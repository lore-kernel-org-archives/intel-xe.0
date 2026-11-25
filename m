Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AC7606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 19:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VSxFfw4f;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=fj84uwmV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D421C10FF53;
	Wed, 25 Nov 2026 19:47:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6883F10FF53
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 19:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795636015; x=1827172015;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W3IDmRRWlf8Q10Szh3Speb3JPx3y2CCwW+AiCBfK9L4=;
 b=VSxFfw4fq+SYUhJ+vjNnScfNLnOLTI/i9LglM992BYlV1o6xO19EgyLl
 pLr3I612W45bYFIL+dkaq2Z9uNVSTnJMbpgcVrP0dqQNxEs8tTEqBI7x6
 ykua1JXJhli93+VoIpUkGOb64ONtmhCMj5rU2XeJg8oG215GQC+yDM4EF
 yreYgBB53Av0XnDKn37UHGGHYRpYUTArNj0o9XYHiI2bcewiukZeJU4vr
 ngveHU6vvCWxKtAxZsctoKPE2ocmk1n0KMej1VAksKLpsMJHJMRd9n+DC
 Dq5ycHBD1FX6NCZ9TY05l+0/6VMBhiItj0eaCd09bHAqaNd6kDHgzrmNl g==;
X-CSE-ConnectionGUID: OXY1Pk5mT4u9GSnUkql7pQ==
X-CSE-MsgGUID: CqHZqM0+SAe6N//1YXru0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4587950"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4587950"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 10:33:44 -0800
X-CSE-ConnectionGUID: WkU3WSixSxWTzaNjeNLV9w==
X-CSE-MsgGUID: 4P7PXHRdQe6S5mQKx4mvVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; d="scan'208";a="12227121"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 10:30:43 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 10:30:42 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 10:30:42 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 10:30:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXb54iVUyTBnqhPPseec2kOX0RLO4nYimxR9z2J0I4AChf/FB7NZxSyEroiRv4f99uhQlOPh6Lxww9JoxjRrW3Xf1/SEHaBgkAJvAEtWBYwjS3JKCjv2/rd0O0/AH0YQHp7D1b4WmVFOkYIMeXbRdue5X3B1WnaNRP2nwDBpXv2+4Y4U+sbxjSSuJnLYtA7eOtXAoeth2FrkeQCx2VMT01FFSx9hO6jklNJxahvp36gT6A6Ayt9+oFvWF698P/+lUFl/yZNVp0PBICwZ0xESeJv19YhlBjaAnGo+QSvMA552n3GlReMyWLhtZ81lurfah82CzwU0kFLCGY5yYi4HfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2jFdf5J+Nfkv9e88BegmO0FvJGiNzicYhoCVZVssWM=;
 b=SKl17uUjKpR8tHovrWzi348dbM5v7Bk6iFyiKA0Rj2x+gY+lzycXAKRkoFxoerWYZ8a7twIWQ8whAinGfj5OOyrPZznQrPxktNmTEGBoHI1dOUdLL1hqEWDE58G/b2rTcQw4bjmz2LdsXY6yCEBglQ+z8wUtBVjYJhuphxxz9BQ5khsfCnqkBXXldTZbGbop7+8jEdWKV2GMYYw/kGarb4IANSvbyGfMNnd1hOGwAUFIFx0G+N1d7j2iUclg2DNKZyVMCMV2866DhjkZG6Mu2y4rRmfprEAlo22+Ne1NMXKW81BfJh+uXcRMTXrZLLRKa1syHTouE0y0S0VZmwBQ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2jFdf5J+Nfkv9e88BegmO0FvJGiNzicYhoCVZVssWM=;
 b=fj84uwmV1zR2FGHJwP26fCssilfc6GO5vN2h489KVap9u7LfJmaw0PJ/1HLHzeux0WML5Ch0J8EAPknGXltJc78tMs9MlRQaljMIoDfpq4SnPLZKWTxUTk2/4yqweH467DBTD6siJunV4sopYjhH16XZ53PqJvZda4ZK0qx0XGQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 DS4PR11MB9532.namprd11.prod.outlook.com (2603:10b6:8:34b::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.6; Wed, 25 Nov 2026 18:30:20 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Wed, 25 Nov 2026
 18:30:20 +0000
Date: Wed, 25 Nov 2026 13:30:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, <ravi.kishore.koppuravuri@intel.com>
Subject: Re: [PATCH v4 10/10] drm/xe/hwmon: Enable fan support for CRI
Message-ID: <awcpOQOOkOtZeAsB@intel.com>
References: <20261124054811.798763-1-karthik.poosa@intel.com>
 <20261124054811.798763-11-karthik.poosa@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124054811.798763-11-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0126.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::11) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|DS4PR11MB9532:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a167894-cfd8-48c0-0fc8-08df4b22296d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|10067099003|11063799006|4143699003|261021123027099003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ADx3a33k2uJ7MwF1DRaiR830l4qAjApih7GqadwxSoxSZA7ik2kkia0iBcwZ/6y1w3ahziG18MY2HTnqA9EB/QAaXxqci5ReV4yj0z8Zp1yP2ftDKabd/4qt1g/0iNBMX5nC5iqwVIeFI9VWvaikWN58EfOMWERYCkYx/uSvEZTXB9JxNQ1chnWJ4AABkFwRS43fpz1GDwY0RH77q2jhopnkKA+0Equ5TQRdiOV/hY8GxWt4DBsziebUJGYhW2t53bgT3UJWlqKh2YZkStBbpWC3EUYxiwiK6g0F87/lseDRcVaan6CvASH9wwV+V060nuX+M/irRL2JHLfMZgssG38lis3DcFlgMjNrPTq2TUEE8pnGQH9O5QjxDuvmDJSYWEESiXAtEEQpbIPTx5VumvPK7fLRGs5HYQ1IFgKzBwVpB6lTRd8J6TGdHCc0+NHQoIyJm+jAOS1+HSFEavfneQDh+gcPUAm/vwXSqFp98tQS1alijoc4pLsRWIjxG0qPy6zeO3VmuyDd6wDTpjxDr+ScmfyiFZ2RRTK53MUYqY00xhH3oIGAqkorlSOFmMBHvUhFZxM//zzR7WGR/h5K0UCJPEsLwy8dE8R8QoI68lh8UlmuMJIeBIJvakK8HJG2Ic3L3qWQPtDj0A6zdud0D+FY5wRGzUyQZEeZ9PToR3s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(10067099003)(11063799006)(4143699003)(261021123027099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JKtJ7Uhq9kxsCJmxOIIZqH8mXarZDZB7bDocCD8uV9+MvQhWWvw3cW5XbpEm?=
 =?us-ascii?Q?RAJ98cScQspIh5rmxFGTLePyXKDHUHWlIJ+dMGSmnGfi2zLe6GePCJz5j7Pb?=
 =?us-ascii?Q?Udvrv8LJ09Qr7hspFVCDJ2V0B3OqJ5qLulXZRb3aO8fFOiI9zEOp4VjhrgGM?=
 =?us-ascii?Q?kgtgLDVnY2+QXKAmR/afJzFRpAh2KF518v6H7ZOD7N3plBzpB4e71fNV8L7B?=
 =?us-ascii?Q?HbECclBTCmHDK2zdIYDuZyfVznJBB7C8J+0ZAlNDOL0z/I1BZxIY+mCfSKYf?=
 =?us-ascii?Q?axESwrn/4XVdsGRS7zS4G9qRexWNa2iFH3cfmg5LZiMiVo+toGGwgI6jDt6W?=
 =?us-ascii?Q?6FsSF/Fb+kamdX4IcT1Jigw1SEQEUtoypE6GEzreXKGqoTvD61sy4JI/oF1o?=
 =?us-ascii?Q?m/dpHLMFJ2vNCfIOFF0yX0uokzVm4vGp/JZU0IrQ7L/I2uEoNgiJJL5Wd6sM?=
 =?us-ascii?Q?CCyNu3lWEoypLPm2THj9VXF9PqeifeoJQTx/kYNNozghrmcfTY67YcUy2xcs?=
 =?us-ascii?Q?rvIsVCYEQywCGTecva5bqyDhsMBXll2PPNIRPLY3nMC5tkkr6UE0Yvig0NRA?=
 =?us-ascii?Q?36O2/OUoLZQRLN96iDW43caayIKLbVeW9gCipFAr+bqwKtJXF4CsllTbakWZ?=
 =?us-ascii?Q?Zq1BtTRnPf4g++zwvc6Srh9Mtkr1Ou1+IdnL5JldihzXMdgPrYNXUaCfAuJ7?=
 =?us-ascii?Q?paFRHyB20SfBX4rWdgeHVrL6qO3XCU3NvHDrbvuqz1z7iybz6FPZc9wfNeXU?=
 =?us-ascii?Q?qwzzfJQewWgGR+Ur7hbfeg0zQVFb2132KdtL4NJsDd5WJodcc/MT45iHEOR8?=
 =?us-ascii?Q?gbEklqlojpYRqhxLvQ6UQYtzjNKQ/YhviKm13vYx4OP3hYxufq8pdv04IS1N?=
 =?us-ascii?Q?1MNd9V17BImpnBZDAlbJZw/tcBXDY1ZlMX6sVNlM3jprAUonabLS+hSBx0n+?=
 =?us-ascii?Q?qXrgUP8BhngD8BRnOokWenZxdsXDRGZeFB7SuyK4rgpxxHqzCOcd2JVyjUTX?=
 =?us-ascii?Q?6P+d2/P6ScJpPd157kSr542dQrDuJDZUCanDk0AEtu0RITwVn4ImCNvtzLeE?=
 =?us-ascii?Q?zfxa+Ak6hqiO02BR9Q7uzZ/M6dDFqQ57P8Rb8cgvZYX3EUQUAdx13A/CcrMO?=
 =?us-ascii?Q?+afp9dQ1VOLGb0KpsBIUE4A5eeFi7ArEo7bthlsFZb25XOGVoIXjqCLic2iz?=
 =?us-ascii?Q?ifFWxGYpSB2rOjdeSPhquzCY6iuYQLQ2IlpAfCvtoIosTRYKCMPYxa1OY2J6?=
 =?us-ascii?Q?8nCX+lAdATX/T/Kedv8hT0hNMONtC5yZEuVQzbEUqmrcDFxSts2Kv3xOP0K2?=
 =?us-ascii?Q?O6bYXnPobnH4fK+ke4vwxq0HMj6TX8Wd/GuzoZ6W9pb9x+XRlis0S5gUMDO+?=
 =?us-ascii?Q?wRVFaLl4+IWfMkeOTO9g+KfHbAgKqpTG459ViJnPSRibAXS9Q2Xtc20MFssx?=
 =?us-ascii?Q?eBRQvQlTidR6u6idaQVqBE3DQjW5oRo5Ksynqr2TfkyCDu+oi/FGRgG7pfXN?=
 =?us-ascii?Q?YVggs0yINR18apWERlk3i+58S0MqvGy9jmBLZxcxJGCx15TPTKWE1mbhYAZs?=
 =?us-ascii?Q?SaN7EfNMfbNXcc8lnwgri0XMmnAFsjvgoDs+lnVzxSoLD5mrZDOoDw0734+e?=
 =?us-ascii?Q?GeAyllD6Tg0AE8hx60GPxfXWgs+LLtJAxoaAAzspnVTBxAziV5ppDTT+AjoG?=
 =?us-ascii?Q?FVsfvdIaT9+ioAENAfU/jlmhhNnMfK6Z/s7n4wuYoz91Ckql9RpIChoQikwK?=
 =?us-ascii?Q?Kg3ByCZUog=3D=3D?=
X-Exchange-RoutingPolicyChecked: ChT+Nh7VhuOhTv+evcADKyDMvqwh0xjTC4jPx9oXTkoAOhb+J8SS+fYK0cK/ApX4nsIhwzpY9qdYhq8FI/R06gvh4g8gRGy4ytQNRE8wapeFle1khnokyleO3S50qSyLa2ABrtRXtNhogpZABzoWbGREgIK27PIM151EDgYtq/4FDFFAc4GG3E3+/MOo2mVjhVDvIiLkVQ376YeClBe4TE+t/WglFKzP7qB8h5pWoxk536/rSni9g309qamwLArEvttEaLDGgRG9wvGGalLa/24Agz7Kx1ex7jKldtyKOArnZCyHmK7eyss9Abj0zOOj58/Epht1CaGjG0XZZ5NBkQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a167894-cfd8-48c0-0fc8-08df4b22296d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 18:30:20.8054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ia3y7c3MawgFHVMpowD4EbhSZVqvPHSb3vNyrpO2bOqCh5fcGI/AnLtUCS2pg//SVCXGR5Eby/hirI8ceQ6ahg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB9532
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 11:18:11AM +0530, Karthik Poosa wrote:
> Enable fan control support for CRI device IDs 0x674E, 0x674F and
> 0x6751; other CRI SKUs don't support fan control.
> Use new fan 3 speed register offset for CRI.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_pcode_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_hwmon.c           |  3 ++-
>  drivers/gpu/drm/xe/xe_pci.c             | 23 ++++++++++++++++++++++-
>  3 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index d9e4847dd68e..5657b483d18f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -28,6 +28,7 @@
>  #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>  
>  #define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> +#define CRI_FAN_3_SPEED				XE_REG(0x138174)

code looks right, but I couldn't check this reg, where can I?

Thanks,
Rodrigo.

>  #define CRI_MSU_VRAM_ENABLE			XE_REG(0x138340)
>  #define CRI_PACKAGE_TEMPERATURE			XE_REG(0x138344)
>  #define CRI_VRAM_TEMPERATURE			XE_REG(0x138348)
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 2f1d779e2784..8e732f54aae2 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -533,7 +533,8 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>  		else if (channel == FAN_2)
>  			return BMG_FAN_2_SPEED;
>  		else if (channel == FAN_3)
> -			return BMG_FAN_3_SPEED;
> +			return (xe->info.platform == XE_CRESCENTISLAND) ? CRI_FAN_3_SPEED :
> +				BMG_FAN_3_SPEED;
>  		break;
>  	default:
>  		drm_warn(&xe->drm, "Unknown xe hwmon reg id: %d\n", hwmon_reg);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e7b844f96d40..b6c1d42fba61 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -477,6 +477,7 @@ static const struct xe_device_desc cri_desc = {
>  	.has_display = false,
>  	.has_device_uid = true,
>  	.has_drm_ras = true,
> +	.has_fan_control = true,
>  	.has_flat_ccs = false,
>  	.has_gsc_nvm = 1,
>  	.has_i2c = true,
> @@ -612,6 +613,26 @@ find_subplatform(const struct xe_device_desc *desc, u16 devid)
>  	return NULL;
>  }
>  
> +/* Only these CRI device IDs support fan control. */
> +static const u16 cri_fan_control_ids[] = { 0x674E, 0x674F, 0x6751 };
> +
> +static bool xe_has_fan_control(struct xe_device *xe)
> +{
> +	int i;
> +
> +	if (!xe->desc->has_fan_control)
> +		return false;
> +
> +	if (xe->info.platform != XE_CRESCENTISLAND)
> +		return true;
> +
> +	for (i = 0; i < ARRAY_SIZE(cri_fan_control_ids); i++)
> +		if (xe->info.devid == cri_fan_control_ids[i])
> +			return true;
> +
> +	return false;
> +}
> +
>  enum xe_gmdid_type {
>  	GMDID_GRAPHICS,
>  	GMDID_MEDIA
> @@ -804,7 +825,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_cached_pt = desc->has_cached_pt;
>  	xe->info.has_device_uid = desc->has_device_uid;
>  	xe->info.has_drm_ras = desc->has_drm_ras;
> -	xe->info.has_fan_control = desc->has_fan_control;
> +	xe->info.has_fan_control = xe_has_fan_control(xe);
>  	xe->info.has_fixed_vram_channels = desc->has_fixed_vram_channels;
>  	/* runtime fusing may force flat_ccs to disabled later */
>  	xe->info.has_flat_ccs = desc->has_flat_ccs;
> -- 
> 2.34.1
> 
