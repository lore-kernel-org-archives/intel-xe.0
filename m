Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4AFC88E5C
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 14:16:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34A510E12D;
	Wed, 16 Sep 2026 14:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVXpmrCP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E712B10E12D;
 Wed, 16 Sep 2026 14:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789568212; x=1821104212;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dHdjUKMvfpftGILr+GtEiMTDUdcvqZ3pIsBduXKOtIg=;
 b=YVXpmrCPFNN7N0krc3iorF5qL37CuUxtWsIfvsLKH0NEnAei/mmB2/tj
 SfzK+U2TQ49onWPpnUDjhxHD4Vi5Mi6m1O+pcG9N/tuWSe0pAcsFhGTD4
 69vwbkk0wB71u98ObS8Zj61K68mTCJbzCzlB8Q7IAL0WFU4ICYCEAZCK7
 cl9ajfd396HZj1aKfuJxy0WumPc6tLjf8fDTzHk+06r18ZbLA0FqXx2+H
 24CD5Wl1vWgWZE+fvq7UHQE88ISLmKfGkteA3ktUsCuH3kb1tFv9DSX+Y
 vTww3YHaclyo4phUKtKFu5cLV07iYhvOed7dH+sfyTEk4C4sd4Dpz0DQw A==;
X-CSE-ConnectionGUID: VuF5ObgYRqWOHU5TiVcP9Q==
X-CSE-MsgGUID: HGWsoZVkRvmVmXpS9JN9xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89884156"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89884156"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 07:16:52 -0700
X-CSE-ConnectionGUID: iczTKUjbQ0+LUNgZgjQg7A==
X-CSE-MsgGUID: 1andiZniTHCXZXaLjIjDmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277481587"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 07:16:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 07:16:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 07:16:51 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 07:16:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPa15DTQkoVZZMy4AljDUBuUGXO/9L3xe1olq0HNV91kAHCS9ESL5FKVXBUK7zIEOL67qJZn/WScU7jytZ0NMzIuFhTb+hh9W8zUgPfQjrRAWDOq+4C/0iPLnUpxkGBhK+fMQk5tIkJRHRujUJCHFsaR6ikdQoe/QHvD8FguoQU89iM2reuLvVh92uG9bf2Wjqbed7qMcXLYMrwo2dXYI7xutiSFE7ltorhpCLSnewkfVlKZtg+VBCU9KpyUVrTrfILtcIpFpU+pk/IPu2XptYRefwS5yjR2eAY0xUSrP/qqzNvHZbOxHe7edzsyuu5oB3BVPQtgIZGxZmthe7aYXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZSFjnfG8Kc18X/0gPapv+jm8gqILjGBZmH51+zo8OA=;
 b=YzEwznjptfpX0m8QSh62Xzd37X9winPxwuI0nCsDbq+ewazExgIAzP+NfckJVxbcMElEcN48Cnkg8QlR61Zgt9Z57eW2TQPWtGBIZTgvr13d+M2dpaEffykYwk76G1nkpwZWAweomktj1durwHVIKqoGaQbM/zK1GDMlv8N0yfL9BczY9l3LAbCjttqxHnga7Wjpy2tUD1oNWWpWA14FqSnnsQEtoSryniqOMM0PxPlY0jqKTEeEPwrqM/UarWBQONJMn2zr/GUz+Sah7z16sqJQnUgUDgOggo4f3+MROxhleCVSy68EMDLyXq5k0+y5B8tRt7TSiSQSeIWgo3Ii0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by DS6PR11MB517798.namprd11.prod.outlook.com (2603:10b6:8:4c5::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 14:16:47 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 14:16:47 +0000
Date: Wed, 16 Sep 2026 10:16:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Subject: Re: [PATCH v8 1/5] drm/xe/pm: introduce PM PME support
Message-ID: <aqqky2AJ83MWU36q@intel.com>
References: <20260915092518.639448-1-vinod.govindapillai@intel.com>
 <20260915092518.639448-2-vinod.govindapillai@intel.com>
 <7f970736cd33b3bf749f538a6da927613d918369.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f970736cd33b3bf749f538a6da927613d918369.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::34) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|DS6PR11MB517798:EE_
X-MS-Office365-Filtering-Correlation-Id: c24e94c5-40cb-4c6d-63ae-08df13fd246a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|4143699003|6133799003|3023799007|18002099003|10067099003|56012099006|5023799004|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info: EQ4aFLSyfNG1yHWF77+fhyksvmtDLWQRuTWgrVamKlP4UbrhgR/TZDPLWzExzTNBB3ZN2DixmGVGlGAFq6rw62PxtkfknA2OP1ASge6rPtlpuoDcN4aypVdPpTSMh40GN0zKeAMjrqg43YvSBXopeUcXAJo2jMHIXMnWwf8Wjl/3IZfhvIVOdI5VAG7W4OcIIFcJXTchXbybKL6SKxdOZ86wkFlC90xE6c/bBHqZTUlcLocf7JEsnQbPHLnPhhwKtiqMnTlOFxy69xQGyYStYefCgvpnTTZvAGKJG+Ix18npqpRohirFQAqUlefTJbf1N5Pldm+jt+B8/CnnezLRFd4c06wtOUnxo2YcihrZ4gnYNbiqS8NQ91u2QvuFg6VzE59zse3PYlbvhpE0DtTAw8+mXIGCsqN1G92fGDDxZgMDYN/vvARN+Dne3zh0/USSpW9zoTlbDGy6QI8Q9LIcCfMsLh/46F7oJ3p26q1ott0WXSWo8dbLIdX07Nw3c0xi6/rXV7tzJ0s49L6ZpcVOOu7/flqiWwPehFdVARJ90s0R04gAbE4+EMByjNupwWSPEwLTbqtSF75KFj6aeZRYcFLZtYUOeoTlvbJfWlMU3TmhycMdQfnSi1PSt/0TjDwqCHc1Zd2T9lGyHXlyYMA2lkdkyetmH6gfny3A5QAXrH0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(6133799003)(3023799007)(18002099003)(10067099003)(56012099006)(5023799004)(11063799006)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?utcs0BGCeInkvluvdjrFNKQiMdWiBQlzOSzsKzNnwCG7/M3ZB6FY9Pmkwi?=
 =?iso-8859-1?Q?JEm0klpomrL8uClOWZQwLsojiHaT2pc5MAdpk8ffMRGm0n9Eo5Vi71Bqe6?=
 =?iso-8859-1?Q?Saobvp+nHXIIWIoVxDT8Bxu/XFn1zqg4CU/wXSdszxrf61bfXghk+6stSn?=
 =?iso-8859-1?Q?FrX+yCelJeJqwX3k2UyJpvjrQq7d2Ewv4GshoQj4ADaPy01vsxmKA1mrw5?=
 =?iso-8859-1?Q?J3Moeu8YkeVrdWAgo3/ngyZe31qOr9TI1hjQ23P4vNla7J//n798xfQAk6?=
 =?iso-8859-1?Q?XVDmcbTGb/m6QLO7LjA8iZ/fD0eTnZILkB0ix7PAS0i7iZJMvotGklSKi4?=
 =?iso-8859-1?Q?wkgvR1DYLNGzLN4IJUn6PVvQEdM5D69WmamTTiZRFem/cgeJj0xiB556bq?=
 =?iso-8859-1?Q?2JJYN+jK1Oj6+IAiO+bmjyzuiDE48XSRqCXrzH8ukz396BTfKLNRANEcPu?=
 =?iso-8859-1?Q?7LHjpd5cQMuvA4VyEyZIuDnhoZUIoEoVdsczOxZRHdNadv4pQ1FWbhltcP?=
 =?iso-8859-1?Q?qWxJ1LS0FvGYgJ0ryU+6K5an1FptkEAfHYl2BuvCDwBroLF2ZycjDUGJly?=
 =?iso-8859-1?Q?Bj39oJFe//Q4brXm6ay/29Tg7qazVLNrSiF7fOJIuRiSf7iClGfVZzYsSd?=
 =?iso-8859-1?Q?sfhouYlermAayQO0zgW5nTpRoAcQtXJfv765PLrdejhCDEAEBexQxe8Ib3?=
 =?iso-8859-1?Q?izq/C20wfj/yLiq40Q8sDZUzs3KLAHQA/ojGfAiCap8XqV7/WfuxacbTuE?=
 =?iso-8859-1?Q?IzbGOa45zdGG2G/V9f1+q6zBxyUzyaHW7zo1nXMgq4A+RRArmVUMp3+xOi?=
 =?iso-8859-1?Q?rPObIpu35ImG3fgphK72zVztAwjbNqqjje3G+P4HmszWo/2BevWEcMNKvw?=
 =?iso-8859-1?Q?BkNHFvZEO2B854CQu3Q75srNNz4oC+41jL7xCpJd8wN8iBfssHzWxc5kI3?=
 =?iso-8859-1?Q?sxNZg3DykJteYZQqi1MkD9m3Ei5mj8CL/AB+qKzNBwdEp14X7RQ5jFTxKJ?=
 =?iso-8859-1?Q?OKiu/yz0ukZMLvIJ2M4VMCio92x40UYFX9XOgqPIqdtnyFkQ0rKyxRU38S?=
 =?iso-8859-1?Q?SbbxXmr8XZ1swMw/6N7ztVW8a9F8xS11P9Te3+BJXwGw0Q0Dm4im5yNgeZ?=
 =?iso-8859-1?Q?gAI1o/jmKzfqx0xChO4j/U+usRbq98mxJGRPCCtHO9oMRFAhp46AfTfjrO?=
 =?iso-8859-1?Q?iFXvOOLtLfAR2oGJPwOhxHjYaeWsJ2ACNwyfFljkTFfnUM+FDH+VgzVvC2?=
 =?iso-8859-1?Q?NBtZzisXQ+I2nE4YtuouUYWswqsaf0p0y0dQk+PTKnnjy7xoh74UCeVL+J?=
 =?iso-8859-1?Q?+jCE+FPAVAcSRkyIFO13FQax8jpvd5shFNbzlZ+YnJ/MUXKhrIRDiHIhQ5?=
 =?iso-8859-1?Q?uLIvs2d2Ow39TBHSd2hPJCgwzaR8u1ApiX9psdLRDeG20To8LcJ2+OGj7l?=
 =?iso-8859-1?Q?O48/WFZ8QYCOZrofu1LJClD/yunxJR/P7rTUlTj3zmyuO/1EWgy9Fzmpyb?=
 =?iso-8859-1?Q?9MUTwaERP6Q+1GXBE41NL3RJ+tf44T58Gl2HIso/QlFXePKSfw9DXto86U?=
 =?iso-8859-1?Q?iJec0d7/T9BF6pjYHA0aEaWV4mMPvjlZy7oDUHJ9pTEoiEnBQVKZa9aBex?=
 =?iso-8859-1?Q?vj0DbiUkzUozK3zNNAi7lEx+QKcVzSQtLDPz2T5S30+83ZivqtRQH7bPYm?=
 =?iso-8859-1?Q?b2fvvbc5w03E0U0/rTtsR6LT4S13CD8wSRUfjtZMcwQ6fgrwsyXAs+l/OM?=
 =?iso-8859-1?Q?mDhPOVKxWzr+yqkvwwMrT3ruz7oVpgGLhz1Ds1+nElZC2VzSphDkC0zenr?=
 =?iso-8859-1?Q?QrMBTatBtQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: fLDCfDkKw0caP5aAq44GubZw+70RxQstuVNJ64VHsfD2o3tpJJy/FF4X8BNxEE5rzgg5Eo3+Sb/nQR4mrO+1FQrY6jUm0o1EEcfIBzhRqvMnbz/1kfAkp786eO6eBCmf0GlYmV1TUf2oOalN9yzUL7Sox44fOxzmFjbpWzQGKt8vlQb9B3u+Z0jivZaAclN4mm9EW3d71r7jVdQzoMAuiDWa8g9he0V/5RCeTuC1A5Eg6qaF+iZ15T+loL4M9Gs1vOyL7EH27WQOT/mu6LOzIxrdzZnxQhXCItUPHsCMHRTb431s5g69XtQhplwth8TEB1MajqoyYKqjF/lANjjpPQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c24e94c5-40cb-4c6d-63ae-08df13fd246a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 14:16:47.1284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfVnrJ4CC1Ryr4pVrTmEVlhuUEsQKiIXeWhjn4TA+12e1y/Puci4KtX6uo3yu3xURZQQPWVhQsq1/jIc8zyd0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB517798
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

On Tue, Sep 15, 2026 at 12:27:11PM +0000, Hogander, Jouni wrote:
> On Tue, 2026-09-15 at 12:25 +0300, Vinod Govindapillai wrote:
> > Introduce PME support for PME capable devices. Whether device is
> > PME capable is assessed during PCI probe routine. And the whether
> > PME is enabled for a specific context is assessed during the PM
> > runtime suspend call if the device is PME capable.
> > 
> > If the PME is enabled, HPDs can generate PME which in turn call
> > the runtime resume call and do the wakeup routines. Till now
> > the driver was relying on HPD polling to wakeup in case of any
> > HPDs. HPD polling can be avoided in platforms with PME support
> > and instead rely on this PCI PME for HPD induced wakeup.
> > 
> > v2: access functions for xe.pme.enabled status and clear the pme.
> >     enabled in case of error in xe_pm_runtime_suspend()
> > 
> > v3: use the local pme_enabled flag to clear the device wakeup
> >     incase of error
> > 
> > v4: call the devm_device_init_wakeup() only if device is PME
> >     capable to avoid false wakeup capable reporting in platforms
> >     where PME is not supported.
> >     Squash the patch which handled the lockdep deadlock handling
> > 
> > Bspec: 52979, 52980, 68857, 68867, 68970
> > Assisted-by: GitHub_Copilot:claude-opus-5
> > Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> 
> Reviewed-by: Jouni Högander <jouni.hogander@intel.com>

pushed to drm-intel-next

Thanks for the patches and reviews

> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h | 13 ++++++++
> >  drivers/gpu/drm/xe/xe_pci.c          | 22 +++++++++++++-
> >  drivers/gpu/drm/xe/xe_pm.c           | 45
> > ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_pm.h           |  2 ++
> >  4 files changed, 81 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > b/drivers/gpu/drm/xe/xe_device_types.h
> > index 4661bfce2f4e..bb4234f00453 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -460,6 +460,19 @@ struct xe_device {
> >  		struct mutex lock;
> >  	} d3cold;
> >  
> > +	/** @pme: Encapsulate pme related stuff */
> > +	struct {
> > +		/** @pme.capable: Indicates if device is PME capable
> > */
> > +		bool capable;
> > +
> > +		/** @pme.enabled:
> > +		 *
> > +		 * Indicates if PME is enabled - depends on user
> > controllable
> > +		 * sysfs interface as well
> > +		 */
> > +		bool enabled;
> > +	} pme;
> > +
> >  	/** @pm_notifier: Our PM notifier to perform actions in
> > response to various PM events. */
> >  	struct notifier_block pm_notifier;
> >  	/** @pm_block: Completion to block validating tasks on
> > suspend / hibernate prepare */
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > b/drivers/gpu/drm/xe/xe_pci.c
> > index c401c8803796..d10633f74aa4 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -1380,6 +1380,8 @@ static int xe_pci_runtime_suspend(struct device
> > *dev)
> >  {
> >  	struct pci_dev *pdev = to_pci_dev(dev);
> >  	struct xe_device *xe = pdev_to_xe_device(pdev);
> > +	unsigned int flags;
> > +	bool pme_enabled;
> >  	int err;
> >  
> >  	/*
> > @@ -1391,9 +1393,25 @@ static int xe_pci_runtime_suspend(struct
> > device *dev)
> >  	xe_assert(xe, !IS_SRIOV_VF(xe));
> >  	xe_assert(xe, !pci_num_vf(pdev));
> >  
> > +	flags = memalloc_noreclaim_save();
> > +	pme_enabled = xe->pme.capable && !xe->d3cold.allowed &&
> > +		      pci_enable_wake(pdev, PCI_D3hot, true) == 0;
> > +	memalloc_noreclaim_restore(flags);
> > +
> > +	xe_pm_update_pme_enabled(xe, pme_enabled);
> > +
> >  	err = xe_pm_runtime_suspend(xe);
> > -	if (err)
> > +	if (err) {
> > +		if (pme_enabled) {
> > +			flags = memalloc_noreclaim_save();
> > +			pci_enable_wake(pdev, PCI_D3hot, false);
> > +			memalloc_noreclaim_restore(flags);
> > +
> > +			xe_pm_update_pme_enabled(xe, false);
> > +		}
> > +
> >  		return err;
> > +	}
> >  
> >  	pci_save_state(pdev);
> >  
> > @@ -1422,6 +1440,8 @@ static int xe_pci_runtime_resume(struct device
> > *dev)
> >  
> >  	pci_restore_state(pdev);
> >  
> > +	xe_pm_update_pme_enabled(xe, false);
> > +
> >  	if (xe->d3cold.allowed) {
> >  		err = pci_enable_device(pdev);
> >  		if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index f517bf453b54..e71bb90c9b80 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -78,6 +78,8 @@
> >   * management (RPS).
> >   */
> >  
> > +#define HAS_PM_PME_SUPPORT(xe) (GRAPHICS_VERx100(xe) >= 3500)
> > +
> >  #ifdef CONFIG_LOCKDEP
> >  static struct lockdep_map xe_pm_runtime_d3cold_map = {
> >  	.name = "xe_rpm_d3cold_map"
> > @@ -384,6 +386,14 @@ int xe_pm_init_early(struct xe_device *xe)
> >  }
> >  ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See
> > xe_pci_probe() */
> >  
> > +static bool xe_pm_pci_pme_capable(struct xe_device *xe)
> > +{
> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > +
> > +	return HAS_PM_PME_SUPPORT(xe) ?
> > +		pci_pme_capable(pdev, PCI_D3hot) : false;
> > +}
> > +
> >  /**
> >   * xe_pm_probe() - Initialize Xe Power Management
> >   * @xe: the &xe_device instance
> > @@ -397,6 +407,16 @@ int xe_pm_probe(struct xe_device *xe)
> >  	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
> >  	xe_dbg(xe, "d3cold: capable=%s\n", str_yes_no(xe-
> > >d3cold.capable));
> >  
> > +	xe->pme.capable = xe_pm_pci_pme_capable(xe);
> > +	xe_dbg(xe, "pme: capable=%s\n", str_yes_no(xe-
> > >pme.capable));
> > +
> > +	if (xe->pme.capable) {
> > +		int err = devm_device_init_wakeup(xe->drm.dev);
> > +
> > +		if (err)
> > +			return err;
> > +	}
> > +
> >  	return 0;
> >  }
> >  
> > @@ -650,6 +670,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> >  	return 0;
> >  
> >  out_resume:
> > +	xe_pm_update_pme_enabled(xe, false);
> >  	xe_display_pm_runtime_resume(xe);
> >  	xe_pxp_pm_resume(xe->pxp);
> >  out:
> > @@ -993,6 +1014,30 @@ int xe_pm_set_vram_threshold(struct xe_device
> > *xe, u32 threshold)
> >  	return 0;
> >  }
> >  
> > +/**
> > + * xe_pm_pme_enabled - get the current status of PME enabled
> > + * @xe: xe device instance
> > + *
> > + * Returns: True if PME is enabled, false otherwise.
> > + */
> > +bool xe_pm_pme_enabled(struct xe_device *xe)
> > +{
> > +	return xe->pme.enabled;
> > +}
> > +
> > +/**
> > + * xe_pm_update_pme_enabled - Update the PME enabled state
> > + * @xe: xe device instance
> > + * @status: New PME enabled status
> > + *
> > + * Called during runtime suspend / resume. Status is set to True if
> > PME is
> > + * enabled during runtime_suspend. Cleared on runtime_resume.
> > + */
> > +void xe_pm_update_pme_enabled(struct xe_device *xe, bool status)
> > +{
> > +	xe->pme.enabled = status;
> > +}
> > +
> >  /**
> >   * xe_pm_d3cold_allowed_toggle - Check conditions to toggle
> > d3cold.allowed
> >   * @xe: xe device instance
> > diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> > index 6d5ab09cb769..037c73ea4342 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.h
> > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > @@ -33,6 +33,8 @@ bool xe_pm_runtime_resume_and_get(struct xe_device
> > *xe);
> >  void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
> >  int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
> >  void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
> > +bool xe_pm_pme_enabled(struct xe_device *xe);
> > +void xe_pm_update_pme_enabled(struct xe_device *xe, bool status);
> >  bool xe_rpm_reclaim_safe(const struct xe_device *xe);
> >  struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
> >  int xe_pm_block_on_suspend(struct xe_device *xe);
> 
