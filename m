Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7334C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 19:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260C489B30;
	Thu, 14 Dec 2023 19:40:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9E810E194
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 19:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702582847; x=1734118847;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5i7PLPkkuqPLMiMXnzK/jCHX18Q4/aB7vqdAkaH8GMA=;
 b=gF/AZQ3Gc1mBAA20veP+1utDXTMf1RhoZQ7TRimCrOalneOnNZSTunj2
 i1p7MPVAOjCyczneVSw1uOz9K8gZ487ZbiJWxdnAhzd68iQKTU2M1saya
 w9L/yAUbeJZGvVN+DvBWQ1H4gU3Pp+Yx4aWUVpAWcIqh9m0+aLTRaIrgr
 lKBJlSW5zi43CEP2B8ygbLvwh0Rxyhf5qkxbkfKuIQJ8nZdI7keLpQAyr
 bW7g7H22fAnuDJG7Azxd1eisY2qZYS2JQXaKsI60s+jUNUq/jBN2JvmE2
 gGW31FhHkf2lYHJCk8rqjpKb2Hjps7I5gShfC6rPoZT+/suYTLE3UvGgP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="397963208"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="397963208"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 11:40:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="918158639"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; d="scan'208";a="918158639"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 11:40:46 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 11:40:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 11:40:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 11:40:45 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 11:40:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHOY1wKMrGTDUETdjJj1srKwX0RzRZztxQ3qI42Uqw3Y05GZkZoVBHPKgKblGUhXSjGZRm+EtJOk8eUKi2KfSNY4zecvq1Y2eyDVqsWz0xtPAq/swWTE/8JkEKzgiATx2HFkgaiC0pins98eZUiPpKSI0odD61Zyv/CBi/M3wtFPpuUVtX+WOMYhSolDFQO9I+BW/R8j/5PedagoFKaJijQpzT6BdqJqLiiewYPfNyPhyKnwhIJE0iUtmrhl0xcVZ9Zlvkhyz44aNIEEwe5v5p9l/03DUATuynOEEeiO+nWm/gevDdRFBY3BA0xTph2lon8oIYLFJFMNImXKsJvanQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAgEY1zYkrWDpnmHjrR0ZZaHEmEJdLO0biOt4TjAnbg=;
 b=Lybi8MWwt+vlM49UajvFZWL/ph+rETo3cyEs3KsvVByu2TtrdfoZIYVV8i2Ms+Iu+2UWzNANzRUgJiyCNmELdqnDULDWRGnhUU6g/WD4oORNDz1/j8ilh/BIyV7EfR2Ee4ISrDn6ZKpMjm+ANdnJUVNKuwvD9qUC4d5+Rnvis91c4bsA5n2KHFcygqG4wrlU3mmz0Zy535O884MepTbk168n7xeBXsTsnSeER0bNTP+NLderZ0K0/9YPXsqXpmId0FwFYY5tEsGhY+D5Qzap6ufbtkW1N1RZngt5AEQjR0xPQ9j0fH058aJonMMTUCz6xk05KCJnyP2caKC+/zVoLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 19:40:43 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37%7]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 19:40:43 +0000
Date: Thu, 14 Dec 2023 20:40:37 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH v1 09/14] drm/xe/uapi: More uAPI documentation additions
 and cosmetic updates
Message-ID: <ZXtaNdOtc_ix1HoW@fdugast-desk.home>
References: <20231207135009.7-1-francois.dugast@intel.com>
 <20231207135009.7-10-francois.dugast@intel.com>
 <x372auciffcjchrgqo4k35orpocaycb4kpx2p4zxjwnrfoji5o@gkwsy7tnlebg>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <x372auciffcjchrgqo4k35orpocaycb4kpx2p4zxjwnrfoji5o@gkwsy7tnlebg>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0329.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::28) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA2PR11MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7c48f1-1e0b-4feb-732a-08dbfcdc8f5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ai6Tf9BvVgKyXjqHaMI+XKZ7CMR9xMB+D3xUPbkmecaB//oMiNPaGFLboxwIAj285D7ioQBMxFIep1fbDw/xYc9D7zEIahLTQ3oWnxAgR+Q9Ko6kRMijYLVZsQhcZMPH1m2Q+Ek8/DoLogpIcP3iHvEASUejk6rTFULpRwIqPpX2LkEMj+qV6XFgqjvzzdugqvc7Hk1bqo1BtGucB+/vcCu0nxp1ct7pA0p9bp6q3h9mJOWjvSnaI1v64QX170tFoZ0A8gR9mtNFLgptt0r4UYg9ZfLXBzAv1GEJhOuHAvVfwZdyIdc2BGBCiATfIysK+lu50Rl6qQ+EOaKqkGrf7Exgm+Q8B0/I/5tPDnmzDqjtBgJckXatd43bBQve9ki1y1yWQZ1vKW7S/L0wGkncWQP1l8bg/Qp9oykfat05LjpBOsA5qzYfNIO6fixrgMyJFliOF155DpTr4oXZYvlgrsgaEn2yfAxIlarylwEoPDzYDzJDiExYPIuLmdP1ZihHU/WQ80Scl8lrQbtNurid/2iHlVN9BpZmDk0UNC5ad5HmOPDbyp3aPrSTZtWbzii
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(366004)(39860400002)(136003)(376002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38100700002)(86362001)(82960400001)(36756003)(6512007)(9686003)(107886003)(26005)(6506007)(36916002)(478600001)(6666004)(6486002)(44832011)(8936002)(66476007)(66556008)(8676002)(316002)(6636002)(83380400001)(6862004)(4326008)(66946007)(41300700001)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?apF6Ojefrml6NhV6QC4mSoXpntpjyMEfOWLFq9pkw6kFPHpBqDDiGvMqvq?=
 =?iso-8859-1?Q?ngqfZ+DXThMCvzGk7mpmTju+xXAI8/ryHmswws1YM9ebTJpaEFA7Lwfmf8?=
 =?iso-8859-1?Q?9d4s+tA9PnATPUd+SkI2OuRKtUDrE4xzvhlZrg9RbUnTWf0wIm7QrzSsAV?=
 =?iso-8859-1?Q?yuoQtbYGejdFHY/IOajgthEqtgmW6IC1gCIAa3x42Eoq68QLMuaHCbmdzX?=
 =?iso-8859-1?Q?S1WEE9O7aT2SPBHrSPfAF7dvCM5DcNbzIxO9RVGENFpyRhJFUVKD1nMrCo?=
 =?iso-8859-1?Q?Sd701knOMlUarkXOftqSYKzLJokjtG8DCJmNsAizTD/UnfEwRj2FfAkm/I?=
 =?iso-8859-1?Q?ikhDFq+DvzZb/HkQ5tlzO+waFr6fHRga78Lq8Ex6IT53YXz/FpW9Lnm1gR?=
 =?iso-8859-1?Q?F1hOmAP1RwpPqu60n/WqnTkb5XNxq8Um8qSTC9XQO4elzrc8O/ffitPQUT?=
 =?iso-8859-1?Q?AxY4mOsm792zyfE8NP3Y4L0N7xI+cuO/XFN7+agIlO7momOgVgLzH8TwpQ?=
 =?iso-8859-1?Q?yRqHp4O4FcN3U8ftDU4Q6sdBks1/Dfz9rb9BD9TEE4DawISx3ASz8k+uVv?=
 =?iso-8859-1?Q?oRHmJUKzfd6MWitV+8Ylnsgav3k04GcVfV6XHezSOHdAFjEZzMUh+I8hGi?=
 =?iso-8859-1?Q?T8yG9MTrltOm9xqnVV7TDWEadbPBaSRyxeE4ff7tvZqXflNZbTHtkvNghD?=
 =?iso-8859-1?Q?ZVjkZ3omgX9fvp7/K4aL3xlOwNX2fXFoT5MsX3UiQAdgChLtDg0tQyeSFY?=
 =?iso-8859-1?Q?nPuQ565mxAce4tVYTK6t0tWGYRT2qLXIOSR1Xtdg59nKtAO81EzpuI8xVF?=
 =?iso-8859-1?Q?swkN8N7xTV9IcrRAmpwgtDLNjGykfYzjyqEbqNN0IzH27n5xzWBtMR133t?=
 =?iso-8859-1?Q?VczYuhtXPIeDaSUguabxuH2v81EBpInVQ37M6KiG0rNzmsAscjsDl8oVIt?=
 =?iso-8859-1?Q?gGWLob5x7iX1fhDQ1BGfCmjq0cEr7OeCYYDEwRyEAs/s64/R1wLKD7WalX?=
 =?iso-8859-1?Q?xIo5uj+fx9oVfe3md9SFoz5NUPN70o367BH/8E+sX6+YczAElNf8l+2u4M?=
 =?iso-8859-1?Q?04p2D17JZ9UaQnWC8rZeLUlMo2nRsFPl7jNSSga9jlcddbyXEg5a9nxa+L?=
 =?iso-8859-1?Q?MPivJrLV7SWXvWwCdUKkZTg63TFSPqMCk95pWryvx+ec1FKaNsEnQdxDhV?=
 =?iso-8859-1?Q?OXjs/7jz+kapTZAJbQQOpe80F8uhIWT9m1pn9BgPTArbEB/juJExDRrv8+?=
 =?iso-8859-1?Q?oZk8C4VtmB4DIwpcVN31GcncyTa12rdidzskirK7/pPs9G0MyHX9OHvpl8?=
 =?iso-8859-1?Q?JeU93VcFs3HAfzBosWZWq63/rLBBHHzyMmhibBEhJoGAw4OMJ8CGkbA+B7?=
 =?iso-8859-1?Q?ZU0BzbXekpMjHyCYgG7v13VarODB2dCroIm+4DGw6auii+Mfd6L6sjzPbD?=
 =?iso-8859-1?Q?7sxHMoLWNi2CLQqFG6uKoauk/460bgLaimTkWCDMxAGZhXVLI4aqi5esGr?=
 =?iso-8859-1?Q?PEMtQo7K5SvFj9ju3g3NUKnCH9VajS7u/6uBZ9ucsJssy49/qAJ8ewCTBb?=
 =?iso-8859-1?Q?If+KAKz4L29q42NBBrGreLzsHsnc6AmpxpgXjukgtDyd7FXTqvPlZXn38E?=
 =?iso-8859-1?Q?vYGz5n0FJqR8fAO2eRWiMyxO+fXQBOY8SCOCXDx/grze4dXXIezwOYYQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7c48f1-1e0b-4feb-732a-08dbfcdc8f5d
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 19:40:43.3964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvkSupP9FUQAk1N1jcS4d5PDKLlRs/+fBSuyv7grrh+B0sjZGznXDD4JLC06F+L5p+Q2qMKInT6cuhX8zBtABR+LOheBfJZnK+Y7AzVBCE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 14, 2023 at 10:45:59AM -0600, Lucas De Marchi wrote:
> On Thu, Dec 07, 2023 at 01:50:04PM +0000, Francois Dugast wrote:
> > From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > No functional change in this patch.
> > 
> > Let's ensure all of our structs are documented and with a certain
> > standard. Also, let's have an overview and list of IOCTLs as the
> > very beginning of the generated HTML doc.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> > include/uapi/drm/xe_drm.h | 48 +++++++++++++++++++++++++++++++++------
> > 1 file changed, 41 insertions(+), 7 deletions(-)
> > 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index b36f3bd53611..55cb22b2c7e2 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -25,6 +25,28 @@ extern "C" {
> >  *   6. PMU
> >  */
> > 
> > +/**
> > + * DOC: Xe uAPI Overview
> 
> not sure about the lowercase u. Isn't that used when it refers to µ, like in
> uC (microcontroller)?

uAPI seems used this way in DRM (though not everywhere), see Documentation/gpu/driver-uapi.rst.

> 
> > + *
> > + * This section aims to describe the Xe's IOCTL entries, its structs, and other
> > + * Xe related uAPI such as uevents and PMU (Platform Monitoring Unit) related
> > + * entries and usage.
> > + *
> > + * List of supported IOCTLs:
> > + *  - &DRM_IOCTL_XE_DEVICE_QUERY
> > + *  - &DRM_IOCTL_XE_GEM_CREATE
> > + *  - &DRM_IOCTL_XE_GEM_MMAP_OFFSET
> > + *  - &DRM_IOCTL_XE_VM_CREATE
> > + *  - &DRM_IOCTL_XE_VM_DESTROY
> > + *  - &DRM_IOCTL_XE_VM_BIND
> > + *  - &DRM_IOCTL_XE_EXEC
> > + *  - &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
> > + *  - &DRM_IOCTL_XE_EXEC_QUEUE_DESTROY
> > + *  - &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
> > + *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
> > + *
> 
> stray newline
> 
> > + */
> > +
> > /*
> >  * xe specific ioctls.
> >  *
> > @@ -59,7 +81,10 @@ extern "C" {
> > #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> > 
> > /**
> > - * struct xe_user_extension - Base class for defining a chain of extensions
> > + * DOC: Xe IOCT Extensions
> 
> IOCTL
> 
> > + *
> > + * Before detailing the IOCTLs and its structs, it is important to highlight
> > + * that every IOCTL in Xe is extensible.
> >  *
> >  * Many interfaces need to grow over time. In most cases we can simply
> >  * extend the struct and have userspace pass in more data. Another option,
> > @@ -93,7 +118,10 @@ extern "C" {
> >  * Typically the struct xe_user_extension would be embedded in some uAPI
> 
> 			  ^ to be renamed to drm_xe_...
> 
> >  * struct, and in this case we would feed it the head of the chain(i.e ext1),
> >  * which would then apply all of the above extensions.
> > - *
> > +*/
> > +
> > +/**
> > + * struct xe_user_extension - Base class for defining a chain of extensions
> >  */
> > struct xe_user_extension {
> > 	/**
> > @@ -123,7 +151,10 @@ struct xe_user_extension {
> > };
> > 
> > /**
> > - * struct drm_xe_ext_set_property - XE set property extension
> > + * struct drm_xe_ext_set_property - Generic set property extension
> > + *
> > + * A generic struct that could allow any of the Xe's IOCTL to be extended
> 
> IMO looks better in the present tense: s/that could allow/that allows/
> 
> 
> other than these nits,
> 
> 
> 	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

I will fix them, thanks.

Francois

> 
> thanks
> Lucas De Marchi
> 
> > + * with a set_property operation.
> >  */
> > struct drm_xe_ext_set_property {
> > 	/** @base: base user extension */
> > @@ -294,7 +325,7 @@ struct drm_xe_mem_region {
> > 	 * here will always be zero).
> > 	 */
> > 	__u64 cpu_visible_used;
> > -	/** @reserved: MBZ */
> > +	/** @reserved: Reserved */
> > 	__u64 reserved[6];
> > };
> > 
> > @@ -1051,8 +1082,8 @@ struct drm_xe_sync {
> > 		__u32 handle;
> > 
> > 		/**
> > -		 * @addr: Address of user fence. When sync passed in via exec
> > -		 * IOCTL this a GPU address in the VM. When sync passed in via
> > +		 * @addr: Address of user fence. When sync is passed in via exec
> > +		 * IOCTL this is a GPU address in the VM. When sync passed in via
> > 		 * VM bind IOCTL this is a user pointer. In either case, it is
> > 		 * the users responsibility that this address is present and
> > 		 * mapped when the user fence is signalled. Must be qword
> > @@ -1061,7 +1092,10 @@ struct drm_xe_sync {
> > 		__u64 addr;
> > 	};
> > 
> > -	/** @timeline_value: Timeline point of the sync object */
> > +	/**
> > +	 * @timeline_value: Input for the timeline sync object. Needs to be
> > +	 * different than 0 when used with %DRM_XE_SYNC_FLAG_TIMELINE_SYNCOBJ.
> > +	 */
> > 	__u64 timeline_value;
> > 
> > 	/** @reserved: Reserved */
> > -- 
> > 2.34.1
> > 
