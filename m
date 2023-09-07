Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77759EC875B
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 21:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9BC10E3D7;
	Thu,  7 Sep 2023 21:46:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8A010E3D7
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Sep 2023 21:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694123162; x=1725659162;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PLyrE0fBZx6JzR3KEkCokWndSRtdX5PO+4x2ZDGKx78=;
 b=LT7GAHjTvXTIPfANm2mzMAADTrpjCT1qbU0DqAK0wDwm2lp3rrJn9h6P
 7n7tB0BZrfybXlUbZ3b8bbN2oxgQnWLk8rAWsClF0zq7wC3nFvh2OJ+4q
 bS/5WA7XCoCYubVRepp8EyYGP+4ZT0JdRF938nubG5E52SivNR/pOWpSs
 NRdi6TZRDfG/XiCya+YoIlWJZHsIW2Xv+bHYl9nZubAq9kd/hClcyiv0h
 gv7M7agGFDnPJxbyK62DjIUOUy6M68gzR0GlTsOFjb9lKmGBCS/zjIzbg
 okOD+BmTeOpD0NBKRzbgJdD/BgUj7R+7+PQkDVzqDQxaMnuFXzGZtqYKL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="376395992"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="376395992"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 14:46:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="915888149"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="915888149"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Sep 2023 14:46:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 14:46:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 7 Sep 2023 14:46:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 7 Sep 2023 14:46:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 7 Sep 2023 14:46:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPRPaGP0VibKQ6VL/Iz82vjYvMHQDhzG66J1BUZdAwB5XklLXGyjghxlkgUYHjaSbf6igvKNCW/QLpfuQWlaHVk1PwxmiZWmPIVzZLbXHBYJXnHiMinyE7YWyvGowo2a0SoXKCYggG+hvDSx6pD8jhCS/JhIfB/Yr/6E3KF39EQg4ganinioigc8FH2fxGK+Op+eAX8hcLmhG8dC3mmYzS4CaW7mUjfBNgOm0jiKS12NBmzd6I6liMvpN9G565MFnktC/KZxINrDUXp2PAJZO5U5g8pHdttvEzSW6B2iftKOksXrYTe67ERt2ud0SsvGZcum7JKIPbsn+yab542tQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRt4e9pRqLSOiEi4OL+ZP+yplkNmOIo/xnhA5u9s/ig=;
 b=hDlW3x94AfZtaRIdN2Cpyv78iuI3+5cWapOnjBDpi4xE0FRehEg/2kgW4TjgsfjAPDqXBpJOfxltCg5YD7htd+U8Dxn0qKh776Z1DwjE26X8+tjNU4cBz+whF22/WckkEEn9XPqIBmXVew1yaONnpE1Fr+4oMhk91/UHDfKrijKQBTugJ4jBvWL+Ug1Js1vi3Kf0e150hMK3hGJUDxRTFBW68ZKRfAV2Jmt6K9Z+hZrC0p6WvVZmG8SVn60QlNiAkpXs2TR8EnCwtSc2e5mnCM4+YEDt9LBAx55aHaSTtnO0K+ze9YYOPwKAAIjmKAytZJ3sZjnHGnONN0dkZ6CYXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5267.namprd11.prod.outlook.com (2603:10b6:610:e2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Thu, 7 Sep
 2023 21:45:59 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Thu, 7 Sep 2023
 21:45:58 +0000
Date: Thu, 7 Sep 2023 17:45:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Message-ID: <ZPpEkR47cLTO9NH0@intel.com>
References: <20230904123605.3255946-1-mika.kuoppala@linux.intel.com>
 <20230904144644.3259148-1-mika.kuoppala@linux.intel.com>
 <ZPi0gnYZlMk6mD2d@intel.com> <87zg1yay7a.fsf@mkuoppal-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87zg1yay7a.fsf@mkuoppal-desk>
X-ClientProxiedBy: MW4PR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:303:16d::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5267:EE_
X-MS-Office365-Filtering-Correlation-Id: 0221cb00-013e-40d5-04bb-08dbafebd28a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wi8lwrkL0jl/SR8cXaZrho82zuRe1gpZ8xyLo3+RXbsiEykDO5logZnqm7c6eI9sIGYNh844daYv1jlxhK5S7FiR2AE7/F/h9XhnCUewZGJwVo43pazSrhFTTE+zd9uDPIa3xt31UTM/KPxy6yiR+VfPd21J++p89jSFLgwDh3ztcaBHtGhS0/12M7isFST2n7oqVMDG5SDc7Kj4DSkW8KWNK4/WIK/6+ayNZEUBW+nKApUyWqSMmU7PdAx2FLKtc8x9vxQgx/AK7/RZed84sIEuqqjZWgmrlZoTckJAXlj+nDDncwhECyvbrRsS8UbtH6Pl6n+Lxexd6Tfx6TnO31NJWkSKg9qkvWIrS9oty6yteMoSpSl5KSxg3nLhGG/Y1dfeSRp8Jhub/x7yNMqoPpYqo+W6/zwhG0AocpSDokgjYcAJ/CHzqyK0PRq/s3wW76fZ5TEeyY/F7K/ZLN8OxS6S8s9vzOj1LNpLSwVtVL4WnE/JpS/SXFV5g9IeI4Qxa2ERtUeeCiodZMqp2/m4xZCCoo2caVarnrWOL9iPalspyxtaFQWO9/EZLwIjpDfb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(396003)(376002)(136003)(346002)(186009)(451199024)(1800799009)(6486002)(6506007)(6666004)(6512007)(478600001)(2616005)(26005)(66946007)(2906002)(41300700001)(66476007)(316002)(44832011)(6916009)(66556008)(5660300002)(54906003)(4326008)(8936002)(8676002)(82960400001)(36756003)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rd1Mp74ZnLfkq8dyjL3n5/7I8Q3+wWgyjKSdACyeMsHPL20H/fJYRAStw4kg?=
 =?us-ascii?Q?qxZmf87wGOeHJl0TpBDtJZUDeG3/HsJkZKSQ+YBr4l36sNqQTlibJo2ngmdX?=
 =?us-ascii?Q?GTZ046Df89hxBlpPfQ0w0l+zx3MYlHsN86r+3Ov/qDqNK9RYVoIm4VUt52FV?=
 =?us-ascii?Q?HfrCKtcGUFaW9GEVMqiz3kQZBTyJ4I6V3dGEmASC7V/mQ5HIWd1GtHBHF5gB?=
 =?us-ascii?Q?8oDXAIC/W2gRMu40DTRQQMQG6Ma2jFgdRD6EN9delMtXR89NPUFdX/opRHQm?=
 =?us-ascii?Q?mr1mx7/ZUEaLeeNZSkD4A3UDLn+6i1hg/ynJguQ8Mg4f/9lUjyZ6NHqppFWb?=
 =?us-ascii?Q?VQKZ7uKpBha7+nk/m+VKJyXBhfDUdgpKutpGJbKIcRMYFh2KUnICiusBMArT?=
 =?us-ascii?Q?SW58yw8VgQx8jK709yqzbgvM/ujbV5gBpZ4ryOSRrw8CEKU68yhBd6YNQpS3?=
 =?us-ascii?Q?NkAEYIQiwx4GO8f8abT9ebuvqXN9vKfox2Z8n5OEtX91O1FhFK87yjaUdx9B?=
 =?us-ascii?Q?Q0DOCVRe5+KkKFgsr4UwDYgRnlUR4RIvIE7pzAR2aiNPgrUM3+PlyDc30T1z?=
 =?us-ascii?Q?vk8ZPi+8grSmApBYcnERNajzlzXQ2DsrN92xWH5hZTJmKDElVdmaXtbEdth3?=
 =?us-ascii?Q?u23Y/+xmgFahOnHzOB1L+WTctWNWlIdQ1fZKz+0zjGcc91NeCMAUitGm3dpm?=
 =?us-ascii?Q?w6Ctm5olzXJIRPMqskg2Q2mEx3SFXrJ9UBl5eGL1gZQI1sZ5x/YCFy45E2TT?=
 =?us-ascii?Q?TEuU5RXm8SvcF3WGDuzmrWxPBt4bpo5Ke7lVFYyq7Nqn9IMEu3Ck+OLcb7NM?=
 =?us-ascii?Q?2sU3ciW4ncDFa0XO2F5aHtKUPkXp3EvKSTPU1CRNnmTiyHpZn5P8N6u+a2+9?=
 =?us-ascii?Q?lwAcwuE7jb+MbwCaTrhxhfp8Yylm29LSXByY7AP8Ilg+FLuxUzjfEZsOocnJ?=
 =?us-ascii?Q?acLmREeMrTDseWNf3T5bte7SOw71E4LmfmFFZ6vezZVeeYxGhnrw513RqVoj?=
 =?us-ascii?Q?Ti1pkBb7vSSEE49GUDjoohC2Yp8ofwdEkD0pe+jXk1S6z7uGvmeyVgckjzSp?=
 =?us-ascii?Q?erqxeraVJWhcbIO4nZNQVWUEz/cnPaIH43RdJQlLCFPYBVg/cT0jw1yS9kEo?=
 =?us-ascii?Q?d5gCennpkL1py4heJxVP5X6BFnRDoD+gquvv38EHMazPuS4oqxA2wRfA4TMv?=
 =?us-ascii?Q?pl37D6GaVssFPbNVPALMGmi90hCbTDlVGTvoYQP169TBeyypenagcfoDkazP?=
 =?us-ascii?Q?EJxqgt7i0egO5FAwASl3xHHDnxhibhkyBp6eGRKHsBwgCs+ttV/qjrhe67bv?=
 =?us-ascii?Q?Snw5tyH0Oj595Vx4oCrTZ2y4JCxshEQ6GQM1yL3Va1b24roh0jDxs8ZMi+ci?=
 =?us-ascii?Q?kEJCDqryIl3jA5gpFD9h9lK8r4KvfwWXAAFMkc7YQ4a0IToFy45gZgbmvzOF?=
 =?us-ascii?Q?tmEz/vlnBZCjr1NHUjj9jjRrFubnLwKmDoaIB0opyw7jFOJ3pZ4RaYadinj0?=
 =?us-ascii?Q?ljopyqW9JRkdGZFoSktvzZC5VwhCusEDvdJw2teCYb119Qn9tXfSIfH955HX?=
 =?us-ascii?Q?Lb4dbJ1RuWpR0EtYcx27tPz9WFEiXB0io6Mbl8llFQbJL+/z95/SUml+7IKi?=
 =?us-ascii?Q?7Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0221cb00-013e-40d5-04bb-08dbafebd28a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 21:45:58.9645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ih2sZjsilTXuxFYhvISGWJG0qrR32ldVDjbofGySxt2qx8wqqoj7kKLFKyD3PzbBUv+KIzRx6O8HQsEmPshe9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5267
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Extend drm_xe_vm_bind_op
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 07, 2023 at 04:51:21PM +0300, Mika Kuoppala wrote:
> Rodrigo Vivi <rodrigo.vivi@intel.com> writes:
> 
> > On Mon, Sep 04, 2023 at 05:46:44PM +0300, Mika Kuoppala wrote:
> >> The bind api is extensible but for a single bind op, there
> >> is not a mechanism to extend. Add extensions field to
> >> struct drm_xe_vm_bind_op.
> >
> > But why would you want to extend the operation?
> > Except for the destroy ones, every ioctl itself is extensible.
> >
> > So, DRM_IOCTL_XE_VM_BIND is extensible. Why would we need to get
> > prepared to extend the operations themselves? And if we extend
> > the operation, what to do with the extension at the ioctl level?
> > which one has precedence? how to organize that?
> >
> 
> The intent is to pass debugger metadata as part of particular
> vm bind operation. For example on MAP, we could associate
> ELF/ISA (relevant parts) as metadata for this bind range.
> 
> So in vector of binds, we want to tag specific one map (in between)
> with debugger metadata.
> 
> With extending the XE_VM_BIND itself, this could be possible too
> but would then need to deliver index into the vector instead
> of carrying the metadata as part of per operation.
> As atleast in this example, the extension is heavily tied
> into particular OP (map).
> 
> I take that you mean precedence of VM_BIND vs bind op?
> Excellent question and I dont know all the use cases the
> vm_bind have to cater. So I can only refer to example above,
> VM_BIND extensions would be only in scope to all operations
> and vm_bind_op extensions would be tightly coupled to per
> operation only.

So, maybe we should do the same union that we do with the
ops themselves and make the extension also an array of num_binds ?

> 
> Thanks for feedback!
> -Mika
> 
> >> 
> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> Cc: Matthew Brost <matthew.brost@intel.com>
> >> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> Cc: Francois Dugast <francois.dugast@intel.com>
> >> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> >> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> >> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> >> ---
> >>  include/uapi/drm/xe_drm.h | 3 +++
> >>  1 file changed, 3 insertions(+)
> >> 
> >> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> >> index 86f16d50e9cc..5c6c86f5e5fc 100644
> >> --- a/include/uapi/drm/xe_drm.h
> >> +++ b/include/uapi/drm/xe_drm.h
> >> @@ -552,6 +552,9 @@ struct drm_xe_vm_destroy {
> >>  };
> >>  
> >>  struct drm_xe_vm_bind_op {
> >> +	/** @extensions: Pointer to the first extension struct, if any */
> >> +	__u64 extensions;
> >> +
> >>  	/**
> >>  	 * @obj: GEM object to operate on, MBZ for MAP_USERPTR, MBZ for UNMAP
> >>  	 */
> >> -- 
> >> 2.34.1
> >> 
