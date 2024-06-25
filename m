Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B871BC2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 21:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BD410E157;
	Tue, 25 Jun 2024 21:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLJR9iHt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFA510E157
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 21:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719352131; x=1750888131;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=p+PAr9EySl7kvPabVojNEqvkIBfbPcb24qMKX+VdeP0=;
 b=bLJR9iHtoumOBK6GujvfGyo8jk5vcZHM1mHYn0EPyiw9vFrL8O1j0MSe
 zCc8UOljbwi0n5k9SUKvcr9CmZcug18vzRjJasujOnmUpeGF4+7kwRR8l
 mz+4Z1cyZ4UBgCoAyDRt3acQYYIDPBAWaPdPcTdq6gPirJdCCkQslbq0d
 7MTGtb9jjq7ttYR3xTFI+0YFg+P+9G3Up0Ozs758PlyXMD+ECQ2oHvpS3
 q94lQg5nI5QkMzmZIQuGAg06zgMLx7gmmlypGVqo0zAAN9E5GycRKbhCg
 ImHRp6EewdlsB9acT6hA8diayA2JBemt8BnMwbpE9Ka4J3X27YOD4W3W6 Q==;
X-CSE-ConnectionGUID: jzu75agoTsS4L5hv2hLqOQ==
X-CSE-MsgGUID: A8NMSdMhRt2RAArvxkfWLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16358253"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="16358253"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 14:48:50 -0700
X-CSE-ConnectionGUID: NqJPIcWGQ1C2RsYOncxCaQ==
X-CSE-MsgGUID: zDIJdVYITUKsVXTVhygXRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; d="scan'208";a="67005945"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 14:48:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 14:48:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 14:48:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 14:48:49 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 14:48:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwbXerdtUAeCIbzakhmMKiVbqI3XDV3EkdrepOevHWVKCisvrofqRRCqsrIioqXF2fZlKfb1x/0EZJyZ0CuBbGk3FGLvAVRkJd31r2T5oXaVGDdCGlrp+fG3kLqWwyBeDEsSfjZy/vQNnU6/OsY5eP2dpHqXEvsVpe3bYXgu092IGJXmdIkQoULw9QlMI6PNXaYkOTleBlQlb945jYpkW23K8hOuySZ54FtNLGzMfvV5lSNjeQaRMNKMSeKT1CGgJLbxsNeGM4w2p0HAJf9W2PdBTUNXqvv30qTPdpB/en3P/F2AGRpQUE9nr5INE4up0UknFX0EwCLugFzWMJ3mNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+bUvMvMVhWZtbl6ZaHdEGQDRYdV0Pk9PQfGi2cHmQ8=;
 b=dKsGKTVoBg85P2fp3TPXGbmAwGvs82KRMBCFgXlbBDKZhqdudVLMCyvetwMYJ9u4N+wy1EvwLKDQm5ZNKtS7oNJv4EVEsiqaM8mg7HSJxW9VCTHGDifgtZQ9tsdMYTpsM46GS0QjU6Bblb/lxVZ5xxOHBgBW6X96oRcIHI1VRiiPc3M3uayiuCLAbuCAN6Cr7EjtGA8D5jaHbgQ5Su4jb3ei5ZIU4Xw2sUA5mHx9HAZz8dFk/u62lHz+2Gy1ZRR4OAPfKyUe6trT+OcYgSqetUj2e3hnaNhvw6JWUIpgFu58Tcay4uMzRN8HhFko2apEiLGKfHAz12+8k2BNHFbWkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Tue, 25 Jun
 2024 21:48:41 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 21:48:41 +0000
Date: Tue, 25 Jun 2024 21:48:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/guc: Add more GuC error codes to ABI
Message-ID: <Zns7EbbOrFj1pWkp@DUT025-TGLU.fm.intel.com>
References: <20240625141258.1257-1-michal.wajdeczko@intel.com>
 <20240625141258.1257-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240625141258.1257-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::39) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA0PR11MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c51b389-3e7d-4c77-92b7-08dc956093e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+N41PqxOZUDZKUu1aL4bbCbv07cbmLYNHKGUA+ShGobfItaG5z+am3cOhGOo?=
 =?us-ascii?Q?wT8P7Q2cBbqMXUm3oC2OUuMvraDRM2d49fY8iK3kOnXk4z9rRuVL0kPP2NbW?=
 =?us-ascii?Q?vT70pW1Gf1mmVR4LDA9CFee5X6yq28MlBs55/60RfQ4dHqHwLtOih7gks1iT?=
 =?us-ascii?Q?Rw69ZvzeqBp+Zs56e5K8DS3pk7ekOhWYER6mn7BwpJDseVvN84pTWaRDIaDd?=
 =?us-ascii?Q?D393M68DM0vvE9KchSFWrA51LFXz8W3yUal3opHe+68i4X1anbQKaxEDFPoB?=
 =?us-ascii?Q?kQAwbKIN9Pd1R0D7Wn5MTv/ExLCNHuRO/NLQnCKieCYXZtq/HtjmrY+6aKaD?=
 =?us-ascii?Q?NT3tutTXr1FYS4i0zfMihiIjKUWeUjo5b1zO0UJgUOeEu0Z13J8u9VZgG4Ov?=
 =?us-ascii?Q?bLBpyfeMxPgdqOYRTT/90XxIHEhmE47lHefEKI1kbEmqzJAm4ZP8a3bnuWHT?=
 =?us-ascii?Q?q1Zh4pwAi2GFuyrUIHfEPBJQ8nkDsHGLiQRLDkoSJUaV6k4XR3E3vtjKk3tL?=
 =?us-ascii?Q?2FezZUUp2K2iNVZnjT65f7+9t0kH7vLHpqWDXWdUSPxSSg6IqLnhXivlQfcC?=
 =?us-ascii?Q?CuPyz+ept05EZPP5B26/0TfvcS7lrNXm8iTjDXqZ8XIIZ2VNvrQ6PFCMKJ3d?=
 =?us-ascii?Q?mapEDq/BOn1Dc5/pjIczY+1uQCWFspLsqwD/Ygp8FFHb18bpbud5B2ypDc5j?=
 =?us-ascii?Q?mTm25GxZhP/2oemTcZcxmoYyd54pFdiId83ebHgKpvnIRhYAMjWGvurQgrI5?=
 =?us-ascii?Q?9RFSQ0kpUiEMLW+/nO48fEhcGLGrELf9kJa2CbsrMfneVK7ex6r8gt+SYw3i?=
 =?us-ascii?Q?BYRycL+46jj5BTokZyWhuta9/fsXhYFQhN0BCQWQZK5vzzJytuOe5jafVAkP?=
 =?us-ascii?Q?3xx+UPR270p4pB7pUrm5S9n1OsZ3u0/OQ3mUJlJF0IcNsh5pXiRMy0w8cYiF?=
 =?us-ascii?Q?5gi9taXkQUdoO6R4faEGvNTNDRTksckTHsb/QzdrNtcdnm82cGu/sNg1IrHN?=
 =?us-ascii?Q?XA0i4HRh6zjUylEtAQaaMJ8M9zLd0v17SwBZtz2hQWTjbF5pq19f70sVpSDg?=
 =?us-ascii?Q?C2/YpNQgEMQMdX7Ya4t4Oso+W2qRaUN0e+KVI6oM3lMeQjQ7aW36j7mpjssR?=
 =?us-ascii?Q?Lj0c6UwofY4GlQpzfYRxqubpzO2JnMmqaNGWJ5RH/JHKqUlQCkKgEwziboeH?=
 =?us-ascii?Q?TrcsMSiyWt8HGTbXyO5pMB4y7w5KsJ2jJN2bcN8/Kiv4N8ERQF3C0xSjjp2D?=
 =?us-ascii?Q?mXVkJg6UU49w8E1k4kUN1M/4vAPVBoCkkZcqxFm13PfJVpesVkAc1+8uY6Ud?=
 =?us-ascii?Q?9WxekwPUxLGTPk0oN9n+HTQvCf6Ve797Mzh3aWq6Xzm8dg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hhUDHoQxxT/bEd7/KLvveOR32Vz5SmzSbzIySPa8aAf6GpgyzCBnPX/Q2ZLl?=
 =?us-ascii?Q?HcoaQ570MR+/59525Lsnl5tM1/wQ71AbpF49OWXbeqWApkPFshej2CaWPEFF?=
 =?us-ascii?Q?pzFgnDbz0KV4w/XtMdVivapP6CjwaheFES8UyKnmlC16Op/a/MjdTyz4Wb6M?=
 =?us-ascii?Q?ZymsT8TxIohBumfqifsfeBADQQ+JN0GbV48doMVzcgIxGr6DCVRcfZkQYsaD?=
 =?us-ascii?Q?DqLMG6hE6NuHn7INMx5wgHVTjA5a5as6e1xuti02OeYrZoduPWvNSeOoJ6tv?=
 =?us-ascii?Q?XJD5eTZsJrByNio6w7GR1oYhPVArhdtZY2NiIjuq5BghK6o0Bo0PoB3JvOOf?=
 =?us-ascii?Q?s6tqA6zzSc2ZNIZ4eBYgq8X5oWzJ2Q3GD8mW+oC1fp9WhUyu+QeuY6omMtvM?=
 =?us-ascii?Q?56QXq5xnZxfDKfgODBnPw4c6V84yFptSgxSEgSIBc/fxY91MHnzk8SB455fE?=
 =?us-ascii?Q?9LeNX3TaRWJWlTmbv/03d2rcSyt4hLeQ3oxOGdTHLlh4vqZEWMggzY1rvBYa?=
 =?us-ascii?Q?PTdf+HXB8Pq7GoW21I1DzifbRJorzsm8zfi7sjg5jrlvvnqwaqNvkmeUxOeP?=
 =?us-ascii?Q?DIac4J8MuNVNgRagvmPnbUmPDrByHmchWNMmKasRHuYcA7exiNsHu63xvgSo?=
 =?us-ascii?Q?kOG9R54qRZ66CPrVPbUSomMoMxSll/hpTZtpUk49SMgDzX8b24kIbxGT+IIX?=
 =?us-ascii?Q?fUZJTpq72b2YEGL24zATlRfoloCvF+UJDbSKijDYKn+spD7J4z1k2oJc76z3?=
 =?us-ascii?Q?vzKto0M/INoyyfav9J+NBieMGrsFdS3TrNvbvvKnV5vOnfSmNXWc6ZfClyis?=
 =?us-ascii?Q?PppqkqGFRGhcN49ZqbnfBliif/vvIMjQH1d3au4pzPWQgiPXFB/8XR2sUAxA?=
 =?us-ascii?Q?Tygl8BwOjI/SYNqHcucJLVhzR/2W8T6r7AKdTxSsCoSUtJEUo5YRSSyh61zQ?=
 =?us-ascii?Q?P3Xhia2yNY30E180qZ3zWlu7XikzLkWi2k4yhWu1ldzds3+golEvkTJvxpdQ?=
 =?us-ascii?Q?FtQu7bAE3OwreOPlClwD8+nPbym6DcTrKxCa/C7oh1ab8J+2zypMIWXgqPr6?=
 =?us-ascii?Q?axxIwdMvBfD5uq3w3ykKp+jFZ3Nw+lSmgGnKDpthaRPLxpc+cN7u6e7RtJiW?=
 =?us-ascii?Q?LmvOzpZxWHCia1XyL+MsXUldsLXbF85olzsqT99jZptzILmQ/dAmHQ3DN76b?=
 =?us-ascii?Q?HlTeufnakAHxtBuOPvNK6jUXGx72lYWhFw5kkZQSEqRoeeXdr21GO2rrZuZp?=
 =?us-ascii?Q?PxksLsbiC4z8bDtfaf684Hb7QZ17Q1BSkrmrISx5WmK+RumogQ9JV0fQ5nPN?=
 =?us-ascii?Q?Ry+vBV0LfalkFJX2W7UPJQFr/R2mtQ/6GAfvVrC7uLxzZcMlDzUBYJ3RpcUM?=
 =?us-ascii?Q?XjIWaBwHNwcnh+AV2UEvKLrgb13Lm5OJ0/ddMyaP3ECRMr5lIN3iRbLW4xOq?=
 =?us-ascii?Q?11TpzifVjydlq6IEylXmGFFBUdM7i9q4x+Yvyn03WTNxW9vsUPoTNETtiUvD?=
 =?us-ascii?Q?hXa2kaTdwKvIPCitM8wxTu5Qki4iqV2k3MDcOW9oIydpil7YgRQhdaSzIbgJ?=
 =?us-ascii?Q?Cl5KesSZDCU85SgNs6G2lfNfMALouiL7YAHrYPX2YwOzXLUkBZkkoHN/SAjW?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c51b389-3e7d-4c77-92b7-08dc956093e1
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 21:48:41.1130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zw18avQGnO6NrTT/uGJfLN4bX3lGafRFLcx+6ZtjasWuksX4t9k3UXmUGzF9JuGdSvARtdO+HWoBEQi/ef9w6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7378
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

On Tue, Jun 25, 2024 at 04:12:57PM +0200, Michal Wajdeczko wrote:
> There are many more error codes used that the GuC firmware can
> return in the RESPONSE_FAILURE message.  Add to the ABI header
> those which are more likely to be seen by the PF or VF drivers.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/abi/guc_errors_abi.h | 31 +++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_errors_abi.h b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
> index d0b5fed6876f..2c627a21648f 100644
> --- a/drivers/gpu/drm/xe/abi/guc_errors_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_errors_abi.h
> @@ -8,10 +8,41 @@
>  
>  enum xe_guc_response_status {
>  	XE_GUC_RESPONSE_STATUS_SUCCESS                      = 0x0,
> +	XE_GUC_RESPONSE_ERROR_PROTOCOL                      = 0x04,
> +	XE_GUC_RESPONSE_INVALID_STATE                       = 0x0A,
> +	XE_GUC_RESPONSE_UNSUPPORTED_VERSION                 = 0x0B,
> +	XE_GUC_RESPONSE_INVALID_VFID                        = 0x0C,
> +	XE_GUC_RESPONSE_UNPROVISIONED_VF                    = 0x0D,
> +	XE_GUC_RESPONSE_INVALID_EVENT                       = 0x0E,
>  	XE_GUC_RESPONSE_NOT_SUPPORTED                       = 0x20,
> +	XE_GUC_RESPONSE_UNKNOWN_ACTION                      = 0x30,
> +	XE_GUC_RESPONSE_ACTION_ABORTED                      = 0x31,
> +	XE_GUC_RESPONSE_NO_PERMISSION                       = 0x40,
> +	XE_GUC_RESPONSE_CANNOT_COMPLETE_ACTION              = 0x41,
> +	XE_GUC_RESPONSE_INVALID_KLV_DATA                    = 0x50,
> +	XE_GUC_RESPONSE_INVALID_PARAMS                      = 0x60,
> +	XE_GUC_RESPONSE_INVALID_BUFFER_RANGE                = 0x70,
> +	XE_GUC_RESPONSE_INVALID_BUFFER                      = 0x71,
> +	XE_GUC_RESPONSE_INVALID_GGTT_ADDRESS                = 0x80,
> +	XE_GUC_RESPONSE_PENDING_ACTION                      = 0x90,
> +	XE_GUC_RESPONSE_INVALID_SIZE                        = 0x102,
> +	XE_GUC_RESPONSE_MALFORMED_KLV                       = 0x103,
> +	XE_GUC_RESPONSE_INVALID_KLV_KEY                     = 0x105,
> +	XE_GUC_RESPONSE_DATA_TOO_LARGE                      = 0x106,
> +	XE_GUC_RESPONSE_VF_MIGRATED                         = 0x107,
>  	XE_GUC_RESPONSE_NO_ATTRIBUTE_TABLE                  = 0x201,
>  	XE_GUC_RESPONSE_NO_DECRYPTION_KEY                   = 0x202,
>  	XE_GUC_RESPONSE_DECRYPTION_FAILED                   = 0x204,
> +	XE_GUC_RESPONSE_VGT_DISABLED                        = 0x300,
> +	XE_GUC_RESPONSE_CTB_FULL                            = 0x301,
> +	XE_GUC_RESPONSE_VGT_UNAUTHORIZED_REQUEST            = 0x302,
> +	XE_GUC_RESPONSE_CTB_INVALID                         = 0x303,
> +	XE_GUC_RESPONSE_CTB_NOT_REGISTERED                  = 0x304,
> +	XE_GUC_RESPONSE_CTB_IN_USE                          = 0x305,
> +	XE_GUC_RESPONSE_CTB_INVALID_DESC                    = 0x306,
> +	XE_GUC_RESPONSE_CTB_SOURCE_INVALID_DESCRIPTOR       = 0x30D,
> +	XE_GUC_RESPONSE_CTB_DESTINATION_INVALID_DESCRIPTOR  = 0x30E,
> +	XE_GUC_RESPONSE_INVALID_CONFIG_STATE                = 0x30F,
>  	XE_GUC_RESPONSE_STATUS_GENERIC_FAIL                 = 0xF000,
>  };
>  
> -- 
> 2.43.0
> 
