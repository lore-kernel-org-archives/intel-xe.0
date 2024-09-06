Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B65CE7B0C
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 16:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084D910E901;
	Fri,  6 Sep 2024 16:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lrKhDjkC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB06810E8DE
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Sep 2024 16:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725639512; x=1757175512;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nzVr9D9IlN8KF02BodNM1AN5cQKr5ZYoGZ2XlRS5+Sc=;
 b=lrKhDjkC7dW8BAhTXKlKh5r0Jt13NBRPn49xE52bCzz6LhgXKnIjpU1u
 oyQaWgcx5nLGK4oSbnEwuVjd934e/Qy7QMy596/iMcQP6X32RmI0rDv9+
 hK1VTr+kSwP/3V/nkClJ4AxnRIfokC60eE4geqJm/50fKrs93nhsYh024
 NciGDGsEVFCdIugaUwk7l7M60ux41asDJ1NvK3ipngSAXhkaeqX5D+gxA
 WdLk+rmeZHbUwKOpXQw4kHre02vsCNfQtR5HZKPogX/vmC60/NzjftAfJ
 9Z2zuhDmVEgsfnlIpXG9PwbE6/fmKXHP0JFK2+gUEMs/zp2ksOffbV/Vu A==;
X-CSE-ConnectionGUID: uCohHuqzSzOSGY8ZWQd4WA==
X-CSE-MsgGUID: amEys4XMRC2wCqdOURmGUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="35549086"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="35549086"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 09:18:31 -0700
X-CSE-ConnectionGUID: GCjeUjYkSkq9y06fYXhirw==
X-CSE-MsgGUID: AUESUuznTeGN5wLwD9qpEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="66744443"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 09:18:31 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 09:18:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 09:18:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 09:18:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AB2FTHi2kSyoxNGY25vO+VmDrMhvXWkco6DLUka0peqAnDkKRe8acsc3w1T/pRoweLIzdHIOuwg66Nz2NBQOQW/HuJao3Y+cHvcFl7gTqMneXnWdpwS7/hJ3h4w34dEy/M+3JMkGdj+PwWPySN7smItlivFRim8jy5hc6VDntqbKhAf4KFbdTVRyVPN8CUCbER+n70TZ+9NRnCBoozzhzorURTk5gQP6cqsDK/3UYNmUfprvv6usFXQb660gwu1uLlWhQEP2KDjS49i56vWhJTF4j+7Is1RWb8PT5/Ecmx6yiEPHzYfF+uLdo/Uy9rtQys6LFzct2/jR8vgywci4sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkjCZKcsucTd/RkPajfC4hsmuRTJdtO4jEI5dpPfkXw=;
 b=Z3XnBmZpHVrT54GT4NGxE6Ttwqm4Nxi4ju3P/oRCurzXbspSAw1CwBrxfiqR+F30n9IrmZw8/vbr36NFS1orTSCzdSX1cvsRJAwkmBkeeD4hkHfUy63OXccvzNrha5z0pjJh+KFMxZx4tTN8I3sEMpg5auYC4PpxpjrFBVLoLV7x20JXXFnqL3quhRfDjf+q8fmkroC3Kvi2T51PIvauroPsQLWiBOHJg4IFPBjr0ci/49o/qLl7xqDiDpoWDl7tayzS783GMvC/rMsuDxIB8lDz9H9YL9lGO4IdnBH5NuyNcHts2iYTRJmS8JsXnO0o79kb8Sm7oHdaC1iXXfPXAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB5198.namprd11.prod.outlook.com (2603:10b6:a03:2ad::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 16:18:27 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 16:18:26 +0000
Date: Fri, 6 Sep 2024 12:18:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [RFC 1/9] drm/xe: Error handling in xe_force_wake_get()
Message-ID: <ZtsrTvFHbMuNvXvk@intel.com>
References: <20240830052326.3707019-1-himal.prasad.ghimiray@intel.com>
 <20240830052326.3707019-2-himal.prasad.ghimiray@intel.com>
 <ZtoGpjVmZbwLsD1s@intel.com>
 <82a78b3a-14e6-472a-8e45-2cb4af2ff3a2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <82a78b3a-14e6-472a-8e45-2cb4af2ff3a2@intel.com>
X-ClientProxiedBy: MW2PR16CA0004.namprd16.prod.outlook.com (2603:10b6:907::17)
 To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB5198:EE_
X-MS-Office365-Filtering-Correlation-Id: ac617292-4447-4d6e-408d-08dcce8f899c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TcS1314eQaW6gcBwuS1k0fujM63zuJ90YDzBmkxoEx31YASTh6KRQ+exD8Uv?=
 =?us-ascii?Q?b0qWGNwETi8OsX9eeE/jzJqeZ90jd5AmGdIFRnXaH3eT4WlIubfeJR5Izdxd?=
 =?us-ascii?Q?1vs7WdbK+Uu4okSpXB1a96aV7nnIEp4x0IZvExlQnIAea0RhRcB+3XcLQy3D?=
 =?us-ascii?Q?Grqj0dpALK1GcnNIHztPgG1RRrUFz1KnZ+kHlC/AC6DwHsR1pzwSnOs+9qhV?=
 =?us-ascii?Q?G57++7RmLzSqoEfmH/tgqe5dNE7u4YfwX9SyvXowqI5AMKBdQda/cwl+m2iA?=
 =?us-ascii?Q?L1I2a8EWb0Q1PoaOV9zaSdLU1f5P2wnjQVHGFLhZpTBL+SQyy/Mc3u6pBdWV?=
 =?us-ascii?Q?U/pT6BqdMalgzl4V6F/wo2lQ8Y9Zu3T+ZME1XranH5uldIsjRc2Dpqdt3RBm?=
 =?us-ascii?Q?VuLv/mNRcpNg7/dZpusxyESexplxFCjj8DE9K0rff8tDOVp9El969LqMa6jU?=
 =?us-ascii?Q?/Jp4STKct1ugJydxq713/CyLn6aLgi09wbCT7O9Qw/xnKr/RVRIoS6i9kCgG?=
 =?us-ascii?Q?SV181qF01E71En/hYezoMFmQbRUts8xRvAR+oV92ywh2l5FbHTebzVX9q9ZI?=
 =?us-ascii?Q?hj6naZj9N7K1PMfPv5fkeHYEOw/KS3KFCc0XeewwL77FebWGc2yzVp8t3JJ+?=
 =?us-ascii?Q?lOxQOw6Qt0TITP55ha97L4e7HDyXBnJu2I97fYet9N8CRmaJlgXintD+Wl8t?=
 =?us-ascii?Q?IIf5HhwLEwIMx98kuphyOSGf3lhhw32WAnmYWSJjxNsyr/fFS+bwlLdxh70B?=
 =?us-ascii?Q?EKxFURD+oLasmY9/jY3vZyleO4Rn66PCwrBGr7LRNQD5mCn40nLHoELFUBil?=
 =?us-ascii?Q?45xHdExA2j4+rRfNCLHbzVOElv6DFHhDFEXVNi7j8QLORmxIlMZ/+S7659x7?=
 =?us-ascii?Q?QTeSMI6wHqj1kF63dy6Vz//xx+q89bE1DJv9ieXP8YeMlFJtaAPzVjqt9V8I?=
 =?us-ascii?Q?sn5goK1fKCXHDp/mFFkPCZmgQ0OKk9EYGR4rAplGCkY909zhlYpkl60CfKb6?=
 =?us-ascii?Q?eK5S3EIHqbRITE6tvcYEPYnNl9ytRQHTVsEwsQ6Www1vKPcWFQK5v4epPZ9L?=
 =?us-ascii?Q?C9M5bGuVv2EXMLGhe6wrVUdIe/uY9JQ1dztJrRFj55pWoUHkcZ3bKbkaSiLS?=
 =?us-ascii?Q?T4mV6XoRlvMNcCBaLC+14Nm6KPV8R97l5RqrWE6r8tKppf5BHC/Pe1uRh6UZ?=
 =?us-ascii?Q?/cw5JaIAuOHzztub0n3VGPoxf23/wilYWJoOoBqIjYKhJ5IEJGT3X1doglDW?=
 =?us-ascii?Q?XS8gd344VnsfF5oaqBFmbYOL6u/0Z4jwW4PZkWOqXJmfqE1/GFtVzUdDVdfY?=
 =?us-ascii?Q?aycAGA+67kICOJdsJ332Zo4jJ4EebAtDuFOmbrK0odfCfQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zW4jCt7AQYprXPSQ6zAVga/BwFGEGwthPH3JSEytj+LWRh05sjNmEjGe3Xtz?=
 =?us-ascii?Q?iYRKDywKYSiwD62CMz36d2tn1R06pteszd+Lxyl7cJm/lQ5BIfE99C6Ajzf+?=
 =?us-ascii?Q?a76bABXw3yC5YyaPZruzrfhpJUE/S3O7JZmV9rR1vtW9kQ54uFXjMq1omqRd?=
 =?us-ascii?Q?45R7S4tBEYA+p6BhxKZ0iLD6LjK3zg1ZMn1vO+4R/LzBeeYrFPjoVtrnUPz/?=
 =?us-ascii?Q?au+h26HHDE4s8/pB6AVCsXlXmWUcW7HLaFHuChSj//WfklD3LCa9ow4Kc2KD?=
 =?us-ascii?Q?DK5ZgMxrW7/8+phYJHttnCed6w2bdKuEThCjiuiLRD8kfegB7MvaToZVlcbV?=
 =?us-ascii?Q?nMLqxFYPE1/E+Ble9BxteH/Xzfq/gq+ZH0qBN37iIKUFbEdzgukWztzTjj1l?=
 =?us-ascii?Q?/tUiuuYJZtTOaPgeuecadez7LRLf104HUgwtrJM2NF8eibu7QwIwx1v8JKGV?=
 =?us-ascii?Q?5IOmRsKdbIeiyIjtjdMjIAxpKfOgaSktRVrK+zNSGArZTye73HR4x78LdWwc?=
 =?us-ascii?Q?+ycDtO2WXYLZ8uUbP4lrbxfUEV5HMIbxTMyCtVdkyXpMjdDUc5erROBJVEjg?=
 =?us-ascii?Q?lL/XOstz+qaxf3FurI4D68hv88FnjAaNKDpi8pgNl88uCrMyq3V0wEbtE0Ny?=
 =?us-ascii?Q?/g92hx0swPwsWdWxf56gpsjEyMa96QNEUHwmh/Gbj3giZ4GrkibPQx68BINu?=
 =?us-ascii?Q?NK91EL9b2GH6ZWH+pihyNoqkhsCiVt3QJPo+j66BqHCn4snjJpGtMHxM8vr/?=
 =?us-ascii?Q?ft85xyvmIeY4nCxo4MXHTzCdq+T289W7Z+q0WbRXnDTcXLwaJBlks3+SfF8h?=
 =?us-ascii?Q?PLZ36lGTMAQVvmw/ONkO9ItANuDaJ6e23sYxVMbrfMy5Fq8NWf9mr1cdE/La?=
 =?us-ascii?Q?k7ab/sfh7+0ZfMAX7Zj/RY0iFsckVtdAJ5rTAfXzjPCPvcmNO8aelcrmZvRT?=
 =?us-ascii?Q?YxzIynEeHfH0Wp0Sm++qUXr4IarSleeahCJPj1szEmU5Ca255GL1R8AcsguJ?=
 =?us-ascii?Q?6z5YRA5KZsxrhbTyzVfe31VmW1HHaDXsQ0vwWHc8ygp4sMH4IsO9nLhACYNZ?=
 =?us-ascii?Q?uM2Z8GmNHTTYF9RA2sTl+Nh0vBud4/RxzlikhimJUTe1X5A5dbe+D8i0UQfa?=
 =?us-ascii?Q?lwgNbLzo/2OOaSSCy+Ysz677Yb3MVeJc0RcvWSzgrgFCXPE39XaugabjIj74?=
 =?us-ascii?Q?8VNugfSUS6fnMlzhzYiWqkRIMds9QUpM9I9D6JUZ7O942uNnPwVwqWRn+oEk?=
 =?us-ascii?Q?ok1fgkntBsU+Us5AYFfTHU4lmLfmJB9/CYeaL7q/4o2nLGag1DTd7JPabO+/?=
 =?us-ascii?Q?26QaHolH85PJZNWk2Yb7krEaxbWrLoB5tzpKvdQhmv1kQR6c+5v+NDY70mip?=
 =?us-ascii?Q?EaWezFYjf/eICh7rLQvUR8TFY2gbRonMg7w5FqQP7iiTK86fKdLlXS54F1ph?=
 =?us-ascii?Q?MdTpSV+KDJah3w93UuHiZIN7PiMG7zsFZ0vEP9zT1xZSmhmZf1B7dGxa2ep6?=
 =?us-ascii?Q?EKe8MN9lvo3BNBurv/MlQH9SmQNFux4gK2Kwklv/p/PL0od1oRGrnFh5oemp?=
 =?us-ascii?Q?/QMQq94MfI/cSK8dTC9pxB6AQ6kcrTqANXCYmip0L54lIXHIKPz/iWNsGz7k?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac617292-4447-4d6e-408d-08dcce8f899c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 16:18:26.7039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVl4ghlySQ9NnzGgrTlA6fB0+x+4ZrC4WcofMQZCExoLigUvz88A200r/iam0Ds41/qCcAZAblcxANO8bsS+dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5198
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

On Fri, Sep 06, 2024 at 01:32:38AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 06-09-2024 00:59, Rodrigo Vivi wrote:
> > On Fri, Aug 30, 2024 at 10:53:18AM +0530, Himal Prasad Ghimiray wrote:
> > > If an acknowledgment timeout occurs for a domain awake request, put to
> > > sleep all domains awakened by the caller and decrease the reference
> > > count for all requested domains. This prevents xe_force_wake_get() from
> > > leaving an unhandled reference count in case of failure.
> > > While at it, add simple kernel-doc for xe_force_wake_get() and
> > > xe_force_wake_put() functions.
> > > 
> > > Cc: Badal Nilawar <badal.nilawar@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Nirmoy Das <nirmoy.das@intel.com>
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_force_wake.c | 52 +++++++++++++++++++++++++++---
> > >   1 file changed, 47 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> > > index b263fff15273..8aa8d9b41052 100644
> > > --- a/drivers/gpu/drm/xe/xe_force_wake.c
> > > +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> > > @@ -150,31 +150,73 @@ static int domain_sleep_wait(struct xe_gt *gt,
> > >   					 (ffs(tmp__) - 1))) && \
> > >   					 domain__->reg_ctl.addr)
> > > +/**
> > > + * xe_force_wake_get : Increase the domain refcount; if it was 0 initially, wake the domain
> > > + * @fw: struct xe_force_wake
> > > + * @domains: forcewake domains to get refcount on
> > > + *
> > > + * Increment refcount for the force-wake domain. If the domain is
> > > + * asleep, awaken it and wait for acknowledgment within the specified
> > > + * timeout. If a timeout occurs, decrement the refcount and put the
> > > + * caller awaken domains to sleep.
> > > + *
> > > + * Return: 0 on success or 1 on ack timeout from domains.
> > 
> > * Returns 0 for success, negative error code otherwise.
> 
> Hi Rodrigo,
> 
> Sure. Will fix in next version.
> 
> > 
> > > + */
> > >   int xe_force_wake_get(struct xe_force_wake *fw,
> > >   		      enum xe_force_wake_domains domains)
> > >   {
> > >   	struct xe_gt *gt = fw->gt;
> > >   	struct xe_force_wake_domain *domain;
> > > -	enum xe_force_wake_domains tmp, woken = 0;
> > > +	enum xe_force_wake_domains tmp, awake_rqst = 0, awake_ack = 0;
> > >   	unsigned long flags;
> > >   	int ret = 0;
> > >   	spin_lock_irqsave(&fw->lock, flags);
> > >   	for_each_fw_domain_masked(domain, domains, fw, tmp) {
> > >   		if (!domain->ref++) {
> > > -			woken |= BIT(domain->id);
> > > +			awake_rqst |= BIT(domain->id);
> > >   			domain_wake(gt, domain);
> > >   		}
> > >   	}
> > > -	for_each_fw_domain_masked(domain, woken, fw, tmp) {
> > > -		ret |= domain_wake_wait(gt, domain);
> > 
> > now you suppress the mmio error code...
> > should be better to find a way to propagate that.
> 
> 
> AFAIU the only possible error code from domain_wake_wait is -ETIMEDOUT, was
> planning to assign same to ret below, which I missed in the RFC.
> 
> 
> > 
> > > +	for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
> > > +		if (domain_wake_wait(gt, domain) == 0)
> > > +			awake_ack |= BIT(domain->id);
> > > +	}
> > > +
> > > +	ret = (awake_ack == awake_rqst) ? 0 : 1;
> > 
> > s/1/-EIO/ ?
> 
> How about -ETIMEDOUT ? Since this is same error which will be propogated in
> case of domain_wake_wait failure ?

hmm, I guess it makes more sense indeed.

> 
> > 
> > > +
> > > +	/*
> > > +	 * If @domains is XE_FORCEWAKE_ALL and an acknowledgment times out
> > > +	 * for any domain, decrease the reference count and put the awake
> > > +	 * domains to sleep. For individual domains, just decrement the
> > > +	 * reference count.
> > > +	 */
> > > +	if (ret) {
> > > +		for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
> > > +			if (!--domain->ref && (awake_ack & BIT(domain->id)))
> > > +				domain_sleep(gt, domain);
> > 
> > wonder if it would help to extract this in a separate function to be
> > used here and in the -put function.
> 
> Let me think around that.
> 
> > 
> > But more then that, I have a question here...
> > Do we really need to sleep other domains if we are not getting ack from certain domain?
> > Doesn't it generally means that we are busted anyway?
> 
> I have no strong opinion on this, main thing is refcount shouldn't be
> incremented.
> 
> > 
> > But also, if we really need to sleep, then perhaps shouldn't we also
> > call the sleep function even from the guys who didn't ack? perhaps the ack
> > timedout, but it really woke-up? how sure we are that this is not possible?
> 
> I didn't want to change the hw state by calling sleep for the "ack failed"
> domain, so if necessary, Debug tools (PythonSV) can help us pinpoint the
> exact failure state of the HW registers.
> 
> 
> > 
> > > +		}
> > > +		awake_ack = 0;
> > >   	}
> > > -	fw->awake_domains |= woken;
> > > +
> > > +	fw->awake_domains |= awake_ack;
> > >   	spin_unlock_irqrestore(&fw->lock, flags);
> > >   	return ret;
> > >   }
> > > +/**
> > > + * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
> > > + * @fw: Pointer to the force wake structure
> > > + * @domains: forcewake domains to put reference
> > > + *
> > > + * This function reduces the reference counts for specified domains. If
> > > + * refcount for any of the specified domain reaches 0, it puts the domain to sleep
> > > + * and waits for acknowledgment for domain to sleep within specified timeout.
> > > + * Ensure this function is called only in case of successful xe_force_wake_get().
> > > + *
> > > + * Returns 0 in case of success or non-zero in case of timeout of ack
> > > + */
> > >   int xe_force_wake_put(struct xe_force_wake *fw,
> > >   		      enum xe_force_wake_domains domains)
> > >   {
> > > -- 
> > > 2.34.1
> > > 
