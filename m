Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05585C4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 22:04:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C77810E811;
	Thu,  1 Feb 2024 22:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXz55CZ4";
	dkim-atps=neutral
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 22:04:43 UTC
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54A410E811
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 22:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706825084; x=1738361084;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yYhfFWoTquKTUdyHAnkNeey68HfDOgzjBzl0lJwoGUQ=;
 b=OXz55CZ4e2Sr6ZIcspFoFQX9myJ/qX4+kpbfmheBWwUXrBl+bMd4j2Ai
 a3mIw/FCgD4zOXGtnh2KXD5kIVNkRmvsrqcqdFUqr7IyQ0lZkiroith+W
 g8LOShRfep3vS3l6kODo1qSPuQZs7NyXBmeR8H4Xq519F+jWaEZ7aIr25
 1ZhSpeZyuIjph81rIhirhjklpQgP6s5x2QIMTH0xe1vxTm7s7gVuhJZF/
 MEY0T9N6oXbslBkoqcjUDXNfNFaO2+7aHAW7Ld0gr7cmQplEByWZUIe8m
 jz6FudSCzPlG1If/I9eNKEX3nJHQs8hDjSTL2fRqMVfAX1s9GGDADgupA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="199765"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="199765"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 13:57:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="912261173"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="912261173"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 13:57:32 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 13:57:32 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 13:57:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 13:57:32 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 13:57:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8Kr5mYbB1h4swkYONdwk8ejSgILLw2lAtRvm8sjQpoPByhKu4A5sDi3bhSMom72IeQDiJ4LMbmfVT8+TN7rKnzVttikpsNHCsMcNA+C7cTSeo0VNmyBK4can/dHZMcHcY0qWzxHaRc4xD482KYnoGZ04Z+e+WgXsLZ9+nmup5xp3y99vo2Lqd/e6EBmfAPpbGYca+63IDjF1+6Syj4xGIHlcIfaAIpPN+a+xVuI/xXRJ0Aj2ZqtkFk8xVdigHraBCY92KbxyIXo/rvTL6Jv389MJCxsjg2nkT4TV4yAtYcDS/RxWMyO28f3fGUncRddIu2hLh2HNIy3gXdXx+mJrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3G0R1jjQ0xP2Rc7co8Th+U96yazZKGPu551FseVm9XY=;
 b=Sec8jfrIUer+wEfSvO00du7kUCft61JrHhrdRfelkJz21WSVtP5OwF/9xX0nnQ4eiK9hz/p+8Ec4gHRxhkaro3n382L0HTuAeaIR9aUO418vnMYUil/1CSBWNW9fi+S2GVMxDZQ0hAP6eWVIRoiRcIBB1QXCwt+YBPDDZFJ91tPWLVBUapRycWJVqIWqac01R5Wa0BQjihMv+iFDNtUXFemQuGOTi8ZccLDBwAePS+Q8qxkdrGg1lUmeZtwBLgoXOgSVnpZvJrMdk+C1injFlQVMJar4utDBS/90fxtol7EKs+FBiXud8e4K9Jpu7tI+PCLZsKVHTIUCyJDo82bQ3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7108.namprd11.prod.outlook.com (2603:10b6:930:50::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Thu, 1 Feb
 2024 21:57:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.029; Thu, 1 Feb 2024
 21:57:30 +0000
Date: Thu, 1 Feb 2024 16:57:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Brian Welty <brian.welty@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: Re: Re: [PATCH 1/4] drm/xe/guc: Allocate GuC data structures in
 system memory for initial load
Message-ID: <ZbwTxSYFyERYDp0g@intel.com>
References: <20240129130308.3544466-1-michal.winiarski@intel.com>
 <20240129130308.3544466-2-michal.winiarski@intel.com>
 <ZbvWlEXjQz+7/iWQ@DUT025-TGLU.fm.intel.com>
 <vbsgkhdcgtpndbhbqpxv6wurmeuxzvgvrnjdhoarlztajbydke@bw5uym2eomjo>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <vbsgkhdcgtpndbhbqpxv6wurmeuxzvgvrnjdhoarlztajbydke@bw5uym2eomjo>
X-ClientProxiedBy: BY3PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:a03:255::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: c1afb88f-0e89-4e08-47f3-08dc2370c926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZuLXBuxapRiEi4D59batawIqbdt2aMQfpPFw56f525tgQyQP/fYpblGcSa/LpEh+yQElW/SICrrzPlFggMF7IPIXkK6cPmaMtG4VFmR7UlVUFD0/cEDQTuRx2c1P/OksmPXODMGDiXkkkvh2AcaU0YoHUAVMrQvcgK+41rj7QEhwftQ/PjIdUFC7cPRjsDyitoyTUaDHdWFUEi835IlDwGApeyXtz6YiZtiHcKk/F/vnfg22bXV5MRGAc2y9JYiIKAriljbK0IgKXwAww/zFT/ZDuhN1xl9GKwUQF7yKITZ7miNgeJBd+3IjuZ7Gu+YpH4XgV1nOgnNQCY+gfPJGAywHevna9n6LFs//05S93hkLXcV713dOcF3cfyoXe/lBrn3LTJxVfzOe94/v4ycwaC5bkOJJo530XkrjpejlIzLFmk6CHKaYzaIjzGWy/8kOkfn63bEFNK7k8YxgUGUk6FJh+akl8874q/mqVnUWzG5Y7SL6Z56z2ZKTx9Fpi00G4eKt5Kt+wRj4Fp9gyjsG+crDHku4MdXVO96tykW8DmFASdEsahzadazgynSGkCFRRybv5AlPJjs/Vl2zTO7d4A1KUagMATqTSrFKUoG62Dw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(39860400002)(346002)(396003)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(41300700001)(66946007)(6666004)(66556008)(6506007)(2906002)(44832011)(4326008)(6862004)(6486002)(8676002)(37006003)(316002)(54906003)(26005)(2616005)(6636002)(5660300002)(6512007)(8936002)(66476007)(38100700002)(83380400001)(82960400001)(478600001)(86362001)(36756003)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDJ4d3M0cGlkYldkbURLcWZlcitlYUhoUjBoNkxIYVB4Uk00Q2VBNFVwelE0?=
 =?utf-8?B?NE1SWjdHekZRaTQyYXAzUExLZm9DN041Qk0zSlVnRWhSdFpoaGtrWUVzZmlP?=
 =?utf-8?B?bzU5SUZrbGFUcktMZ0x0dVN5bHExTllUZkZOWjIwSHJyZTlCbUt4U0V0djdF?=
 =?utf-8?B?WE9wQ0tMWDFCc2xweFdaS1k5RW1hYXlSS0IydnFWVWE0N2lSbm9pYndKZkE0?=
 =?utf-8?B?ZmlJcU9NcURwaVNjM29qUjlnTkxpMjRBeEcyVk0vejVmQ1RvRytCMXNQT0kr?=
 =?utf-8?B?bVI1aXFJUW1LVkhveU5iTkIrWDRDSjJteE0vcWFiYjNnQWJoMmJDZ2tVaG5m?=
 =?utf-8?B?VnNSRGorTGNlMm1xUkUvQmdrSjVqMjJ5dlFob2dmdWVzTjhjd1R5Y3NBazRa?=
 =?utf-8?B?VWE1TjFDeGpzSFdWTVVxRzRTTGpCYlliMkUvaGR3ODltV1VTa3BSRFlPUmFi?=
 =?utf-8?B?VTl4MlVBd2VWNTFCaURFeGhQdFFUZ01nQWpXWEwwOVRzY3VrLzgzM3d2UCtw?=
 =?utf-8?B?TUd6Q0IvaUZURnVZd2dmN012TGVpbjhueWREeHNtOCsxWVg5cUZnbEdialp6?=
 =?utf-8?B?dlUxQXQrM0g2eU9wcDMxMFo5VXZ1ZmdUZFJzekZhYzlOU3BZVVViUVA3QjNt?=
 =?utf-8?B?UXVyU04wbGwvc2FPUWVaM1NYdmVZVTZYVW1YRWRJd3BQWTdCRGM4NjhmeWEy?=
 =?utf-8?B?cmViaG1KZk1RaFp6T2VHRitxbzlLSVR1YTZ3R2pqZWpMVDJ2bkhQemw2a1Vm?=
 =?utf-8?B?QXgyNmdIcGRHdjJWNmpENW1HWDNpU3hncGtYNjE0YTV4SnRSa0pNWXpIdyt5?=
 =?utf-8?B?dzNUdFNwemo3L2RSWG5DQXhnRFEyTUhpdXZWTnRaUzNFSFV2ZTdGZkxOd0E4?=
 =?utf-8?B?dlcwQzdIR1dBTG0rNllpK25DQlg1L25pQ0FKY1l1L241OFVhNmNqWHFuekF2?=
 =?utf-8?B?enViMi84d1pvNGVZUkg1aHJnUEowcE80TzVZamN3cHRUeFd2cENZdlpOL1I0?=
 =?utf-8?B?REJDc3VxMUJrMTFMcStpbzVIdEdmNFl0c0FXTFZJa2dnRVF5R0lnaXdZVGFl?=
 =?utf-8?B?Y1F0cDZJQjBaWDZGVEFrTDdDQTdOU0pia1FtSzF3bEhnK3VnTHVJRWtRNElM?=
 =?utf-8?B?MzE1MW92NExjK01YVFdqQTJYaGVrd3hpbXR5T2g3NlhBajBUNy9JL3FVZ1VU?=
 =?utf-8?B?cm1SMG1vcTVqN0FSc0sycVc1aWkxTE1Fd1lvRWRic0xqOENhR1VwaUlMQ3po?=
 =?utf-8?B?SENCSDFxMjJyR3lHUjBwcXE3OGRPc3ZjMGhDbFNvTDJsRUNtQkQ5TDBFU1d6?=
 =?utf-8?B?SFBwQ2Z5QnlBTUM3anFEazRHbEtrM2d1SnlOVjJjcWFmM2J6aURqY04rYTV2?=
 =?utf-8?B?Q0EreE8xd09hZU8vTDI0OVFnZVZNZWxjSCtwMzc0cmdzTjA0Vi9pQTRnbk45?=
 =?utf-8?B?bWZtblM4Y2ZteFQzS0lJNnFETldPY21tWkRaZXVuUy8wV3FCSmFkUW5NUGoz?=
 =?utf-8?B?a25WQkFDV0NTMFdwZDFURlVMMVYwTFNuWEVYbS9GdDhKb0IrT3ZWTXgwTE93?=
 =?utf-8?B?bGtlWUxTbmFwbmtlVU1zck0yc2Npem1FcmNOUEFhSlBYU09iRWJpdXcvZW9H?=
 =?utf-8?B?b2RTU2o0MTJkMjRYck9ta3pwbDZOWThDNHFLUFpEVDRWbU5ORW50NHNUNWlM?=
 =?utf-8?B?b3NzV3RTeklrMGdmQ2lNRHcxRjFzSU44aFJjK0hTa1N0YUpCOS80WWt1MnNW?=
 =?utf-8?B?YTJoeWloK3hsTk4rVFVLUTQ5Y2JGZGVRY0tZbFpqa0tvMU5acnExYXFoSUlV?=
 =?utf-8?B?aGVMRFNIVUVzcTVDRHE5QjZJNDErSkdhQ1Z4TDJSTlBKanlJNjNvSDc1RWZL?=
 =?utf-8?B?UnluaU0zYk81NGo0K0IraWlHTkVmelN1L0h5cDE2L2RrZURKcEkrS2JNak5j?=
 =?utf-8?B?d0tYUTAxN1lGbnphdUhJSGNHTnR5VWxJbnVFdEJ2SVF5SlMvcHVPdkRCY0Fp?=
 =?utf-8?B?MGpyRUY0MnRYYXFjdldySmRvMWVBNFpSd1o2bkVyNFdLeGVCOE5qYXZoVzNQ?=
 =?utf-8?B?WldBQlY1Q1JRZk1RN2c4ZHc3MVJyM2xyd1NPQ1pSTnVBY2ZCWjVNRUhvb3J6?=
 =?utf-8?Q?pgHpTgwhnPS+XKHcUqjsIw5z/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1afb88f-0e89-4e08-47f3-08dc2370c926
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 21:57:29.9873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6TlJkE6viAHEElVFzaewUgKDorGse9RacBSoT5bcDmToMExFuoevGUFYyakAXwhLxS0mTdH4T+YAF2YgaXlmuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7108
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

On Thu, Feb 01, 2024 at 09:25:38PM +0100, Michał Winiarski wrote:
> On Thu, Feb 01, 2024 at 05:36:20PM +0000, Matthew Brost wrote:
> > On Mon, Jan 29, 2024 at 02:03:05PM +0100, Michał Winiarski wrote:
> > > GuC load will need to happen at an earlier point in probe, where local
> > > memory is not yet available. Use system memory for GuC data structures
> > > used for initial "hwconfig" load, and realloc at a later,
> > > "post-hwconfig" load if needed, when local memory is available.
> > > 
> > > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c           | 32 ++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_bo.h           |  1 +
> > >  drivers/gpu/drm/xe/xe_guc.c          | 34 ++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/xe/xe_guc_ads.c      |  2 +-
> > >  drivers/gpu/drm/xe/xe_guc_ct.c       |  2 +-
> > >  drivers/gpu/drm/xe/xe_guc_hwconfig.c |  2 +-
> > >  drivers/gpu/drm/xe/xe_guc_log.c      |  2 +-
> > >  7 files changed, 71 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index d6a193060cc0b..7df87fbad0938 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -1605,6 +1605,38 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
> > >  	return bo;
> > >  }
> > >  
> > > +/**
> > > + * xe_managed_bo_reinit_in_vram
> > > + * @xe: xe device
> > > + * @tile: Tile where the new buffer will be created
> > > + * @src: Managed buffer object allocated in system memory
> > > + *
> > > + * Replace a managed src buffer object allocated in system memory with a new
> > > + * one allocated in vram, copying the data between them.
> > > + * Buffer object in VRAM is not going to have the same GGTT address, the caller
> > > + * is responsible for making sure that any old references to it are updated.
> > > + *
> > > + * Returns 0 for success, negative error code otherwise.
> > > + */
> > > +int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src)
> > > +{
> > > +	struct xe_bo *bo;
> > > +
> > > +	xe_assert(xe, IS_DGFX(xe));
> > > +	xe_assert(xe, !(*src)->vmap.is_iomem);
> > > +
> > > +	bo = xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr, (*src)->size,
> > > +					    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > > +					    XE_BO_CREATE_GGTT_BIT);
> > > +	if (IS_ERR(bo))
> > > +		return PTR_ERR(bo);
> > > +
> > > +	drmm_release_action(&xe->drm, __xe_bo_unpin_map_no_vm, *src);
> > 
> > Should we not destroy / release the *src BO here?
> > 
> > Matt
> 
> That's what the __xe_bo_unpin_map_no_vm is doing. When the BO is
> allocated using xe_managed_bo_create_from_data, __xe_bo_unpin_map_no_vm
> action is added as DRM managed resource to automatically destroy the BO.
> With drmm_release_action, we're calling it immediately (and remove the
> action from the managed resources list - so that it won't be called when
> the underlying DRM device gets released).

This indeed looks correct to me:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Thanks,
> -Michał
> 
> > 
> > > +	*src = bo;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  /*
> > >   * XXX: This is in the VM bind data path, likely should calculate this once and
> > >   * store, with a recalculation if the BO is moved.
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > > index db4b2db6b0730..ff919a836d163 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > @@ -129,6 +129,7 @@ struct xe_bo *xe_managed_bo_create_pin_map(struct xe_device *xe, struct xe_tile
> > >  					   size_t size, u32 flags);
> > >  struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_tile *tile,
> > >  					     const void *data, size_t size, u32 flags);
> > > +int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);
> > >  
> > >  int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
> > >  			      u32 bo_flags);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > index fcb8a9efac704..9b9a1252f3090 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -272,6 +272,34 @@ void xe_guc_comm_init_early(struct xe_guc *guc)
> > >  		guc->notify_reg = GUC_HOST_INTERRUPT;
> > >  }
> > >  
> > > +static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
> > > +{
> > > +	struct xe_tile *tile = gt_to_tile(guc_to_gt(guc));
> > > +	struct xe_device *xe = guc_to_xe(guc);
> > > +	int ret;
> > > +
> > > +	if (!IS_DGFX(guc_to_xe(guc)))
> > > +		return 0;
> > > +
> > > +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->fw.bo);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->log.bo);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.bo);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ct.bo);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >  int xe_guc_init(struct xe_guc *guc)
> > >  {
> > >  	struct xe_device *xe = guc_to_xe(guc);
> > > @@ -331,6 +359,12 @@ int xe_guc_init(struct xe_guc *guc)
> > >   */
> > >  int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> > >  {
> > > +	int ret;
> > > +
> > > +	ret = xe_guc_realloc_post_hwconfig(guc);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > >  	guc_init_params_post_hwconfig(guc);
> > >  
> > >  	return xe_guc_ads_init_post_hwconfig(&guc->ads);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > index 390e6f1bf4e1c..6ad4c1a90a787 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > @@ -273,7 +273,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
> > >  	ads->regset_size = calculate_regset_size(gt);
> > >  
> > >  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ads_size(ads) + MAX_GOLDEN_LRC_SIZE,
> > > -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > > +					  XE_BO_CREATE_SYSTEM_BIT |
> > >  					  XE_BO_CREATE_GGTT_BIT);
> > >  	if (IS_ERR(bo))
> > >  		return PTR_ERR(bo);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index f3d356383cedf..355edd4d758af 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -155,7 +155,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> > >  	primelockdep(ct);
> > >  
> > >  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> > > -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > > +					  XE_BO_CREATE_SYSTEM_BIT |
> > >  					  XE_BO_CREATE_GGTT_BIT);
> > >  	if (IS_ERR(bo))
> > >  		return PTR_ERR(bo);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > index 2a13a00917f8c..ea49f3885c108 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > > @@ -78,7 +78,7 @@ int xe_guc_hwconfig_init(struct xe_guc *guc)
> > >  		return -EINVAL;
> > >  
> > >  	bo = xe_managed_bo_create_pin_map(xe, tile, PAGE_ALIGN(size),
> > > -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > > +					  XE_BO_CREATE_SYSTEM_BIT |
> > >  					  XE_BO_CREATE_GGTT_BIT);
> > >  	if (IS_ERR(bo))
> > >  		return PTR_ERR(bo);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > > index bcd2f4d34081d..45135c3520e54 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > > @@ -84,7 +84,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
> > >  	struct xe_bo *bo;
> > >  
> > >  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
> > > -					  XE_BO_CREATE_VRAM_IF_DGFX(tile) |
> > > +					  XE_BO_CREATE_SYSTEM_BIT |
> > >  					  XE_BO_CREATE_GGTT_BIT);
> > >  	if (IS_ERR(bo))
> > >  		return PTR_ERR(bo);
> > > -- 
> > > 2.43.0
> > > 
