Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52196CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 17:30:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136F510E575;
	Thu, 12 Oct 2023 17:30:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C0610E562
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 17:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697131845; x=1728667845;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ABZLhjm9JDjkA+/TmRYZ9U5iLacMtDxVK/WCeaaJlGg=;
 b=EEJ2/l8D/XLfjPvN+aE5GPJHJwkQKf+KlJ0v+BrLrk1GBTmaUgL9IPnD
 UHbxPvXXqgkdCM6IS9/xx9o2W3DZjrWNiJu5QQY4ADEF3goF78nOt3q2G
 YpwMRshh6A0cnjsW1sNdsUHSbDxY8g2wnAFWriRyzSpEw/KvC1PFTB6AU
 SstbEhjD7VuUFTs1OI98ZACiC4lB01XANGmgHVe70kHQTdD02X5O+v6o1
 XGg44sGR6YsUSXNBgNPbW8jxQ9LizNvIqbm+orTbSVy3AU+oGL0PnEmmb
 XNCOT/cQLiJZa/O+9PFOyJI0sGRMwEtVFxKwGVXKuR4N+6xwQT8o+MJne g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="6541773"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="6541773"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 10:30:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="783782072"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; d="scan'208";a="783782072"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 10:30:41 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 10:30:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 10:30:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 10:30:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mC4sLpJHigNIvK5KC9TrudslD/+dV+p+G0PdxKYp9tKNACGrrgYW/JC0L+/bw8urcffymsleor05STDVf696TX7jAPDkH9Fk1y640JADFKlT2k0hWdQn2r0ba0Sq6LvglpVSYsWxcisTBQgwJDRWcb7AXZCIpTik8f2Z3QNnvfYgSdSJGvAyogoh7Qlk8ye5boOwYSZP5v5yilZt+wH7srEQZsoJ6f3cyPa6/AnnLt0LtgH+1keNCI0ExjoBzvJyz7aYfW5dFpz9z2CHOavvy/TJWG+nCTHIu1tioaw+H67T5l6yl1ye96ILSE1rHlJnZ8iwH4J7czK0B2zTX981bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1d1Z6I3dVTa289J4L71MzAowWQ10RPbjXsk5UKq2Mgw=;
 b=KRxym6EViSpQ+KPwk3qgK59+RqHe3yjNF4JOdX700rvHWIoyiNPHmWFc2W8q589RzwcnShkwaXD+BdOCdwYeNV3M0sqjRAVbZGCiVk6maeQEE0vSm32mvekoCq331WknpWf5E3PaCj8yCYvG38joxJ0dpcWWSEHdzegbstW6V65ArCTaE/NWM+3lIfMmepz5RjLBsbnJs3Q77YHwEJJOPfbi/8ZhHVsigMPzyNPDRiKetd1KobE9UCUnI3fa5ayHBXqU6lvMoBp6m50a/RwLE9xfx4pmiEAMB2HAbvFAsVJ9kIbxxsZk0Ex/dAxnVa152eo4h1afEZlxJ7yFJk8S+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB8752.namprd11.prod.outlook.com (2603:10b6:610:1c2::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Thu, 12 Oct 2023 17:30:38 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 17:30:38 +0000
Date: Thu, 12 Oct 2023 10:30:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <20231012173036.GJ21382@mdroper-desk1.amr.corp.intel.com>
References: <20231010184151.91195-1-jose.souza@intel.com>
 <20231012171628.GH21382@mdroper-desk1.amr.corp.intel.com>
 <ff3e03acf78dda8cb52bde94de70f89a005596c7.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff3e03acf78dda8cb52bde94de70f89a005596c7.camel@intel.com>
X-ClientProxiedBy: BYAPR07CA0042.namprd07.prod.outlook.com
 (2603:10b6:a03:60::19) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB8752:EE_
X-MS-Office365-Filtering-Correlation-Id: 32ef2956-970d-4320-f8a7-08dbcb48f35f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QiJQl/QJhnY0PADcpRtz2gmlETg4k6QZHjowK8V8FcYsM/GXAZvSpfmmkByL5KnfJSFGczKUHa/IcoRaAmLSD1GXRLkk0gkcW52EShl+7rGBnzzjazmaBR8ERT3x0UG0yjUKjB2kwKt1HIxIA2NlSafDX4ZmKVhA1zTnsRQKYMronHL/EUfn6gNzxHwe4Vd/MU5LFvWB7D3QAUgcCM7hvUNuD51h1WbBdIITxpRE/imSjc5RhF+oWN7dQKWjf1f5Axsw6EM/C8xpBVfw7PC8k310BLLF9dhTvV95DMHF831U3A8uPviw3Z1B+FiD3oEMDKyVSpcKEvUcFzadke0ZXZEEZ9F1q2YKLxrKX2gdzpVY8uXvokK5yvgcCoPL2QJz092t5UT0UNqYpf8lv6oEgaHyDxf8cQRbKgEbMIJttzCFRC8YFgRE3uzKM6Jk5ECgZanx+he+kewAsOiObDp+zbvnHnzaejFOMc98k/QBO4I5NZaRRWIMXL9h16DNBwTHfG/lJO1m4AegMKb61H/BOYTMDXmxIKmHLeNY8wgWVT22VfDcXEYXlr23vEP0WmNs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(39860400002)(376002)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(26005)(82960400001)(33656002)(6506007)(6636002)(316002)(83380400001)(66946007)(66476007)(54906003)(66556008)(1076003)(107886003)(86362001)(38100700002)(4001150100001)(6512007)(6486002)(478600001)(2906002)(5660300002)(8936002)(4326008)(8676002)(6862004)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?I60RS5UuNNvmWl/hIMFYOCmhnFFP9Hg8CFtcqSwZs3TKxsooo7rY77gRsH?=
 =?iso-8859-1?Q?ncvKLhNGV31Y0wtP2ktttpjZ4f8frUSLpaY4qVlsjeHsT0T8TYvfIEzH8D?=
 =?iso-8859-1?Q?GMa2YMJPyXOeEon4m67fUmgvCYYntxEtqlgmhzAYPUPS34MWDQTGa0WTfB?=
 =?iso-8859-1?Q?NfNGmGkMCIVO5y0AFcsU/n037BlNSL+y5+KDbma6fqeHmzXheAudE8ZbSs?=
 =?iso-8859-1?Q?8ohptJwQh7hbutHl+XuBnYdei8qj5kzYsgplyCjekg2CsQGOOvtZFte/Wk?=
 =?iso-8859-1?Q?7/AnttpO3bA0MQ2RN8mQIvyRHC1gWY0Fcmh8Oto0PHCUg+c+TKZiOItZps?=
 =?iso-8859-1?Q?PjnWi77vk4KvAUHuQNHn4qyh4iX0imLv+2xxmrBn2ymEYssWwUV09yatzK?=
 =?iso-8859-1?Q?aAmk6uctQ6j23pqQHNrJSQiHxcanqwhaMo+ntnhGofCp/mFMUb3QEYqBYG?=
 =?iso-8859-1?Q?WadvDkoyx+hMCceFADA5XMDLTtyHPJyK4DmorTCufxiWHNTfaZsQr5THIk?=
 =?iso-8859-1?Q?2yKW/fCDTyeiZhdqaHhDyPBp0PjVv3L3VY24Dy6/ag3Sxw6O8iCw5ag5fD?=
 =?iso-8859-1?Q?1++0R/bb+0TpFW4b1d7GsP84oUAJ6EP7orJyd/IX5lJy9yDNGGE7g34JBO?=
 =?iso-8859-1?Q?alvR53fVGa8xYglY5Y+Egkx+iseWNpJ4TqBSd0mzqc+FdaBNutiTHsskOh?=
 =?iso-8859-1?Q?9Q/Ur7z5EXSMxuup1T0hWqrGKHg+XwalIFNYbSmeDUwGm8TrMu+x8KBnf0?=
 =?iso-8859-1?Q?MaiNnGkxfvwsIIjz/jiCYIX99529a9uRWh9esi4c25tWd9Yc9QRO6lX/Nv?=
 =?iso-8859-1?Q?brCrHdaltZCwmDCi0Ow87rf2AAMXdCqD6kyelP4tJKJnwQfIGocUhw+FPf?=
 =?iso-8859-1?Q?JI9Bs/Cukkqvx+epYWbPc7+M0N60GuHYhh1x+lCG+F4GoXD2YX/g9FgfXA?=
 =?iso-8859-1?Q?/WyQ/j7RMq1nS6LAVrpqGsc7SF5kkFFI+sUQ9BonCYjedViwc3FOc0nPkR?=
 =?iso-8859-1?Q?iZtgQlpRVgmJQiSXO3nFLqoMngRDxztIZTW7UWHoAeLhcS/5YJ+WncfAbl?=
 =?iso-8859-1?Q?tLO1vnAH7l5DQXbzZoWl5l193r0q1QaGemi7/fWOlqDSp5+naetDeSAzkn?=
 =?iso-8859-1?Q?lPaDn9dKBmJlJAu5ZDcj9lyi1xqiIH7gC1/BUT8ZA7Gq7XkDtdQcrEJqIB?=
 =?iso-8859-1?Q?tKeTIPKAbWZ+CK1TkmOP973td/lLBSJ3y6X17cdfYFzglxI88+j8Wjk/ej?=
 =?iso-8859-1?Q?x3X0FW5VGsdxAX+j0fLhtGZ8s6h5aUNinkjwxzAHkBtHzjeOObXFXsjzo7?=
 =?iso-8859-1?Q?vG6R0ATr9JX9KOqdsPU59tIFqs0GmWTdCNnoen8NN6S5Oci+uuKESi6Yiw?=
 =?iso-8859-1?Q?Y1kTJ0NiNxEgaz03x3owExc8vXh12HOi3c18+HelAjoLeDrojVqREJxwL8?=
 =?iso-8859-1?Q?nGidzQCWq9pkjKjDYd8EHMVVCTcGhhhuFNgjZHkuoFjCodH/OspVxvSiG8?=
 =?iso-8859-1?Q?w2h4gk3P39IPLQTRWOg0qO74agP88H1KgViM1Q4pc/xb+6Ummr9QJ9z5Eg?=
 =?iso-8859-1?Q?eYhYLYIyOIDdta62RZyyVCw2lTK4RwQDbAON2F6ZEr3rcRi6Cz9FK2uk14?=
 =?iso-8859-1?Q?zPLcvUjNB/fxIcGQjYCgedUmhXP4/XvtmomKnXjNI1/+6G7G7fii6N7A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32ef2956-970d-4320-f8a7-08dbcb48f35f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 17:30:38.5515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LLm5hjUaxB7wy1/nk1ekwRBNDEl/7e4JTVD+ChOnTldL3XQqVEMbj5yge9r4qI8lS/Thau8AykP62/F4xbPTZnsv6fKa6f/YTbm9H+knuAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8752
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/3] drm/xe: Store xe_he_engine in
 xe_hw_engine_snapshot
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 10:20:33AM -0700, Souza, Jose wrote:
> On Thu, 2023-10-12 at 10:16 -0700, Matt Roper wrote:
> > On Tue, Oct 10, 2023 at 11:41:49AM -0700, José Roberto de Souza wrote:
> > > A future patch will require gt and xe device structs, so here
> > > replacing class by hwe.
> > > 
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_hw_engine.c       | 6 +++---
> > >  drivers/gpu/drm/xe/xe_hw_engine_types.h | 4 ++--
> > >  2 files changed, 5 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > index b5b0845908887..37b3ee1268090 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > @@ -684,7 +684,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
> > >  	if (snapshot->name)
> > >  		strscpy(snapshot->name, hwe->name, len);
> > >  
> > > -	snapshot->class = hwe->class;
> > > +	snapshot->hwe = hwe;
> > 
> > I haven't really looked into the devcoredump stuff much, but it's not
> > clear to me from a really quick skim whether it's safe to save away the
> > hwe like this.  Is there ever a case where the snapshot can persist
> > after the engine itself has been destroyed (e.g., if we capture an error
> > encountered during a device probe that results in the device being torn
> > back down)?  If so, then you'd probably need to make sure that the hwe
> > field here only gets used during the capture, and the 'print' routine
> > would still need a cached snapshot->class to avoid use-after-free
> > errors.
> 
> Xe devcoredump dump is also removed with Xe module, so no problems with this.

With the module?  Or the device?  Even if probe fails on a single
device, the module may remain loaded (and might even still be driving
other GPUs).  If the dumps for failed device(s) are still accessible,
there might be a problem?


Matt

> 
> > 
> > Rodrigo probably has better insight as to whether that's something that
> > we need to worry about.
> > 
> > 
> > Matt
> > 
> > >  	snapshot->logical_instance = hwe->logical_instance;
> > >  	snapshot->forcewake.domain = hwe->domain;
> > >  	snapshot->forcewake.ref = xe_force_wake_ref(gt_to_fw(hwe->gt),
> > > @@ -731,7 +731,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
> > >  		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
> > >  	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
> > >  
> > > -	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> > > +	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
> > >  		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
> > >  
> > >  	return snapshot;
> > > @@ -786,7 +786,7 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
> > >  		   snapshot->reg.ring_dma_fadd_udw,
> > >  		   snapshot->reg.ring_dma_fadd);
> > >  	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
> > > -	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> > > +	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
> > >  		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
> > >  			   snapshot->reg.rcu_mode);
> > >  }
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > index 5d4ee29042407..71c0a0169e62a 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > @@ -156,8 +156,8 @@ struct xe_hw_engine {
> > >  struct xe_hw_engine_snapshot {
> > >  	/** @name: name of the hw engine */
> > >  	char *name;
> > > -	/** @class: class of this hw engine */
> > > -	enum xe_engine_class class;
> > > +	/** @hwe: hw engine */
> > > +	struct xe_hw_engine *hwe;
> > >  	/** @logical_instance: logical instance of this hw engine */
> > >  	u16 logical_instance;
> > >  	/** @forcewake: Force Wake information snapshot */
> > > -- 
> > > 2.42.0
> > > 
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
