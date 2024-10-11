Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403C2D0EE38
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 21:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0563410E09F;
	Fri, 11 Oct 2024 21:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cHiQq9wo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441ED10E09F
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 21:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728681450; x=1760217450;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tjp2T3luqv2BKDQtBhWhrTUZSh7m90UqDaGoUsLvNOE=;
 b=cHiQq9wown+LiKbq2ReqfefNq3+0bkiFWj7iZipGsMnrTX8RvO0/haom
 4QKYlJ/Bpty3ud1TtVSh3SRWNhxJsjT5QJQSGrqqHbidPKdHDTVJopxnh
 Id6bu3tqLkQMAaoTmc65Uhj5o47Jmy8CUNr3pOX/IGBzmGj3iX5X61Epj
 9cgrrljYbsCdQrueP/CqfJkz7enLXKVbBQ0awAnd6GFXd3vQGV7sGiZYA
 WfKAt2xc3WKWoIoE+Fgb0Z7ki/1DY3JDobvv2IZWn3CIfhRfJzWGQG1Kt
 m11uhTHAOwF7kK1V0U+Nca1lI0svhATNWS+hipZGeH9ABirT9CrmeQXrK w==;
X-CSE-ConnectionGUID: Ujgs+iLkTQ6xidJrSGTzZQ==
X-CSE-MsgGUID: IW8LiCn1RymWO7sl6gzSjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28221481"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="28221481"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 14:17:29 -0700
X-CSE-ConnectionGUID: zM2ehm2qQc6LbHpxQtIJlg==
X-CSE-MsgGUID: hI1b+ES3SN+Cb2nJn1d4aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="77118213"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 14:17:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 14:17:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 14:17:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 14:17:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 14:17:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrMjoY82xIeNiWzxK+mYeR7vMMAi4VTPeNqwAQgE94O5dWz5xLJo3O45xqmAn0x2Vn1IOJuetfqtMvRbt3kOKy9lGqhXTU/R3eHD94zmCZ3xVOkVF9lzOGe6i4ttnYHm2qScJj3TLnM3Njvp3rhKEeTjfwu5VAhO2esaU8T1KNY9KIRH/Ct9REmdFYhdh2sdCVRDKZLxsLy8GJY4sijmNGHJVVA5lINS8ARF9i0gOJfBPtsZyWq5283HBVUzUVacK7TVRHmaW4hLUPK47JWWxUMZH/H8dGxi3ZfFwHioConJkqPp84FOlOiP2iJ0+7x+x4lDzhsaa//TtCoXa70+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICLOJkNNPLZrVLbzoOodHFHumAQ411dVU9oiHkj6wCI=;
 b=bIOFgMoQYhccYWjNX+3eKozpRdK8/036oJW9hqT8R7zVOodbMOeVnAICi3gOObaosZEHeMHXAVAVc5LkEsy1Tgc3MjkWYI0OfUqUjbpeofy/gn3EOvcFxUP46zw2kmDT3rpwBwBVcbDG7j9cQxTXKDkXiIxYVRRdu1+Enkju000VojYO7EOFiYgKpIVTOvIxesztA3NCPD8A4JbX5ezAlq1LQtxp4vr1fSU8FxGxFhw3X5jA7B1N18a1KTXDefFzUWFtr/6x4kwQCKDXg/OkLET8iuR8fZayHvzAXtYr8gezRn/SIJZNfng3IniZL/QvqwjyegMXdTdCYtanRvVuBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Fri, 11 Oct
 2024 21:17:24 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 21:17:17 +0000
Date: Fri, 11 Oct 2024 14:17:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Sai Teja Pottumuttu
 <sai.teja.pottumuttu@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Szymon Morek <szymon.morek@intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe/query: Move timestamp reg to
 hwe_read_timestamp()
Message-ID: <20241011211715.GB5725@mdroper-desk1.amr.corp.intel.com>
References: <20241011035618.1057602-1-lucas.demarchi@intel.com>
 <20241011035618.1057602-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241011035618.1057602-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: eaaf1c33-7d59-4b81-9a2e-08dcea3a1604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mn84oXP3Ck8zH0Biyo6LK66Jc5EVCH3GObES2JPecRd6gnVpAyJTmfS0t+Mm?=
 =?us-ascii?Q?AqgpJg13vkUrlXSGClP0ZDOQHXzY1VFvZLWRECTxTvDLANZxBFXe2H5bb48y?=
 =?us-ascii?Q?W7iQtJLHpDTOdIqa6QlVO6mmHMQ2hLnOXV7zLJbuzRjCjIqDITtvN7n5GBvb?=
 =?us-ascii?Q?QTKZaEUBbmKy+4ZeUMc/T9CLJY42STqk81+KGpEmshv5+pe6niT2QKIO6uAR?=
 =?us-ascii?Q?ZYSCGBJroarVzbZDyuNS7NHZGGncikLbhJYFtrXpMKAwNsWzIU8+D3XcBbrT?=
 =?us-ascii?Q?rn3bEzp6f02iQLbpfqWzlPOmFfE+V6e3HsEOwuNmLhXbCQg0gdgUP/b9Dgj1?=
 =?us-ascii?Q?HGmD/SmRmY8As0LVDv1OBVWRCU+Xe3rHd8l0lMI00obm/dT0ewWOXLEqasIb?=
 =?us-ascii?Q?lTDMyfq2QRYPIliK0A2uD2Qp5XAEe5jL3s97Mt8ffwuu635E/9RDaAT9o4zx?=
 =?us-ascii?Q?9sgDjtAWVPAPe62xMsM4b6I645WraFo2tM6IlouNvcwVtTu7hhdH2z2NRaKh?=
 =?us-ascii?Q?TexS0C+pQhvzHS+q+jT8Rg9p5OVfJDhbNwrQt3HA+3A2TyOVlMpjJ6GliGFl?=
 =?us-ascii?Q?8VaEE9ypFRxfPwli2yc0ZDnpiTnz79CjalyJisnZtYuerCVn697PXYcELHVA?=
 =?us-ascii?Q?H7hqKC1gSM1AWK1ROO/i8gTzJOk6pBE7AjdV/+Nssfa7XEwgv5zyzHv0mphQ?=
 =?us-ascii?Q?q3wwx32rivn7XlPbg93jljA4bCfrsvtBNwEWWGOlvoaMkTbSANjlDHAObWcv?=
 =?us-ascii?Q?lZQzfZDDFwi9RkvZ00MXUVCXkIxc8xcdbpHcBTHOXWev/QAwzJ+SruZJ6bBY?=
 =?us-ascii?Q?Vp1kHMx8DP+I0LDjcIC/sVIejYPlA2c5YRS8W7dSli6TsdZ4jOHBY2eujz+h?=
 =?us-ascii?Q?lOgGtE5QfTtme9sOZGrQqN3tAAWNB4ZIGdib18XWF67sfDpeMnvXeEJ2GbpB?=
 =?us-ascii?Q?OgO/8monwFhOPwdf2bA3exP1OA/suVHYjsekrBwElcOIeTjGGAPjf2ZQsMhC?=
 =?us-ascii?Q?sQfONLC0h+Pp9jbEa4rTzISkTXjWiiyn7GYTVjZxjZ9HzK2Q/MePUIR9ruxm?=
 =?us-ascii?Q?bW6eeUgEbcVjbHEE5gGGePXKCEzFVYuat7WngFzS8JZV0pLdVoEPoAlLuBjQ?=
 =?us-ascii?Q?f9yHZKPOK8ueGIWqQc5vV4LkJ2Ry0q8HjW7wh9VZC7U+R494Eta4Dpc5TQ5l?=
 =?us-ascii?Q?Xo0vE3rpfLnNz2Y/LGClerLp+TnjnZSKQ0itudRPGaKWnIlsUD7Ymi7TVblR?=
 =?us-ascii?Q?QSSzJzlTptar0WYL6UUaB8nFagdRffDXXeNh29n+OQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MjVlM4Fj1+fyANJgeL6RWTvnT5kHlujJk+2Vya0n1AeFAUUpVRkxPMHAYrSh?=
 =?us-ascii?Q?rWx+YFE2Jt52jL7YUwc3Z//LYv0r54ouv+8osJpvBDee+n2kASS9ZwQaFYBY?=
 =?us-ascii?Q?67zv6IwU7Dl4V0C3655bMnXmi6rTcJKkT4QRYUkrNnOoD1mSxdXg+L3XTPeR?=
 =?us-ascii?Q?bIIYIiEDLmI/Zgpanmhj8PxXieHHT9m9wLaYKh1++wSzlJiveEMBYgcI2l3T?=
 =?us-ascii?Q?CwYDAXcTmFwi8HV4hBTngimbq9ch5ni+1WFPARO8M2K03dcrmUG1pDLEqcxD?=
 =?us-ascii?Q?OX6zxQKgNizkxSzQAimeJr1QCkbCfnmXaclkQqfMRjIYX/xgycPhd6fMQru5?=
 =?us-ascii?Q?l2kp7vmPATylrc/MMdomj/TO3yQF6/V2bIa18/pI7suFTgRwDCjsY2i9Q7VG?=
 =?us-ascii?Q?ZVJLDTHUXTF+PTSB9Lqvfl/wJdGoItLBT1VDuv7rBfBoqb0UnvR2/kjcQaJg?=
 =?us-ascii?Q?hZRamiWl6cOu+WFnsxEsqhX09K1Isfi3M7LJ/0I7MCwBm4NLQC0X7hiDzKnU?=
 =?us-ascii?Q?hX1oiosdQn19x+/v9Ro5OnM1EpBy9eEhv1MccPP1m1EsEEc4iuO4hXQLBXYo?=
 =?us-ascii?Q?D+WaoADP0gPV3u2Rdb0S/pDO2jRnb7gIxrs4pM4RwaVuuN7I95D+4d2tl2ws?=
 =?us-ascii?Q?y/O7C5k0z2I2HQFlfjvpFu2FX0iwub7rBZA10OZUhtdVrgIEGLGllBAcOYQL?=
 =?us-ascii?Q?YLGqPfECt7Zf1QYNpMTfcqrp2aRSrydgwmGy7kY4vPaAbiA/jc7C0FcGCHoi?=
 =?us-ascii?Q?VrlIzrTktTbw0QzLIxdwH4aVWjTjtvkY8eBKFivnNHV81+0mtrsL6cyw2Dwu?=
 =?us-ascii?Q?m3Nk5eOQnzr739E21lPkfWWlde5VFN0eWJyiKMR4w4/cubmLdwNDFprPqIcd?=
 =?us-ascii?Q?muN29yOieTgLVAM4WnBJ8n6OUUnkwUR/4dAFwl9cMnCtp2+mp2PtNEIsPlSr?=
 =?us-ascii?Q?wqa9C3yFOUcQbjjeNmI7xXerVCN5TaOxgmv8wBhOFR3NpEKhnikbko/K8M2i?=
 =?us-ascii?Q?i70FXyL3r3tz8OtcX/htZ/0zpdce40hqKTyfFyaNxpEBxrYjzyl/xXNP56Dc?=
 =?us-ascii?Q?8AIyhsjyh+96hht95FlaVZk77f/nRWTaAnQF91+U4v+p+BUP3VJIKDrormck?=
 =?us-ascii?Q?1O646k+HmcZNnrEbGjP4qJF2FA4vVjMKlUCMt13Wz2IZiXqxBkZ6BKjtVemc?=
 =?us-ascii?Q?qzSTR+3dH82EcnjCJZ67u8iUzgPxBE0/2RVhy3Ph6USyFBBCFUVJQwIRSCbO?=
 =?us-ascii?Q?Ntj3oLol2578jIL0SwoKri5QcMOeP5O6s/gxkPN3Tzrw4k33pT8EV1Aog/Iz?=
 =?us-ascii?Q?u3ITaS9P3OSXFABE63YOcx5kYitySJD07bhqInS8+cQTPgLBWHP/0VMO/ORx?=
 =?us-ascii?Q?RUB1Ld3WwRY6d5V+Wr5GtQmOsrZChOXEAn1Kut9kzj/nr+tmkK64FdL5rbTE?=
 =?us-ascii?Q?WE1UJvLMBurE/6/mUjfr/WanVI+R3dme4t17isatQ7u2IO0WHac1aGS5bj+z?=
 =?us-ascii?Q?leoDLcl73Zsry2ui4yIQBlEZM3WItIbRmN+p6rVq1bMf5YgqFlmUHN2Dfahe?=
 =?us-ascii?Q?9aMPw9nqY2b5Yy13YIq4N9hYspDmD1Hf+PHMrBcbSioBfZVyq09Oc4OLg3Un?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eaaf1c33-7d59-4b81-9a2e-08dcea3a1604
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 21:17:17.9272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8CSxgiH+TCQX11iS1G11GQ7n3F+qivAlYkn6zc4OK13Yet0IaXioDMZOLZmap+mzcGrozRzs5t+MLG8VHooEr40vOIsa6SfSDsyEUsqMuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
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

On Thu, Oct 10, 2024 at 08:56:17PM -0700, Lucas De Marchi wrote:
> __read_timestamps() is actually reading the timestamp from a certain
> hwe. Use it as parameter, move register declarations to be inside that
> function and rename it.
> 
> Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_query.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 07093af0b32e3..69307ff4146a1 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -85,16 +85,13 @@ static __ktime_func_t __clock_id_to_func(clockid_t clk_id)
>  }
>  
>  static void
> -__read_timestamps(struct xe_gt *gt,
> -		  struct xe_reg lower_reg,
> -		  struct xe_reg upper_reg,
> -		  u64 *engine_ts,
> -		  u64 *cpu_ts,
> -		  u64 *cpu_delta,
> -		  __ktime_func_t cpu_clock)
> +hwe_read_timestamp(struct xe_hw_engine *hwe, u64 *engine_ts, u64 *cpu_ts,
> +		   u64 *cpu_delta, __ktime_func_t cpu_clock)
>  {
> -	struct xe_mmio *mmio = &gt->mmio;
> +	struct xe_mmio *mmio = &hwe->gt->mmio;
>  	u32 upper, lower, old_upper, loop = 0;
> +	struct xe_reg upper_reg = RING_TIMESTAMP_UDW(hwe->mmio_base),
> +		      lower_reg = RING_TIMESTAMP(hwe->mmio_base);
>  
>  	upper = xe_mmio_read32(mmio, upper_reg);

Not specifically related to this patch, but is there any reason why
we're not using xe_mmio_read64_2x32() to read the timestamp?  It already
has rollover logic specifically to handle timestamp reads like this.

Anyway, this patch looks fine.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  	do {
> @@ -155,13 +152,8 @@ query_engine_cycles(struct xe_device *xe,
>  	if (xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL))
>  		return -EIO;
>  
> -	__read_timestamps(gt,
> -			  RING_TIMESTAMP(hwe->mmio_base),
> -			  RING_TIMESTAMP_UDW(hwe->mmio_base),
> -			  &resp.engine_cycles,
> -			  &resp.cpu_timestamp,
> -			  &resp.cpu_delta,
> -			  cpu_clock);
> +	hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
> +			   &resp.cpu_delta, cpu_clock);
>  
>  	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  
> -- 
> 2.46.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
