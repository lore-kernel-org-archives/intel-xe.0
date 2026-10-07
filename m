Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F42CA6002
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 18:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F2810F74A;
	Wed,  7 Oct 2026 18:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VW0UkWLn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466F210E664
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 18:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791397273; x=1822933273;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OkI7tGzX+VsTJOBZjCgCYxvSeCgNuGuN744BGW+tDfQ=;
 b=VW0UkWLnhNO7s8HfHKJxGyYxAGkn+BqEqWRejdYKRqRSXAk4p8Ut0vEI
 rluQK/GX5Bb8olxmf1Az9qbudaeE/E7xNd+beN3CGipUDWbzjHQjk6XBr
 TLZ7nlswtw0twEkZbzOlTESSwzYyy/YGNlaTyKfJXxTHh62qhb8Eq5xN7
 GTzk80/ix6oazi7wmbSzDVUdbRVcMhMOzBaVEsGup6fh0E+U+WbIRZzz+
 81qosfBIFKRcqQSC7lYrfn7HrtpECu32u8wGfJVhSijBjFG8d1hj9VF2i
 fo6CiNt8ErwXkrgixwEA7TZ9ZXLSpKEt6vVnHHCAzM1ACjFDrFDW4ldmc Q==;
X-CSE-ConnectionGUID: rJAs6/7oRgW6oJ5TPGCB2g==
X-CSE-MsgGUID: THNuAAtWQLqvhJNNthCDmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="173169"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="173169"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 11:21:12 -0700
X-CSE-ConnectionGUID: xzI5JzsgT6q+tfY9EAmszA==
X-CSE-MsgGUID: mRnZIBTARvSJM0xKEEYMNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="1597490"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 11:21:12 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 11:21:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 11:21:11 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 11:21:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ps04BzitncGLXwpLQTzkhI4Yfpc5DSbnOq2sjnhq4S4poGUuioSPASpwacyF/lUuP2EKChYenlMPhxXSpkaXG5cVdj0OIgIZ4mFC62RxIiX0kMVG+CJLe7bZb1rZemJZB2K0Z4XS8amlvPCpqUOOGmgXLPCZJoTa9jVxSqaeUcrkpV+rHpOt0FOmPHWgE0DlNa1wU7tsGsqSyeFjHu2fl2Pqi0Wdoq31hmf9OJxnxP2CDHTBkxXmOag3hY0Yx+md4m2CTkwMiIIqzGJx/Ihdk2Tdz9KS5cE8e+4LWWxfsq9gghWETuGGtxOk+x5wQSWpiYNDtqdsmqtiilfpusRLzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAFOuDNYITJkWyD5cC3N9F88DyR6ORSoUiKJWoJBvNg=;
 b=yjJxcExE0sjr9EewdD1nUCOfpcfYXX+2S6Pqp2cnugjoJYtJP56qusrT0k8Yjo5okoJOS9hyy7L0t9oTeLktwDk4HDhmmuvCO6LE/kZWdKq+jGeEmXcVBdv5KPNCb/dmfyrLoRLVJ/QnUJ/VFweHv7sZ/FrVUsuTf0CETtMoehvnHbuScjLbCW56EqonxFT9x+GOXUDyWXzGsf1LOrIzvL4zaylw0lnrhsm1L1Wh26ZP+t/IzI8zPjn4G4ScJpMUhGy5GA/0cuN5Q7AGHSUD8H1AwEamhiKNJH8FsISRJufx79M50NApLZJ9yIXEakq27wTAkp2tC4wgYPycv/zxDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by SJ0PR11MB5006.namprd11.prod.outlook.com (2603:10b6:a03:2db::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 18:21:07 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0451.026; Wed, 7 Oct 2026
 18:21:06 +0000
Date: Wed, 7 Oct 2026 14:20:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v8 10/15] drm/xe/hwmon: Add platform-aware VRAM thermal
 channel support
Message-ID: <asaNhY24wleR-tnR@intel.com>
References: <20261006033534.3583967-1-karthik.poosa@intel.com>
 <20261006033534.3583967-11-karthik.poosa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261006033534.3583967-11-karthik.poosa@intel.com>
X-ClientProxiedBy: SI1PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::11) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|SJ0PR11MB5006:EE_
X-MS-Office365-Filtering-Correlation-Id: 06efee2d-2aa4-4c30-dc44-08df249fc09e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: oSCmnst1B5SPg+TC+aw4RmW6vQf8L+HGsrzZWCvqaml+3wTD32AaT806oINyMP1WRQIq3jeECK1dAz5PEcjfMQzsJwgk3tRhjcbI4E2eyy8c56Qme7HTX0M23oslGwAJqda3s1w6wjFHEgA7UAV6Ecq9jDksUUVVk5OFqNMht6iFBWlTzGb/AiHTieIYC0zzGKVoNTI7mIi0wZeBHEq/DFSWFVK5zxpy3K3LDWD1qaum1jkz4JCX57ppQftKtry9NmEOYY0m6Yo2kv3DMZkadrqxKzkRs3hzh9czqfD7LB+dHVCYjzWr3e7AerPh3qVGNeOUzytcqakaL7Ux5rHwHenZrzJnuvPlz8chQXkrF1/H1VrP4H3hfg//K0q9vIofWWq85/X30ZguJ9JjA1i1Y0UTuy+tjx38DZzJHgI93o62ofgFVM6caS90Fi6CUpIPL2k4q2D/apsfm+s5l+x/AY3QEHMMHcTZSjleZj3glxKwQV7YIVzhhPrhcIbGF7TW6NdjP9ohWtVjzQClImDoXhURjiHZkbJHl6t8Pfc6mqUvUyQqRzRfk58oVk2JkeKHTQlqYyD64S/bFd/gtGQNwzEq7rI2ozE53v7akxLDvBRFxEi1SELJauCgFoO3zXHf8sZSolp3NTQ+q/0gJXBALLCllVYGpdo74nKADJLiX7Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0q5evyOZ8RhmnPLxD5BXhOPEge67NJCZX1aQxEKaXXdwXfuizrVvjmEFaw?=
 =?iso-8859-1?Q?yubqZRN5G06gBOWcKzd5OywM/daT+R2jFXCKKMlL5/0jFodk3mdM6bmz0C?=
 =?iso-8859-1?Q?pqbufAzakamiLKEZlCtsZiiY5ihBAmubfI68ei/YtaINQ4CHrt/X9yY9Im?=
 =?iso-8859-1?Q?rKA6ibAeP9st06U/aK4/KrNuAzSBzRdjMKExDTvpDHj7DkhdgQK3BfD9/m?=
 =?iso-8859-1?Q?O/yu/xbbJPiiH2sY7Od8C34OxPI4sWt3JzycEnVJgVe48T/lDwMGRqIyz1?=
 =?iso-8859-1?Q?WSOvt/mrgiVQK0J5+uHDYk6N2HcKAZDtLv9/7x5IE0ESfsD1WRWkldNr0U?=
 =?iso-8859-1?Q?gpBVp2xx8KRvvAt5iG4kLR3jwEShpZUznsq1yc4LMUJRulK620WPLRLcBa?=
 =?iso-8859-1?Q?vATGlabblKLgZNqD8NwhgPm+Sd6tcmLBKLCN03SXTmhBu0TNBrCxMz2O/J?=
 =?iso-8859-1?Q?oHiUErVJev09Z3+7VwSItBu69+8cOsN91/XOWgwHNJB0EQxLliUs/4tvq7?=
 =?iso-8859-1?Q?wKreDU0VXplKoybzojHdppq19IS2st5B++eSO7q/LdUzBNBZrQWlDzGEQN?=
 =?iso-8859-1?Q?924UHW0d72iNnqa2sJYBNrcC7bH63MA4G9MqWN0vzFkfJmhHkM16XD3VDL?=
 =?iso-8859-1?Q?bRnBdY7RR0znm0dtpb1CD+9jI5CZRDLet2g7WVJ4VMV8x+ydIPE0QkQZiw?=
 =?iso-8859-1?Q?MN0TDP69nkgF4Ll8oFXhmKTaupobuyIwrY7JrvvQhalxOEyuIhIdDLiPfJ?=
 =?iso-8859-1?Q?69enDkwbsvY0SkA5dVp0KFzieR9y9rHM+xDcyJOuWAXXpFfDs+ukHC8+L0?=
 =?iso-8859-1?Q?FuBSgqS2UKxkyo8Ol3ex1UrKG4k/GXX6llctV3DXLtF0z8DwfZUoG/hgWF?=
 =?iso-8859-1?Q?6nYtGuIYLh7F8cszgt+Lod1D6mgR9k9SFTzGH7uMqzkKX0bhcfTxTDmlAO?=
 =?iso-8859-1?Q?ro/5lPvg4OMeSggs71Wf1VcCFJNNhN0RPBG3Ka3mC6zPXgLydrUzJVO9hC?=
 =?iso-8859-1?Q?Hl36JHY5I+gq+M+AUPuV/PrfIcOz9BEpFyFz0VzYu+uXArJ4HFdc1+1nU+?=
 =?iso-8859-1?Q?iBj3qQ8bnnhfxehxDcKBCqlAWwfZmqsBZzA+T/rh0EdfJurf9CTovyBwTB?=
 =?iso-8859-1?Q?GYBr/NInq1dN0QbCMMzFLDznlOiJ0dUVukoyidE0fG6sRpc0whBdjHdTTQ?=
 =?iso-8859-1?Q?QJDCwFKUT2BjCcR3r4KAXrKW9nxPvQM1MIpfKZF50kgzjD/MTtvli9BQBG?=
 =?iso-8859-1?Q?BNc7sk8AVkfMld367YHSn+1ofh1nNH+Zw6JW0ZUfO6IybjToZcU4Lj5vcL?=
 =?iso-8859-1?Q?krEfRJ+Dh1aCD8VmtF8/xbNMdn60iaUiF59lnCUKrp3oL3IUI3rhij/5qM?=
 =?iso-8859-1?Q?SeH7mIG4i1M+Vdp90PypBz2T5xPnc7ARimMpo8chX8JZulsJ4bdtIx2bT8?=
 =?iso-8859-1?Q?7bovWPcaGRD22bj39YX0Z03op4EaNTym8nb5TdTMJPZDNBI+2gaV8I49kF?=
 =?iso-8859-1?Q?txa/xS99++6hw78t6nu2Vs8GEwGYWtZRGGeqBMl+IUyXDflLWWHW2i1kTY?=
 =?iso-8859-1?Q?aQ+lmYr1CkOCxGtqoTwM3x6ITuhJRei9M/WCEXCKqvj+CgCuzYGlkEiSzf?=
 =?iso-8859-1?Q?iduFa5SBlQ4Hgi9OCuVXB89XHmSlrJB2oJju+5uUo5Avi80tTmjDGbsEIg?=
 =?iso-8859-1?Q?qrSu/Shcc1yjU9e0sh8Pr3WzJdxHHq++0prI3wR0rGi9w/MoGzfgW8bbns?=
 =?iso-8859-1?Q?G46mj8K+k9An2OcKU4FRXjc8MamgqAC1A+9zq5L4+GvrM/zUeoOhrwShKF?=
 =?iso-8859-1?Q?l3wQ131DgqIwcGX/4V54hSkBsdRbArQ=3D?=
X-Exchange-RoutingPolicyChecked: dsD9cb6X6F7RsAaXsB/JhTw6Fj07QFbwehkrDYGNu8W+lhSAaEKDyMBUO6GbR9NXvksjRG44KAGzGPUgrKb+ycIZuRk01oO5+Uf02H52waqzg+jjgUxXzGh5L3wxrDkXfXr3rq1qZ50ta1TU0x/GPrgfndLO/Rn/tSqoa4Ssvnlnwf6utSvxzfE8Rw80m/nNMlzWvMw4T58vsVL1BKRPBFvXpwamfFUfQgw62AKfNsV1+rcGYf4O3UkOY+DSxCbCQnR5pUur6Io6jpq081JFZDCBmLG0oe6vAeHti/DXDSZSF0AM0Cd1PlywR9fmWQ6X2oXl5htZUmuSoJYVVDFcCQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 06efee2d-2aa4-4c30-dc44-08df249fc09e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 18:21:06.6283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8VScfuaJEaBWhNqn5b39080AASvNo98a+1gfDFPlL9ACfXriS552Je5+0ld5gao3AD/k/+2DjRUUeeO/hD92aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5006
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

On Tue, Oct 06, 2026 at 09:05:29AM +0530, Karthik Poosa wrote:
> On CRI, derive the number of available VRAM temperature channels from the
> CRI_MSU_VRAM_ENABLE register, where each enabled MSU contributes
> VRAM_CHANNELS_PER_MSU channels.
>  
> Increase the maximum supported VRAM channel count to 80 and use the
> derived count to control VRAM sensor enumeration, channel access, and
> VRAM label allocation. Add a has_fixed_vram_channels platform flag to
> preserve the existing fixed-channel behavior on non-CRI platforms.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_pcode_regs.h |   1 +
>  drivers/gpu/drm/xe/xe_device_types.h    |   2 +
>  drivers/gpu/drm/xe/xe_hwmon.c           | 164 +++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_pci.c             |   2 +
>  drivers/gpu/drm/xe/xe_pci_types.h       |   1 +
>  5 files changed, 154 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> index a969661f0c95..d9e4847dd68e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pcode_regs.h
> @@ -28,6 +28,7 @@
>  #define BMG_PACKAGE_TEMPERATURE			XE_REG(0x138434)
>  
>  #define CRI_PACKAGE_ENERGY_STATUS		XE_REG(0x138120)
> +#define CRI_MSU_VRAM_ENABLE			XE_REG(0x138340)
>  #define CRI_PACKAGE_TEMPERATURE			XE_REG(0x138344)
>  #define CRI_VRAM_TEMPERATURE			XE_REG(0x138348)
>  #define CRI_PLATFORM_ENERGY_STATUS		XE_REG(0x138458)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index beb0ceaabb3f..161ba2b27f47 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -185,6 +185,8 @@ struct xe_device {
>  		u8 has_drm_ras:1;
>  		/** @info.has_fan_control: Device supports fan control */
>  		u8 has_fan_control:1;
> +		/** @info.has_fixed_vram_channels: Device has fixed VRAM temperature channels */
> +		u8 has_fixed_vram_channels:1;
>  		/** @info.has_flat_ccs: Whether flat CCS metadata is used */
>  		u8 has_flat_ccs:1;
>  		/** @info.has_gsc_nvm: Device has gsc non-volatile memory */
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index bafa175f8457..9d83d9d2286e 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -39,7 +39,11 @@ enum xe_hwmon_reg_operation {
>  	REG_READ64,
>  };
>  
> -#define MAX_VRAM_CHANNELS      (16)
> +#define MAX_VRAM_CHANNELS	80
> +#define FIXED_VRAM_CHANNELS	16
> +
> +/* Each MSU enable bit maps to one VRAM subsystem of 4 channels. */
> +#define VRAM_CHANNELS_PER_MSU	4
>  
>  enum xe_hwmon_channel {
>  	CHANNEL_CARD,
> @@ -48,6 +52,7 @@ enum xe_hwmon_channel {
>  	CHANNEL_MCTRL,
>  	CHANNEL_PCIE,
>  	CHANNEL_VRAM_N,
> +	/* Compile-time upper bound; actual channel count is hwmon->temp.vram_count */
>  	CHANNEL_VRAM_N_MAX = CHANNEL_VRAM_N + MAX_VRAM_CHANNELS - 1,
>  	CHANNEL_MAX,
>  };
> @@ -144,18 +149,22 @@ struct xe_hwmon_thermal_info {
>  		/** @data: temperature limits in dwords */
>  		u32 data[DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32))];
>  	};
> -	/** @count: no of temperature sensors available for the platform */
> +	/** @count: temperature sensors count from READ_THERMAL_CONFIG */
>  	u8 count;
> +	/** @vram_count: exclusive upper bound for VRAM temperature channel indices */
> +	u8 vram_count;
>  	/** @available: temperature sensor availability cached at registration */
>  	bool available[CHANNEL_MAX];
> +	/** @msu_mask: VRAM subsystem enable mask read from MMIO */
> +	u32 msu_mask;
>  	union {
>  		/** @value: per-sensor raw mailbox temperature; bit7=sign, bits6:0=magnitude */
>  		u8 value[U8_MAX + 1];
>  		/** @dword: sensor values as dwords, u32-aligned for pcode reads */
>  		u32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
>  	};
> -	/** @vram_label: vram label names */
> -	char vram_label[MAX_VRAM_CHANNELS][MAX_LABEL_SIZE];
> +	/** @vram_label: vram label names, dynamically allocated based on vram_count */
> +	char (*vram_label)[MAX_LABEL_SIZE];
>  };
>  
>  /**
> @@ -269,6 +278,14 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>  	return ret;
>  }
>  
> +static bool xe_hwmon_vram_channel_enabled(const struct xe_hwmon *hwmon, int index)
> +{
> +	if (hwmon->xe->info.platform == XE_CRESCENTISLAND)
> +		return hwmon->temp.msu_mask & BIT(index / VRAM_CHANNELS_PER_MSU);
> +
> +	return true;
> +}
> +
>  static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
>  				      int channel)
>  {
> @@ -281,14 +298,16 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>  				return CRI_PACKAGE_TEMPERATURE;
>  			else if (channel == CHANNEL_VRAM)
>  				return CRI_VRAM_TEMPERATURE;
> -			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count) &&
> +				 xe_hwmon_vram_channel_enabled(hwmon, channel - CHANNEL_VRAM_N))
>  				return CRI_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>  		} else if (xe->info.platform == XE_BATTLEMAGE) {
>  			if (channel == CHANNEL_PKG)
>  				return BMG_PACKAGE_TEMPERATURE;
>  			else if (channel == CHANNEL_VRAM)
>  				return BMG_VRAM_TEMPERATURE;
> -			else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +			else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count) &&
> +				 xe_hwmon_vram_channel_enabled(hwmon, channel - CHANNEL_VRAM_N))
>  				return BMG_VRAM_TEMPERATURE_N(channel - CHANNEL_VRAM_N);
>  		} else if (xe->info.platform == XE_DG2) {
>  			if (channel == CHANNEL_PKG)
> @@ -800,6 +819,70 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>  			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_CRIT | HWMON_T_EMERGENCY | HWMON_T_INPUT | HWMON_T_LABEL),
>  	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
>  			   HWMON_P_CAP,
> @@ -814,15 +897,37 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>  static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>  	u32 config = 0;
>  	int ret;
>  
> +	/*
> +	 * Only CRI reports dynamic VRAM channel state. Fixed-channel platforms
> +	 * set the count up front so those sensors stay visible even if the thermal
> +	 * mailbox reads below fail.
> +	 */
> +	if (hwmon->xe->info.has_fixed_vram_channels)
> +		hwmon->temp.vram_count = FIXED_VRAM_CHANNELS;
> +
> +	if (hwmon->xe->info.platform == XE_CRESCENTISLAND) {
> +		hwmon->temp.msu_mask = xe_mmio_read32(mmio, CRI_MSU_VRAM_ENABLE);
> +		hwmon->temp.vram_count = fls(hwmon->temp.msu_mask) * VRAM_CHANNELS_PER_MSU;
> +		drm_dbg(&hwmon->xe->drm, "MSU VRAM enable mask 0x%x, VRAM channel bound %d\n",
> +			hwmon->temp.msu_mask, hwmon->temp.vram_count);
> +		if (hwmon->temp.vram_count > MAX_VRAM_CHANNELS) {
> +			drm_warn(&hwmon->xe->drm,
> +				 "VRAM channel bound %d exceeds max %d, clamping\n",
> +				 hwmon->temp.vram_count, MAX_VRAM_CHANNELS);
> +			hwmon->temp.vram_count = MAX_VRAM_CHANNELS;
> +		}
> +	}
> +
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
>  			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
>  	if (ret)
>  		return ret;
>  
> -	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%x val1 0x%x\n",
> +	drm_dbg(&hwmon->xe->drm, "thermal info read val 0x%08x val1 0x%08x\n",
>  		hwmon->temp.data[0], hwmon->temp.data[1]);
>  
>  	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_CONFIG, 0),
> @@ -1031,6 +1136,14 @@ static bool xe_hwmon_temp_probe(struct xe_hwmon *hwmon, int channel)
>  		if (!xe_reg_is_valid(reg))
>  			return false;
>  
> +		/*
> +		 * On CRI, VRAM channel presence comes from the MSU enable mask
> +		 * (applied in xe_hwmon_get_reg()); the temperature register's
> +		 * 0xffffffff sentinel is not reliable for VRAM channels.
> +		 */
> +		if (hwmon->xe->info.platform == XE_CRESCENTISLAND && channel >= CHANNEL_VRAM_N)
> +			return true;
> +
>  		reg_val = xe_mmio_read32(mmio, reg);
>  		if (!mmio_temp_valid(hwmon, reg_val)) {
>  			drm_dbg(&hwmon->xe->drm,
> @@ -1048,20 +1161,31 @@ static bool xe_hwmon_temp_probe(struct xe_hwmon *hwmon, int channel)
>  	}
>  }
>  
> -static void xe_hwmon_init_temp_info(struct xe_hwmon *hwmon)
> +static int xe_hwmon_init_temp_info(struct xe_hwmon *hwmon)
>  {
> +	struct device *dev = hwmon->xe->drm.dev;
>  	int channel;
>  
>  	if (hwmon->xe->info.has_mbx_thermal_info && xe_hwmon_pcode_read_thermal_info(hwmon))
>  		drm_warn(&hwmon->xe->drm, "Thermal mailbox not supported by card firmware\n");
>  
> +	/* vram_count is known only after reading thermal info above. */
> +	if (hwmon->temp.vram_count) {
> +		hwmon->temp.vram_label = devm_kcalloc(dev, hwmon->temp.vram_count,
> +						      MAX_LABEL_SIZE, GFP_KERNEL);
> +		if (!hwmon->temp.vram_label)
> +			return -ENOMEM;
> +	}
> +
>  	for (channel = 0; channel < CHANNEL_MAX; channel++) {
>  		hwmon->temp.available[channel] = xe_hwmon_temp_probe(hwmon, channel);
> -		if (hwmon->temp.available[channel] &&
> -		    in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +		if (hwmon->temp.available[channel] && hwmon->temp.vram_label &&
> +		    in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>  			snprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N], MAX_LABEL_SIZE,
>  				 "vram_ch_%d", channel - CHANNEL_VRAM_N);
>  	}
> +
> +	return 0;
>  }
>  
>  static umode_t
> @@ -1557,8 +1681,10 @@ static int xe_hwmon_read_label(struct device *dev,
>  			*str = "mctrl";
>  		else if (channel == CHANNEL_PCIE)
>  			*str = "pcie";
> -		else if (in_range(channel, CHANNEL_VRAM_N, MAX_VRAM_CHANNELS))
> +		else if (in_range(channel, CHANNEL_VRAM_N, hwmon->temp.vram_count))
>  			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
> +		else
> +			return -EOPNOTSUPP;
>  		return 0;
>  	case hwmon_power:
>  	case hwmon_energy:
> @@ -1586,7 +1712,7 @@ static const struct hwmon_chip_info hwmon_chip_info = {
>  	.info = hwmon_info,
>  };
>  
> -static void
> +static int
>  xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> @@ -1654,7 +1780,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
>  			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>  
> -	xe_hwmon_init_temp_info(hwmon);
> +	return xe_hwmon_init_temp_info(hwmon);
>  }
>  
>  int xe_hwmon_register(struct xe_device *xe)
> @@ -1683,7 +1809,9 @@ int xe_hwmon_register(struct xe_device *xe)
>  	hwmon->xe = xe;
>  	xe->hwmon = hwmon;
>  
> -	xe_hwmon_get_preregistration_info(hwmon);
> +	ret = xe_hwmon_get_preregistration_info(hwmon);
> +	if (ret)
> +		goto err_null_hwmon;
>  
>  	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>  
> @@ -1693,10 +1821,14 @@ int xe_hwmon_register(struct xe_device *xe)
>  								hwmon_groups);
>  	if (IS_ERR(hwmon->hwmon_dev)) {
>  		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
> -		xe->hwmon = NULL;
> -		return PTR_ERR(hwmon->hwmon_dev);
> +		ret = PTR_ERR(hwmon->hwmon_dev);
> +		goto err_null_hwmon;
>  	}
>  
>  	return 0;
> +
> +err_null_hwmon:
> +	xe->hwmon = NULL;
> +	return ret;
>  }
>  MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 111d0aa45b10..e754668100cf 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -417,6 +417,7 @@ static const struct xe_device_desc bmg_desc = {
>  	.dma_mask_size = 46,
>  	.has_display = true,
>  	.has_fan_control = true,
> +	.has_fixed_vram_channels = true,
>  	.has_flat_ccs = 1,
>  	.has_mbx_power_limits = true,
>  	.has_mbx_thermal_info = true,
> @@ -798,6 +799,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_device_uid = desc->has_device_uid;
>  	xe->info.has_drm_ras = desc->has_drm_ras;
>  	xe->info.has_fan_control = desc->has_fan_control;
> +	xe->info.has_fixed_vram_channels = desc->has_fixed_vram_channels;
>  	/* runtime fusing may force flat_ccs to disabled later */
>  	xe->info.has_flat_ccs = desc->has_flat_ccs;
>  	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 15eedac8467a..ce0b0f6c5b18 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -43,6 +43,7 @@ struct xe_device_desc {
>  	u8 has_device_uid:1;
>  	u8 has_drm_ras:1;
>  	u8 has_fan_control:1;
> +	u8 has_fixed_vram_channels:1;
>  	u8 has_flat_ccs:1;
>  	u8 has_gsc_nvm:1;
>  	u8 has_heci_gscfi:1;
> -- 
> 2.25.1
> 
