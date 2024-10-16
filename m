Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A7FD20682
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 00:00:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D764010E635;
	Wed, 16 Oct 2024 00:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMUZXI6p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDD210E635
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 00:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729036840; x=1760572840;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y2WHeDMDzoJAxWzSZ5tMNGcgvv8ypKTc0mEURngWdtM=;
 b=gMUZXI6pA5vKjYHeI2Nu2BCchOpCz5sLNo99wOzKF8486EZn3KcdyOhO
 I1W4fjuABmuAz8+AqF+vK0uD5signVMgH8l5SIfJcdRYMAfHImxnfXk2F
 eZctSAdyn+v3ECrtfXjz4wx9vfE3u+LbBmGAZnGw/6z3gxpvZDyauTX/A
 EklHJDRtzujANOuWEwJw0pOqQUk6xsV1FiMiQNfYMglOUjTgLpGHNkdRC
 cgGcwNBd/7+MaLj8JnZPCDszt9RD6wiyvUloq++QwsQj4YBOLlOx6pl9e
 9WELazj559zngQeT3DG2Qz76upmmzL8oniMuAWRP7SA8brkjaIiIjkIzW Q==;
X-CSE-ConnectionGUID: SKYC2VmAR/mteqhw6y+E4w==
X-CSE-MsgGUID: S3eqTfhVRd+p0Yeexup65g==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="45962820"
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="45962820"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 17:00:39 -0700
X-CSE-ConnectionGUID: 757zYoAkTWySHuy5yXGLeA==
X-CSE-MsgGUID: tCzmvBjYS963PC09/CW5mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; d="scan'208";a="108837445"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 17:00:39 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 17:00:38 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 17:00:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 17:00:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 17:00:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vptgqUxehccs+Tuz8lBBh1TjiUmEJdaq3tCjkvym9QGDHnHK/vB5QnJ5bgnd0Ar0nBjAdr52h7pzjOYHSF/+fjS4dU56gSFKUqF8sFWJ/sXlwBJS5LG3VZBeJrgZh8rIvspSp+3JHt5HKYQxq4FSX9aDHlBbqH+L1BNVYtzjRYit9uMlEUuzwQ4L0VNNR1P2GTlbdUVvsxommWeeATf/Z8nzLXTdvDw67Se+ZVoOXHHd5XVd5wG6RaeuH6MY0Qf/PHD9/MLJDyo35eVQoQhnfm/Qs43ufzrFocMyHnrvTt6ZFw+PT96IkMsatrrOtfeRDEbB1qSF79CqmJ3qDL9fbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sTp3n5jDXuT2SHFeCzBeAuioV+ULNF+M3pANnBIrzNM=;
 b=nLXuvbIH87Up6+RrzhCjrK7GwazHHaJgvKm8eUWUFvuE724YZYGxZ362ZbO1EE+r4lANm0YtfZulWx52z97bid7Ahxo4sxyDBz3tUptry3sS6OmMm6nVlM+RMooBGwInBrpgfnYITzEgzkn/Lu3fK9DBK2oxCg9OKsNE5/nan0sx30FoJRp6YVU2jZ2sdMw2HIFbdNCuB6n8vrOxDSg0akomyosMQyVdtrkXZEEsiTk8vC3Icc+XAiC9ermj5AAdk/B9z6ChidiqLLNvVctSA2bqSwDZENAIrsRk8UZW8d3mxBY77d7D4GPodnwxDDm7yC8k4HvLgfkpSYqWMHhhMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Wed, 16 Oct
 2024 00:00:35 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 00:00:35 +0000
Date: Tue, 15 Oct 2024 17:00:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/ptl: Apply Wa_14022866841
Message-ID: <20241016000030.GF5725@mdroper-desk1.amr.corp.intel.com>
References: <20241015234428.2004825-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241015234428.2004825-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: SJ0PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:a03:333::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB5108:EE_
X-MS-Office365-Filtering-Correlation-Id: b6d842de-dfc8-45e7-60ec-08dced758f72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+mWz/k/hrQFFg9q5QqNSgIWF+VpkY9BNlEwbZVfswMp/pEgEL6fDvT4upOUD?=
 =?us-ascii?Q?74L5xNcTJN1XHqX3BMATWyuktR7INeDHV5PK6W+XQzkbNxa6BXJ6ck9BvefG?=
 =?us-ascii?Q?5iRTKXX8UgLyGNbSfHYGF5UM13fFtQ0OBILjFenBcmIERZtO0V0T/xpfu3zi?=
 =?us-ascii?Q?XOERyg4lWHtezt9SgiYY6m7DKWUfWmSowJvIGS5XNeghr9xKhUIyqFo9JwT9?=
 =?us-ascii?Q?erkAWedTFuMHvCaN4lQSxfkC9H2Zl0mVDQ5HaSlvmeoMsTIL4NT4Sb9HvEt1?=
 =?us-ascii?Q?DjekKJmef1udk3GjhQWcSuSHcxEK2pWMa8BPizF3Vgp5asjIQlQlVa//zFdF?=
 =?us-ascii?Q?4UpB/GASnHxXEvLUUQVefNEWOk1wVmwpVqLxdBOz6zwd9t48nGBZM6+WtIio?=
 =?us-ascii?Q?H96tOcvY/sADKKM97RzJTATiCv5l190AKZY+Ml+ILx/iE9qqyI1Z9iavEhbp?=
 =?us-ascii?Q?hRmHxJqbAsn/+WyNo/pHk4fj4FjcWEdX+TbhXITrm8SGIWX+Zb2qrpIWCwJL?=
 =?us-ascii?Q?0sofabgi8+DtP1g9hoBvItXofFSda5p1CjI+d8HSuiu3JWneaMnq+c9u8HWh?=
 =?us-ascii?Q?Ku0SC9LbmpYUfAjHpp09sKcIUbQzJFQfzsXf+ro1awm724ypgEiYJfdEgcoM?=
 =?us-ascii?Q?uh5zexhrT63K9BsjZ6+E804LHnmTMQjdw6XFBj8HiELOaKvsOkAmIqQpeL5B?=
 =?us-ascii?Q?i59fXSX7q8z5g38zy9TTG/sIrN7bAwVhZNmfeR7nQkWLnTHC9oGdD3kXuhTX?=
 =?us-ascii?Q?Q1nmL+Kq1KM0xIT9w5q0ZVaBuw26C5ZvpmqB95I4ua1mG7PlM7qiY4t+4/NQ?=
 =?us-ascii?Q?sTBEzdXoE2za84565iwLC17S8MDO/WlMMIYHwvlOtY93ruDpLn6d8K5XbTty?=
 =?us-ascii?Q?moZG42Bhc6IGdkxswJLPEbDNE8e/d3oRVk0E7dmAKW8j/2zS4CRlo3l/cP+3?=
 =?us-ascii?Q?WXj2vj1Gn+Ul2QYtu3s9e1LFwHmZIyoGr1mgbTMiCOzjT1Q4VTU37fhJ/eSR?=
 =?us-ascii?Q?z4e5aKMI6hkhgqFZPS4QxHHYXCAO+454sNxLrvJP0X0n52yK6/mJXDa6Efw5?=
 =?us-ascii?Q?fuioqfxeGQh4CYX0fLed2B5IwJ3rk0w4TC+NHrN/r68i3XVIuFJbZtW30Jre?=
 =?us-ascii?Q?WhTrJ0g+xmk/qIz58XWX5hcz0Wr6ZWs9J7iLXODDTT2AAdO+xbfDj3rn165i?=
 =?us-ascii?Q?UqShMp1B1GR4r8tXrMa/WCfoujjrmDZ4ZEVEO8ft64DAB0zaNTm3EfFcBh3E?=
 =?us-ascii?Q?BnjsHnLNnWto9AGHQKYlK7TpKs3LTIjD7wDo6B7YCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RH+vf+MFA0HdVmmv5Fr1gppXp2V+GqEk2TLy+OsGd1hCusSgB9gXG/QcmUd7?=
 =?us-ascii?Q?Y8ktiVOEMuwOEtCQd09Qw80sGiGoqTkG4w9tl64brKBbNjWeA/IM35xx9yct?=
 =?us-ascii?Q?v3uuqyZq8b1hDBGO/Diuj7hf4W3Qpu2d6DxxwsYqtpWqe5k0BwEfGggcWNKc?=
 =?us-ascii?Q?qz2Jl0CS65Ve67upDhB6VCgbpR35C4xVocdjGiBxd90jim+WRpVYc2v/UQfM?=
 =?us-ascii?Q?D1YsSyF5aTTcuSam1w1sgo5S2SScKiMc78440ZTM+E/0sH3JrLYY5mKE5i6E?=
 =?us-ascii?Q?swha25zg/k1z+Rednw+pTakjz+0jc3AOH/htT/MsOW8M2W/aAPp2wBIscyf9?=
 =?us-ascii?Q?ZZdGbpb7M40cEN+g7z01pUQf3EwaMSt2bqFZkDXsDiWxJuItQjY/cDdo1fQL?=
 =?us-ascii?Q?Nc7fSq6XcfBTDftrnkye6rM9xIgIrYL+n4MrAd6osZhUWU13DPlWyPujkKq8?=
 =?us-ascii?Q?GZAvkwBSeMDxhHapkGPKxXZieRgM9/cxTj24EJQW0ZDc9hl9iAmp6n/Am2tq?=
 =?us-ascii?Q?DwEGChtp26xgVWSm312tc9mR4onDUkef1UBXa5lya2v6TSA+gR1c0TYPHhMw?=
 =?us-ascii?Q?RzIvpzB6dhdzo+tKetRp7UaEp5boBU3GyFpDbX4f85echabOUOFL6SlV3/9K?=
 =?us-ascii?Q?mlDeugd/olVcSzdibUsRYrOLhjlAMTX7T77P3x7zE6aabzk8pucaVIBVDpEB?=
 =?us-ascii?Q?ZdsqOWHB+SU43Ujr9Hz2YT3EckVL2UIw5D8SFlqcnx6CFPcCDBTSfDepRnNh?=
 =?us-ascii?Q?qNtTC8565SlZhjNy5L6OTGFMv+i1j5AUO1dhlqetuGFAGIG+p3xPZkbebadN?=
 =?us-ascii?Q?ItuIXE7CrYmsuFYxye1l9k0avZG1x9AfZ3tit7MGux8eeczfLnQ4brB+bFAA?=
 =?us-ascii?Q?zZGnwTQXExa/9mXy1Ohn2w6Y/YVfjSglf1ULuGtM3u1iHrb1ItvvOFwjuirS?=
 =?us-ascii?Q?20o+lum3w9oGZR8qla6JF9M8fwEKQ20MsBz8GkhDSz6E9Tb2thFBaEsuxwB5?=
 =?us-ascii?Q?yn3Oi7vVq6BVt7YeH+wgiENGJyA4l0zb64LTW/SfzHEEX4eSjLEluuF4YBVx?=
 =?us-ascii?Q?TaMUcB4SLogmHfFjIDHkWKqLhI1IfW7LL80DzBEU3N9Enc30ersHMu+xUMCl?=
 =?us-ascii?Q?IA/OhmyP7fc3FGFLAcu5K1uq3jr+ruhmQSeZHbt6BqRV/3ZwimOrLPX8PuUM?=
 =?us-ascii?Q?6BvxGfhDrwO0xw6ZFeI7VB4d3SECcp8uEx1Wkde39tkfYiooEpzlf8efYBgr?=
 =?us-ascii?Q?906OhQRa5/3xa4+Z1/zp9ql7n12NAz6CmvQimAvdN05DV5Ur9kmYPTL9A0Gg?=
 =?us-ascii?Q?H3Nmw8vnEEkSrSQwdyGPsvFQF9B1fmgJXW5dcJlySnEt7NkKj4wtIun/3fcw?=
 =?us-ascii?Q?9l3V8Y0olCDCTclwx2P8pt1tfh2K+RcHs34arzaQ6IuTjx5Tvq8YxbCVoEBS?=
 =?us-ascii?Q?F0lwREM98E0U2bvErlcCPnpxnqNz4DDxCVhZOrhhtBGk25uksTb5qj0AHQ1K?=
 =?us-ascii?Q?GEgQ1v9Jvhjt4FdMdPQBRcAa5AP5Un6mCiqMkx0w6WUUSN8b765nIyY0ZMa3?=
 =?us-ascii?Q?lAmAA7V4ftNtNOyJkkZFwblOUwLSyyKfrQmeAsHV10+UwgjrTpXbQZ9vW+5q?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d842de-dfc8-45e7-60ec-08dced758f72
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 00:00:35.4432 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPbKGo+22joVIBDJn4RXkGxXbTVbfuLURLuZDKbKGeh60xo7+OeB73mgFjhDYvGjbfb+JwtFpOP4Gfx8YZ5PBPoImu29c3IfalSOjl/QQ2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5108
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

On Tue, Oct 15, 2024 at 04:44:28PM -0700, Vinay Belgaumkar wrote:
> As part of this WA, GuC will hold a forcewake for certain
> MMIO accesses outside the GT/media domains.
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Since we're not using doorbell submissions, activating the GuC
workaround should be all we need to do.  The KLV matches what's given in
the GuC spec, so

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>  drivers/gpu/drm/xe/xe_guc_ads.c       | 5 +++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules    | 2 ++
>  3 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 6b30743a2f6c..37606cf8cc5e 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -352,6 +352,7 @@ enum xe_guc_klv_ids {
>  	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
>  	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
>  	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
> +	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 25292997c7f3..4e746ae98888 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -359,6 +359,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>  					GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
>  					&offset, &remain);
>  
> +	if (XE_WA(gt, 14022866841))
> +		guc_waklv_enable_simple(ads,
> +					GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
> +					&offset, &remain);
> +
>  	/*
>  	 * On RC6 exit, GuC will write register 0xB04 with the default value provided. As of now,
>  	 * the default value for this register is determined to be 0xC40. This could change in the
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 264d6e116499..bcd04464b85e 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -39,3 +39,5 @@
>  14019789679	GRAPHICS_VERSION(1255)
>  		GRAPHICS_VERSION_RANGE(1270, 2004)
>  no_media_l3	MEDIA_VERSION(3000)
> +14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
> +		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
> -- 
> 2.38.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
