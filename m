Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DA1D68BCD
	for <intel-xe@archiver.kernel.org>; Fri, 15 Nov 2024 19:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD37510E8AC;
	Fri, 15 Nov 2024 19:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqRwI2qJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B44010E8AC
 for <Intel-Xe@lists.freedesktop.org>; Fri, 15 Nov 2024 19:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731700185; x=1763236185;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zZIut5zsj10Y+DC9Kvrun9RoFkIbEgLPOpyr7iDXLaQ=;
 b=cqRwI2qJF/5yP25nEKS57Efm3DDUNm4sHjKc5hsJ4RRA4K/LeGJ+hO2K
 LnCfLpPphYft5/ChXSO3y17itUIJEehT2O4UJ440NmJsD5iYKLgVe1Plw
 HTT1f4IyI0x99cjmMR+44JkkJNiTkamayK5uRMiSekCmX9vV7o/yZbsT5
 pw+cm1lboYsOZtyzK30lmEoxbWEkk+JVXiFh+SVvGmyW3LMQUEHG69G4u
 jyf+NNctw8OilaUouITr5xOOhFxE8S4w9D/Gozy8e4KuobtuXBOLttitB
 u9ZZ2+QZ2It/UrF1RTGUQxpRDTsChIamtNMIZrH2R3PKeE2PD4n3mBxka A==;
X-CSE-ConnectionGUID: GTMNzllmQF6Az6BzIq+cUA==
X-CSE-MsgGUID: xbqH7Q0rSeWhGXObv20D8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="49250701"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="49250701"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 11:49:45 -0800
X-CSE-ConnectionGUID: gsSG8ls6QxGE9WRMcPT2IA==
X-CSE-MsgGUID: J06EIVt6Rf2jojS4r2lcjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="88415312"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 11:49:45 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 11:49:44 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 11:49:44 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 11:49:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BB/QIGpsZ/1xU4U4sHULIKnC3QdQeSPZ0a2suG+1Z00ptqaq7+LJXH6sgDhUCvbshWzB1r+kRm7yiA5/AFbb+NHqLpwgUF1+wa62UP5XJp1Q7hUQl6EEpqmz2VYPBLjXK9OY38PBdvTtFAt6wHhVykEwQ5QJKnG1ctvHdCwBa55LcNuR0IgQi5gt9adSM3rDBwxveh5vVMTKFjXjOMNZF6KYgtBvsH2x0+LS050BjwD+xhO2IT7Q3lGenJ6WuyLI+8U5KWPXEWdFzY3r5oSKblJxl8/JXqwv7ZOVRKTpPmeJ6285IZGl9zc/ti6Z3UrE+m+lEG2mGj3bKb/zAjflvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJV7wsNIrHi2aFg1O1I71Sk6oUYd9fULc2EuPXVOAnU=;
 b=TPI8MDj74e7M0aLOLv6nwuL8Mf/gGo65tu552HzTQKznXRO9ZkbFKKG8pDhEVDI7u15UmXhyXQZenVZzrNA+qnfOdwsvCF8QKXWKxMrsnGmH1CxqC3eb/qDg9NDevPtzMZktyXEJovmirU+/A+XN/IihRviU4QBfp6xN86KK8qtCS6DlyIlrqE8Fsx0RA2+91gm5AwY4NNXnjm8DdudWVHZD/fWnsJa5jTrQGyMmnialp8eUak0/xxyvkypiaLmGJtVrtFIIuqFUH7tNemq3LboeeJPIieZW101iskSuYytxyJk0lSklDjkgy4KZ/p9H8Wf9PzvCtQ3P+SmJdhLWsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 19:48:57 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 19:48:57 +0000
Date: Fri, 15 Nov 2024 11:49:30 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for G2G communications
Message-ID: <ZzelyrwhddiK0QBY@lstrano-desk.jf.intel.com>
References: <20241108202216.2020164-1-John.C.Harrison@Intel.com>
 <20241108202216.2020164-3-John.C.Harrison@Intel.com>
 <ZzeczRm2B3ekqb4Y@lstrano-desk.jf.intel.com>
 <b2707450-2273-4933-bd2a-bc175c3905ac@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b2707450-2273-4933-bd2a-bc175c3905ac@intel.com>
X-ClientProxiedBy: MW4P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::15) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ2PR11MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c55b93b-8090-46b8-7c57-08dd05ae8ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kXNWz4joQsoO3XRzDCc3TAbA06fzmwgvzxg3kJ3JO1ODt2DeBaqOgEt+jApC?=
 =?us-ascii?Q?Hs4Dl9MNIvpTA+4EeClLNQ+akdGerqz4kydr0ILkVM12q/doCLFK9NpVZZVo?=
 =?us-ascii?Q?DBKxJODaslH3XgVnSYz76KjByl9kHyYBIUdttuKPZlvBWLbl+QW1jvzek4KH?=
 =?us-ascii?Q?5ENt5Pmz6vIkrKz8Xwm6WKff/3v4MPxkwtmcCLzOe76TEeS1foOlArjpK82I?=
 =?us-ascii?Q?wHoD/vvftuEQSCGW6004T7xTLh6p6thkhMia2nrly1sz6r7smNS07BFMcCzp?=
 =?us-ascii?Q?fyVbySObrOrT+1kEUtTFXRlwNmjoWmg7fxIrWoDMn/WuCjZdb6NgqQ/ebgaS?=
 =?us-ascii?Q?NJBHh0B0RaOxpPH/WpiAigHdurP/O/9una2gMvbHTkcXRbh9ouDdTGm6kmAt?=
 =?us-ascii?Q?Scm+uRs6e+QQUQSmpyhjeJezTn4X105fCycrqVwiYBNxaQu6PyuTNaiqHZ7C?=
 =?us-ascii?Q?MbXpss7O/XVBsRmsCQrbF8zKp8CLpgBnPltptlkhKMrvoQ8vh2LcCyuTR0V6?=
 =?us-ascii?Q?7MA86n0vByfsEvkOh+wSvSqQF8HzA6kdRutM3P4KCSL5+zjy1pYeeWltRZaQ?=
 =?us-ascii?Q?gtoQPa30knEQ8ET8qeT5O5QgCmmCIdu/9oWeXwEPGG6ClzZnjOxrMTiKKasJ?=
 =?us-ascii?Q?DkxrrMxSmN2zP8PX5GncDIk4qgNt0Y5vLKwqeKX8WgIaH5VxHj6wjhTJWDVT?=
 =?us-ascii?Q?Qva+o5uEexNxZ+UwQuee5nVJUboFsGU4usYVmh4bEMTWXZS5MPdOuo6QqzcN?=
 =?us-ascii?Q?esS+M0c8E5KyKcmKlv/NRgLPQzGIKJu0yfJIg4vDSqRzrlnWQOXBnAcjcSAQ?=
 =?us-ascii?Q?BT+VuUzbXnSW/BYZlKbdQQbzAqrl6ev8ksbxJGqVK7P3eeclDqiooBXl0vQw?=
 =?us-ascii?Q?nUJmGd7r4k6LfCX8gN0nMFz34Dn4P/FGfj/qb4zx9bdPUkWStweuIEexq4AL?=
 =?us-ascii?Q?U8pLe91ZQLOwe8HJkh7q0BjaobwX2GC9t8s4BBhyfLFZb87pfdjPEyi5mhu5?=
 =?us-ascii?Q?cV3DgL88Auu2/3Hkn1cNwegqy//Mn6K9+r++A0UY5gPUeBEw3ualQO1cpxhM?=
 =?us-ascii?Q?IWcestt42fRkeKzkCdytXznkn9jst/GGIWsEjMennWf6/6wQL4UK1XA/4g+S?=
 =?us-ascii?Q?UhMsMS1a8roh3Re+4YnExGiGfaTdggPrnQfMXy+qlo3L2OcoZBAx1OMnzLl7?=
 =?us-ascii?Q?GdTN2dZR7MzBBtPXfFm0ZB/Qqgo5b+pLgRAyTwyMf/3Wim+bNrrBX+Drhs5e?=
 =?us-ascii?Q?A4s2GvC82Ky2ZZno0uT7B3ZQ9pGRtB8HS+BpIP1yuC+4dQqHUpujwOvLodw3?=
 =?us-ascii?Q?WwhgN7kAH7r7OZYq7Fie9V3n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QES06ThaqeR6RKhcu6u3RSlM2cIeBGEm8R0XVt6QHeOknr8qRj5g539MBX7D?=
 =?us-ascii?Q?UzG9Q5QnH5hL7mV7/nBVZy8E9Da65i2523sYuIhsfwy3SceZhnj1QTo4+44z?=
 =?us-ascii?Q?uWC7aOtNQlpP6vNfPdCqSWSVXgvn4wpTmI12XUWg4Y7+Lc0TteXJ026c9XrP?=
 =?us-ascii?Q?jTPrpsM5fIKlB+L/FYHpQR36WDltlaVqfg/bMKIWXcGuYz7rs6A6XbNLR3T2?=
 =?us-ascii?Q?ik43rs8CE/viQAI3QxhhvxFtyLOozKxO52qDvIGtmufbdh5jWPL0AV4WEbGV?=
 =?us-ascii?Q?A59afYyRC0IJOKjoi7bvqF1Vo0C+xvQ21+sZPTeJcPQ7/QqIupjpLZxTmf6q?=
 =?us-ascii?Q?wbfr+/oDqOlKIePOa4seQ+Xb7OG4hyT6XGY8y8+cIqJf4/nUsjG37F9Ib8vm?=
 =?us-ascii?Q?nhPa6C78XsYQStpKDnxp1NQHsT92MGrdDPq72FxmcU7DtnejygsDW6ubIA+i?=
 =?us-ascii?Q?0YNLEPQ5nE5yQfDXflBxf757LyfHRcRIBUdSvZvwxiI3J8QF5vLvx2Qc7pvQ?=
 =?us-ascii?Q?xTvmPsBJBt5IPkin9LUo+2eqYsWM4BbtIC9Bask5IHIM4vUVHhmAtB86bRJ5?=
 =?us-ascii?Q?jS+fEDOVWl0ymjEeuWGrdaUabyd7QJRu7yK/Hw1W8jK3ljbB0IOL9WGwrEhG?=
 =?us-ascii?Q?ofuTgvhOxPe7++cU0xLaLoL3odh1VxmHlsqErILtp21XgrjVdQPqqm/oYayh?=
 =?us-ascii?Q?4r4GxB32ULAA3+zjuTryXyuLq6IPDtzcFYK7wbsiEqdgBriprR6Qz+OMXNVB?=
 =?us-ascii?Q?Sg3/7Jj7/B1eVifd8tpA8rMrWGRHOimhpi7QBhXe9EeQJ5XLtRKauYh8y4iK?=
 =?us-ascii?Q?zBE4wTrlRqPdPYs5B22Htez2a2o0GnWkVOXYgvAWwTS1pAZTuVe3u8aiLRwB?=
 =?us-ascii?Q?M+acfhxgJq1BShout5Tfhkv8zx96ShHrY5OoE6PfKFxw0VtbX80E24GuopKu?=
 =?us-ascii?Q?21ZbR8XGGdPs9c1phlj6NaDRQqrsU6dqOSDEjcMZXTz6vn3O/heNaOMT31rD?=
 =?us-ascii?Q?GxczoRt/xP/MTJmwT//bXM2yGbFhrZ2Gu1+pSjZBhdj+nbdkENQSgvDFgCE9?=
 =?us-ascii?Q?15qszQOsiogvhRJVcOug3gFnFL5W7ddpH0hJuKre20aXk8ZNsBVprX0klb0o?=
 =?us-ascii?Q?si7i7iOvu+OTHPk6U9rweqEdjjlDqWQpfosvvXRNknsd8RtAJzfoNR73Dx7N?=
 =?us-ascii?Q?eJKTKuXWOQXiP8u+8ENBFNKVMzPczXDPvvavUQ8tFHXvx+007Y/MsozBjz9Y?=
 =?us-ascii?Q?yTu0TCMKIFIv2CT25WXM22HIgzQnVbkkC+48bUby7PjZn1WYigiJD+VaJJB9?=
 =?us-ascii?Q?Wj1wN3cr6TUbUHcCBjApOSdqOwzDQL/NdYvaNqx7gpHRRylqg36ZcOKkSi5N?=
 =?us-ascii?Q?kjsd6B6jcB77J7NdNfpP//heR9Ld28c8d0woqEfuKAit8yoeH40D8n52nHrX?=
 =?us-ascii?Q?oWjLBNAUWpwD45q4uX4crsyQTwMPSi0QcapZKgTT6YUwAnI98Ilnix3hJONu?=
 =?us-ascii?Q?+M2g53r/qc4C/iVH6HiGUe9wwsII+tp5Jgrj4I43Y/AvxaFl7Ud9QHb8wWIg?=
 =?us-ascii?Q?mpCLNEeVoSKMdRrv2qDJ67Ww6d+VKt8lzQISvBbdlrTAdY9VW/k9NSppMvQs?=
 =?us-ascii?Q?IQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c55b93b-8090-46b8-7c57-08dd05ae8ac7
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 19:48:57.0056 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 87abV5spfekA79ag065802v4MA/Lvb7mzVnR3CeWdyg4unAWB+PMin87nvv9M8ZwOOiLClwMA3ShVGJgdWo92g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8370
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

On Fri, Nov 15, 2024 at 11:34:40AM -0800, John Harrison wrote:
> On 11/15/2024 11:11, Matthew Brost wrote:
> > On Fri, Nov 08, 2024 at 12:22:16PM -0800, John.C.Harrison@Intel.com wrote:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > > 
> > > Some features require inter-GuC communication channels on multi-tile
> > > devices. So allocate and enable such.
> > > 
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  20 ++
> > >   drivers/gpu/drm/xe/xe_guc.c              | 276 ++++++++++++++++++++++-
> > >   drivers/gpu/drm/xe/xe_guc_types.h        |  10 +
> > >   3 files changed, 305 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > index b54fe40fc5a9..fee385532fb0 100644
> > > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > > @@ -134,6 +134,8 @@ enum xe_guc_action {
> > >   	XE_GUC_ACTION_DEREGISTER_CONTEXT = 0x4503,
> > >   	XE_GUC_ACTION_REGISTER_COMMAND_TRANSPORT_BUFFER = 0x4505,
> > >   	XE_GUC_ACTION_DEREGISTER_COMMAND_TRANSPORT_BUFFER = 0x4506,
> > > +	XE_GUC_ACTION_REGISTER_G2G = 0x4507,
> > > +	XE_GUC_ACTION_DEREGISTER_G2G = 0x4508,
> > >   	XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE = 0x4600,
> > >   	XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC = 0x4601,
> > >   	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
> > > @@ -218,4 +220,22 @@ enum xe_guc_tlb_inval_mode {
> > >   	XE_GUC_TLB_INVAL_MODE_LITE = 0x1,
> > >   };
> > > +/*
> > > + * GuC to GuC communication (de-)registration fields:
> > > + */
> > > +enum xe_guc_g2g_type {
> > > +	XE_G2G_TYPE_IN = 0x0,
> > > +	XE_G2G_TYPE_OUT,
> > > +	XE_G2G_TYPE_LIMIT,
> > > +};
> > > +
> > > +#define XE_G2G_REGISTER_DEVICE	REG_GENMASK(16, 16)
> > > +#define XE_G2G_REGISTER_TILE	REG_GENMASK(15, 12)
> > > +#define XE_G2G_REGISTER_TYPE	REG_GENMASK(11, 8)
> > > +#define XE_G2G_REGISTER_SIZE	REG_GENMASK(7, 0)
> > > +
> > > +#define XE_G2G_DEREGISTER_DEVICE	REG_GENMASK(16, 16)
> > > +#define XE_G2G_DEREGISTER_TILE	REG_GENMASK(15, 12)
> > > +#define XE_G2G_DEREGISTER_TYPE	REG_GENMASK(11, 8)
> > > +
> > >   #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > index 1cbad8a91798..899094423291 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -44,7 +44,15 @@ static u32 guc_bo_ggtt_addr(struct xe_guc *guc,
> > >   			    struct xe_bo *bo)
> > >   {
> > >   	struct xe_device *xe = guc_to_xe(guc);
> > > -	u32 addr = xe_bo_ggtt_addr(bo);
> > > +	u32 addr;
> > > +
> > > +	/*
> > > +	 * For most BOs, the address on the allocating tile is fine. However for
> > > +	 * some, e.g. G2G CTB, the address on a specific tile is required as it
> > > +	 * might be different for each tile. So, just always ask for the address
> > > +	 * on the target GuC.
> > > +	 */
> > > +	addr = __xe_bo_ggtt_addr(bo, gt_to_tile(guc_to_gt(guc))->id);
> > >   	/* GuC addresses above GUC_GGTT_TOP don't map through the GTT */
> > >   	xe_assert(xe, addr >= xe_wopcm_size(guc_to_xe(guc)));
> > > @@ -244,6 +252,263 @@ static void guc_write_params(struct xe_guc *guc)
> > >   		xe_mmio_write32(&gt->mmio, SOFT_SCRATCH(1 + i), guc->params[i]);
> > >   }
> > > +static int guc_action_register_g2g_buffer(struct xe_guc *guc, u32 type, u32 dst_tile, u32 dst_dev,
> > > +					  u32 desc_addr, u32 buff_addr, u32 size)
> > > +{
> > > +	struct xe_gt *gt = guc_to_gt(guc);
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	u32 action[] = {
> > > +		XE_GUC_ACTION_REGISTER_G2G,
> > > +		FIELD_PREP(XE_G2G_REGISTER_SIZE, size / SZ_4K - 1) |
> > > +		FIELD_PREP(XE_G2G_REGISTER_TYPE, type) |
> > > +		FIELD_PREP(XE_G2G_REGISTER_TILE, dst_tile) |
> > > +		FIELD_PREP(XE_G2G_REGISTER_DEVICE, dst_dev),
> > > +		desc_addr,
> > > +		buff_addr,
> > > +	};
> > > +
> > > +	xe_assert(xe, (type == XE_G2G_TYPE_IN) || (type == XE_G2G_TYPE_OUT));
> > > +	xe_assert(xe, !(size % SZ_4K));
> > > +
> > > +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> > > +}
> > > +
> > > +static int guc_action_deregister_g2g_buffer(struct xe_guc *guc, u32 type, u32 dst_tile, u32 dst_dev)
> > > +{
> > > +	struct xe_gt *gt = guc_to_gt(guc);
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	u32 action[] = {
> > > +		XE_GUC_ACTION_DEREGISTER_G2G,
> > > +		FIELD_PREP(XE_G2G_DEREGISTER_TYPE, type) |
> > > +		FIELD_PREP(XE_G2G_DEREGISTER_TILE, dst_tile) |
> > > +		FIELD_PREP(XE_G2G_DEREGISTER_DEVICE, dst_dev),
> > > +	};
> > > +
> > > +	xe_assert(xe, (type == XE_G2G_TYPE_IN) || (type == XE_G2G_TYPE_OUT));
> > > +
> > > +	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> > > +}
> > > +
> > > +#define G2G_DEV(gt)	(((gt)->info.type == XE_GT_TYPE_MAIN) ? 0 : 1)
> > > +
> > > +#define G2G_BUFFER_SIZE (SZ_4K)
> > > +#define G2G_DESC_SIZE (64)
> > > +#define G2G_DESC_AREA_SIZE (SZ_4K)
> > > +
> > > +/*
> > > + * Generate a unique id for each bi-directional CTB for each pair of
> > > + * near and far tiles/devices. The id can then be used as an index into
> > > + * a single allocation that is sub-divided into multiple CTBs.
> > > + *
> > > + * For example, with two devices per tile and two tiles, the table should
> > > + * look like:
> > > + *           Far <tile>.<dev>
> > > + *         0.0   0.1   1.0   1.1
> > > + * N 0.0  --/-- 00/01 02/03 04/05
> > > + * e 0.1  01/00 --/-- 06/07 08/09
> > > + * a 1.0  03/02 07/06 --/-- 10/11
> > > + * r 1.1  05/04 09/08 11/10 --/--
> > > + *
> > > + * Where each entry is Rx/Tx channel id.
> > > + *
> > > + * So GuC #3 (tile 1, dev 1) talking to GuC #2 (tile 1, dev 0) would
> > > + * be reading from channel #11 and writing to channel #10. Whereas,
> > > + * GuC #2 talking to GuC #3 would be read on #10 and write to #11.
> > > + */
> > > +static unsigned int g2g_slot(u32 near_tile, u32 near_dev, u32 far_tile, u32 far_dev,
> > > +			     u32 type, u32 max_inst, bool have_dev)
> > > +{
> > This function makes my head hurt but I don't have any other suggestions.
> > 
> > > +	u32 near = near_tile, far = far_tile;
> > > +	u32 idx = 0;
> > > +	int i;
> > > +
> > > +	if (have_dev) {
> > > +		near = (near << 1) | near_dev;
> > > +		far = (far << 1) | far_dev;
> > > +	}
> > > +
> > > +	if (far > near) {
> > > +		for (i = near; i > 0; i--)
> > > +			idx += max_inst - i;
> > > +		idx += (far - 1 - near);
> > > +		idx *= 2;
> > > +		idx += type;
> > > +		return idx;
> > > +	}
> > > +
> > > +	if (far < near) {
> > > +		for (i = far; i > 0; i--)
> > > +			idx += max_inst - i;
> > > +		idx += (near - 1 - far);
> > > +		idx *= 2;
> > > +		idx += (1 - type);
> > > +		return idx;
> > > +	}
> > > +
> > > +	return -1;
> > > +}
> > > +
> > > +static int guc_g2g_register(struct xe_guc *near_guc, struct xe_gt *far_gt, u32 type, bool have_dev)
> > > +{
> > > +	struct xe_gt *near_gt = guc_to_gt(near_guc);
> > > +	struct xe_device *xe = gt_to_xe(near_gt);
> > > +	struct xe_bo *g2g_bo;
> > > +	u32 near_tile = gt_to_tile(near_gt)->id;
> > > +	u32 near_dev = G2G_DEV(near_gt);
> > > +	u32 far_tile = gt_to_tile(far_gt)->id;
> > > +	u32 far_dev = G2G_DEV(far_gt);
> > > +	u32 max = xe->info.gt_count;
> > > +	u32 base, desc, buf;
> > > +	int slot;
> > > +
> > > +	xe_assert(xe, xe == gt_to_xe(far_gt));
> > > +
> > > +	g2g_bo = near_guc->g2g.bo;
> > > +	xe_assert(xe, g2g_bo);
> > > +
> > > +	slot = g2g_slot(near_tile, near_dev, far_tile, far_dev, type, max, have_dev);
> > > +	xe_assert(xe, slot >= 0);
> > > +
> > > +	base = guc_bo_ggtt_addr(near_guc, g2g_bo);
> > > +	desc = base + slot * G2G_DESC_SIZE;
> > > +	buf = base + slot * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE;
> > > +
> > > +	xe_assert(xe, (desc - base + G2G_DESC_SIZE) <= G2G_DESC_AREA_SIZE);
> > > +	xe_assert(xe, (buf - base + G2G_BUFFER_SIZE) <= g2g_bo->size);
> > > +
> > > +	return guc_action_register_g2g_buffer(near_guc, type, far_tile, far_dev,
> > > +					      desc, buf, G2G_BUFFER_SIZE);
> > > +}
> > > +
> > > +static void guc_g2g_deregister(struct xe_guc *guc, u32 far_tile, u32 far_dev, u32 type)
> > > +{
> > > +	guc_action_deregister_g2g_buffer(guc, type, far_tile, far_dev);
> > > +}
> > > +
> > > +static u32 guc_g2g_size(struct xe_guc *guc)
> > > +{
> > > +	struct xe_gt *gt = guc_to_gt(guc);
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	unsigned int count = xe->info.gt_count;
> > > +	u32 num_channels = (count * (count - 1)) / 2;
> > > +
> > > +	return num_channels * XE_G2G_TYPE_LIMIT * G2G_BUFFER_SIZE + G2G_DESC_AREA_SIZE;
> > > +}
> > > +
> > > +static bool xe_guc_g2g_wanted(struct xe_device *xe)
> > > +{
> > > +	/* Can't do GuC to GuC communication if there is only one GuC */
> > > +	if (xe->info.gt_count <= 1)
> > > +		return false;
> > > +
> > > +	/* No current user */
> > > +	return false;
> > > +}
> > > +
> > > +static int guc_g2g_alloc(struct xe_guc *guc)
> > > +{
> > > +	struct xe_gt *gt = guc_to_gt(guc);
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	struct xe_tile *tile = gt_to_tile(gt);
> > > +	struct xe_bo *bo;
> > > +	u32 g2g_size;
> > > +
> > > +	if (guc->g2g.bo)
> > > +		return 0;
> > > +
> > > +	if (gt->info.id != 0) {
> > > +		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
> > > +		struct xe_guc *root_guc = &root_gt->uc.guc;
> > > +		struct xe_bo *bo;
> > > +
> > > +		bo = xe_bo_get(root_guc->g2g.bo);
> > > +		if (IS_ERR(bo))
> > > +			return PTR_ERR(bo);
> > A few things.
> > 
> > - xe_bo_get returns BO or NULL.
> Meaning just use if(bo) rather than the IS_ERR wrapper?
> 

Yes but if(!bo) is the error case. Assuming a typo on your end.

> > - Checking the return seems overkill
> Seems wrong to not return an error if there is no allocation. E.g. just
> change it to 'return -ENODEV' or some such if the bo is null?
> 

That's fine if want to leave in the error case but tons of places in
driver don't have this check. Maybe that is an oversight though in some
cases. Some cases we are in a non-failure path though. It can only
return NULL if argument is NULL.

> > - I don't see an associated xe_bo_put
> > - Do we even need a reference? i.e. The clean up is handled by DRM managed on driver unload.
> Technically, the get is not required at present if the secondary GTs can all
> assume that the root GT is guaranteed to be holding its reference at all
> times. It seems cleaner (and more future proof) to not make such
> assumptions, though. Just have each GT look after its own usages and
> requirements.
> 
> And yes, there is currently no put because everything just magically
> vanishes on driver unload (same as per a whole bunch of other driver

That function only drops a ref, so if you don't have put the BO will
never actually get destroyed. I'd expect if you load the driver on a
multt-GT device with this series and then unload it you will get loud
complaints in dmesg unless I'm missing something. So if you leave in the
get, you need put unless I'm missing something.

Matt

> internal BOs). The selftest does require dynamically releasing and
> re-allocating the shared BO in various different configurations, though
> (including different per GT splits that mean the root GT isn't necessarily
> owning the allocation, it might not even have an allocation). That code
> isn't included in this patch set at present for a bunch of 'not ready'
> reasons.
> 
> > 
> > > +
> > > +		guc->g2g.bo = bo;
> > > +		guc->g2g.owned = false;
> > > +		return 0;
> > > +	}
> > > +
> > > +	g2g_size = guc_g2g_size(guc);
> > > +	bo = xe_managed_bo_create_pin_map(xe, tile, g2g_size,
> > > +					  XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> > > +					  XE_BO_FLAG_GGTT |
> > > +					  XE_BO_FLAG_GGTT_ALL |
> > > +					  XE_BO_FLAG_GGTT_INVALIDATE);
> > > +	if (IS_ERR(bo))
> > > +		return PTR_ERR(bo);
> > > +
> > > +	xe_map_memset(xe, &bo->vmap, 0, 0, g2g_size);
> > > +	guc->g2g.bo = bo;
> > > +	guc->g2g.owned = true;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int guc_g2g_start(struct xe_guc *guc)
> > > +{
> > > +	struct xe_gt *far_gt, *gt = guc_to_gt(guc);
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	unsigned int i, j;
> > > +	int t, err;
> > > +	bool have_dev;
> > > +
> > > +	if (!guc->g2g.bo) {
> > > +		int ret;
> > > +
> > > +		ret = guc_g2g_alloc(guc);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	/* GuC interface will need extending if more GT device types are ever created. */
> > > +	xe_gt_assert(gt, (gt->info.type == XE_GT_TYPE_MAIN) || (gt->info.type == XE_GT_TYPE_MEDIA));
> > > +
> > > +	/* Channel numbering depends on whether there are multiple GTs per tile */
> > > +	have_dev = xe->info.gt_count > xe->info.tile_count;
> > > +
> > > +	for_each_gt(far_gt, xe, i) {
> > > +		u32 far_tile, far_dev;
> > > +
> > > +		if (far_gt->info.id == gt->info.id)
> > > +			continue;
> > > +
> > > +		far_tile = gt_to_tile(far_gt)->id;
> > > +		far_dev = G2G_DEV(far_gt);
> > > +
> > > +		for (t = 0; t < XE_G2G_TYPE_LIMIT; t++) {
> > > +			err = guc_g2g_register(guc, far_gt, t, have_dev);
> > > +			if (err) {
> > > +				while (--t >= 0)
> > > +					guc_g2g_deregister(guc, far_tile, far_dev, t);
> > > +				goto err_deregister;
> > > +			}
> > > +		}
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +err_deregister:
> > > +	for_each_gt(far_gt, xe, j) {
> > > +		u32 tile, dev;
> > > +
> > > +		if (far_gt->info.id == gt->info.id)
> > > +			continue;
> > > +
> > > +		if (j >= i)
> > > +			break;
> > > +
> > > +		tile = gt_to_tile(far_gt)->id;
> > > +		dev = G2G_DEV(far_gt);
> > > +
> > > +		for (t = 0; t < XE_G2G_TYPE_LIMIT; t++)
> > > +			guc_g2g_deregister(guc, tile, dev, t);
> > > +	}
> > > +
> > > +	return err;
> > > +}
> > > +
> > >   static void guc_fini_hw(void *arg)
> > >   {
> > >   	struct xe_guc *guc = arg;
> > > @@ -423,7 +688,16 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> > >   int xe_guc_post_load_init(struct xe_guc *guc)
> > >   {
> > > +	int ret;
> > > +
> > >   	xe_guc_ads_populate_post_load(&guc->ads);
> > > +
> > > +	if (xe_guc_g2g_wanted(guc_to_xe(guc))) {
> > > +		ret = guc_g2g_start(guc);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > >   	guc->submission_state.enabled = true;
> > >   	return 0;
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> > > index fa75f57bf5da..83a41ebcdc91 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> > > @@ -64,6 +64,15 @@ struct xe_guc {
> > >   	struct xe_guc_pc pc;
> > >   	/** @dbm: GuC Doorbell Manager */
> > >   	struct xe_guc_db_mgr dbm;
> > > +
> > > +	/** @g2g: GuC to GuC communication state */
> > > +	struct {
> > > +		/** @g2g.bo: Storage for GuC to GuC communication channels */
> > > +		struct xe_bo *bo;
> > > +		/** @g2g.owned: Is the BO owned by this GT or just mapped in */
> > > +		bool owned;
> > > +	} g2g;
> > > +
> > >   	/** @submission_state: GuC submission state */
> > >   	struct {
> > >   		/** @submission_state.idm: GuC context ID Manager */
> > > @@ -79,6 +88,7 @@ struct xe_guc {
> > >   		/** @submission_state.fini_wq: submit fini wait queue */
> > >   		wait_queue_head_t fini_wq;
> > >   	} submission_state;
> > > +
> > Unrelated.
> Sort of. If the coding style is to have blank lines between sub-structs then
> adding the g2g struct ahead of submission_state gives it a blank line above
> but not below, which is therefore wrong because it is both mis-matched start
> vs end and not following the style guide. On the other hand, if blank lines
> should not be included at all then the lines before/after the g2g struct
> should be dropped.
> 
> John.
> 
> > 
> > Matt
> > 
> > >   	/** @hwconfig: Hardware config state */
> > >   	struct {
> > >   		/** @hwconfig.bo: buffer object of the hardware config */
> > > -- 
> > > 2.47.0
> > > 
> 
