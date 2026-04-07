Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42C0FB5192
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 04:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5410410E174;
	Tue,  7 Apr 2026 04:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n0st0OqL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53F8710E174
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 04:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775537464; x=1807073464;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MMfjYvG3AoGRawCMQRi6PJ4giy/p+cta8UXalFaYBKQ=;
 b=n0st0OqLX9bxVBuNaZrEKYsh/hHPEUDefN6UFYYnbZ/w6MLc7mvSnaRq
 zOxOfmrpwVoEpCbci2ce481FNobl1yO2Uz9ID8qbK/FUZgmDRPfVrORux
 MiavGGhzegDVVi0/MnHaj/gNR16UhCk2Bh8U+vQsdXDfNriH6q+yuylK1
 r7CNdyH9b961nOQhnWM81sZq8SS691NOGMB59jp3RVDJSddGL2SoeQUIy
 9ZlYKRfJUe4+fS5F9YuyUHXA6oMdGdANgVWcnMmZWMEa9nVKmxWUk4P0j
 p14tDzJLtWF+WpEkoJEEnCYGk2DsNSw0L8KjZ6W7xxLaUUWhI0E8wcI6f w==;
X-CSE-ConnectionGUID: bH+g4fI6TNKoP1kulrD5FA==
X-CSE-MsgGUID: uWoF4yyMSRCef033Rmd+iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="101947035"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="101947035"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 21:51:04 -0700
X-CSE-ConnectionGUID: kI8JiO2KTv+CcnarFBXBLA==
X-CSE-MsgGUID: 05A0cDftQeG3Bu2rAwXyNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="228005631"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 21:51:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 21:51:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 21:51:03 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 21:51:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VO38jrkWAJ6vzfewzCOC7iVX3dkAEt1spjhiBF52deug8m9jryONzKuSixEgvSzQ9a+stSZ4cKdTYYKSO4uoQVB2YRKLQGOtG3pCTy/5Y8Q0Sr7MDUnP3L76kdYLW7tbUhWE/59QmWoihX+l8yr/dHfKxUsPXZL+ZHvRIzhcTj11V0tkFLh8RscbKhkJg4U101sHr82bD+fMX0AYPLl20GPtWHVjaurDVVqU3trDffe7vI8CjFJkpsIoVCW11ArPd0ZLYZW+Nh5WP/nBEATLjpFRsBbF4PFJiEkTmEK6HolGleMCTUisZuLsFq99R8MoQywUpvuRD21YUP6z2iITQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5BfLnHktXDoj4OSeyVwLGknbs9Nmh+g9s05eWVVObY=;
 b=AHqaJfO58c0zd83p1UUpQTs/fwAcw6qpzFKrW+3kyAr1MxAJULelCcoDmoTL1Wv1uOa8gmCuWmaGLkxm+nY1t83WeDeGX9AI70ZQq7l7LbmPOKv34HC//GiJbv8J4C4kJ8Rpzltcm+tfREzLIF9LfyeyCaKBF861fyi5xEhdWeCb3WT5jZTEZmGmXpS+h6E2Y3WjqsZ3KYilBbln4uEBA0ryi7xWDLq95dudOZ/Nz45V2vV01WIIK3DXaEzyqU8H9iucJohUQtgymyE6OCeiqwo4424SFVRZdmqZHS1N/joufFk/VhS+Jogt0wIwVE5boRq92KD+v+JcPPz+IWB/1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY8PR11MB7290.namprd11.prod.outlook.com (2603:10b6:930:9a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Tue, 7 Apr
 2026 04:51:01 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 04:51:00 +0000
Date: Mon, 6 Apr 2026 21:50:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 02/10] drm/xe/xe_pci_error: Implement PCI error
 recovery callbacks
Message-ID: <adSNMapnJqvfswlJ@gsse-cloud1.jf.intel.com>
References: <20260402070131.1603828-12-riana.tauro@intel.com>
 <20260402070131.1603828-14-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402070131.1603828-14-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:a03:333::10) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY8PR11MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ef4daf-0144-44ad-107b-08de946143ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: ukSstraFeJyZhLuPKZNsKCIbOWpOh3BH9pWaSie2urkOwr8sCQa1gJapkiYF4xv6a/sNZgyukAgZx6tILZlxFUmleoIsHoRgSeHuzXMBxxkD42b970uVKgD2yaeUfflIEQZLjSL0QwpDFkbrzHULCsU+082INaU0rYPQeLovWX03pOJaq25y72GioLhozet+ECP0WDDPcow0kRInx6d4D0Z0eNuQ85z/ljqbQb/BM+5ILfKEKXednnuVsOFgad8u3GKPe2RHgZRDXzF9wVYO9I9mym/t3HuKUHCa4s9YWMulGjzRODnYQBojGJIDJzGftsmGYlhh789PbeMRrur+EDawbnEitUFX1bgfYP84JLB85OHUJwNg/nUI6aqExDNEoUY4BuzoE6L4gBT3IicJ79358e9Nwvlo+ygARWcC4lglsKB2lmTdDoltZA8BmsruMBeoehEoqWaN9RdZhXKVWNVMJs3xPTwLi9YlVyXh3EP5GyoU8LwN1KBBGhuqvFiTzp0BFjXif7xmjkZ9XN6Z/1tJ5XI9YjJkpKeADohGGp6h4jk1pIPgF0pdxXfR+1zSgUzGjJV848VNE0TVeglctl2Dcj+07Ff1mlfhR0LLVy/ERMthzXeVXKOMSjDyr1sJiITNhtogUsHNgN/fE5ha5lm53GE3N/r5CzHhBRSeTrlS4qIUDE4rTFjXpt3Z4n8t
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RrIpUavtjR33GDQ2yGrGhmUxTL7e/sMuBAjCF49f3i4qyU1hHASB1hmRAC?=
 =?iso-8859-1?Q?mtWRps2f84UZDGa7hLogbre8F6n8lkOLQ5hnt54SSGkKkFiRDjeUsVOQy1?=
 =?iso-8859-1?Q?buZX+uP2oa5eueYSE8Ky3m67On1MPla9Sgj66NHfariVoGo+6TTRa6USa3?=
 =?iso-8859-1?Q?fZyUiOuQbuRk8GCk0LMJje1gI7ZRuhqYdbZ3c0u7wSkvZ7buE1PTVybVnS?=
 =?iso-8859-1?Q?nf2Vu/0cK3XL6/ich8Gnm5Q7fGEOewEjxtPvQZLyuwRSOEY67AudQQROpp?=
 =?iso-8859-1?Q?qatZ2/cFv45g8TUiR/f3t+m437zInHEx/PEM2EbfrJaAIqMZ6DCctfv5pf?=
 =?iso-8859-1?Q?RO9OAFlAg6XtAfmroih4AlvFi6bbw5L/LKXxwFsAFXNwmzMQkOFDlf6/Le?=
 =?iso-8859-1?Q?cNGeztJ+0Dg0wkuKoMotYIthlRPjMFFV/2rTJclscOqszH6PpQwlFBA8OR?=
 =?iso-8859-1?Q?dBmX/vWIpsdPuGVrUaaL80EVqSAIaQC/9qG9mXPnfM6j7Plkp8lMEiXlx4?=
 =?iso-8859-1?Q?Eqj+6jqDu2fBelk6OyvAawBRlRoLPZnzALgawBgLpEreDpRJ+GijknGxT+?=
 =?iso-8859-1?Q?b5j5L4Wv0Rmar0Mhjj/iZSNAMcF+fuj71srGrngSVN+U0VjfBRDtYjmnGl?=
 =?iso-8859-1?Q?CcDDUIrbs5t8HJocd+BYVckdoq4wHj3Ki0llKI58ne5JgFu7fuIEgIfvL0?=
 =?iso-8859-1?Q?O/UtIT5QXMmM40On8Ah8ni6UCJl8UNM+Ij4BPs6C0krPe3bHKTby2fPDVn?=
 =?iso-8859-1?Q?xUm9wIsB9+o5NXW3Q6GvNZ4ltasUFhyaJbFd+2/qoARtj9paL1ZgTiD4oy?=
 =?iso-8859-1?Q?emW2ANchtw5DySoqEdSAX2BuAWudsypRZGsr03igvZgybIIdqQKJlOeqhy?=
 =?iso-8859-1?Q?tcuT+4ki+mO9iuPh0ADhkez/HU7ctTggowLlj3u+hP1mtTHd+kocYhCMLc?=
 =?iso-8859-1?Q?KQAY7kIxmOxzKtdiu12Qlll6nHaqT3S7F597lNafRvMO2PEcZRV5A/6QWn?=
 =?iso-8859-1?Q?TVPk8hQ1y+m8a0/ueR7A1wCRsjVVZ9eajMgQvNXwBd8vFVPtOO3LlZAetJ?=
 =?iso-8859-1?Q?POJ8EVKkr5+Nrr5Hctb0bVZffpBwh5RgwVa+AwXoo53z0va+nOkdRfmgso?=
 =?iso-8859-1?Q?AaE1mO5mtIcljO/avweA/ttrIEqKDL4nwWWfhNuQ70RfSW+DcLsZ2KXR+U?=
 =?iso-8859-1?Q?XR3zCBYBVCOqWyHAnEsB8ADRSKfDHdppClcxJ4aKsN0gZnq7pWbDWp/KOq?=
 =?iso-8859-1?Q?ilrinpjhCq2w3et9oXuEM1mvC1DJz+fWCFhOelEU1SJCG2A2j4Rid5KQYh?=
 =?iso-8859-1?Q?YCNctX68RKBQUFKo6D6pcnI2GaI0Qxl2i4eNDbow+9vaK1NYQ+4oVKR7ly?=
 =?iso-8859-1?Q?nzqSNQ5fAmYXJPcWE8fQ9NakdxrwL+ELHQBMYJd7tFyZnH/NWFi3N4u+xb?=
 =?iso-8859-1?Q?iHIej+wLsWB2xaO4nvwkl2a38hI8rbQt8eCQb+PCOeWZNEGJlP0SHGYrM8?=
 =?iso-8859-1?Q?te/iKJ2rSDZSBBH3bGiwEVQ7S7RJhqrFzwSwD8WMZBch4lpsaMsX2E8RlO?=
 =?iso-8859-1?Q?5Batj+C6sWdwZYkLqMIlUOWkeE6N0O38zKN9Zv1E6YxkOI+8tZTQJ285gE?=
 =?iso-8859-1?Q?vITgO2dbxpeCD90zrkPbRStXmezlTi7LSANSQzSXcgWQYXWx1OT5bAiT+J?=
 =?iso-8859-1?Q?h6M10vUk5sk1DXgHrEQs4/pfQV6spLEo0CVYL5T0iEh8Wc1d7lPY8UKsL2?=
 =?iso-8859-1?Q?+jg3eo5mKuIT7Oo1VYQoJ4Dgvi9mYL+CS4rQL5IPb2FEVB9/Fh4OPdhDyF?=
 =?iso-8859-1?Q?EH48QId+3g=3D=3D?=
X-Exchange-RoutingPolicyChecked: JSs+Hui7USH+HTmi4BO9cVQ/IrYNsBh5oIxkbmmxhqqR88aCoSrhUNHudMGyrPxufF50gF0HWbuMcqYdbyAFjIbmUKMPJW9WSMvo+I9bKNp3bH0/byv1HUydEZjqwczyY2qSIZUAkh2lSypsIaDOEe6kGJR6LGmI4lPlScBH8ePHu+NIpRH8of5oWkLkgTP2lrKDhptw3vU+jbOopdUyFxXfewElGJmKaQWGi59NPQ64CXekn1dcAyqa+nDkdPm8QDwqFz5/TkK15BCHN5hgneN9020OFv99787pGqII7mb89fLB+nMHWxKBxlgwhQXgwNNFV4n8Yz11iZY32yQdpg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ef4daf-0144-44ad-107b-08de946143ef
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 04:51:00.8652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nflo0CKe3JkZETn9t/MAQG1uD8im55G8uoIH3JYh/QDbX1qsiMqTtYbiYubEyi8m/mQqJcgRIuA+Ky9JbwczA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7290
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

On Thu, Apr 02, 2026 at 12:31:33PM +0530, Riana Tauro wrote:
> Add error_detected, mmio_enabled, slot_reset and resume
> recovery callbacks to handle PCIe Advanced Error Reporting
> (AER) errors.
> 
> For fatal errors, the device is wedged and becomes
> inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
> error_detected to request a Secondary Bus Reset (SBR).
> 
> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
> error_detected to trigger the mmio_enabled callback. In this callback,
> the device is queried to determine the error cause and attempt
> recovery based on the error type.
> 
> Once the secondary bus reset(SBR) is completed the slot_reset callback
> cleanly removes and reprobe the device to restore functionality.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: re-order linux headers
>     reword error messages
>     do not clear in_recovery after remove
>     return PCI_ERS_RESULT_DISCONNECT if probe fails (Michal)
>     only wedge device do not send uevent (Raag)
>     set recovery flag in error_detected and clear on resume
>     add default switch case (Mallesh)
> 
> v3: do not set in_recovery for disconnect (Mallesh)
>     return if already wedged or in survivability mode
> ---
>  drivers/gpu/drm/xe/Makefile          |   1 +
>  drivers/gpu/drm/xe/xe_device.h       |  15 ++++
>  drivers/gpu/drm/xe/xe_device_types.h |   3 +
>  drivers/gpu/drm/xe/xe_pci.c          |   3 +
>  drivers/gpu/drm/xe/xe_pci_error.c    | 104 +++++++++++++++++++++++++++
>  5 files changed, 126 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 9dacb0579a7d..7f03f06df186 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -100,6 +100,7 @@ xe-y += xe_bb.o \
>  	xe_page_reclaim.o \
>  	xe_pat.o \
>  	xe_pci.o \
> +	xe_pci_error.o \
>  	xe_pci_rebar.o \
>  	xe_pcode.o \
>  	xe_pm.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index e4b9de8d8e95..60db2492cb92 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -43,6 +43,21 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>  	return container_of(ttm, struct xe_device, ttm);
>  }
>  
> +static inline bool xe_device_is_in_recovery(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->in_recovery);
> +}
> +
> +static inline void xe_device_set_in_recovery(struct xe_device *xe)
> +{
> +	atomic_set(&xe->in_recovery, 1);
> +}
> +
> +static inline void xe_device_clear_in_recovery(struct xe_device *xe)
> +{
> +	 atomic_set(&xe->in_recovery, 0);
> +}
> +
>  struct xe_device *xe_device_create(struct pci_dev *pdev,
>  				   const struct pci_device_id *ent);
>  int xe_device_probe_early(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 150c76b2acaf..c9fe86b670bd 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -494,6 +494,9 @@ struct xe_device {
>  		bool inconsistent_reset;
>  	} wedged;
>  
> +	/** @in_recovery: Indicates if device is in recovery */
> +	atomic_t in_recovery;
> +
>  	/** @bo_device: Struct to control async free of BOs */
>  	struct xe_bo_dev {
>  		/** @bo_device.async_free: Free worker */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1df3f08e2e1c..30d71795dd2e 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1323,6 +1323,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>  };
>  #endif
>  
> +extern const struct pci_error_handlers xe_pci_error_handlers;
> +
>  static struct pci_driver xe_pci_driver = {
>  	.name = DRIVER_NAME,
>  	.id_table = pciidlist,
> @@ -1330,6 +1332,7 @@ static struct pci_driver xe_pci_driver = {
>  	.remove = xe_pci_remove,
>  	.shutdown = xe_pci_shutdown,
>  	.sriov_configure = xe_pci_sriov_configure,
> +	.err_handler = &xe_pci_error_handlers,
>  #ifdef CONFIG_PM_SLEEP
>  	.driver.pm = &xe_pm_ops,
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> new file mode 100644
> index 000000000000..cd9f39010278
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#include <linux/pci.h>
> +
> +#include <drm/drm_drv.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_pci.h"
> +#include "xe_survivability_mode.h"
> +#include "xe_uc.h"
> +
> +static void xe_pci_error_handling(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct xe_gt *gt;
> +	u8 id;
> +
> +	/* Return if device is wedged or in survivability mode */
> +	if (xe_survivability_mode_is_boot_enabled(xe) || xe_device_wedged(xe))
> +		return;
> +
> +	/* Wedge the device to prevent userspace access but don't send the event yet */
> +	atomic_set(&xe->wedged.flag, 1);

We can't blindly set '&xe->wedged.flag, 1' as this is tied to a PM ref
[1], [2]. The existing sematic might be wrong but we to normalize
adjustmets to the '&xe->wedged.flag' field with uniform rules, or the
cases when we wedge we also take a PM ref.

Matt

[1] https://patchwork.freedesktop.org/patch/714622/?series=163948&rev=1
[2] https://patchwork.freedesktop.org/patch/715028/?series=162055&rev=4#comment_1315905

> +
> +	for_each_gt(gt, xe, id)
> +		xe_gt_declare_wedged(gt);
> +
> +	pci_disable_device(pdev);
> +}
> +
> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	dev_err(&pdev->dev, "Xe Pci error recovery: error detected state %d\n", state);
> +
> +	if (state == pci_channel_io_perm_failure)
> +		return PCI_ERS_RESULT_DISCONNECT;
> +
> +	xe_device_set_in_recovery(xe);
> +
> +	switch (state) {
> +	case pci_channel_io_normal:
> +		return PCI_ERS_RESULT_CAN_RECOVER;
> +	case pci_channel_io_frozen:
> +		xe_pci_error_handling(pdev);
> +		return PCI_ERS_RESULT_NEED_RESET;
> +	default:
> +		dev_err(&pdev->dev, "Unknown state %d\n", state);
> +		return PCI_ERS_RESULT_NEED_RESET;
> +	}
> +}
> +
> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
> +{
> +	dev_err(&pdev->dev, "Xe Pci error recovery: MMIO enabled\n");
> +
> +	return PCI_ERS_RESULT_NEED_RESET;
> +}
> +
> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
> +{
> +	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
> +
> +	dev_err(&pdev->dev, "Xe Pci error recovery: Slot reset\n");
> +
> +	pci_restore_state(pdev);
> +
> +	if (pci_enable_device(pdev)) {
> +		dev_err(&pdev->dev,
> +			"Cannot re-enable PCI device after reset\n");
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +
> +	/*
> +	 * Secondary Bus Reset wipes out all device memory
> +	 * requiring XE KMD to perform a device removal and reprobe.
> +	 */
> +	pdev->driver->remove(pdev);
> +
> +	if (!pdev->driver->probe(pdev, ent))
> +		return PCI_ERS_RESULT_RECOVERED;
> +
> +	return PCI_ERS_RESULT_DISCONNECT;
> +}
> +
> +static void xe_pci_error_resume(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	dev_info(&pdev->dev, "Xe Pci error recovery: Recovered\n");
> +
> +	xe_device_clear_in_recovery(xe);
> +}
> +
> +const struct pci_error_handlers xe_pci_error_handlers = {
> +	.error_detected	= xe_pci_error_detected,
> +	.mmio_enabled	= xe_pci_error_mmio_enabled,
> +	.slot_reset	= xe_pci_error_slot_reset,
> +	.resume		= xe_pci_error_resume,
> +};
> -- 
> 2.47.1
> 
