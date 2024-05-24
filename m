Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5E5C25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 22:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D40910E064;
	Fri, 24 May 2024 22:52:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WbYzIDcT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD55410E064
 for <Intel-Xe@lists.freedesktop.org>; Fri, 24 May 2024 22:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716591125; x=1748127125;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sAQFY8dEPnCYlYA+xfdRAksp6QQeG1N6NddD1InoTBA=;
 b=WbYzIDcTcoG6KDBvh2Ijf/jk//7RQnqYuw3M50clJzB+pbA7xPD7VGh5
 9mCh0fe5FrTOWGU2MdLKiC+Qs/XMEY5Um7JaPcaq2PvPPTqRba1jwbALN
 vMBw+zyGw8HoB5mDSVq9FYc9w0CoNQ193HQ3kdqscpBXZN4MWIiVWmG2v
 +jHOiVl6WOJm64H+Zry3u3lqebPy16pJyXWZTpUyhJDYmI+P4XPkrsRSh
 BxquiO06vAOeeqp6kYtnhn1h9NInhxz6uenXGe0p0TM997/ifMwJogckS
 Nl8eoOOn1KBo7mHFkB/WsEMAOSTzcHh7i1JJv7z7AGbJwuktSQ9e8G0qv w==;
X-CSE-ConnectionGUID: qkAcgRVNSLOfF91B5yvCzw==
X-CSE-MsgGUID: UlFb7/GzRjaVQXZKkkSNaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="23588733"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="23588733"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 15:52:04 -0700
X-CSE-ConnectionGUID: +Fkr0+7UQWyMlgcPWb68uA==
X-CSE-MsgGUID: lbQOhBi1QUalhGesnE13sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="39013685"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 May 2024 15:52:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 15:52:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 15:52:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 May 2024 15:52:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ShqPEmL/7AvxWtEUixWxP8TUd7hNOD7wgJHwoPjzIUOxJn9ZyXM/LzhoHvaY0PoBEeJTC8/gle325OVpbJ4YAQUBGBwWXAqpS+U1OqFSc0zNHhU+ddwf5DEsNm1RVYJC68KZZbltkFynS4BWf/ULQXC2CGTbxKB9BSMTmY5Aw4i7hthGAT7XkHsEbfO2AU/l0KwVox5yo2V/+VTn9Pwf2H+9qi3W9+DlezvMV5d6EItutjgMrxVAxZbPFirD6qzuqySANPC/4ugGvlHyvRJ3xwHGLfPp3jm3biMJ0vpVIG16Ur0pohAQxAXY5pyYbVTC+HIm+zmhYyf8kqoxHEE4BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWQQOOLsjn3XPascxLW4JtDIerc3zLR4MUgyJniiSIA=;
 b=iDoaItLhtyF6m4e2KAjqPmi3rMNrKct3xteMXXgSNqtUdTn+tgR/U6LVDDkM+e+5teyGvhRqoR0ZVX9pIv1TJ0WiC5eAnBhbtEJtmhdhlEb+ysGOIp6BN1e0vIHGQWtxZHssPfKQr3tATZpUhlpr9QhIxnllgogk+2gkX+smDNf7IXiH4GOfW8VVXRMZPaky4Wrxqe/VfuZ5auItg+nHe6/D9X6pm33IvmKG9TMUZqgqV24WsfG8MX0a2mTgSn5Rr/s7W1bZxbXMfXd8Pgr4RK3U9RsfPWLx45ghgvvlGL748H59M87LzxViKB+rw8A33q/Pye5Pw1vXIl85hOcs3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB6885.namprd11.prod.outlook.com (2603:10b6:303:21b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Fri, 24 May
 2024 22:51:59 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 22:51:59 +0000
Date: Fri, 24 May 2024 15:51:56 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>, kernel test robot <lkp@intel.com>,
 "Lucas De Marchi" <lucas.demarchi@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, "Fei Yang" <fei.yang@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Fix uninitialised count in GuC load debug
 prints
Message-ID: <20240524225156.GI5383@mdroper-desk1.amr.corp.intel.com>
References: <20240524202603.4011656-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240524202603.4011656-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR05CA0166.namprd05.prod.outlook.com
 (2603:10b6:a03:339::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: f8134af4-42a9-4579-fff0-08dc7c441e52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?YDmeP02hz0yE9y3foY2yi1heGMYg49dgw3bD2LsZ5nNnuzDoVpdwXMwgou?=
 =?iso-8859-1?Q?TmMuxG+PRA+BQC11rNKIb4zGf088y7QN64E4zJZMTpECfD70bTEnGNzFMu?=
 =?iso-8859-1?Q?TuOvQaxc5PEnhSM4QP7yu7k0Bj1AB5e9hWMVpi2+3yvd/i+ivOrByTtaRD?=
 =?iso-8859-1?Q?MNmxOUEdFWBxmobr5pWrdlGYXLbhqsKh9c9abKhs4eSr/ekAEMzsrSUgqv?=
 =?iso-8859-1?Q?rG6XXeiTWGHPeqYt91IAbU+Evpg7VcaPEPmuGgqJryzAyxG0C4s3oVlqpc?=
 =?iso-8859-1?Q?gb4Q9/7Nenlw8jvmpUZiVLvHaXSZIGCST9NwqGeePF2c+siGZmRFBRKhxK?=
 =?iso-8859-1?Q?/uF9r/NdNFYFqH6in5CjTxJqZw2HjxPPCfc2Tf3yNO9Q8cgJS8U56bA2En?=
 =?iso-8859-1?Q?g69GYyc+OFYVzUwKfB9Bf91Wtn7Uk9D+vxyNVcLiwJ5QZF6koBZE+2puA/?=
 =?iso-8859-1?Q?24zjeVeviHkADiX/t/Jr8NXkqR8ymA4mzzDN2/I4XCQLuWlPUcfnCI/ADo?=
 =?iso-8859-1?Q?KNTXVVYwru/cymq5aUUc49V9Vxls3cNClvx4SE632yAB3vfxXO2ff5KOJh?=
 =?iso-8859-1?Q?9gVmmOKxiueEJlltO5kCrYU9VDpSLhn8GdAFDYciaoJJyM5U+Azk5aRXsl?=
 =?iso-8859-1?Q?MmahdO3m4G500+jlzwNOcQS4k68arzMvvfkjCPpPLnDeC93Ivr1XMYNylS?=
 =?iso-8859-1?Q?5W2ng80YJUErBVGkbezuEFdf/OflPItnXmXT1bcfw2+dtdj6sojnio91y8?=
 =?iso-8859-1?Q?0/WMwQ6p5ahcKLWdFnsp8TfW0D844ZyhPilwyI8C8EkS8KALw9pXh9RHqB?=
 =?iso-8859-1?Q?8p19qd3CyRC0j+D1tNfeMb8vJ4CKvti6lhZeCXhbmWydhFmOM9m2wwhxVb?=
 =?iso-8859-1?Q?HI48+LYSFijmmh6jbmSTa6j6+RrkZk9QD4dEk+vXbEk01al3q7gkSGBaMw?=
 =?iso-8859-1?Q?xgdsd1ZYFG2EiyoPKI87pdrdl0fzvd7UI4jWIQmju9Z2gktIqowgL7K05u?=
 =?iso-8859-1?Q?8+FHETC32C+yhzc7tpgTwvoX4c/iYIIbI+Hr6uKOwI2M6LepI8aW14RTKz?=
 =?iso-8859-1?Q?OBnh+XFNbqFN77Nx+oH8GzzwoL40BiGfhNKsKlfox8lt663fongQI+eTPK?=
 =?iso-8859-1?Q?Tf9l3p3dHlAb/dLG+U+B+z/YOjtSDdLcTfYzOBtG/YoVupLqFXk39uv+vb?=
 =?iso-8859-1?Q?TGmaeJ/l5ZkUZj4navsMUeSQF/iTcSPYtO2/erBhjHq90LWgV3QoXCVCf3?=
 =?iso-8859-1?Q?q8eEId39lD0MgINceuDMnY96gU6mUhSAW83mLo5Cs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?38vb5NTUIoAxuucCsHLWESmMu++ng1w0+Rf/xjs73BwEltgziaM/QxapBs?=
 =?iso-8859-1?Q?bK82RQGF/o6osDkXD6FUO6MF2ZtyxNs1sgnT0RfDmXjgLs5HIsqLKP609D?=
 =?iso-8859-1?Q?jOIF7ZJ+ueHSOiW3onr+wUavUxi3Lz/nFeKtUY9b2qMT/I/lFw05ZRqPDK?=
 =?iso-8859-1?Q?SABVj8uqfzIhMMNRq0lt2GpGqA1TGkyN0ye4DL9F2kT18hZhIs6qk5YpjA?=
 =?iso-8859-1?Q?UNmkVy33VemxvIe2s8svHtU9DQFWImPCH2GCDMuKg+o8sW8W7uZHvcVpdR?=
 =?iso-8859-1?Q?giEQ+aKbCUwXWyOY1AXhhOfO8J4zy2pUQu8ocxTsj0dtHJ558f/pbilsAN?=
 =?iso-8859-1?Q?uH4GANEihIlQeB2Sdebe87ePVB1WXY2EsglV6Bex6+40eh17uv7NnHDfrt?=
 =?iso-8859-1?Q?nd+ieV13gNkRW1koiaE77sikqnyirKuGRUAa4U2CMkcRmdJ0tzqs6e8I5q?=
 =?iso-8859-1?Q?Bb1qKlouRi71MCnvQ0Dm45cBhStnDihOz/guhApY+9CAHRH0VWEfXxzPoi?=
 =?iso-8859-1?Q?zWXaBCMKGw9b5mDrgJIptjE7ozmj+A1yV49KwK2iyHte3mqrgJihoR4kcc?=
 =?iso-8859-1?Q?PTi/2Q0hMlaqkADhwhgi4esQXwe5dtq9BKRsE9fKULXDmjzPAYR7K5rSG9?=
 =?iso-8859-1?Q?OyiXCHgZBqM5gEWpI2YY1O3ZfrPU2Enoz/eyOXhxYn5j5+pV0C+C8I85mY?=
 =?iso-8859-1?Q?NkBBMYSRfYIzpetV39/b8cAQ4ovbQlIXZWce6BYhFiwuKjcxxPf4pDm6nX?=
 =?iso-8859-1?Q?RToBM6X2svkUY8xwD6yC8jr/wxlm5tjgrYSeA0jtl5fl21pK7O3O8awW0x?=
 =?iso-8859-1?Q?Uy9HkNhyjzw/RTs9G/q5nsCiahAPsz2tFLHDXzq7EYWaoMTQos0n46HCV5?=
 =?iso-8859-1?Q?Sf3MIs488hJLuGx8iIViA1W4rGj+BWbH0P9RKbII7V211dKJFpN5Lcge0S?=
 =?iso-8859-1?Q?vreO5BCxfpzt4bLF5fwcW2pEXhcMnQDbRlvVcrl985L9jmYdWgwi24WfiG?=
 =?iso-8859-1?Q?NT0V7oF81xWeE94WaSQuLz+aF0FpB/qwfcjtJ/7cS2B3E9xp9TCwbZ2faV?=
 =?iso-8859-1?Q?A0MH6LlFw8sD4MVFxh0iXgbRk6gg8NGn8f2FkNCmDh/ED3edayLbng0PMG?=
 =?iso-8859-1?Q?FmophSI1QgleDBawzOl6Hd7drDbB8uSLRq86M1KQ7RevsUs8Zj2/N31en7?=
 =?iso-8859-1?Q?irYfdcg2uFB6kygo64lHEd56qR614NVh2OspM9/dO+IKJ3Ma7/X4H2FOZW?=
 =?iso-8859-1?Q?MKUEbofB8NGxHObriWsRi0fb5T4oOAPOeZdy5UFpJO/HfNKFbtAOpF30zv?=
 =?iso-8859-1?Q?SAlRKnO1MtWxxMaLgLKrRrcvVjJzWd5dTNKs/ZL2+wxnzQp273obiXETzd?=
 =?iso-8859-1?Q?xZr9DpeQmhDzPM3ic7r+tzFBLCBTSzplU0lzVVMDZe0GgNhbSaVhI+IsxY?=
 =?iso-8859-1?Q?Ez2QzR6vK7D7VO81OlTiTze1suHkXFr2g9qsZZpRoW3SIF+Xoe4PjeI8Bs?=
 =?iso-8859-1?Q?aILkc0ZYkPE7XT2FHebquSTB0mX4KR3hlqOeX5w4eu3T/WIh1eUPjgL9Gg?=
 =?iso-8859-1?Q?poz8a44DoxwK3fPOiF9VDGRZQg+/MuHXzKxGaRD/7+pKqY/ndQ3lh3TEOz?=
 =?iso-8859-1?Q?YNyyBVH+oALE3nM50FZS+5W/FJeAh9f24Uicxq4EhHbAD/2OE9wydKNw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8134af4-42a9-4579-fff0-08dc7c441e52
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 22:51:58.9312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxKz3iByZ4ghmnwne9BO1RU/usMOpzVuNV7SG3SzWubvTG1vQ87PFvbJOg3HH5fq5j6ycl9OyNuQn2eDnTwKNufat/e8BMFa/+5egyd+XA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6885
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

On Fri, May 24, 2024 at 01:26:03PM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The debug prints about how long the GuC load takes have a loop
> counter. However that was neither initialised nor incremented! Plus,
> counting loops is no longer meaningful given the wait function returns
> early for any change in the status value. So fix it to only count
> loops due to actual timeouts.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202405250151.IbH0l8FG-lkp@intel.com/
> Fixes: b0ac1b42dbdc ("drm/xe/guc: Port over the slow GuC loading support from i915")
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Fei Yang <fei.yang@intel.com>
> Cc: intel-xe@lists.freedesktop.org

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index f7886c00af01..086a048876ba 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -591,7 +591,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  	ktime_t before, after, delta;
>  	int load_done;
>  	u32 status = 0;
> -	int count;
> +	int count = 0;
>  	u64 delta_ms;
>  	u32 before_freq;
>  
> @@ -604,6 +604,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  	 */
>  	do {
>  		u32 last_status = status & (GS_UKERNEL_MASK | GS_BOOTROM_MASK);
> +		int ret;
>  
>  		/*
>  		 * Wait for any change (intermediate or terminal) in the status register.
> @@ -612,9 +613,10 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  		 * timeouts rather than allowing a huge timeout each time. So basically, need
>  		 * to treat a timeout no different to a value change.
>  		 */
> -		xe_mmio_wait32_not(gt, GUC_STATUS, GS_UKERNEL_MASK | GS_BOOTROM_MASK,
> -				   last_status, 1000 * 1000, &status, false);
> -
> +		ret = xe_mmio_wait32_not(gt, GUC_STATUS, GS_UKERNEL_MASK | GS_BOOTROM_MASK,
> +					 last_status, 1000 * 1000, &status, false);
> +		if (ret < 0)
> +			count++;
>  		after = ktime_get();
>  		delta = ktime_sub(after, before);
>  		delta_ms = ktime_to_ms(delta);
> @@ -626,7 +628,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  		if (delta_ms >= (GUC_LOAD_RETRY_LIMIT * 1000))
>  			break;
>  
> -		xe_gt_dbg(gt, "load still in progress, count = %d, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
> +		xe_gt_dbg(gt, "load still in progress, timeouts = %d, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
>  			  count, xe_guc_pc_get_act_freq(guc_pc),
>  			  guc_pc_get_cur_freq(guc_pc), status,
>  			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
> @@ -678,13 +680,13 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  
>  		xe_device_declare_wedged(gt_to_xe(gt));
>  	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
> -		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, count = %d]\n",
> +		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
>  			   delta_ms, status, count);
>  		xe_gt_warn(gt, "excessive init time: [freq = %dMHz (req = %dMHz), before = %dMHz, perf_limit_reasons = 0x%08X]\n",
>  			   xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
>  			   before_freq, xe_gt_throttle_get_limit_reasons(gt));
>  	} else {
> -		xe_gt_dbg(gt, "init took %lldms, freq = %dMHz (req = %dMHz), before = %dMHz, status = 0x%08X, count = %d\n",
> +		xe_gt_dbg(gt, "init took %lldms, freq = %dMHz (req = %dMHz), before = %dMHz, status = 0x%08X, timeouts = %d\n",
>  			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
>  			  before_freq, status, count);
>  	}
> -- 
> 2.43.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
