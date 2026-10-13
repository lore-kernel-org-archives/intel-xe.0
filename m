Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD3DCA9ED0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 00:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A665910E6D4;
	Tue, 13 Oct 2026 00:51:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190DD10E045
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 00:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791852701; x=1823388701;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EF4U8dEvL1sUQVn5+IdmWrjqZBJp9X6WVY9V9xitAh4=;
 b=VzJq4d7PefroMCwMDT2fLhLAb2W9gpvemx/NaAO+YVGHAfZk5BKdVciA
 3kpfBbDrxjcG4B1nhEYvFNqAwh1D6DXIs4qfzWF+3dpyjBz/Meqs6CAgV
 2+vbUbtIRCJy/kR9H4sevcNUsJzv1dGW6LpnQvs1CC7tNfNRa4X0SMjis
 RKyZWW/iOF2ZwffgX205eeJHIg/c7vfbepgpZyU5bfOAPSngOWowwnJLd
 835iyJ6yOmbxbhv4WNtDTMCeqYlOPlhIGgC7RIelaUt4Ia1yIqiARFGAZ
 j2oSXFwTC1aDchAYpqa2lcesLH6vdkD2aOmOvbyh3rRilyD6kfbBe8444 w==;
X-CSE-ConnectionGUID: PZAs2ZQ3SNedMTRkR6fNVQ==
X-CSE-MsgGUID: puUHKzhATUOLDgpOYJZqTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="574818"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="574818"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 17:51:39 -0700
X-CSE-ConnectionGUID: 0/8FxmIkT2im//tF2JIs0g==
X-CSE-MsgGUID: BkTIrTZfTHOl5eejLb9prg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1359022"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 17:51:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 17:51:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 17:51:39 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.35) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 17:51:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aE30zJuRChp/vkp3BCj4hAitl+kAj1KlGVXCIwe/HSJ6Bz8pXmQCuJFHoQdd5koYjIfgWe8XmNahFNaszCfVIlC+1iUH0f4mq2dsCwgobGc/4MOCjmvA93dYHj18dvk2Vcl+x6DME4tSffl2j423AHVyhcN5xOr1zNpriKfQfQifQtKV0dR833uw1i/hSNBoJG/PteSrUVCCRInjS5bPzzJPjDAYuatW0diG8RtV+VJOyoe5F82yr5t3YKtyhpzzabIj19kedKVyCgeWcn77H9nIrfsmzy2X/qiuFIXBHllx1D/1kD4x/u6mkqkWtzRy7BtXEWtUVqGFTdXq48+SwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMA/MBz7aUl1NVdfnFgQe6iE9ukXxBJLkm5DrQv/gOI=;
 b=xsoEhQrGMGLkqlAW04+ZXpzb9BG/7s5mD3UPmAoLRabPANf3OqcK7jGmFwFZU2/yHMwNvoohrihl2i2lESALWLG+W68YRtDegJ5tujl+tHTb1UOcjcLIRnchi/C30P1I8Hqty6z5KawuSFCd4eoQHkCFGDcRo9PlzGlbYt/VAvm4uXb+UQiE2CX1QgGrrC1GVI1VykYyiHgHAb7QVfNRBb04caJtCiwaqmYm42tsXHCpF5iFr+o7ZEgF6DSvL+523rhXT4lSe8TPx8fGWht25VDXkRo0ffqYhmYU27gSInx5mRu3XQmqNm8nJI8HFF7H0ufwdjvbP7RY9W/cEpJb8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by BL3PR11MB6361.namprd11.prod.outlook.com (2603:10b6:208:3b4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 00:51:37 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.015; Tue, 13 Oct 2026
 00:51:36 +0000
Date: Mon, 12 Oct 2026 20:51:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v10 10/16] drm/xe/hwmon: Add platform-aware VRAM thermal
 channel support
Message-ID: <as2AisIHhX-nS4FB@intel.com>
References: <20261012130401.443473-1-karthik.poosa@intel.com>
 <20261012130401.443473-11-karthik.poosa@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261012130401.443473-11-karthik.poosa@intel.com>
X-ClientProxiedBy: SI2PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:196::9) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|BL3PR11MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b6fa9d-ed9b-46ab-b2be-08df28c4222d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|10067099003|261009223027099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Jrar67CRmAjbWwpQu8NrQJZyPC4vlWrbNRMi5ESEveKxqIXpuidFF2Xf7shCKGxxPlbgffHRjLxx+XkJHgm2kZA5G3//LWoqqeJbrfuXXuGrTj1gDiwfAJuBPu37xAxTyJUXGNxYR+m2QruNiShgTUTz/UCOeuuEM1V4yA0VArek05Ywyo3Hb750vTNfI/LO7TpTI2eG0IHOB9sV1XVut+ehkJF0d/Iy3yT4zusVhu0iPae4/ji6vP1yKLP1m3xa+RasSjAHRw4DFMBUG4i77Y/LpQIyXYRtTZhnzMgKWz1QaltGMnrD4x3Lf4HKCuUP/OPSyKhkbQh3u6zhn1DG9jZ11Kc36vX0AXT6ebO4Uy5m8TAHHaLv89G1d9Ps0tOtTuLBgYesS/q2MoioSB+OMTvqQ/cp8kzeMcugRx7XVvWqi/DC/TZXj2DDA6bQ17z+g5UYlJQ20QMNGHBJZ5Jj/xbBEeSYNx3A1OoUB/TtBEk/AFYggwMdNPbwRJLWVTqv4H0iARZsZzELKbiaRuwCpt09ElcUlzCwSCkRf9qRtCOJEoeN6lzwHSCzmZjGDFn/lb3faAYTgzWbNUWFrGoa1Yrc2x4PJQhg0g8aiTPJ4OyvoDifU0JEtcwu69iBaaqAPxZID9cCNCaXRsaoQKm5BLERPw6NVqIoENH8Mc9fr2k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(10067099003)(261009223027099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WfHrPnodFNBmYjcpDwKJaz2hmNDZIOMOtxLeang8zAXaBoOOX1jYw2JTuu?=
 =?iso-8859-1?Q?REdv/HZeUwG9o9ucFiRNS7+58HTZn0oGSTTQxLv+SgwwfmZX/P9ZI2eLlz?=
 =?iso-8859-1?Q?LSiaaqfITzMlXalgu9I8pCBqRMjteHZec3FCKnn9CqZ/+5OitbP+SaFQHV?=
 =?iso-8859-1?Q?X0IlyhTeJtguNYckmOynlK2wvEjvGL1lWTCdKjYhgphkrIA7eCwG7qzAW4?=
 =?iso-8859-1?Q?AzfRnhFFoalFMdZedRMj1/Wsz2FSLUazT0aMfBNoP+reZ5YwKKZ+SHcvQt?=
 =?iso-8859-1?Q?YgNvQqiKxGO1Lt3+zlHOnU/gN3wLVFaO26rCu/sDdhIJx42sp7tqiXIU0b?=
 =?iso-8859-1?Q?9H0B1hk4HiwGJD94hDoURPFrzFyk4syakB2XmI7aE+TjNWR1Sf41pZfm8Y?=
 =?iso-8859-1?Q?YXMIsyK83PY9uIFAm2SzNcTFXc7+DtuwJ7kz3HwhmSY5yUIWlz7nIQSrvl?=
 =?iso-8859-1?Q?WVYeJiTwqfx7z4rJMo0zjP9zr0oSdeibvWBeiAJo0mhz08CgeqMHZimVAq?=
 =?iso-8859-1?Q?Yu5LRTyM1GOj3gCq7y1G1CJSp9F3807Ki7YSrdxzTJ+QLKTcf46Wbexkt4?=
 =?iso-8859-1?Q?c1jKJZVkKx+duMQx3TLCASLeq651kTaXtZ0Sn0tFinTvEcDyKbRtUGtZF6?=
 =?iso-8859-1?Q?OMCEszSpaIOD3PXoLV4/lU4URvW3+Bcnfe5uI2NbTkdOU4qED4ViRMmMVv?=
 =?iso-8859-1?Q?YZOcvm7U/R571jSAe2sIJm/wr9P8yGH3cIc/JajpP4CYxMLVSWbfOXkH/N?=
 =?iso-8859-1?Q?04ttB8aju1Uw08i5vxwqmhXnNjO+qbpJjZ69ZV85oGUpLf09dTNK5YGxww?=
 =?iso-8859-1?Q?wg+S5OEFHWRESvyIilmBmN2qmzaBvMe8O341MGIGe2YnNTv35CBJ096KZU?=
 =?iso-8859-1?Q?JCs0K1xtWoXlk04DBwcW0MGAiUHLoT2oGJNWM8k2zdHddFmpRnldgpI1q9?=
 =?iso-8859-1?Q?Fb5S3kZj6KprGvrv+lEyoHc50EQh1X5HvzYHxGskNOEOF6NPmVdUJbRYBI?=
 =?iso-8859-1?Q?y5FMOTipZjuozmviuFhP03q3CmT9uTjrDP1v43oAvXSIOtxyZCGeD+hQ49?=
 =?iso-8859-1?Q?aoGXYIipfN/kjeyc/m/DUUI8OLA5wG4K1Yj/5KovXCgrmQfTvgn8lj9V0x?=
 =?iso-8859-1?Q?rrZU/uT8nTygNvstk1oWZAlX5S3nMA9mdA6+9R+0koMD9OTWXL1FcMtNXm?=
 =?iso-8859-1?Q?NC/nxWzxffo9guv9cYezjUIE9yf8rcNkhW4eYs3zMgpbu7f3yYP2/Uqfdv?=
 =?iso-8859-1?Q?1Fk2BKNo4F2v9qTpWIa2UJNVkcOKyuZqL7ymSz0n1ld33bxgcun4dl7bsZ?=
 =?iso-8859-1?Q?2LSo5c2Nq6Uti44toIpfJKjDZI+A60cMYEBkv1B8+AxTHu25b8enxHLXhu?=
 =?iso-8859-1?Q?fW3nFFBPEiM8E6MfRiGsiVkUhREFMeRv64BnsGBWlKTOFJC02bfe+SPQ0j?=
 =?iso-8859-1?Q?q9gJZksCqYAYncBw5ljNfoEHukPmYtNHJ+ag6aIaTdCTjWfpfu7l0rxN6o?=
 =?iso-8859-1?Q?S0VVJfTMxR9Ys0tZV/yyeMmbee/eY7JVT08ShX+dp0ATRV/SAz5uRm1mL7?=
 =?iso-8859-1?Q?Ldf7ld/UkTwq4yumDZCMIY3ypYVlIKIKptC6Rqk2PhsLfCXlWGkl65zQEu?=
 =?iso-8859-1?Q?v08wvxeKZcvoEiMHFmorAnXCvIkcdlodTxe3a9RVcHaSEiuPtigtfF4kzP?=
 =?iso-8859-1?Q?K5XzCgONoXpkpM0yva6N+GDtb/t6fN+3Wp0bQKcQQFa6HrMqTLtSBsyXka?=
 =?iso-8859-1?Q?DdViUxpdoYyVOSQVE12zRb3qsHEhwd9Twubq3FLr+S2ylAhkS+xsDkrlpp?=
 =?iso-8859-1?Q?tPXLm/yw2wFaorAgMRbsUbQAH+YxNzw=3D?=
X-Exchange-RoutingPolicyChecked: oKmmqWiJXQY+sT9Ia4ylkNfALtBmvqDupgzJ3RssESsSGKmM2butb9OinwLkzP59HaGNkJZC8MNC8LajfN1ej5EEQfznFkaBqXwn/0NzU01ASVCX5Lh4jltENZpDjviMx3Aso1/T8oLHhaaMU/Cg1ePSXaycSlEvzGcXnbPfaWmtcON13Hehr3GVhBBhyA4/CE7FYJpBBxjQ2vvNPPY3J7BKu69tlLVB7cxUYeVpCEr9rO3QJYq4uoIHkwfdS4a0LNjGe1i6y3ziv3EtUg5yyCQhHyayzu156j0sgS2pFPimOYMzub39R3RUEC3VPi8JULwK8a6axmLtaQ/mH54jjQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b6fa9d-ed9b-46ab-b2be-08df28c4222d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 00:51:36.8711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TV51YdqnYVvNL/ZmBSi/9HJPnfT+EgCf/dElLYk2fvlgyxwQbG+2cbk9rUc0y0FUPpvPDbzo92ZaiKsJ2i6nAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6361
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

On Mon, Oct 12, 2026 at 06:33:56PM +0530, Karthik Poosa wrote:
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
>  drivers/gpu/drm/xe/xe_hwmon.c           | 162 +++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_pci.c             |   2 +
>  drivers/gpu/drm/xe/xe_pci_types.h       |   1 +
>  5 files changed, 153 insertions(+), 15 deletions(-)
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
> index 08c4db36ced4..9a0e0236a37a 100644
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
>  		/** @data: temperature limits as little-endian dwords */
>  		__le32 data[DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32))];
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
>  		/** @dword: sensor values as little-endian dwords, u32-aligned for pcode reads */
>  		__le32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
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
> @@ -814,9 +897,31 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>  static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>  	u32 config = 0, data0 = 0, data1 = 0;
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
>  			    &data0, &data1);
>  	if (ret)
> @@ -1034,6 +1139,14 @@ static bool xe_hwmon_temp_probe(struct xe_hwmon *hwmon, int channel)
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
> @@ -1051,20 +1164,31 @@ static bool xe_hwmon_temp_probe(struct xe_hwmon *hwmon, int channel)
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
> @@ -1560,8 +1684,10 @@ static int xe_hwmon_read_label(struct device *dev,
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
> @@ -1589,7 +1715,7 @@ static const struct hwmon_chip_info hwmon_chip_info = {
>  	.info = hwmon_info,
>  };
>  
> -static void
> +static int
>  xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> @@ -1657,7 +1783,7 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
>  			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>  
> -	xe_hwmon_init_temp_info(hwmon);
> +	return xe_hwmon_init_temp_info(hwmon);
>  }
>  
>  int xe_hwmon_register(struct xe_device *xe)
> @@ -1686,7 +1812,9 @@ int xe_hwmon_register(struct xe_device *xe)
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
> @@ -1696,10 +1824,14 @@ int xe_hwmon_register(struct xe_device *xe)
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
