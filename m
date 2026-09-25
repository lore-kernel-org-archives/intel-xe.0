Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CDEC98325
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 16:10:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE59310E2E6;
	Fri, 25 Sep 2026 16:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1aST8se";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869A010E2E6
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 16:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790352652; x=1821888652;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DMDoyRFc+a9Yx2CC6TrOHGCdHWkMOMMniu1+4i8blXk=;
 b=c1aST8seoR6u6nPDndgfFiqlryuT8rRO6Emrb7gGtdxJAGH9yZuPUIuV
 V2wdn2/dkgCmKV1n0nDY7Q8KOkV68eQkoDDKTcxOjuGYGsCKpsaNzrekv
 gWGCoU6F0T3JThxXo46xptz/sODBxXQ/nvsAvw27i7a3xLBD5kOjx4+qq
 egVkcTsgYhwUn6Y9AAYYBk7BKvbCPBevK0R/lBibPb2XCPdiBoU0ISQNV
 FMnnBZ3eLUrP/WmMICtOFBFXJQlelotOhrlEJHUCDI5aqkaI+sSkXfJ3v
 nwq9wF2cdu3owp2XwBRrBqiNEDp7IQuTzI0sfpgn8L5rqe5E96KKY6qGG w==;
X-CSE-ConnectionGUID: IZmtGaGJR221fTsChx24hQ==
X-CSE-MsgGUID: VXkZ8fcnSRGYqH7Hqm6Otw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="108632951"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="108632951"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 09:10:52 -0700
X-CSE-ConnectionGUID: YaLKI6nUR3OmcWjZ6nn3iw==
X-CSE-MsgGUID: Rtd9TELIQmejifLua8s2bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208";a="274536430"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 09:10:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 09:10:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 09:10:48 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.56)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 09:10:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvSvWf7UmmbhBZal+xofn/c0nCyhwTuWQ7pHceB54pNVOX4cEuATFPKcU4F1P7MF2AEVLb+aTvF8uOABzuqs4kQO9FqxQg54rXtCbMsfO/pc3alLLOQ3UR/8yGvOLpf31hLwTFKoToe3VDTA3uwnOfa58mvPSP4/LidLY7E3OseAPtxt4KdqJBCb0diO9hW84riR8jrrME6/vGZiAHxzajQjqdEfnpho+M3yKF+5Ghoj8yCtFiDD5oMEWFTBfuPsCNL3qLIqQpRqXV6l8/4ZuO+bsL8Tyld1JmVqXkIpmf9X5FAQCgcjjla7ogJv041AY/wt0w42jR4RcByTTDQJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+P/5VGCn3/KA8glZNpYutVPBxwYwuEr6VrB4Pss0jdo=;
 b=mI48TUtp3MITg5I3VGOwcntAkkpy9AQoErqB2WyqsCaqRBqhSs7BeqPNMz/+p9nJ5p3/7hcaVaEoRblYme4q5hM7GqyLsYgkzBndn7tVdsSbmjkiZ28OxjV2roSWXdOSIQ4pVqtcPJ+18fq10cAWBonlIK3swoGMs+MxBRygdVLaqfZBMSM156y0LkCSqyungGLvUlo0xR/9+dWfjA14OY2mfv9YlLVIV23PSRCDjHkyF2HnuMuvcostPP6u/4S2nMzRd8IqyEhMzqS2HFpsNI1iXycSkZI+RmB7T8X5FTWj1X0XmFPzxhPHALhLo9mGdcLrOh6ttcUmW7ginw2C7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DS7PR11MB6248.namprd11.prod.outlook.com (2603:10b6:8:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 25 Sep
 2026 16:10:44 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 16:10:43 +0000
Date: Fri, 25 Sep 2026 09:10:41 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 01/24] drm/xe: reference VM from PT BOs
Message-ID: <aradAY+S0rWaAsen@gsse-cloud1.jf.intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-2-matthew.brost@intel.com>
 <arZiVjq3XJHWFpyM@fdugast-desk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arZiVjq3XJHWFpyM@fdugast-desk>
X-ClientProxiedBy: SJ2P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:a03:5db::7) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DS7PR11MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 50bb4738-953b-44b2-0d61-08df1b1f8d2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|6133799003|11063799006|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: iAThnblgJyhmUEikrY0tsI8T5biDec6kk9bs4IzZde6cZoJVRxVxR91A/03XJAU2IO/1Sn3MOacTGyJMi+BqS9LBkRUJLCpEaewpVYn98VgjO3c83DKU5eNdTnQyvgSWdXY7KigLbgHrV77OK8rmLIfR2EmAPbJzVoNVBFnHos01wvMyDQFQxJpoqlGlQ2r+OHLQh56zqz/SW+aLIHNFn08UrVpB9PW0Ku5uizz7fAjMOqssCQFm6sUmzqZDjkZhFJ4R8LPk1wkEcTfRTHcdHT4oWt0dL0nvmoUoiktpoqIghnZpj0KGDcu4j7fdBmiQI7/JVaMT/UctVK9XXEn0okkcT488uajuBgwxLDpHpPoOV2mYkCUpig8TkrXqDiC0YoOsLAz1fU9ds7Dr5quA6o3MdyrJSgfjQzkn6Nlrvlre4CIkw/BZxOzPNjx+0k/3WZejpY+0gJobBCAJiWEtIQugZUe4G37h0MF2DrQj82zIndLK5/rr1g/NbVys0M7vQXWMMatSiAn/IlJ/KxfDv0tXodrCHgVjFRoMKK6VlGYMcZQLqmnZ5a8UZ+W/qDK6Rz9FFMZLy56BRep3j/FYGA1TODng6OFoqnZ0hpN1uw5idWS5c8XnLZQMoQdGtIh8JlwgwRuZvYGDb9H4SytEq3W7frNAX1Ub3pBY2iivRJY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(11063799006)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ju9yN0aIVwQftkIPXPFikCY2lAUAwlP8qTZ68ChpnivLDc2W7tbsa1UnPp?=
 =?iso-8859-1?Q?hTmdYv6nEnqAXGNNHiWbGOLP89v3CA323xHNYZ2EfyYsi3EBDWk7gbvzg/?=
 =?iso-8859-1?Q?RYZLIeAdvAGcWgCBXSWZbwGPS8L/Zknhq+irHHT4HQ8MQo5PKE2MUzoH0Y?=
 =?iso-8859-1?Q?XlpH+B/tdGAgj8aXSZbUUhmFw3R1ZnwMoI4WxOHkCRXeQhcOb1Hw1Huy4Z?=
 =?iso-8859-1?Q?goweLhpzIt9W0YEP5zE+S6YRnG7bOcnno58Dh5lbu7vd8rnWru5KYtxwZ0?=
 =?iso-8859-1?Q?LKAj4alAo4hRf0T31Xq1gzhRzZQUmlfqwxCVNS9RtwB1ZXa/5BnK16HFxj?=
 =?iso-8859-1?Q?SIeldpMpLcLOGaq3HCvnp4WaUmmu7VKDGeWQPfiBKrYBH6z4e5/bMA+O3g?=
 =?iso-8859-1?Q?5l/EC8vCmI69FKnqVF68Pj6UIHV+nrCid+e5WYcZatZanQUSNy0MlH92Oz?=
 =?iso-8859-1?Q?3wWWHJUYImU2bpt6N7hqFo89Jn5GOQQkHSDDh0nRqENgeDJsdi0UXN6jlf?=
 =?iso-8859-1?Q?q43TSlXiPZvVWNNryd8U56Az5l97kjhk7ythVJAHC/owNq8gHNsTZUK5W1?=
 =?iso-8859-1?Q?Ke8N3il8XtW6RJ42Kh32oVcX+WEVYzrPE1W3L2FxAs9b+M3IQUKbgzYwf3?=
 =?iso-8859-1?Q?eP6jfeGDHGpQKU1f272M89ZJjNrOnVVEY90LWxWFPzEaYgYcrE7IrPMB/7?=
 =?iso-8859-1?Q?YYOa8ZI1MhLvPk4Ai+wRfhs6kRpWH9yGn975CHABQq/Stx+ULxNZVjU/7k?=
 =?iso-8859-1?Q?pU2/9XAS1gb3x3e0yA4h8bRWs19wWMWhzhBgD6fqIlX0sYWhGlJLWOLZQq?=
 =?iso-8859-1?Q?3syMtJELQAqMu+M8gFOcGJWFKveZHdRUhG+guVpyTZmTPkW2lZmdPR9QRF?=
 =?iso-8859-1?Q?Uar4GAADMdnE0WdoSbFut/3UEE6Hr0OFiG3Cezu/LE5YxMzAGXV8Q5C7iT?=
 =?iso-8859-1?Q?Ikektryht0+W+72omvjli4NIL3WKb91DZws4EGbu508rFHiG9cgBmU5uog?=
 =?iso-8859-1?Q?8yqwUzPqWQtdDaqiscX8Kj27h1urOpor6fQqPrf00gxqc9MVQr0k9Fr6+X?=
 =?iso-8859-1?Q?Fl3tEhCyuxniPhEWjrYyVRtVbEtAQTKJtfTv4o3NYWcCqRvz5BpGopNVwL?=
 =?iso-8859-1?Q?r3eGCadG1veuRlcSQbo594RKXw0eaPdLVYGBvCsHSuoEDhu5fIeD+ZUmGi?=
 =?iso-8859-1?Q?y3jouk1Ucb65D2YaWvcZbtSVYwzOxC+g9kpsMVZLvW3QOnUESO+q8wFQrA?=
 =?iso-8859-1?Q?lluTAZArWZRWiK+CgVnW5XnQhbhggxL+UnvBpvlCHfWtsvZno5J5XiiDFJ?=
 =?iso-8859-1?Q?l97oVQ6IQUKI2Yzf85xQV+xKXm+vYsa4QkfAVOpFTR9sTXK7QADQKbAjzF?=
 =?iso-8859-1?Q?pXhQWYeEhFnQo5kJDkANZU0J0oh6V+mOstm7rZZ4xDx3dtsWTvwO/xlZpd?=
 =?iso-8859-1?Q?K7ZgSV/uTovalwY1UXd8tAJ+awRFnFONQP+4R6jmzxkEI867Y9B/VPRdPi?=
 =?iso-8859-1?Q?Qwy8goZYtaUxyu9Kg2HYvLWx7GYUXaZIWdN9wA//TtbY1lL7XcHWCJSS/I?=
 =?iso-8859-1?Q?Dk7kG5hbzkfqJ/Yv1lD7HD2U7EoC0qfHduelJed6N+WA2omjBptaEy7pwK?=
 =?iso-8859-1?Q?/TPGC/c/SkTQnlGr/XAVLSsTx4RbdKjQDRnpjyYhxCYS4q40mjc2AEOuM3?=
 =?iso-8859-1?Q?vcvDdxIeFYKyikhbA9MXcxdDVIZC+ZNCyk/yyR5CsCiKFak+b7WSXCirLr?=
 =?iso-8859-1?Q?qk0bRjtVsMI9zSeHdVWsAR1SbVxLvayjit9mg0YS4GNDMSDokc9lHMrkqK?=
 =?iso-8859-1?Q?pju3Cb3nuwptOOAj9t/BvfBNJcf/+Pw=3D?=
X-Exchange-RoutingPolicyChecked: KnhWkV+iMhqHCw7KIR3+Ob30QuOa4a9cRlKsZIZLthjYJ3YqHnwULkCNWOjhghw5pYjBGA9AqimmFrZAenlwjmS3votfk6SS/PfBZy1K6oCMyielrA3xQF8T5Jxzjxt4Umpv1V6tciTMpGw9SQ6bA0QAgZsm/Ez2QqWZX3EPFa3fTqdA5HLw8nsCsjcvqcOUR638ibmi3XzEPK7R6dsa8Fo0jP4JO/raTyIGeRj47pWwH4kjQfazYz8pmZkwcd5r004vrxzdHHHa0EoO2Q8ZXjaHA2j0/NipG5kfBXBfWSSBesvZ/02K6tYFjY3+xeLWe21ZhqIKwtFOtIPAd2VEEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 50bb4738-953b-44b2-0d61-08df1b1f8d2c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 16:10:43.8698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nORHvbhkAKFyaBNAEz3oQVGqEkxRERVdKuERdWMBiNT2AUQaTLV6c8HjNsN6PkFXx52htFr2ckOT497f393pJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6248
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

On Fri, Sep 25, 2026 at 02:00:22PM +0200, Francois Dugast wrote:
> Nit: first letter of the commit title is usually capitalized.
> 
> On Thu, Sep 24, 2026 at 09:52:57PM -0700, Matthew Brost wrote:
> > PT BOs share the VM's dma-resv and therefore must keep the VM alive
> > until all PT BOs are destroyed.
> >  
> > Take a VM reference from PT BOs to ensure the shared dma-resv remains
> > valid for the lifetime of the BOs. Scope the change to PT BOs rather
> > than all kernel BOs to minimize risk and avoid extending VM lifetimes
> > unnecessarily.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Did you observe any side effect without this change in earlier versions
> of this series?

No, just Sashiko (correctly) complaining. The kmalloc in
individualization step would have to fail to get a UAF, thus pretty hard
for issues to show up. We might have issues here in other existing code
path if that happens but wanted to keep this change minimal rather than
auditing the entire driver.

Again Christian's series to ref count dma-resv is the real fix for
memory safety around dma-resv sharing. Hopefully we gets that in soon -
I basically gave him my ack to merge it but subsystem wide change so
might get held up.

Matt

> 
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> 
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index f2ab9bf43a86..6921b6967330 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1879,7 +1879,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
> >  		xe_drm_client_remove_bo(bo);
> >  #endif
> >  
> > -	if (bo->vm && xe_bo_is_user(bo))
> > +	if (bo->vm && (xe_bo_is_user(bo) || bo->flags & XE_BO_FLAG_PAGETABLE))
> >  		xe_vm_put(bo->vm);
> >  
> >  	if (bo->parent_obj)
> > @@ -2575,7 +2575,7 @@ __xe_bo_create_locked(struct xe_device *xe,
> >  	 * by having all the vm's bo refereferences released at vm close
> >  	 * time.
> >  	 */
> > -	if (vm && xe_bo_is_user(bo))
> > +	if (vm && (xe_bo_is_user(bo) || bo->flags & XE_BO_FLAG_PAGETABLE))
> >  		xe_vm_get(vm);
> >  	bo->vm = vm;
> >  
> > -- 
> > 2.34.1
> > 
