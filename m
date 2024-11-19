Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4645D6C281
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 18:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3D010E69E;
	Tue, 19 Nov 2024 18:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LE3YVPCZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7DCD10E69E
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 18:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732042063; x=1763578063;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GAXjagKl0mCRRZ6lLnTXApKBIcBD5PZSSQJiVSEuGKc=;
 b=LE3YVPCZhmCrxMZrHMW5J22iF5Ab1Vz2qlV0U6ehzuIYCngwJjwx9/32
 x60KrednqU/4kX6/71meCyZgEK0ecAuILMRz1w2YyQMALLcyr4CNTWADB
 ctLoMz3a+vIJdOzTm4VS5KWbseBoRKstV5er2oVGSjah/NLHfPb3E74Gv
 000iJVUcNDfD3cGBZfWyMSVDlOHsSTrvoTRuKASeTtsHWh3iKolzMpHq8
 avtgX3PQrEV4jWUzcQt7Vvc7/7L41TvG+tYqIftyR6D34LMnQvrc0fwjT
 m5pIP+jL+NmuvJPVmeNFfEyIRpvgYKQRVAm0+aI+EH2iwpqm4uNcGlM/a w==;
X-CSE-ConnectionGUID: wAxuHDRPSY28KXTFUtCpJQ==
X-CSE-MsgGUID: iRpetpW/QxaBd5c4rkEBpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="54563119"
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="54563119"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 10:47:39 -0800
X-CSE-ConnectionGUID: d/0PZUZxTMOABx3thgdmYw==
X-CSE-MsgGUID: 6eZs6NZOSJGtHtsk8lTgtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; d="scan'208";a="94584550"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 10:47:38 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 10:47:37 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 10:47:37 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 10:47:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nScfGiQ1SqXsCwvmrT4L/yR3OKL5EeJyHqzr7jgrd1nv1gxe20O5yLrR+ogRS3uJGcApHZ+0G0MIIRVlHqcx2aQL0vF6onH5XTlaA+Bz4bE+2R9/iYqqkz2c66lm6uv9mRiF71jwfLDQucpdrwLMuIzOqwJ7Dd+09y5WSGa9FdUVeVTKVjK4iaLST+tUt7tgEzQapWMZzecNDQGhUfvlLDx4+8krNmV2fN3tz1VwO+Gx3ueV31YVwYTBq624vgKERIhJ06pbKjrrlGVunVOecgyl7I0DDACYNW3is9epf5BCSJBQxw0VGYTyZaL6SIEgoplbpz6SxXPt3TwEvidQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOapuhW5EOXWoT8GUZMHJGyQIR4zpR7wlSMEPGj8kj4=;
 b=Sqlsmu0P/Y+tNcdmAN11QYgmWznETLvCugIdiWQGYvHZEvzua2TzVluuY8tzAohwcXWBrEWx1xQ4iDrDiahkohrFF5eKLH8e4gFJtZgmT8/8HHFUsBOLeYSZ1HBsoww6teOj1oGk2P4FBa1KrwwV8qhzqDVLVugZ+WNZyIytM7LC0MyV3HV/CGtnC9qYVMZsou+jv8ldjNefoRj+MOXPboMSQD3jFy3/RxpjcrH9dvbGSXmkhZr50ECtAnOczClju1m5MHD/qQerw0erBUvZjQo0ryrC11hGPDr7YjerlT/W/rCtYnSW1BOL06GNjlg8RsfiwcB1j4IhxC1fJ/gxjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 19 Nov
 2024 18:47:35 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8158.021; Tue, 19 Nov 2024
 18:47:34 +0000
Date: Tue, 19 Nov 2024 13:47:28 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Introduce force-wake guard class
Message-ID: <ZzzdQGnrSSD7jKs_@intel.com>
References: <20241118184511.258-1-michal.wajdeczko@intel.com>
 <20241118184511.258-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241118184511.258-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0218.namprd04.prod.outlook.com
 (2603:10b6:303:87::13) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ad00ce4-243e-40ff-9506-08dd08caa188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1jo0DJg0r6D81OtO8w4weqCNGTstdSZ7eQF9NkLSUKSEbOWreFLR0mQppnSb?=
 =?us-ascii?Q?yd8UY4vSaDzlArS5QdNA0FwflR3CBglGOcVBsQSM6vIN6O0ySxGMTvgRNdFF?=
 =?us-ascii?Q?nT1IMU2fslprDbq3s/D7fPMYtaei8HwLUnrlPYwJWy3KcbtMIYuShpweToLk?=
 =?us-ascii?Q?MH+SYzDXLdoCb/9J15VDMVvp446aGZZuG15RxcCoZOO0ecwAjyWChAa9Wvyk?=
 =?us-ascii?Q?yPIouTvzc37oSEDgDGexPyyLgjxqWRlBTTTMtG9EgLs8BUQ5C2/GH6K3H/n5?=
 =?us-ascii?Q?mHXrGb+IXsisMf/DgJFLSLr7p9Qp1YPyf11E8qBZu/QTlt6x/YQbxIfy/4Bj?=
 =?us-ascii?Q?BgrZ+epDnr8Fh451bWb70rpugHLDHS5LAe3ppi8GcI5oFRvur+PzwrQdrJf3?=
 =?us-ascii?Q?PaD2HQcMYTNCgK5W/S5CFTEUJ+vWw8+xNnS9Dt7ZVjCu9bEOcHLmBYKdC+PS?=
 =?us-ascii?Q?90l4VI3mVEJMOu8qODPyxCv6uaKi3GJTNUuziBJrMvxz9LCLjhRFBVR7R+Jw?=
 =?us-ascii?Q?s9LBrXU1R7roFkiDP6OqQUdFRQhnH9uYf7lN2Pp7NGEsmlspF/Pq4Fe8Lv9T?=
 =?us-ascii?Q?7EtXcpIIwqvJxgNWnKmUi6KgiP7Ge2VbDzeghVvAU5C+3HZNt1w1mLZ9xGyp?=
 =?us-ascii?Q?q7mAu1SlOZQrDzGiCXOXE+mnF7YJeITxVTJjpHhCEeNdawwdeQM5TmYLCyG0?=
 =?us-ascii?Q?iGBvtjL8UflHXJSUHIQgJW9+BggbYpUzqqSZinJ2PqLrR//gDhoDAq+jLZbf?=
 =?us-ascii?Q?zFyWilpQKSmY46iEsasn+SWGyDwOi/QdiFNmfSHXnFt6t/xBZkorPXoDudqE?=
 =?us-ascii?Q?JK4IxpVyr2nfQ/fWMCdKMX+Vv+sz21ccjwMN7VReXylzF73RkgfED4hw3X9q?=
 =?us-ascii?Q?7es65LwQL3ZK1Vp1IlWjCuMeKVwqqwcjLZFqJadKb5NSyNJIyh9/16WnQR6v?=
 =?us-ascii?Q?gSs9Sdlv78Kj/aJsMPuhGrKCZ3F6aSjl7lHmXUjP4YeN+2Qsak6ILHXMMqeX?=
 =?us-ascii?Q?dsIWBNGQPxTKPWaTC59yBfvhRVap5fFfkaeDEBo7bME3Zpp2p/nIuwuqDA6e?=
 =?us-ascii?Q?6Fto7quAFTVjdh0lg8bttWgFjohLmzCHAs/sJ4SHKIRR5+m3zjdRH0oS9X7Z?=
 =?us-ascii?Q?Al+JHt5F8aRm8CmoJkDVaxDJC6vilBqTDkDuGW/JV2fFSaT/fvX/1SM/I0tB?=
 =?us-ascii?Q?FhJ6D9ZF1o+ZbPqarYPeVmLQ1bC6pX7JtZRwAkEnv3dfz58W0AINXb2KZ6cn?=
 =?us-ascii?Q?JyAlsDZah9HOSHLEEpmR3B91x3C7JkfvkTumLkGLnE09f7+zuoKjjambnS7u?=
 =?us-ascii?Q?60g62kk6HxPKJj+cULJJIDPy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DxUfXtPf61EKfgXfLm4WDc5LkP6aF1xhF67SdspkM+tLD34SoRHKxY+aOFEm?=
 =?us-ascii?Q?n+KMxv9NbIIJUi3UgZohF1MBM18hE3O4BMOYIBoA2vY2sXsi2AnJzZqn4uV8?=
 =?us-ascii?Q?EXszn7d+5QRrwpeiilE4gORtu0dpWoQR/jTiXcn75snTWfzPVBsKv6A9adLa?=
 =?us-ascii?Q?4FwoHRcg4n0LCdIHgyNraDyNHcBe687RJg/ka8W+HK99iwWmk2epvhEPy0HL?=
 =?us-ascii?Q?HwhutPMQK7JSkomvkyoOkeCBKWNxA6Y9KkAN+km41D9+Cqbo5XnxPy75NMSh?=
 =?us-ascii?Q?1/3mK0qbQaHwJ8oqIMbAyNlRJVvm87JB91CpdzqOzxDcpyOtljoFyM/ooiJj?=
 =?us-ascii?Q?+MwRaoQNwIxDFn/RQn7pzY7kCHdQqTHO3nTWibZ8fiEVmwg1vEPlG8539m/D?=
 =?us-ascii?Q?bxeejXhPM8FO9HdPQLCzoU87YV430Mu91BlNTWYxBWLgj0YW0vXE93eY1k8y?=
 =?us-ascii?Q?Q8faExiAJro0fX0EYmkbVL7qAZqltN8qUsOk0aAc9cHERs9yYUl8r6KYMw5s?=
 =?us-ascii?Q?9z7YIUzWwGzEuPpBE0yN5kWNTNsaANohVAAlKg79yXHGgkFzicCLH6pFHYbL?=
 =?us-ascii?Q?ltsb8k2REBqmpgPuFFWiZptiT/YYewc72SVgG6UGrmqq7u2bEXavgOaBc3FN?=
 =?us-ascii?Q?4b4Pu08wWz9BxaU//BGVLpx4GAJ43d6yBJeC+UMNem8DDdSItjuwVvRAROX5?=
 =?us-ascii?Q?rVRbng1oAz24+qCACBDYKeZqLQKAXtd4Cq8KpuIh5W8urYpVq/gJh7IIm4UN?=
 =?us-ascii?Q?dInwwPg/i/j2Rbdw+ZEqfJkzHZtqgZebQmkTnOCyAiljFT4xVrVgIDoo114/?=
 =?us-ascii?Q?apm20LwxSjqkBquhPI7TlDHoGtxs5DPz7G5FZss9NNQyxG7KyN4nyC0IINCZ?=
 =?us-ascii?Q?+u8VUPO2/W6dufhb+zEv1mooh8OB3GAFL1FxkmMXDwsTxsUSO9R+wxXArmmO?=
 =?us-ascii?Q?sXg0PxCAMWWSMNi8eTj1l3P6VHyywnmXePZsemiqiaJfE9ioBoup16q3Ra2T?=
 =?us-ascii?Q?ygGFzRCU763WsqKxPafjxX2HgZPdhaqoP+h6HH5N+m5sMpMXp28pvf9QKinE?=
 =?us-ascii?Q?0AkuQShervnP/PWVz1bsOumW8aslrigAq34GuN2YiWpRmzdxrgEjbVdceiCi?=
 =?us-ascii?Q?Gphpl7DRLSsiKN1NzYIDmG0KcZrfPXwoROXaP3l4ZKA+wj5v2A+KRyRoYgp5?=
 =?us-ascii?Q?ndu0KKAQdGsGy+/BlMScUQ3huEFUHf/y5z5rLLKt952+NaLNGRTLNIwHqQDC?=
 =?us-ascii?Q?YMwCFnCioQBa5hODytlIJSzVz9D7NDxVzYDdTFNHP7g9st7CrO/K9eLG2Ypv?=
 =?us-ascii?Q?TTj+NYv7urnw6fBTZVhBt86b/mAo+qHExNAiWpjgJF0GDXjlR5a8SVMS9Yaq?=
 =?us-ascii?Q?Cn/Ni9kK0zeCcGr7rwA+Wz97Gej3YdtSDtRdJ4wRPoTFB/NG3pn3G/GZRB0e?=
 =?us-ascii?Q?qNr7SpKSGhcw5Z36Htvn+W3JjAaqE4Lot6wlyKDRtSEsw3qz/m63WK3DQqa/?=
 =?us-ascii?Q?x52zoot3r3aaMRuEC0DFRvOQtTy+/vG7J9hckyQtzmqmCV86s+DVhw8iHGHW?=
 =?us-ascii?Q?0jLh4MjCDCDduEYJUG5132V11lvGW76cFOpd75/WeLx2+QoLtUDI/QEgDmVW?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ad00ce4-243e-40ff-9506-08dd08caa188
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 18:47:34.8333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QEUC3is7A+FiHA4PYsAp0roKvi9qUBCySj7Q6PRiw21ohxqla23apz5U2iCCbxJpBursCk1CsLRYOoaSv6BfJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5184
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

On Mon, Nov 18, 2024 at 07:45:10PM +0100, Michal Wajdeczko wrote:
> There is support for 'classes' with constructor and destructor
> semantics that can be used for any scope-based resource management,
> like our domain force-wake management.

There is, okay...
It can be, okay...

But why do we want?
What are the advantages?

> 
> Define xe_fw class that can be used for force-wake management.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
> v2: aligned to new force-wake usage model (Michal)
> ---
>  drivers/gpu/drm/xe/xe_force_wake.h       | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_force_wake_types.h | 10 ++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index 0e3e84bfa51c..e46e44f7eb70 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_FORCE_WAKE_H_
>  #define _XE_FORCE_WAKE_H_
>  
> +#include <linux/cleanup.h>
> +
>  #include "xe_assert.h"
>  #include "xe_force_wake_types.h"
>  
> @@ -61,4 +63,14 @@ xe_force_wake_ref_has_domain(unsigned int fw_ref, enum xe_force_wake_domains dom
>  	return fw_ref & domain;
>  }
>  
> +DEFINE_CLASS(xe_fw, struct xe_force_wake_guard,
> +	     xe_force_wake_put(_T.fw, _T.ref),
> +	     ({ (struct xe_force_wake_guard){ fw, xe_force_wake_get(fw, domains) }; }),
> +	     struct xe_force_wake *fw, enum xe_force_wake_domains domains);
> +
> +static inline void *class_xe_fw_lock_ptr(class_xe_fw_t *_T)
> +{
> +	return _T->ref ? _T : NULL;
> +}
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
> index 899fbbcb3ea9..15456a24f707 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> @@ -85,4 +85,14 @@ struct xe_force_wake {
>  	struct xe_force_wake_domain domains[XE_FW_DOMAIN_ID_COUNT];
>  };
>  
> +/**
> + * struct xe_force_wake_guard - Xe force wake guard
> + */
> +struct xe_force_wake_guard {
> +	/** @fw: force wake manager */
> +	struct xe_force_wake *fw;
> +	/** @ref: opaque reference to woken domains */
> +	unsigned int ref;
> +};
> +
>  #endif
> -- 
> 2.43.0
> 
