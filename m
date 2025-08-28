Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4530ACA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 13:31:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0788310E9B1;
	Thu, 28 Aug 2025 13:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WXYUZ9tN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A2510E9B1
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 13:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756387882; x=1787923882;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JPhUmfooaTdUR8fjKE4MCAXXOepgqzbkB8A5cbS+UzM=;
 b=WXYUZ9tNxDjQn6wznUFfQG1KCQp9Mx7Wk0iq1mjFmugCWD3BE2GzBsSv
 zPoS5kFR/Bd3Fdly6TNzxvBw59OLOFya4k4CSwiXAppUbbEUJ5x0gE8Nh
 jIfsmQ0NmOnunaUkLTItGXDsryp9kfofL/KD4tIRfvJSLfGTnlM6kGupH
 DlaAWCYqMR1v91RpYUf57rrcowFCq4ybBEyu6yTxscUB1j6BXh9Z5INE9
 a77UDvOxZJReSNRSvEh2AKbtuPcANPUCxvCihxevjeSrSnXO/hO4zmprO
 XE9T/DrXoZdrKmNx8hbPbTVB+XeGJYKJAcDEI5oWbHooyuJFYJLbucZ3C A==;
X-CSE-ConnectionGUID: GfBltLkLQWqgdYYZHyVsPw==
X-CSE-MsgGUID: XyWAx4VDQQiUTqaVpA4wpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58367098"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58367098"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 06:31:21 -0700
X-CSE-ConnectionGUID: yLdml2nuRUmBoSnCYGoL4w==
X-CSE-MsgGUID: CiVGO+HwRWyirfTiG56acA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170027745"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 06:31:20 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 06:31:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 06:31:19 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.64)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 06:31:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tsvJYWU40OPDQQDjcA7CuTg5wK/q88P8dZoDFc/FIu/UoS9oHpS3dPlhsv3DA8N7LN+tIxnO45zsNMZ1J8veY6zepD6QRanniFDmXY2b3czJ8p7tVLB5t3hAQG8kbFSaC77AxeAXreLH8BLUtl6iGlwQmF8+iahPOp1RY/D3Xij68cqtI4w/jYWH50T8CWSN0r/82520AiEiPSj62j/4G+0m1Y6ad01LmfhD35H/deqk3Loa5atnjTX/zVimVXWCTuaCtxWgNa6mPPKN/pNHZkBanFZrhUEbp/Mdsk5elE92DBl/veiPyPRG77MpyJHKa29vr8s4GbNBm2kkGlxIxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXXg+T8BUG3S3SPstx7HdS+l8mjUKXPqzFFBWh+9shQ=;
 b=exVIKsramcK/qElrVWKgi8F6xUPK96qWe48LXJ7FgxaPzA1t7atl1Dm2OMTkkZ2W69W+WQH6xWdCq0C+nIeLzb8HXog4ag+mY1YGfll6NMF682mouxOPgkN8Kr7Chta/r384GoIy0M2WxDR1FLryof1ynmVosHD+b7Lh/jieFRI4NnmX0WuKP+QXA/5tgqJWTa/xnWCu+6oHVq4ng7r/ENU0ogmAOCvbNQ40gaC+tFwk/QMsJGwjpyLvoBwFPJmjMckfnks/Uk0tflRuKM6I0c8jFv5tfZ/3GiBXf70w4qb8Z+9MYpyqMNS24pneHESyOoS7h7fD5OlzLvs9T3Y3jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7279.namprd11.prod.outlook.com (2603:10b6:8:109::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 13:31:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 13:31:12 +0000
Date: Thu, 28 Aug 2025 08:31:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Fix kernel-doc formatting for madvise
 and vma_query
Message-ID: <wz7wfyrampt4hnjepkotckcriqs7kyrifbmygchlj3lycalwne@y32bbddn5cdl>
References: <20250828071516.3838110-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250828071516.3838110-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BY5PR20CA0006.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: 636a467f-c74d-483d-8cde-08dde6372800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?jIjP7Vc5uYF4SIznGKymsCw0JDFeTdpGSqPSGs442taKILNO9k8VTZsr1S?=
 =?iso-8859-1?Q?gfa/K0v0fDOSJfDcgIoRvCrGHt4RcedHLP6f0gRmycLoqqw2k0vujzB4Xg?=
 =?iso-8859-1?Q?GyerjWUCbTGK/FZ4Zm4Aql+UpeccFyqoZYlEIfSZ3BLQxhxfrSUn4p1ivU?=
 =?iso-8859-1?Q?ViHyGDif0tWZDV2D50HPFflrJIeBV3N2LpA33QuqFF24oX84WpHz3deVQq?=
 =?iso-8859-1?Q?2Pk+ZfaDzdAjUzPuJHCQq8KaAJeJkePUK4U/Orr/1HOrFnhG3HUdS00e+X?=
 =?iso-8859-1?Q?rbFbEfSsocf1EkWYxorQc5lLNtiMVkvhASIGwbZ3O0PNq9Fp9LjxP//jWK?=
 =?iso-8859-1?Q?0COqp1p0k/vONyBgHmbzm4w4MHbbAl4VkDVbmPLcnbnQ+gaC6kUiZPyDVI?=
 =?iso-8859-1?Q?Qc1of/D0nnSCrG/Jeqa+wXdnb6KGsiWfqDdqNaUBN2XBI/gRQo2+r+6kx5?=
 =?iso-8859-1?Q?3v1JTexML0VVluk0MYvkZYAyvBEZufUoP4nZpRG2TmOdoTxQZHqDoKhvKD?=
 =?iso-8859-1?Q?PJzi9C3Eufq85FDLGaAbreVLjSJPKd0XXt/kaph2PTe5AKjmcHNTp1Ca7O?=
 =?iso-8859-1?Q?gzTq37QqMr9a7pLW7xVMrkX9NXP3/9ZKcbzYoisyFZhQcGqHudDEN7Vmb0?=
 =?iso-8859-1?Q?iZwOndrmFw6mvVu+1HPHhRGlhJ+BHIxmQFcL4yozl2FnZ10R9DBQ6CbAOQ?=
 =?iso-8859-1?Q?SaXjBCoQNDgg8dbTbV4pqA/jbfI4nUpLenyKE13YmhmC1CJvdmkdmwvu6o?=
 =?iso-8859-1?Q?7hv2qWdrjBjzr0VOATOB6OlqIYIN6zDsYDbKT5EPtu3myCqlHMzgf8IRCH?=
 =?iso-8859-1?Q?PISs6I3iRS3db/tNDJrvQKZOylMW7KhcZNm8dvfn8x7M7CNIuRoBhBITHY?=
 =?iso-8859-1?Q?PLL68gYWxhygHB0D+9Ln0wh/WGMwKzdibYuErCSlYSB5++XF1i13+AXYjt?=
 =?iso-8859-1?Q?epqISObyq4mDgC2D3csN8p+JLOLcy1ew7K749O93sp85hbTOLGyt93BVQR?=
 =?iso-8859-1?Q?t2IyemUoiVZS226a4JeSIG4k/Yaoe11lMmEfVnEcvS/H4Sw52ZMjQcMIvO?=
 =?iso-8859-1?Q?WrY5sef+/ItwfyLN9XaH3ysfr4s2R+wf7hVyaulmR8UV8B+i3zO/P5EUvi?=
 =?iso-8859-1?Q?DJt8ALGy0xizH541R8KGhzOYMRJNz/FSObBFoiZlQmqVwf39n1LJluLgf1?=
 =?iso-8859-1?Q?glzLea67OKdYEQmheSe3xFLzxwX/qxKH5oos1ngpvXzigCdFo9M84YsL2C?=
 =?iso-8859-1?Q?DqOpaDBEwh8iPk/c9sUCvwMgm6pFZsEUSYrnRRmzJYH2+QCRvpzpbyBK0d?=
 =?iso-8859-1?Q?u7wjrQrOSWGXgnwIQn8pcrnslblSKetP4NXFKOsj56jCJbD5yywLh6Cgbl?=
 =?iso-8859-1?Q?R4UoyI0Hkbces3fBPFg/t2ao9BmFOmPzDJCmKzNEV3LGDAILDWIcQyM1/X?=
 =?iso-8859-1?Q?+VGrISZ5Gzu7ZDARHVrJpCv4eMpIOo3uapfIY3hs6zEEl2O9ni/s3ILAOE?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6cKUaHNB/45c+k/MKR3Bwo4cKHpHzhJxEtBaEqDTbaQ9NIihcdnK0TGK5R?=
 =?iso-8859-1?Q?/SMOHdnpXq+78kYoYcMONluBzDZ32J76PapMumGiHU+nKoUiYaJJyIHDP1?=
 =?iso-8859-1?Q?pbvSofwzKXplHDFz+UlmWbu9Yp+/vDPwoYH17HdKeLbwINfrbw6ML7ZPqK?=
 =?iso-8859-1?Q?HUsFJApjNZR4CQqFsZoDhzOerfWTFZ8MVLzYvJ4Fh+vTUsDkHHnUzHcwJD?=
 =?iso-8859-1?Q?bhFA0KRt3YwCD5mK+KbxZpfSe6mkkikLZMwFDJEzVIoEbvPihZe/8Yfszw?=
 =?iso-8859-1?Q?gG7qr4uteXMO8+Upq1i9pLDooXHRdIRY1wiPFQFgeEJxZrnNi41oa/QzE4?=
 =?iso-8859-1?Q?DpPM8Yr4kvpyEYgGZDuvRjQ/r87+tiCng5T1Spl4Cb8iNcr2Wd0BDTZcVX?=
 =?iso-8859-1?Q?B2obHto+ReqnTbxh/cJ+7TYc8AvzURdoGbxqDiua0H4PmJ6P3i7u5cCu2S?=
 =?iso-8859-1?Q?DKaa93B2/qdNzKh5DMvQ5IyhAgCmvuD0kwF4g55IuK9xO9sBU1wZqeb0BI?=
 =?iso-8859-1?Q?DlT5w7Ass7B1u2zjNmBKg8uQURXRsXiBhqTAmEoPGNzECSvgADqV3Pcf8e?=
 =?iso-8859-1?Q?f5QFi7IEO21rvVEukD1iHHGfI4lFd4hS9OA/ILtswCa0v9WYHZWT4GFZNT?=
 =?iso-8859-1?Q?hhrBZcTWqEevr8PjQnV7MHaVOeL1nXsAg2Iy21jIbZ7AfSiVKrPLqY+PKy?=
 =?iso-8859-1?Q?079GsQ3w5KflxgxkWOpM3b/et9eb6lSCRl+GtaOscU6gTWgCeAbYwwm2JQ?=
 =?iso-8859-1?Q?R61fXMOY6WcmnCCLkmo9c2T6ccrauAgAFHtAXHl5pTEW9QQ8W5KQhRsDcl?=
 =?iso-8859-1?Q?5V9KSVHULSh4Ht/EgkLf8Gsip7M0MsRk5sEZs2Ksi6IRnrIgi8rfh90Aah?=
 =?iso-8859-1?Q?x//JUKOn3FAelYEnFiQCHF0xSNrhoruHqA4eKfmtQEyEyo0RrKZqIioZ84?=
 =?iso-8859-1?Q?waXJnkrvF5GA2KqQOfzVayzzUBn34hO4EAeLZKemVI/OMkD96vPMA4bZqd?=
 =?iso-8859-1?Q?C8IygO91Z3/E2CeLT9mwgAb5qpTduOaO7yCwk5joy/GkxTrEYRAWZqnmOO?=
 =?iso-8859-1?Q?71t96k1EaSmnKRdwQYMfS9ju8g4ig2ltl9zT/WUuraGYMhewd2bYk+xICG?=
 =?iso-8859-1?Q?7y7MBJVDacRcNF7KbkPIZ2QCdgG9b4y6i74R0hBobwBackiHQNgXW3qaM3?=
 =?iso-8859-1?Q?0XP2DQzZ4jzXEYoMNec/ScPrPPf/OkMYi5A9FNdv6PBChI3hZoWgNt4TgL?=
 =?iso-8859-1?Q?LPh2xcnup3Ij0wdlBOvsMe2glJU1H+ZSXIyLrk1blZMIK6elY6WRbJ8jEd?=
 =?iso-8859-1?Q?SpRCBBC37y4qdAjefz5e//IDZeLKe3xKrFmtNJZX/1+NEDbaMRhLY6A1Ll?=
 =?iso-8859-1?Q?LVjFMAXrgQWKkURWV7WTWTtfTpCsDouiqNNHlTyqQzDhqhniUT/TlvfNdH?=
 =?iso-8859-1?Q?gMVYjlroo156LXgRnRUyfb1IHJPNkIMcBZVdTYzLKo5e1DcDbtnXnDWpNC?=
 =?iso-8859-1?Q?DHDXVz00dhRGueGrYqCej9OLDr/7TqNYnj6GSdmXXDMlyMVx5wXnxOtZMY?=
 =?iso-8859-1?Q?Zr0enMpnFLELj47s+cPfduj0CRx1JT+boKEpYlmIEH8Iy6A0PRvtpsmdOi?=
 =?iso-8859-1?Q?d434lHC/kQzu0Nk8s3perlzWboNd3MmM7yhlfF3IpCSbOblVG7anwdig?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 636a467f-c74d-483d-8cde-08dde6372800
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 13:31:12.7348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8d585og+vHbg/QVSRfmxysQex/5eScCFBb0eGT38pbPzv3Ecceo0icBk0InPkrSMhqbtDjnPY4WRcofa+SupTchxicvOGdp85KuiomilOo0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7279
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

On Thu, Aug 28, 2025 at 12:45:16PM +0530, Himal Prasad Ghimiray wrote:
>Correct kernel-doc formatting issues in the UAPI definitions for
>madvise and VMA query interfaces to resolve docutils warnings during
>documentation build.
>
>-v2
>fix formatting (Matt/Lucas)
>
>Fixes: 418807860e94 ("drm/xe/uapi: Add UAPI for querying VMA count and memory attributes")
>Fixes: 231bb0ee7aa5 ("drm/xe/uapi: Add madvise interface")
>Cc: Matthew Brost <matthew.brost@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>---
> include/uapi/drm/xe_drm.h | 45 ++++++++++++++++++++++-----------------
> 1 file changed, 25 insertions(+), 20 deletions(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 7dedd45ab995..8386980041f1 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1997,21 +1997,21 @@ struct drm_xe_query_eu_stall {
>  * union member is used to provide additional parameters for @type.
>  *
>  * Supported attribute types:
>- * - DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC: Set preferred memory location.
>- * - DRM_XE_MEM_RANGE_ATTR_ATOMIC: Set atomic access policy.
>- * - DRM_XE_MEM_RANGE_ATTR_PAT: Set page attribute table index.
>+ *  - DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC: Set preferred memory location.
>+ *  - DRM_XE_MEM_RANGE_ATTR_ATOMIC: Set atomic access policy.
>+ *  - DRM_XE_MEM_RANGE_ATTR_PAT: Set page attribute table index.
>  *
>  * Example:
>  *
>  * .. code-block:: C
>  *
>- * struct drm_xe_madvise madvise = {
>- *          .vm_id = vm_id,
>- *          .start = 0x100000,
>- *          .range = 0x2000,
>- *          .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
>- *          .atomic_val = DRM_XE_ATOMIC_DEVICE,
>- *         };
>+ *    struct drm_xe_madvise madvise = {
>+ *         .vm_id = vm_id,
>+ *         .start = 0x100000,
>+ *         .range = 0x2000,
>+ *         .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
>+ *         .atomic_val = DRM_XE_ATOMIC_DEVICE,
>+ *     };

	^ wrong align
>  *
>  * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);

missing indent

>  *
>@@ -2042,12 +2042,12 @@ struct drm_xe_madvise {
> 		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC
> 		 *
> 		 * Supported values for @preferred_mem_loc.devmem_fd:
>-		 * - DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE: set vram of faulting tile as preferred loc
>-		 * - DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM: set smem as preferred loc
>+		 *  - DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE: set vram of fault tile as preferred loc
>+		 *  - DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM: set smem as preferred loc
> 		 *
> 		 * Supported values for @preferred_mem_loc.migration_policy:
>-		 * - DRM_XE_MIGRATE_ALL_PAGES
>-		 * - DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES
>+		 *  - DRM_XE_MIGRATE_ALL_PAGES
>+		 *  - DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES
> 		 */
> 		struct {
> #define DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE	0
>@@ -2073,12 +2073,16 @@ struct drm_xe_madvise {
> 		 * Used when @type == DRM_XE_MEM_RANGE_ATTR_ATOMIC.
> 		 *
> 		 * Supported values for @atomic.val:
>-		 * - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour
>-		 *   Support both GPU and CPU atomic operations for system allocator
>-		 *   Support GPU atomic operations for normal(bo) allocator
>-		 * - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations
>-		 * - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations
>-		 * - DRM_XE_ATOMIC_CPU: Support CPU atomic
>+		 *  - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour.
>+		 *    Support both GPU and CPU atomic operations for system allocator.
>+		 *    Support GPU atomic operations for normal(bo) allocator.
>+		 *

in all other lists we don't add newlines.

I added this on top an checked the output is sane:

	diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
	index 8386980041f16..40ff19f52a8d5 100644
	--- a/include/uapi/drm/xe_drm.h
	+++ b/include/uapi/drm/xe_drm.h
	@@ -2011,9 +2011,9 @@ struct drm_xe_query_eu_stall {
	  *         .range = 0x2000,
	  *         .type = DRM_XE_MEM_RANGE_ATTR_ATOMIC,
	  *         .atomic_val = DRM_XE_ATOMIC_DEVICE,
	- *     };
	+ *    };
	  *
	- * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
	+ *    ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
	  *
	  */
	 struct drm_xe_madvise {
	@@ -2076,13 +2076,9 @@ struct drm_xe_madvise {
			 *  - DRM_XE_ATOMIC_UNDEFINED: Undefined or default behaviour.
			 *    Support both GPU and CPU atomic operations for system allocator.
			 *    Support GPU atomic operations for normal(bo) allocator.
	-		 *
			 *  - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations.
	-		 *
			 *  - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations.
	-		 *
			 *  - DRM_XE_ATOMIC_CPU: Support CPU atomic only, no GPU atomics supported.
	-		 *
			 */
			struct {
	 #define DRM_XE_ATOMIC_UNDEFINED	0

with that,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I will squash this and push soon.

thanks
Lucas De Marchi

>+		 *  - DRM_XE_ATOMIC_DEVICE: Support GPU atomic operations.
>+		 *
>+		 *  - DRM_XE_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations.
>+		 *
>+		 *  - DRM_XE_ATOMIC_CPU: Support CPU atomic only, no GPU atomics supported.
>+		 *
> 		 */
> 		struct {
> #define DRM_XE_ATOMIC_UNDEFINED	0
>@@ -2196,6 +2200,7 @@ struct drm_xe_mem_range_attr {
>  * Example:
>  *
>  * .. code-block:: C
>+ *
>  *    struct drm_xe_vm_query_mem_range_attr query = {
>  *         .vm_id = vm_id,
>  *         .start = 0x100000,
>-- 
>2.34.1
>
