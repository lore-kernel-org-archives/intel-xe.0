Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE2A8EF9001
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 16:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADDB110EA6B;
	Wed,  4 Mar 2026 16:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dC55ZNj3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F8A10EA6B
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 16:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772642352; x=1804178352;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=u1WCxvrGFHX9pecIrZw9FuIx5qjTKlQgVx3MIo1rvVg=;
 b=dC55ZNj3uJsmfMX7FUXQLh+ieivzuAAwL0pixdSwemi4bePDJij3yk7z
 Z9eVEuQHeMtNc0Ag6rwSIIFFpXVk5/ywC90lq3R+o4ogc3BzoImsNi4yi
 qjRceMWpSSjPC/sD5V1oJ6D5bmXqJNrS+dCWSyu4i0MjNDTfLUA5U5w8k
 aDZ575ViYBxIMdyn4Ecf4kYiJC7rETEfnyJ3q9zgQ3meZy1D3g+JeOppl
 co0WDW1Hs/DMBUrcnItVuKrRDKgdKHgQEAY3mNVtiQxlnevUnvt4/8JOa
 +gdZKtSxHuPwy6B05vPQ/4jlK+Vn3X+8K1XVWrvNjFhDEGwQNRa0qSVRj A==;
X-CSE-ConnectionGUID: ymvawfpPTomjhYOKx0mnsA==
X-CSE-MsgGUID: EoHoXTcCRD25N8wmZxW5fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="96325009"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="96325009"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:39:12 -0800
X-CSE-ConnectionGUID: WICTSPZVSR2Ukddg4mnRcA==
X-CSE-MsgGUID: sHHRuA7nRDSUkiOrdrjNrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="245024118"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 08:39:11 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 08:39:10 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 08:39:10 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 08:39:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxmejENLGsItIBTSX03wtXlonfJ7Gj8LqVGaNIxCfxbhWgIWpkDahc503HdWa0eXSRj4o6sEzwP1vZkc0LMYyBSSCv4TL8Lwm14TlDZOecK0avE6WfucABTtkougFlFniYr1ZwKW4jDy3VrT0dnXcv+srk9OItYxV32QSBx3PVS3Af6UAn82XkGVStPzphOMkj6vXnaHWp2CKJ9rNp/DVKp01TxhIHpqCLySAGxPIqu1G2UZoHdRRrVxNw98LgSspe0kh9cFuVmsSqbhdQBWTZc+l6bWqmMjIZ+dmADLWABjM7D4kx1oD1tOerq+UqsTAAR7sPBedxMb4NNlM0B2DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drwceCDdt2OWQ3lxSrRll9tthQ2cgBCtOI7MxEaPnw4=;
 b=v6RPA35SaaiYyMpek0q6Gx8H1OgotcqVdS0G1QMbz+AE20+rXv9SriCAbPuXmxvuIAEaAK9E2mZMhL9z/Lzxhmrm53qvJoClwzEbahsVBtmre2CuhIZtpULvRvjljWGAmFykbPDz/YwT1Etg1EiYDlNqT+INMn0LRAUcwW3/LXpt4T9lFheqF67LDde2/oqwfRVzGKy7IISdSSyU/Yh8WIs5XZabQw0FtA2amyanLjIPoHjqmrlT/2/8c4z018oLoUNNFc363eYCcMb+CPil6jUBfVn0WNBUGbt4iz5rntz0YrMxdZc+0bkJL4Ssahb4CYW2Eo0Ahq8KgGVCJgjWEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5051.namprd11.prod.outlook.com (2603:10b6:806:11f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 16:39:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 16:39:08 +0000
Date: Wed, 4 Mar 2026 08:39:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Fix overflow in guc_ct_snapshot_capture
Message-ID: <aahgKt4kHpXWwenB@lstrano-desk.jf.intel.com>
References: <20260304112501.230992-1-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304112501.230992-1-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0229.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5051:EE_
X-MS-Office365-Filtering-Correlation-Id: 477957a9-6b19-4629-5e2a-08de7a0c8e72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: GJPPpqbr6F4+5isVxbXJ+7NZnGvbZCkcvJRNXDZ+lfD0DJ6fFEFmh/vDV8U5HQCo6PrpCwJbZrbKvADBk8iU/DMNNL6BP6HMYG2SZicqXkVzgcrHvPVuXr0feDnWDTPsytU38dl9WSSFIITkpZkrCCoibfgielvYqe1oXHUaYAOmL3vQDyeSie/b3OgQITwAF6njZ4I+lyd4PXdEXc7d/zhq4n//Wf7dGdwLnAmUu2YYaQUr2m8wbPSL5rbplM00krk8gHqFDq+pgn3lZEd79mTT9+xpfret57Qwbg021bbwDD33tXIRJhXBilPM413JtxIHkRmHHuM9vmwnmzOPvScsriZKmHTORjRWo9vWh/8tJ8KJdJ06P4fWihDB7ZBSMsWN5ZhSr7L2vrhwJqK/CWrnYutlrko6+B83M4gf/vsU9aHQGtDUCBw2fCQhbTervuL5TZAhgzvqkCLiGfuqNBw+5k0TpoDAUCm8tx3pKBDB4kf5pi+doM/oMSm7ZrJcxiHqmF1mKV/T0Sh0uGifmzxFDfRkI22Pv3ge9HzJw8kW2kzcX0xUFM3ctw8G5yi+O0nrvaLr60CfBriw7z+0AtyZu/NAQ1J1KGHIVdZXuNVI91H9dzOztUGKRIf0iRBZFITnM3KOZjsxAL4VzKBt3wka7KC7B6aFVXuog3E8U3ioB07Iub+74TPb/2xeXyZ8t1VEG0j/t9VEuvooToMOizjhnvr4JxCG94l8+WityBg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2wGfA1VRpz3BNvM7uwrxQN7Gq1kijevSiZoZuzUIEGnPq4tMnxLSCkvwz+?=
 =?iso-8859-1?Q?7cTdk0Mh01Sm8d25O++pOXbKe8nuQMQctRIbiY+ZTaD1wDQOSkJn9xX598?=
 =?iso-8859-1?Q?RP2s61R38qXOIsdMHcQteyebs+w8AKRV+toBNvmhEweaKbSKScmd2fUd06?=
 =?iso-8859-1?Q?pWUOcvXBO0bn/Pp5s1Qu+lQsoUqi9UAQIKJXHM57t2vHPfuArwLAvGKyNg?=
 =?iso-8859-1?Q?BsK+i6n9XcBPn+ZmMc71fhGSShYyerxmwHA7cryR4CF2TtAoiKkEVIK677?=
 =?iso-8859-1?Q?mW0+d8IJ4B4V9aRCZlblN2d4JxWcxR3Ioqn1wkWlwqUMPcNomjQT4VOmwM?=
 =?iso-8859-1?Q?3A7jWGH2XiA7gtYJvMppyL56OOs9xvetoB/0bE7rFjlG3pBN8WCnBKGHae?=
 =?iso-8859-1?Q?75p2rM7mYNFkZZO7NnjJGprtNbeJlVIfKgboE/6tQrmL7IP4hYFQXjS0F7?=
 =?iso-8859-1?Q?XAcfvexKhqieFLjEsBpbyOnGdQymtObpcPq8EB+7bE0xAvp5W/7r9Rb9No?=
 =?iso-8859-1?Q?BVy0P66HuwkgicohMwHL8fKuFP/nh1vkkJDsMXI1lutk0Zmxn7M/tPrRpa?=
 =?iso-8859-1?Q?vamfK6Qt2SpCdRDrPrtI2QFmFRmLYgn/jHwIMw9M6+jqqIyf4t5g3dneOE?=
 =?iso-8859-1?Q?Gb9GWysqncsywswARXcPrg4eSS03LLVwrhuN08Wt+WitCjF+5uG54r+gpP?=
 =?iso-8859-1?Q?JtAJ+rqkXjjgoO0ePkw7x0CQgI58KglAyc78673jOEfP4BkqyPWiiP/vT8?=
 =?iso-8859-1?Q?Ka9ClkAXNeth4qKcLfPiaOpdVSpfBuGMoXeSpTIAX9WrYP5JmRKueBV2RM?=
 =?iso-8859-1?Q?2kUCr0fj5rKukUqW/FaLCipN9DyQ44Wdnr0XhhiNtiKYRkiH9fwjGkO/m5?=
 =?iso-8859-1?Q?NDhekpyXB4RPsdF8wBtxuStvn+cxZp9g2v88HJm9RQeHKRfVQEVqlIxysp?=
 =?iso-8859-1?Q?vc48tM0Wsw7WuXhdpMpUQwROKbe7WHe1LCyVvzrZEtAwa9fqNJVBSNDKkF?=
 =?iso-8859-1?Q?kWcirIbdNU+EbaotTMvcnfMSJa9yGmeNSPTNh9ZvwCKvfVgh24kmxLdhZd?=
 =?iso-8859-1?Q?jMeImS1rKKD8p/oTp9M9mGlMqvG1HrapW8iqD1Y+gLvi+gDTdTNf1xxxYP?=
 =?iso-8859-1?Q?Rfd4JFxJfGTWGtF+VtzMYO4EkMJcF072P1sdWIMj1wFTju9+EOregk4laB?=
 =?iso-8859-1?Q?4wKy7LO5uvY4bPGUyaAN1Cm6O8fW3Ri2y0DG8pt+70QnDHOpbjZhLCDYSG?=
 =?iso-8859-1?Q?4oNUsmc9xntNiNjrFbKYiczkj1kxc0E8/ILSu2QD9EObIGZB6xC+ZYstxb?=
 =?iso-8859-1?Q?h7p2qIhA4pc1m/zfvN+MJrh1Ip7g8hab7XwmlZLLIqIq9OYMizFITa7Fle?=
 =?iso-8859-1?Q?GFGnb2cAQtNurMCtFpAYO+w7u+wYzjAYVl3dFub+BhsTDXnWUed76nZsmP?=
 =?iso-8859-1?Q?GVArGtcQjqTrxY6NfY2TQDskFZ0fIjJ+BHMJ48YfM3GGFY2VzHr4bDamLl?=
 =?iso-8859-1?Q?US1GHT82WY1cMxd66oVe0jO5Rsdx6dp5UFemHRRDmqSx4cti5rXjJaAz8W?=
 =?iso-8859-1?Q?zUTUnJMjm81Mvr9qUqOxRokJydeAHj0645mUlwW3kLjRLWaTSIewpNIzs0?=
 =?iso-8859-1?Q?lanCj5myiZaSpszplhjTbL0b2BrRhnIbqnkpjMu9K8xufXA5/cb/itf0C9?=
 =?iso-8859-1?Q?QwfSTXbqEHv2OxXbBMb3dPT2UO44AJQHDsgQzwAk2hgjGA9tlmfp0fzb4w?=
 =?iso-8859-1?Q?rsi2+dWmpqrLG+aw5bYMB/4Lwf3pUMncsWGeIN5e3qp9Q40XQbiw+ay8N3?=
 =?iso-8859-1?Q?xleVyNtPVw0H7BJajWBqosWg4jMbNDU=3D?=
X-Exchange-RoutingPolicyChecked: NWQXL/MZj2BfaXxii0/t2pU/BdMWUFdqpyMBx51PJO92puvugR7NiFbHb20Te/cCtsK/Qm2dzcB0gZPpyiY0rMs8iemAqxzMD0uVBw8lQOd5uZc1DPA98FIfbC7/GojCta2ZARAmldrqJmlbpE64rM+LAnD5Bo+n8+sj0u12CYX/KM3YNYPaiinvOQqUAsUCoL5sAMhxjgdT/PlXqFqtox/WGje0W7oxoMbkjbHm3isRjbtqj2S2RayWuha1MDRDKHU093WNT5kBuK0rYiP0eybTXH2r3gpBNpV/cc19gzhX6QGip1M6bNA2VyzhKU0dV5NQzBYtWvWfNDFOEVnA4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 477957a9-6b19-4629-5e2a-08de7a0c8e72
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:39:08.2756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODnnijr547ZM9pzEKGls6U/XgU+7hnaoC+C9hyI8TnSzupygSM+FhmYCii7VwMTDO0c9Tk0j25a6My6FuuTA5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5051
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

On Wed, Mar 04, 2026 at 01:25:01PM +0200, Mika Kuoppala wrote:
> snapshot->ctb is u32*, so pointer arithmetic on it scales
> the byte offset from xe_bo_size() by 4, overshooting the
> intended start of the g2h portion and writing past the
> allocated buffer.
> 
> Fix this by using *u8 to get the arithmetic right and also
> prevent future mishaps.
> 
> Fixes: af3de6cf06f9 ("drm/xe: Split H2G and G2H into separate buffer objects")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct_types.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> index 46ad1402347d..1b4b9b713d42 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
> @@ -74,7 +74,7 @@ struct xe_guc_ct_snapshot {
>  	/** @ctb_size: size of the snapshot of the CTB */
>  	size_t ctb_size;
>  	/** @ctb: snapshot of the entire CTB */
> -	u32 *ctb;
> +	u8 *ctb;

Ah, I see the issue. Maybe 'void *ctb'?

Matt

>  };
>  
>  /**
> -- 
> 2.43.0
> 
