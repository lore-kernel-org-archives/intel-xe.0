Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02D3EDEBE2
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 18:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865AB10E084;
	Tue,  3 Mar 2026 18:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1dyMfjP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F88210E084
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 18:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772561533; x=1804097533;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=L9Gzmyo0xhm+L4b5KrDyWLaCMQ96CnioO2pYSrfS+ls=;
 b=h1dyMfjP6+TsoEJuqpIIyHcQT5CGKdqNdxyaxJfPOdfu3qjQtFtAzpV5
 nDcsBWUAGN1Ls1A8WMnCccAhx+zD0oJD7xbjz2F0QV+Y8q21sFV+j5oCl
 F1ilJsJyUekk/9ZidqRyzrdubS+MsDIx1xthsTqMFXdJknvghHHM+MPQG
 xERz3QsJpSxIxq3tMgOjmij7FVglf2Vw0j17cqL5kpXRgvRtj+B3DPmCd
 eTeXLYRyAYfL9dDM1eikqu83tNTVX5P2ZSrEML8wAqwHJBPALOeH2g2Mb
 RtXwVppuIDkAKPz+pMBIJVw4R9BZNyw21LmQ1Hykhso1fVeDbzAM9LpFA Q==;
X-CSE-ConnectionGUID: 0DSQKzfFSY20XlX2XOrtLg==
X-CSE-MsgGUID: BVFisXa7SsqcSJlllZofxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="77454703"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="77454703"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 10:12:03 -0800
X-CSE-ConnectionGUID: irGjTBpCT+WIjEER2zMrVw==
X-CSE-MsgGUID: x9ZDa1NVQReMkWfHXGT8MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="218031004"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 10:12:03 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 10:12:02 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 10:12:02 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 10:12:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRSzElH03Ubkhkc5bdQq7/YoqGswwk4scPGQxIV0K+az1PQj0s0TXeSIk+/QfPtAkTEYPk8qsnGFz1dfxilGJYhYPJvkoB7Mh06E2ua4aETvaYo8DziFqD/g3cP/z4Qva0C2l/JVSzHhITjhB7+6a0Cr9+ElGVEUU933nfb7TGjRCvAyJ2NeBViKrsEbddULsLuoNH7Vg6013hCJYYLW7KF328t72WwuJYmc8oLCf+qjkmTXMklIqHUD1Bw+o19e8cXVazBbogzv4up+S17HbE/XKkkbtjmAfcZAofyD+7bo7WDArMLCpUNkbUTnbhjuALrcXDCCk73hjq7PBug49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFoLFwInP/KpK48ktGYxRGpWFCXd7ziPT+npSGKJEu0=;
 b=cgFXMTotS/WXleViNJ7grGPHR4hsmwCJ10+U+XzL6kjmjn9A/hXw9fi7mv2zoUwfEgt9Whl7z/ah2f956uJXBWvFZHNOTrz/5sJXBukvr+RRrEH0+rXixATfbXbJqfXNmPiExv1k9QVI9AQwCiWu7QkY5s3k4SynANHhxg0P1/jGMkFfif1Nfx52IS3A5hUvyrkkE7lkorF7FsCnsBrkuerYO43ku1XgtS/AVY8MNNj08Zaskz7UQsH5E2RzvuAk2q+et25Ja5B8I2qMgmXk4lPH9JefTdIOb2awrkKUBI1sJ9mQfSfBt+VxSV9HXHcS5jMToxd9ryswSPQnYezW9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB8232.namprd11.prod.outlook.com (2603:10b6:8:15d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 18:11:57 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 18:11:57 +0000
Date: Tue, 3 Mar 2026 13:11:52 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Ville
 =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v17 1/8] drm/xe: Use write-combine mapping when
 populating DPT
Message-ID: <aackaFzhEXkCXwBM@intel.com>
References: <20260128101333.37765-1-tvrtko.ursulin@igalia.com>
 <20260128101333.37765-2-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128101333.37765-2-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: SJ0PR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:a03:338::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: b3370311-6fa2-4717-049d-08de79505b2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: lZL60k1T0jncdZMOw6Dd205ZVhIt+wkl6jWhL3CV0/uMaHNQdpKwY7K27pKqSmUnj2dOjsztvy3apx2LJZb2q72DQ4fUYAxN7RYONPR+rDfYO5z92OQerdQ5ACeo1TWV2uxjSFhfTGtLCILYszysq813OIr4TLz7Zx7yyBejnX/bRpm23ZvOV/VLzYKvjrgPlpyCb7sMJB+USBHLOUV3GIB04K5dxFN9XyP/OuaMH/e3HHx1fJiyAiU7HnB6PbsmvU6PbMh3nyyXw2MvWPt+uK+6BwBckG/LvV16YfFEnBMhMMq5nVVDBYoNhLdvI2Pu66qWfM7FAasPhCoTmGGrf1ndU3Z70ZDIPAnhCQbIuyK3M5cSerJXNs2/5KANaA0KU5Y0BBmHQrAy0y/WiHzzxgT7tjrN7v9MfNl6FTBdXoQO5SqwQBPGuzf7zdeizKnLSFiZ+6w+M+jj6I0bOSkNyXa2DALLu8A2TzUgBMHmIwwDidU/eoWt5U4Dlxi2tMBvvA76Dzxh2kvEGUTlbeBA/8Dgqwkd8yaEPV2yAf2B+Bt2HzO7141URFa1zfJk+FN/2E3n4HWhXHCgFOgs0YeZzBVBC1vwpSgGDl1HwhVpNbxi3OGdRRzHKew7pNvxAB+YPgvCDr3jPe1fOJm0zpkW3Xziqw+j6y2DW966U3f9aG5oInShfAe84Mw67+Xd7bpaTMzmjRxZ7aY2HTcHD6dKfr++NInzIwce+QGaJsXppiU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?02DHqPapFD43Y+OEYOf8s3vQJ0Qsql0r75dPMNEZO2kMNsyNcXdDwNyX5T?=
 =?iso-8859-1?Q?IZkafwO7YLMdpybtBRuoZXOHEwVHSBMM7P4SeiMZ0YR+jCG2NZnOF1KXKm?=
 =?iso-8859-1?Q?fKEM/H+TmkyHsG5+FIOA+HD0ON0e/04mxwlVC5XRcFELgt7buQWXTS+wOv?=
 =?iso-8859-1?Q?Blv64cMtXnsTjWZ8H3tzoebqjE5tvJZyNl12Dr3a45HSNUEUrQLiyb9rx3?=
 =?iso-8859-1?Q?fx3CC7eK/NXtf5Uz7ZS40JdFtqP3MOicZgqbrqIkmqBVVRYqyk3ByMC+Ii?=
 =?iso-8859-1?Q?iPHPz5XpLvRNilujANVOiWty2A7oT169H8NCEPYOa6O3M0XhEUXDZGmRqG?=
 =?iso-8859-1?Q?Qi+aKPHmJNwtCj7CfRJemZ1Thfr4WY1AJsDErwNmXhPlwxRkUQluPS8cw6?=
 =?iso-8859-1?Q?drQyPvb1GZMXq4zD5vKPvzTYFqeuVZpJMxnfUFkljUejImPkIAZc4IIHNB?=
 =?iso-8859-1?Q?qT8ueGfRor9A6vXjUI7lorNF3rKA/71WcYwEOSvxz4xKVgNbDrfHo/yxIk?=
 =?iso-8859-1?Q?d1Y9uIOl4XbS2SnwsUZMSyVl5BFnU5mK7lRYM17Q8fYrbsTKXHBTO7Qhn/?=
 =?iso-8859-1?Q?w1LrBNmH1aXtivQ5wJ7T8qh9rpBg75Iv4Ld/+F841I48O55g9pSuE/ddqm?=
 =?iso-8859-1?Q?7w3Mta0FLCsQvC9VFSJuznyT001bQ9RGNAEEHL12MNiod2V2kzBxSO5LYe?=
 =?iso-8859-1?Q?SxNZmq9hB0+BthNMMX9x3iAI6wRGdN8kWwQCGAG8pJHjKEpRBlb0H2c0TG?=
 =?iso-8859-1?Q?ivirOvBcxWTdUsZN+zoKmuUyA9eR4nkkpnukZRSJ2+RJvc6G3nFf1uMLbI?=
 =?iso-8859-1?Q?OJfiJHryX83ZVqjGWvoz+m9+RnpiE4BnuecT1F7gHSc8yFoEVFzOzg3/k/?=
 =?iso-8859-1?Q?wSwECz+ThSUpaEtWjd01I/bLeOiHUrWRswCHFj0JD7p6KUEEerxfBnZ0gy?=
 =?iso-8859-1?Q?yWwe7+fEExCPwi2NiNHsQ/MMD6xZe6bbq5dZ4MBJdcgXFB54WH5qamxoFa?=
 =?iso-8859-1?Q?BphJxLHJ8yFy2lzjfdCKdTCTKbN9vquKle76qtvwRsoPOu+b9aBGRIezEb?=
 =?iso-8859-1?Q?KOEPEbwtCHiQLK2MNkoIZ/XztwKYL13LkbBZXrCvxiBMxKl4AgLGm46tUI?=
 =?iso-8859-1?Q?56oCILLHXeLzS8KIoWR/4K06jDlg45v3tUSJjeWkEiH9feuBMxDkvlf/qT?=
 =?iso-8859-1?Q?Vke3iSwIov7he4SU8TheHStAihVIQkVu4fIMY5JN4IdTEpemDIOxfuSjj/?=
 =?iso-8859-1?Q?ouy/CfoZWr4q/1/OoLRIqZtnPsvbTKdl3spbmmTN4xUgHNKuzXlr4L7Zbp?=
 =?iso-8859-1?Q?hDVoaBZ2q1nDcdPqRJarPDlH8I/Kkleq7+f1d9/Ffv1tfeZVPyErZtpkfo?=
 =?iso-8859-1?Q?Jr55RiMlt2db+BOFODM5ikmTnFa2/B60whDRtfbX53FAksqUZiP2fsUU4O?=
 =?iso-8859-1?Q?o+PnZWKeICsEtOMZQyrOBuR4EOQ934cBOceMgawe9QfuYzf0wsJz3/kAZo?=
 =?iso-8859-1?Q?b5ncUpaFFawLYkIlOjmEAS663dXF+J9TysPB6P4Y6wY/NbDMlXASlK/Hl7?=
 =?iso-8859-1?Q?VB3oOsXOkQGrfzEGtbUJ3MkqSSm1ufNzKBgXrfRQ4LXFOrZVHMtOAGLWMJ?=
 =?iso-8859-1?Q?iCPi7IPMwxN8m9Xa8Wgo4rsxc+I18b4+Cgu8Y4muafqFtj3Qwjj+demGvQ?=
 =?iso-8859-1?Q?yZOd0/f+la51P/KECdfneeuUreU1k6CxmpO5eCulZiOcgyLuRuqBRDCkrk?=
 =?iso-8859-1?Q?Q65BVwkoEBeJ73pvsMbyiHRAyWKoAsmPm69whQgRTl9q2mlWNRZQYwWbPw?=
 =?iso-8859-1?Q?V2yCJqauwg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Btwt6yjS82IBH5Bnn26OYUA+IvlCRCPnqz6cOxLE4VsO1MFc2p++nEHfcpmahNxopblywQq/wJlXr3DGWWIIl6OSMn4uRUM7FLGQAiKqc42QW6mdzsZhA5HTn5v3mi2khXOSpFmg0QcAJefFcOgvR5z5jqU71ZmVSYrR/srf69kkDct79y/KWGU1dNCmPM6+nXKo+jqgjBiRnVJfaRaYLhiRt09CbbVRMV35rAsVTW+gHiForPmZdVm0XrzNaS+7eigVZ+9mRoRBFONcSpigOIiMtp5DovWbzRyiHg8J/eLA2rl8GabG0MFOS9/Zgxrlp8fd8P5YXd8oXLfv1O82+w==
X-MS-Exchange-CrossTenant-Network-Message-Id: b3370311-6fa2-4717-049d-08de79505b2b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 18:11:56.9272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRBD8fqv9E06biiIO8Av3hXu9m1sNaPqXU/OsSyJ8vvmmd0aI7qno4evwbbaU/FxJbqRRpQOsOgyggvE5XWBcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8232
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

On Wed, Jan 28, 2026 at 10:13:26AM +0000, Tvrtko Ursulin wrote:
> The fallback case for DPT backing store is a buffer object in system
> memory buffer, which by default use a write-back CPU caching policy.
>
> If this fallback gets triggered, and since there is currently no flushing,
> the DPT writes made when pinning a buffer to display are not guaranteed to
> be seen by the display engine.
>
> To fix this, since both the local memory and the stolen memory DPT
> placement use write-combine, let us make the system memory option follow
> suit by marking the buffer with the scanout flag.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index d2c4e94180fa..b285cc446f57 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -123,7 +123,8 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  						   ttm_bo_type_kernel,
>  						   XE_BO_FLAG_SYSTEM |
>  						   XE_BO_FLAG_GGTT |
> -						   XE_BO_FLAG_PAGETABLE,
> +						   XE_BO_FLAG_PAGETABLE |
> +						   XE_BO_FLAG_SCANOUT, /* Force WC mapping */

This kind of changes the semantics of the flag.

Could you please change this internal name to something like
s/XE_BO_FLAG_SCANOUT/XE_BO_FLAG_FORCE_WC

Then we will have something like

/*
 * Display scanout is always non-coherent with the CPU cache.
 *
 * For Xe_LPG and beyond up to NVL-P (excluding), PPGTT PTE
 * lookups are also non-coherent and require a CPU:WC mapping.
 */
if (args->flags & DRM_XE_GEM_CREATE_FLAG_SCANOUT)
                 bo_flags |= XE_BO_FLAG_FORCE_WC;


>  						   alignment, false);
>  	if (IS_ERR(dpt))
>  		return PTR_ERR(dpt);
> --
> 2.52.0
>
