Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DB4C4332F
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 21:11:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D4110E4FB;
	Mon, 11 Dec 2023 21:11:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFEB10E042
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 21:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702329111; x=1733865111;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UsMrZiCURMi1chlZF0/vkTs2Auh2Uy9clwrWPUltLsM=;
 b=WgqapbaG6LACqjLtyfoAn1QoijdYcQGMiyzT2eLtj2dKqrkshkIb7n0p
 RhuHTSFfsNFaeiyFE8vO+Tt2/bR1HW1srRwaJagmGNgveMMmorgzxno7T
 FYzKCYjF7rj6XE84rHVJ3cNoB2y+5dq8sL1cSXq1S739RdbWwqljPcy6D
 SzFi1O1BmN/rwkRjiX7hPPt10AMsMld+r6ly7FO7vvbJZkm1p/rlaw2vM
 ll9UreR5unsEcs2f3Huz3AeHV9hRtX1R6I6PbmFegGzcDCQqG5MGYEcwB
 1Uw4zjmMpklKYfnEUtNrZ/DGxeV0zpbhyXQeN9IRTP2ZFY2hUwy1t37DM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="391883802"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="391883802"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 13:11:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="773255107"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="773255107"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 13:11:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 13:11:50 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 13:11:49 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 13:11:49 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 13:11:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILNYVz06Vs0kR6372bY85aDeesRaKGGfhZoPkpEiHwE3BwOJlDE9qlSF/X/fkSzQHuXMCD/Hoqa8TA+dO5j5xANa8yB11Ldh+mYOEm7NftIGFvhJk77NDav1LvyKAv04/0e9G6WQQJNXutTk5uUKfjnPeRP5JhjhWP63NlOZ9zlkektMBaE+V2z7DVZJ9RLfCGKr9LNJWaKQfwPmb8ew25Sg01MXW92AJVxorZPVWPwun2av+c0lyMkXxPyNqIolkZI0GNQcGJLZt/G06JmlKLbNIREeNSflev1JbrBcM4PTT9zlNbLch2CHZTa0hO+sgU2i53Ov7koiiHtlPWX6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9RtTtvmqF2Tr1BhRMU5veEvHQ60ZgPm/NZ/Pu9RDnM=;
 b=i9Z8O7j2r/RbonVUlCLMXKdPHF5zQWiHosEy9pYHrZo4uQ9ryGSd8FGuC17AdD6dVAkx/7us7oOdC7TegSq++p3mHRaYnVLdDZeKtndeM45iHU53ZeFAwAxa2jqoOvtuQRX6HgIEiR6wVJ3m9jCquCo295wxn1UltcoYjxzFr9JTttYjGb+EFheoCp4HeE5682PRCV8HKS+vtIyoAPzp6S/bfFpS0uJURSODsWqiPlzl2ISw9L1hhOHmmCP0yDBuf+YglURcvn20k72FuKeq3J3ed9uKD/gBXbFofnQH7gaeCrYnTwVbdrl8cTWCH/NjzlY0k9HPiK/k4RRvy3G3LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7716.namprd11.prod.outlook.com (2603:10b6:a03:4f2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 21:11:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 21:11:44 +0000
Date: Mon, 11 Dec 2023 21:11:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC PATCH 7/7] drm/xe/uapi: Uniform async vs sync handling
Message-ID: <ZXd7HmklhmklkmsQ@DUT025-TGLU.fm.intel.com>
References: <20231207055729.438642-1-matthew.brost@intel.com>
 <20231207055729.438642-8-matthew.brost@intel.com>
 <d7c25d14-fa14-4426-57a4-276675c7b2f9@linux.intel.com>
 <ZXLluT3zXZFEH8V3@DUT025-TGLU.fm.intel.com>
 <4a814fc8-6e05-c5fb-8ff5-492a6e14aebc@linux.intel.com>
 <ZXc9i98QKBNPE1u9@DUT025-TGLU.fm.intel.com>
 <d7222626fd51cf23c8aed21d540235a976816e14.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7222626fd51cf23c8aed21d540235a976816e14.camel@linux.intel.com>
X-ClientProxiedBy: BY5PR16CA0027.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::40) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7716:EE_
X-MS-Office365-Filtering-Correlation-Id: f98a3bbf-dd6b-41eb-d1ab-08dbfa8dc707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t8zhKpCB7hViH6JrHPtxx6q5YG72CN3ZtZsaooQ6Cu33ir7/PlUwbPCMmv4LNLv6uTOznbOg6w5Iq870zt596daiK+PmWGSXn/kvFPIm7LK+BvmZxq0Y2bG/Il8FQ/zorpIIXWTwKbhmoNnxEYTp6R785IQsa1P69UnhyTCfyDmgmcF9P7qHsTM5/XBkDsQE1PNJ72fy2tZXi8WKzrE3JwchhAGSK/bquDnbcegFKt1pDtbmGOWk6h1plX+6qZxqIVqM+6EqHzVNgwvjFeGzzafW1NtUfRYJNQSNcvqhEYUcyc0yEPW7gXK/t1CAq6Dmg1w1ZKXxsBR219M0FN31lTZxm+p85ezJCBxfKBZMjBuZzLj0+GJXrZ+l4ABlAnH314mmBuloeQQn0w1qZHyvyPH+yjKrJ0Dgo2BZxFGhAUSy+8m3FXDrbAXNzgtjes9O5NUm+D0KBt4GiiPRZBd2YPtBOEIptw7OsWoUbnM2CdQX2CJQxHpTFPOw/RrPlgRki9w95TeaF9hX3fxJK34ZI9QHVlLzLHg4ZBSN69R7j7t1IbRZt0JJ0PSTn2ImkXyPjOISiUA9QsHApaJj4S376K5gwl8gZH/qA243OIuwtWE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(396003)(136003)(366004)(230273577357003)(230922051799003)(230173577357003)(186009)(1800799012)(64100799003)(451199024)(30864003)(4001150100001)(2906002)(41300700001)(38100700002)(86362001)(82960400001)(83380400001)(26005)(478600001)(53546011)(6486002)(6506007)(66574015)(966005)(6666004)(6512007)(4326008)(5660300002)(44832011)(316002)(6916009)(54906003)(66946007)(66556008)(66476007)(8936002)(8676002)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?V2Am7PJ22zvFO8R6Fc0XnHt9xiha3CesCzPo8Gj6cIhWcKP1TgWyXTacUo?=
 =?iso-8859-1?Q?S3NS+GRhTIWGWZY6fZk+POVqZmwZwIb3u5s7MeWpTn7uW5KNZ0h9OtE53I?=
 =?iso-8859-1?Q?8P65GXIqbUHDw+vzaP31ZASoxlfMZ8EJagirr5++Fo0AKoVdI6+chqc8QS?=
 =?iso-8859-1?Q?ctgMEtV+HwqZAZvHOhhnFFVpx0Jxem/Ih5bz7Bn2wrX4Q62PsW+RD49JVC?=
 =?iso-8859-1?Q?rU2NK9hdIUo8Fq+kU8vv0tTBcVFr4Cbvb1Z+zxr1UGBTe6RTsS18Df69Zx?=
 =?iso-8859-1?Q?uXPUpuJz0KtEL87wcyvLxfQcktiGGsZC3IM0AdEFDq3OnmdwdDLN5ilrra?=
 =?iso-8859-1?Q?H/qR11dkeOgKOQxvgDkANU+cA3FFKXoQ0NpwD++k91JxSAnsKyIEVcn0UX?=
 =?iso-8859-1?Q?BrDK55cduEayZGr4MezZszyCX/e8lQnFEckCF+bh+k/Ap703t9a+jz06KJ?=
 =?iso-8859-1?Q?BoQQGVskyFuCsrHqGQe6Lgn1uKJ5iUP6AXO4GIqKJHAbQFfVNjvjRyp0rV?=
 =?iso-8859-1?Q?1r0NITh7+B3C+2alN9oIx+xTkalX50EqF+SQz8qLHLP8Ck6LdOv8nbdBP0?=
 =?iso-8859-1?Q?y9deAHdUsvq2C5CXlw8CVvc9f9oF+vR0UBjUpiG81jJeVvBoZnaLbJh8Ku?=
 =?iso-8859-1?Q?WLkJkCj/u60YirDUTdcVmQMUAWe6vOMK/sApPnvCyJ7VxD4UtAprDtqmzc?=
 =?iso-8859-1?Q?7ofPalVb7fo4qXlmpbubuTvHg5BcauDpU+mYGr+7YOuscwZTNd8C++glZd?=
 =?iso-8859-1?Q?4ggga3JnkRQN8d8Ld5tHE6H5fS93MJ/juQ9clx2OoTVAFZTeFxAGFwMh3t?=
 =?iso-8859-1?Q?WOEQE3RS0Nvj0kvZt/hIRzqpVlst92HMybhlFT94fLQrmAkZZUfSw0RM12?=
 =?iso-8859-1?Q?5xzq5xZutQpLu+TjDbWoD6a4jEjXmEmwsh5cM7TNhICIxLIuuR9TbJd5T1?=
 =?iso-8859-1?Q?QEi0u7IHKOXBFHs4yhQGTIAH6EJy59tgVugB4tOySQDHQKBM61cfT+Ux9f?=
 =?iso-8859-1?Q?3kX19uQpKyefvN4jQPOGWE1yWnG9DzpGGlt5F0fNBEY9M3VYVCDPyMJNkB?=
 =?iso-8859-1?Q?7cin9nGPdlvi4+WFIx4nTr4xqr3w/EI7i3DAg7+WTYm8P+DG8WSmJLIBee?=
 =?iso-8859-1?Q?cjsb1ELr7hkn2PuTGXEv/iCmbPbmyjAscFULEiysfDEgSI7IbmF4t/beKp?=
 =?iso-8859-1?Q?pTeqDHDm3Rt49C1TqKnAsbZtvr18TlpccSIs7eUV/ua0OKKMtyL9kGLNY+?=
 =?iso-8859-1?Q?D9BrsS0FlD0ubClAWujelZ3AljYQJxrcJUd+DzUXokWD1PMlTkIRr5RQ0m?=
 =?iso-8859-1?Q?TMZqUvblM00JrLyw8pNbNdY5w1Eol7j/GOpUrIRWuL/MbLbGcC8H44rAcg?=
 =?iso-8859-1?Q?rVvIeYBrBxDoexLHXMeRMlPC/usaSq4nuUNzN0yz/DnWTsujyPuiIHqFqZ?=
 =?iso-8859-1?Q?b6+q095oiZ3avAKwlEr/fxQLwPNTltGLPfMIg8EHfAqS+Noaq2qakOB6OT?=
 =?iso-8859-1?Q?Hh2QfD3q5Ohfk/VT61ybOObsw3zO+A5SvWo+pT70uZ2MMWDmDzLAG/Og0i?=
 =?iso-8859-1?Q?WMUxxnO7sTGI5rAU54l0hafdLUxm7H5hgGGDRjLBuSAuGGo0vPrRp7VIu2?=
 =?iso-8859-1?Q?NGlaDv5oDLJFsmS8XKDSeFUVZpBEJ1O7WvHezDh8eKovIAj4t84CJNfg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f98a3bbf-dd6b-41eb-d1ab-08dbfa8dc707
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 21:11:44.1352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xe9tvRQ3mUcRRgscVcjdVLeIyVkfOtddPJnFvCuAThVY2NTFE1PQynoHcagngXeypVF4aSCkgQpuzNoLmjYdOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7716
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Dec 11, 2023 at 07:11:15PM +0100, Thomas Hellström wrote:
> On Mon, 2023-12-11 at 16:49 +0000, Matthew Brost wrote:
> > On Mon, Dec 11, 2023 at 04:43:06PM +0100, Thomas Hellström wrote:
> > > 
> > > On 12/8/23 10:45, Matthew Brost wrote:
> > > > On Fri, Dec 08, 2023 at 04:00:37PM +0100, Thomas Hellström wrote:
> > > > > On 12/7/23 06:57, Matthew Brost wrote:
> > > > > > Remove concept of async vs sync VM bind queues, rather make
> > > > > > async vs
> > > > > > sync a per IOCTL choice. Since this is per IOCTL, it makes
> > > > > > sense to have
> > > > > > a singular flag IOCTL rather than per VM bind op flag too.
> > > > > > Add
> > > > > > DRM_XE_SYNCS_FLAG_WAIT_FOR_OP which is an input sync flag to
> > > > > > support
> > > > > > this. Support this new flag for both the VM bind IOCTL and
> > > > > > the exec
> > > > > > IOCTL to match behavior.
> > > > > > 
> > > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/xe/xe_exec.c             |  58 ++++++++---
> > > > > > -
> > > > > >    drivers/gpu/drm/xe/xe_exec_queue.c       |   7 +-
> > > > > >    drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 -
> > > > > >    drivers/gpu/drm/xe/xe_vm.c               | 110 ++++++++++-
> > > > > > ------------
> > > > > >    drivers/gpu/drm/xe/xe_vm_types.h         |  15 ++--
> > > > > >    include/uapi/drm/xe_drm.h                |  56 +++++++----
> > > > > > -
> > > > > >    6 files changed, 129 insertions(+), 119 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > > > > > b/drivers/gpu/drm/xe/xe_exec.c
> > > > > > index 92b0da6580e8..c62cabfaa112 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > > > > @@ -130,12 +130,15 @@ static int xe_exec_begin(struct
> > > > > > drm_exec *exec, struct xe_vm *vm)
> > > > > >         return err;
> > > > > >    }
> > > > > > +#define ALL_DRM_XE_SYNCS_FLAGS
> > > > > > (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
> > > > > > +
> > > > > >    int xe_exec_ioctl(struct drm_device *dev, void *data,
> > > > > > struct drm_file *file)
> > > > > >    {
> > > > > >         struct xe_device *xe = to_xe_device(dev);
> > > > > >         struct xe_file *xef = to_xe_file(file);
> > > > > >         struct drm_xe_exec *args = data;
> > > > > > -       struct drm_xe_sync __user *syncs_user =
> > > > > > u64_to_user_ptr(args->syncs);
> > > > > > +       struct drm_xe_sync __user *syncs_user =
> > > > > > +               u64_to_user_ptr(args->syncs.syncs);
> > > > > >         u64 __user *addresses_user = u64_to_user_ptr(args-
> > > > > > >address);
> > > > > >         struct xe_exec_queue *q;
> > > > > >         struct xe_sync_entry *syncs = NULL;
> > > > > > @@ -143,15 +146,18 @@ int xe_exec_ioctl(struct drm_device
> > > > > > *dev, void *data, struct drm_file *file)
> > > > > >         struct drm_exec exec;
> > > > > >         u32 i, num_syncs = 0;
> > > > > >         struct xe_sched_job *job;
> > > > > > -       struct dma_fence *rebind_fence;
> > > > > > +       struct dma_fence *rebind_fence, *job_fence;
> > > > > >         struct xe_vm *vm;
> > > > > > -       bool write_locked;
> > > > > > +       bool write_locked, skip_job_put = false;
> > > > > > +       bool wait = args->syncs.flags &
> > > > > > DRM_XE_SYNCS_FLAG_WAIT_FOR_OP;
> > > > > >         ktime_t end = 0;
> > > > > >         int err = 0;
> > > > > >         if (XE_IOCTL_DBG(xe, args->extensions) ||
> > > > > > -           XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] ||
> > > > > > args->pad[2]) ||
> > > > > > -           XE_IOCTL_DBG(xe, args->reserved[0] || args-
> > > > > > >reserved[1]))
> > > > > > +           XE_IOCTL_DBG(xe, args->pad || args->pad2[0] ||
> > > > > > args->pad2[1] || args->pad2[2]) ||
> > > > > > +           XE_IOCTL_DBG(xe, args->reserved[0] || args-
> > > > > > >reserved[1]) ||
> > > > > > +           XE_IOCTL_DBG(xe, args->syncs.flags &
> > > > > > ~ALL_DRM_XE_SYNCS_FLAGS) ||
> > > > > > +           XE_IOCTL_DBG(xe, wait && args->syncs.num_syncs))
> > > > > >                 return -EINVAL;
> > > > > >         q = xe_exec_queue_lookup(xef, args->exec_queue_id);
> > > > > > @@ -170,8 +176,9 @@ int xe_exec_ioctl(struct drm_device *dev,
> > > > > > void *data, struct drm_file *file)
> > > > > >                 goto err_exec_queue;
> > > > > >         }
> > > > > > -       if (args->num_syncs) {
> > > > > > -               syncs = kcalloc(args->num_syncs,
> > > > > > sizeof(*syncs), GFP_KERNEL);
> > > > > > +       if (args->syncs.num_syncs) {
> > > > > > +               syncs = kcalloc(args->syncs.num_syncs,
> > > > > > sizeof(*syncs),
> > > > > > +                               GFP_KERNEL);
> > > > > >                 if (!syncs) {
> > > > > >                         err = -ENOMEM;
> > > > > >                         goto err_exec_queue;
> > > > > > @@ -180,7 +187,7 @@ int xe_exec_ioctl(struct drm_device *dev,
> > > > > > void *data, struct drm_file *file)
> > > > > >         vm = q->vm;
> > > > > > -       for (i = 0; i < args->num_syncs; i++) {
> > > > > > +       for (i = 0; i < args->syncs.num_syncs; i++) {
> > > > > >                 err = xe_sync_entry_parse(xe, xef,
> > > > > > &syncs[num_syncs++],
> > > > > >                                           &syncs_user[i],
> > > > > > SYNC_PARSE_FLAG_EXEC |
> > > > > >                                          
> > > > > > (xe_vm_in_lr_mode(vm) ?
> > > > > > @@ -245,9 +252,17 @@ int xe_exec_ioctl(struct drm_device
> > > > > > *dev, void *data, struct drm_file *file)
> > > > > >                                 err = PTR_ERR(fence);
> > > > > >                                 goto err_exec;
> > > > > >                         }
> > > > > > +
> > > > > >                         for (i = 0; i < num_syncs; i++)
> > > > > >                                 xe_sync_entry_signal(&syncs[i
> > > > > > ], NULL, fence);
> > > > > > +
> > > > > >                         xe_exec_queue_last_fence_set(q, vm,
> > > > > > fence);
> > > > > > +                       if (wait) {
> > > > > > +                               long timeout =
> > > > > > dma_fence_wait(fence, true);
> > > > > > +
> > > > > > +                               if (timeout < 0)
> > > > > > +                                       err = -EINTR;
> > > > > > +                       }
> > > > > Here it looks like we will rerun the same IOCTL again if we
> > > > > return -EINTR.
> > > > > The user-space expected action on -EINTR is to just restart the
> > > > > IOCTL
> > > > > without any argument changes. Solution is to add an ioctl
> > > > > argument cookie
> > > > > (or to skip sync vm binds and have the user just use the 0
> > > > > batch buffers /
> > > > > vm_binds calls or wait for an out-fence). If you go for the
> > > > > cookie solution
> > > > > then IMO we should keep the -ERESTARTSYS returned from
> > > > > dma_fence_wait()
> > > > > since it's converted to -EINTR on return-to-user-space, and the
> > > > > kernel
> > > > > restarts the IOCTL automatically if there was no requested-for-
> > > > > delivery
> > > > > signal pending.
> > > > > 
> > > > > I think the simplest solution at this point is to skip the sync
> > > > > behaviour,
> > > > > in particular if we enable the 0 batch / bind possibility.
> > > > > 
> > > > > If we still want to provide it, we could add a cookie address
> > > > > as an
> > > > > extension to the ioctl and activate sync if present? (Just
> > > > > throwing up ideas
> > > > > here).
> > > > > 
> > > > Hmm, forgot about this. A cookie is fairly easy, what about
> > > > something like this:
> > > > 
> > > >   807 /**
> > > >   808  * struct drm_xe_syncs - In / out syncs for IOCTLs.
> > > >   809  */
> > > >   810 struct drm_xe_syncs {
> > > >   811         /** @num_syncs: amount of syncs to wait on */
> > > >   812         __u32 num_syncs;
> > > >   813
> > > >   814         /*
> > > >   815          * Block in IOCTL until operation complete,
> > > > num_syncs MBZ if set.
> > > >   816          */
> > > >   817 #define DRM_XE_SYNCS_IN_FLAG_WAIT_FOR_OP (1 << 0)
> > > >   818         /** @in_flags: Input Sync flags */
> > > >   819         __u16 in_flags;
> > > >   820
> > > >   821         /*
> > > >   822          * IOCTL operation has started (no need for user to
> > > > resubmit on
> > > >   823          * -ERESTARTSYS)
> > > >   824          */
> > > >   825 #define DRM_XE_SYNCS_OUT_FLAG_OP_COMMITTED (1 << 0)
> > > >   826         /** @out_flags: Output Sync flags */
> > > >   827         __u16 out_flags;
> > > >   828
> > > >   829         /** @syncs: pointer to struct drm_xe_sync array */
> > > >   830         __u64 syncs;
> > > >   831
> > > >   832         /** @reserved: Reserved */
> > > >   833         __u64 reserved[2];
> > > >   834 };
> > > > 
> > > > DRM_XE_SYNCS_OUT_FLAG_OP_COMMITTED gets set in exec / bind IOCTL
> > > > after
> > > > the job is committed or in the of zero ops last-fence updated on
> > > > the
> > > > queue. Note that for binds we don't yet do 1 job per IOCTL but
> > > > after
> > > > landing some version of [1]
> > > > 
> > > > After DRM_XE_SYNCS_OUT_FLAG_OP_COMMITTED is set we return -
> > > > ERESTARTSYS if
> > > > the wait is interrupted and -EINTR is still
> > > > DRM_XE_SYNCS_OUT_FLAG_OP_COMMITTED (interrupted before job is
> > > > committed).
> > > > 
> > > > I'd rather go with patch as we have to change the uAPI here
> > > > regardless
> > > > so we might as well make this complete.
> > > > 
> > > > Matt
> > > > 
> > > > [1] https://patchwork.freedesktop.org/series/125608/
> > > 
> > > Yeah as we discussed in the meeting that means making the ioctl RW
> > > instead
> > > of W with some copying overhead.
> > > 
> > > I also think we should leave the EXEC ioctl out of this, meaning
> > > just having
> > > a single field in the VM_BIND ioctl. Basically the reason is that
> > > waiting
> > > like this after submission is a bit weird and does not align well
> > > with how
> > > -EINTR is typically used.
> > > 
> > 
> > I kinda like uniform behavior between exec and binds with the
> > behavior
> > defined in a common sync structure.
> 
> Even so, I strongly think we should *not* in any way expose this for
> exec. If needed the user can just wait for an out-fence and then we
> don't need to implement code for this that will probably never get used
> and with an implementation that very few will understand.
> 
> Furthermore the sync VM_BIND ioctl per the ASYNC VM_BIND doc doesn't
> allow neither in-fences nor out fences, so grouping like this becomes a
> bit overkill.
> 
> > 
> > > So either a pointer to a cookie in the ioctl,
> > > 
> > 
> > What about:
> > 
> > 119 > >   807 /**
> > 120 > >   808  * struct drm_xe_syncs - In / out syncs for IOCTLs.
> > 121 > >   809  */
> > 122 > >   810 struct drm_xe_syncs {
> > 123 > >   811         /** @num_syncs: amount of syncs to wait on */
> > 124 > >   812         __u32 num_syncs;
> > 125 > >   813
> > 126 > >   814         /*
> > 127 > >   815          * Block in IOCTL until operation complete,
> > num_syncs MBZ if set.
> > 128 > >   816          */
> > 129 > >   817 #define DRM_XE_SYNCS_IN_FLAG_WAIT_FOR_OP (1 << 0)
> > 130 > >   818         /** @flags: Sync flags */
> > 131 > >   819         __u32 in_flags;
> > 132 > >   820
> > 138 > >   826         /** @cookie: userptr cookie written back with
> > non-zero value once operation committed, only valid when IOCTL
> > returns -EINTR */
> > 139 > >   827         __u64 cookie;
> > 140 > >   828
> > 141 > >   829         /** @syncs: pointer to struct drm_xe_sync array
> > */
> > 142 > >   830         __u64 syncs;
> > 143 > >   831
> > 144 > >   832         /** @reserved: Reserved */
> > 145 > >   833         __u64 reserved[2];
> > 146 > >   834 };
> > 
> > Also if cookie is 0, we wait uninterruptable once the op is
> > committed?
> 
> I'm afraid I don't follow. The *interruptible* wait after commit is
> what trigger the need for a cookie in the first place? Also here,
> @cookie is still read-only for the kernel since the struct drm_xe_syncs
> is embedded in the ioctl. Also I think any cookie should be opaque to
> the user, other than that it must must be 0 if not calling after an -
> ERESTART.
> 

Cookie here is a user address which is written back to when a sync wait
is interrupted. The expected value of *Cookie is zero on the IOCTL
submission. If Cookie == NULL, the sync wait would be uninterruptible
(we can skip this part if this is confusing). The kernel only writes
*Cookie when a sync wait is interrupted. The value of the write is
defined just as non-zero.

> > 
> > > or perhaps dig up again the idea we had of mostly waiting before
> > > the
> > > submission:
> > > 
> > > 1) Pull out the last_op fence for the queue from under the relevant
> > > lock.
> > > 2) Wait for all dependencies without any locks.
> > > 3) Lock, and (optionally) if the last_op fence changed, wait for
> > > it.
> > > 4) Submit
> > > 5) Wait for completion uninterruptible.
> > > 
> > 
> > We can always change the internal implementation to something like
> > this
> > after [1]. That series makes refactors like this quite a bit easier.
> 
> Well the idea of the above 1) - 5) was that we wouldn't be needing any
> cookie at all, since the wait in 5) would be short, and we therefore
> could get away with implementing it uninterruptible. If that turned out
> to be bad, We add the cookie as an extension. Initial implementation
> can even use uninterruptible waits for simplicity.
> 
> To summarize:
> 
> * I strongly don't think we should support sync exec calls.

What about the same interface as defined above but on exec if
DRM_XE_SYNCS_IN_FLAG_WAIT_FOR_OP set we return -EOPNOTSUPP. This gives
us a uniform interface between bind and exec with an optional path to
support sync execs in the future if a UMD asks for it.

> * No in-syncs or out-syncs if SYNC.

Agree.

> * A flag to trigger sync binds. Syncs could be in a separate struct,
> but not really needed if we don't support sync execs.

See above, the interface I purposing has this.

> * If we go for the interruptible wait, we need a writable cookie that
> is not embedded in the main struct.

See above, the interface I purposing has this.

Matt

> 
> 
> /Thomas
> 
> 
> 
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/125608/ 
> > 
> > > I actually like this last one best, but we'd recommend UMD to uses
> > > out-fences whenever possible.
> > > 
> > > Thoughts?
> > > 
> > > > 
> > > > > >                         dma_fence_put(fence);
> > > > > >                 }
> > > > > > @@ -331,42 +346,51 @@ int xe_exec_ioctl(struct drm_device
> > > > > > *dev, void *data, struct drm_file *file)
> > > > > >          * the job and let the DRM scheduler / backend clean
> > > > > > up the job.
> > > > > >          */
> > > > > >         xe_sched_job_arm(job);
> > > > > > +       job_fence = &job->drm.s_fence->finished;
> > > > > > +       if (wait)
> > > > > > +               dma_fence_get(job_fence);
> > > > > >         if (!xe_vm_in_lr_mode(vm)) {
> > > > > >                 /* Block userptr invalidations / BO eviction
> > > > > > */
> > > > > > -               dma_resv_add_fence(&vm->resv,
> > > > > > -                                  &job->drm.s_fence-
> > > > > > >finished,
> > > > > > +               dma_resv_add_fence(&vm->resv, job_fence,
> > > > > >                                    DMA_RESV_USAGE_BOOKKEEP);
> > > > > >                 /*
> > > > > >                  * Make implicit sync work across drivers,
> > > > > > assuming all external
> > > > > >                  * BOs are written as we don't pass in a read
> > > > > > / write list.
> > > > > >                  */
> > > > > > -               xe_vm_fence_all_extobjs(vm, &job-
> > > > > > >drm.s_fence->finished,
> > > > > > -
> > > > > >                                        DMA_RESV_USAGE_WRITE);
> > > > > > +               xe_vm_fence_all_extobjs(vm, job_fence,
> > > > > > DMA_RESV_USAGE_WRITE);
> > > > > >         }
> > > > > >         for (i = 0; i < num_syncs; i++)
> > > > > > -               xe_sync_entry_signal(&syncs[i], job,
> > > > > > -                                    &job->drm.s_fence-
> > > > > > >finished);
> > > > > > +               xe_sync_entry_signal(&syncs[i], job,
> > > > > > job_fence);
> > > > > >         if (xe_exec_queue_is_lr(q))
> > > > > >                 q->ring_ops->emit_job(job);
> > > > > >         if (!xe_vm_in_lr_mode(vm))
> > > > > > -               xe_exec_queue_last_fence_set(q, vm, &job-
> > > > > > >drm.s_fence->finished);
> > > > > > +               xe_exec_queue_last_fence_set(q, vm,
> > > > > > job_fence);
> > > > > >         xe_sched_job_push(job);
> > > > > >         xe_vm_reactivate_rebind(vm);
> > > > > > -       if (!err && !xe_vm_in_lr_mode(vm)) {
> > > > > > +       if (!xe_vm_in_lr_mode(vm)) {
> > > > > >                 spin_lock(&xe->ttm.lru_lock);
> > > > > >                 ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> > > > > >                 spin_unlock(&xe->ttm.lru_lock);
> > > > > >         }
> > > > > > +       skip_job_put = true;
> > > > > > +       if (wait) {
> > > > > > +               long timeout = dma_fence_wait(job_fence,
> > > > > > true);
> > > > > > +
> > > > > > +               dma_fence_put(job_fence);
> > > > > > +               if (timeout < 0)
> > > > > > +                       err = -EINTR;
> > > > > > +       }
> > > > > > +
> > > > > >    err_repin:
> > > > > >         if (!xe_vm_in_lr_mode(vm))
> > > > > >                 up_read(&vm->userptr.notifier_lock);
> > > > > >    err_put_job:
> > > > > > -       if (err)
> > > > > > +       if (err && !skip_job_put)
> > > > > >                 xe_sched_job_put(job);
> > > > > >    err_exec:
> > > > > >         drm_exec_fini(&exec);
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > index 3911d14522ee..98776d02d634 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > > > @@ -625,10 +625,7 @@ int xe_exec_queue_create_ioctl(struct
> > > > > > drm_device *dev, void *data,
> > > > > >         if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe-
> > > > > > >info.gt_count))
> > > > > >                 return -EINVAL;
> > > > > > -       if (eci[0].engine_class >=
> > > > > > DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC) {
> > > > > > -               bool sync = eci[0].engine_class ==
> > > > > > -                       DRM_XE_ENGINE_CLASS_VM_BIND_SYNC;
> > > > > > -
> > > > > > +       if (eci[0].engine_class ==
> > > > > > DRM_XE_ENGINE_CLASS_VM_BIND) {
> > > > > >                 for_each_gt(gt, xe, id) {
> > > > > >                         struct xe_exec_queue *new;
> > > > > > @@ -654,8 +651,6 @@ int xe_exec_queue_create_ioctl(struct
> > > > > > drm_device *dev, void *data,
> > > > > >                                                    args-
> > > > > > >width, hwe,
> > > > > >                                                   
> > > > > > EXEC_QUEUE_FLAG_PERSISTENT |
> > > > > >                                                   
> > > > > > EXEC_QUEUE_FLAG_VM |
> > > > > > -                                                  (sync ? 0
> > > > > > :
> > > > > > -                                                  
> > > > > > EXEC_QUEUE_FLAG_VM_ASYNC) |
> > > > > >                                                    (id ?
> > > > > >                                                    
> > > > > > EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD :
> > > > > >                                                     0));
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > > index 52f0927d0d9b..c78f6e8b41c4 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > > > @@ -74,8 +74,6 @@ struct xe_exec_queue {
> > > > > >    #define EXEC_QUEUE_FLAG_VM                   BIT(4)
> > > > > >    /* child of VM queue for multi-tile VM jobs */
> > > > > >    #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD    BIT(5)
> > > > > > -/* VM jobs for this queue are asynchronous */
> > > > > > -#define EXEC_QUEUE_FLAG_VM_ASYNC               BIT(6)
> > > > > >         /**
> > > > > >          * @flags: flags for this exec queue, should
> > > > > > statically setup aside from ban
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > index cf2eb44a71db..4b0c976c003a 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > > > @@ -1433,9 +1433,7 @@ struct xe_vm *xe_vm_create(struct
> > > > > > xe_device *xe, u32 flags)
> > > > > >                         struct xe_gt *gt = tile->primary_gt;
> > > > > >                         struct xe_vm *migrate_vm;
> > > > > >                         struct xe_exec_queue *q;
> > > > > > -                       u32 create_flags = EXEC_QUEUE_FLAG_VM
> > > > > > |
> > > > > > -                               ((flags &
> > > > > > XE_VM_FLAG_ASYNC_DEFAULT) ?
> > > > > > -                               EXEC_QUEUE_FLAG_VM_ASYNC :
> > > > > > 0);
> > > > > > +                       u32 create_flags =
> > > > > > EXEC_QUEUE_FLAG_VM;
> > > > > >                         if (!vm->pt_root[id])
> > > > > >                                 continue;
> > > > > > @@ -1835,16 +1833,10 @@ xe_vm_bind_vma(struct xe_vma *vma,
> > > > > > struct xe_exec_queue *q,
> > > > > >         return ERR_PTR(err);
> > > > > >    }
> > > > > > -static bool xe_vm_sync_mode(struct xe_vm *vm, struct
> > > > > > xe_exec_queue *q)
> > > > > > -{
> > > > > > -       return q ? !(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC) :
> > > > > > -               !(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT);
> > > > > > -}
> > > > > > -
> > > > > >    static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma
> > > > > > *vma,
> > > > > >                         struct xe_exec_queue *q, struct
> > > > > > xe_sync_entry *syncs,
> > > > > >                         u32 num_syncs, bool immediate, bool
> > > > > > first_op,
> > > > > > -                       bool last_op)
> > > > > > +                       bool last_op, bool async)
> > > > > >    {
> > > > > >         struct dma_fence *fence;
> > > > > >         struct xe_exec_queue *wait_exec_queue =
> > > > > > to_wait_exec_queue(vm, q);
> > > > > > @@ -1870,7 +1862,7 @@ static int __xe_vm_bind(struct xe_vm
> > > > > > *vm, struct xe_vma *vma,
> > > > > >         if (last_op)
> > > > > >                 xe_exec_queue_last_fence_set(wait_exec_queue,
> > > > > > vm, fence);
> > > > > > -       if (last_op && xe_vm_sync_mode(vm, q))
> > > > > > +       if (last_op && !async)
> > > > > >                 dma_fence_wait(fence, true);
> > > > > >         dma_fence_put(fence);
> > > > > > @@ -1880,7 +1872,7 @@ static int __xe_vm_bind(struct xe_vm
> > > > > > *vm, struct xe_vma *vma,
> > > > > >    static int xe_vm_bind(struct xe_vm *vm, struct xe_vma
> > > > > > *vma, struct xe_exec_queue *q,
> > > > > >                       struct xe_bo *bo, struct xe_sync_entry
> > > > > > *syncs,
> > > > > >                       u32 num_syncs, bool immediate, bool
> > > > > > first_op,
> > > > > > -                     bool last_op)
> > > > > > +                     bool last_op, bool async)
> > > > > >    {
> > > > > >         int err;
> > > > > > @@ -1894,12 +1886,12 @@ static int xe_vm_bind(struct xe_vm
> > > > > > *vm, struct xe_vma *vma, struct xe_exec_queue
> > > > > >         }
> > > > > >         return __xe_vm_bind(vm, vma, q, syncs, num_syncs,
> > > > > > immediate, first_op,
> > > > > > -                           last_op);
> > > > > > +                           last_op, async);
> > > > > >    }
> > > > > >    static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma
> > > > > > *vma,
> > > > > >                         struct xe_exec_queue *q, struct
> > > > > > xe_sync_entry *syncs,
> > > > > > -                       u32 num_syncs, bool first_op, bool
> > > > > > last_op)
> > > > > > +                       u32 num_syncs, bool first_op, bool
> > > > > > last_op, bool async)
> > > > > >    {
> > > > > >         struct dma_fence *fence;
> > > > > >         struct xe_exec_queue *wait_exec_queue =
> > > > > > to_wait_exec_queue(vm, q);
> > > > > > @@ -1914,7 +1906,7 @@ static int xe_vm_unbind(struct xe_vm
> > > > > > *vm, struct xe_vma *vma,
> > > > > >         xe_vma_destroy(vma, fence);
> > > > > >         if (last_op)
> > > > > >                 xe_exec_queue_last_fence_set(wait_exec_queue,
> > > > > > vm, fence);
> > > > > > -       if (last_op && xe_vm_sync_mode(vm, q))
> > > > > > +       if (last_op && !async)
> > > > > >                 dma_fence_wait(fence, true);
> > > > > It looks like we're dropping the error return code here.
> > > > > 
> > > > > 
> > > > > >         dma_fence_put(fence);
> > > > > > @@ -1923,7 +1915,6 @@ static int xe_vm_unbind(struct xe_vm
> > > > > > *vm, struct xe_vma *vma,
> > > > > >    #define ALL_DRM_XE_VM_CREATE_FLAGS
> > > > > > (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
> > > > > >                                    
> > > > > > DRM_XE_VM_CREATE_FLAG_LR_MODE | \
> > > > > > -                                  
> > > > > > DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT | \
> > > > > >                                    
> > > > > > DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> > > > > >    int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> > > > > > @@ -1977,8 +1968,6 @@ int xe_vm_create_ioctl(struct
> > > > > > drm_device *dev, void *data,
> > > > > >                 flags |= XE_VM_FLAG_SCRATCH_PAGE;
> > > > > >         if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
> > > > > >                 flags |= XE_VM_FLAG_LR_MODE;
> > > > > > -       if (args->flags &
> > > > > > DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT)
> > > > > > -               flags |= XE_VM_FLAG_ASYNC_DEFAULT;
> > > > > >         if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> > > > > >                 flags |= XE_VM_FLAG_FAULT_MODE;
> > > > > > @@ -2062,7 +2051,7 @@ static const u32 region_to_mem_type[] =
> > > > > > {
> > > > > >    static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma
> > > > > > *vma,
> > > > > >                           struct xe_exec_queue *q, u32
> > > > > > region,
> > > > > >                           struct xe_sync_entry *syncs, u32
> > > > > > num_syncs,
> > > > > > -                         bool first_op, bool last_op)
> > > > > > +                         bool first_op, bool last_op, bool
> > > > > > async)
> > > > > >    {
> > > > > >         struct xe_exec_queue *wait_exec_queue =
> > > > > > to_wait_exec_queue(vm, q);
> > > > > >         int err;
> > > > > > @@ -2077,7 +2066,7 @@ static int xe_vm_prefetch(struct xe_vm
> > > > > > *vm, struct xe_vma *vma,
> > > > > >         if (vma->tile_mask != (vma->tile_present & ~vma-
> > > > > > >usm.tile_invalidated)) {
> > > > > >                 return xe_vm_bind(vm, vma, q, xe_vma_bo(vma),
> > > > > > syncs, num_syncs,
> > > > > > -                                 true, first_op, last_op);
> > > > > > +                                 true, first_op, last_op,
> > > > > > async);
> > > > > >         } else {
> > > > > >                 int i;
> > > > > > @@ -2400,6 +2389,8 @@ static int
> > > > > > vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct
> > > > > > xe_exec_queue *q,
> > > > > >                 }
> > > > > >                 op->q = q;
> > > > > > +               if (async)
> > > > > > +                       op->flags |= XE_VMA_OP_ASYNC;
> > > > > >                 switch (op->base.op) {
> > > > > >                 case DRM_GPUVA_OP_MAP:
> > > > > > @@ -2538,7 +2529,8 @@ static int op_execute(struct drm_exec
> > > > > > *exec, struct xe_vm *vm,
> > > > > >                                  op->syncs, op->num_syncs,
> > > > > >                                  op->map.immediate ||
> > > > > > !xe_vm_in_fault_mode(vm),
> > > > > >                                  op->flags & XE_VMA_OP_FIRST,
> > > > > > -                                op->flags & XE_VMA_OP_LAST);
> > > > > > +                                op->flags & XE_VMA_OP_LAST,
> > > > > > +                                op->flags &
> > > > > > XE_VMA_OP_ASYNC);
> > > > > >                 break;
> > > > > >         case DRM_GPUVA_OP_REMAP:
> > > > > >         {
> > > > > > @@ -2552,7 +2544,8 @@ static int op_execute(struct drm_exec
> > > > > > *exec, struct xe_vm *vm,
> > > > > >                                            op->num_syncs,
> > > > > >                                            op->flags &
> > > > > > XE_VMA_OP_FIRST,
> > > > > >                                            op->flags &
> > > > > > XE_VMA_OP_LAST &&
> > > > > > -                                          !prev && !next);
> > > > > > +                                          !prev && !next,
> > > > > > +                                          op->flags &
> > > > > > XE_VMA_OP_ASYNC);
> > > > > >                         if (err)
> > > > > >                                 break;
> > > > > >                         op->remap.unmap_done = true;
> > > > > > @@ -2563,7 +2556,8 @@ static int op_execute(struct drm_exec
> > > > > > *exec, struct xe_vm *vm,
> > > > > >                         err = xe_vm_bind(vm, op->remap.prev,
> > > > > > op->q,
> > > > > >                                          xe_vma_bo(op-
> > > > > > >remap.prev), op->syncs,
> > > > > >                                          op->num_syncs, true,
> > > > > > false,
> > > > > > -                                        op->flags &
> > > > > > XE_VMA_OP_LAST && !next);
> > > > > > +                                        op->flags &
> > > > > > XE_VMA_OP_LAST && !next,
> > > > > > +                                        op->flags &
> > > > > > XE_VMA_OP_ASYNC);
> > > > > >                         op->remap.prev->gpuva.flags &=
> > > > > > ~XE_VMA_LAST_REBIND;
> > > > > >                         if (err)
> > > > > >                                 break;
> > > > > > @@ -2576,7 +2570,8 @@ static int op_execute(struct drm_exec
> > > > > > *exec, struct xe_vm *vm,
> > > > > >                                          xe_vma_bo(op-
> > > > > > >remap.next),
> > > > > >                                          op->syncs, op-
> > > > > > >num_syncs,
> > > > > >                                          true, false,
> > > > > > -                                        op->flags &
> > > > > > XE_VMA_OP_LAST);
> > > > > > +                                        op->flags &
> > > > > > XE_VMA_OP_LAST,
> > > > > > +                                        op->flags &
> > > > > > XE_VMA_OP_ASYNC);
> > > > > >                         op->remap.next->gpuva.flags &=
> > > > > > ~XE_VMA_LAST_REBIND;
> > > > > >                         if (err)
> > > > > >                                 break;
> > > > > > @@ -2588,13 +2583,15 @@ static int op_execute(struct drm_exec
> > > > > > *exec, struct xe_vm *vm,
> > > > > >         case DRM_GPUVA_OP_UNMAP:
> > > > > >                 err = xe_vm_unbind(vm, vma, op->q, op->syncs,
> > > > > >                                    op->num_syncs, op->flags &
> > > > > > XE_VMA_OP_FIRST,
> > > > > > -                                  op->flags &
> > > > > > XE_VMA_OP_LAST);
> > > > > > +                                  op->flags &
> > > > > > XE_VMA_OP_LAST,
> > > > > > +                                  op->flags &
> > > > > > XE_VMA_OP_ASYNC);
> > > > > >                 break;
> > > > > >         case DRM_GPUVA_OP_PREFETCH:
> > > > > >                 err = xe_vm_prefetch(vm, vma, op->q, op-
> > > > > > >prefetch.region,
> > > > > >                                      op->syncs, op-
> > > > > > >num_syncs,
> > > > > >                                      op->flags &
> > > > > > XE_VMA_OP_FIRST,
> > > > > > -                                    op->flags &
> > > > > > XE_VMA_OP_LAST);
> > > > > > +                                    op->flags &
> > > > > > XE_VMA_OP_LAST,
> > > > > > +                                    op->flags &
> > > > > > XE_VMA_OP_ASYNC);
> > > > > >                 break;
> > > > > >         default:
> > > > > >                 drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> > > > > > @@ -2808,16 +2805,16 @@ static int
> > > > > > vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > > > > >    #ifdef TEST_VM_ASYNC_OPS_ERROR
> > > > > >    #define SUPPORTED_FLAGS      \
> > > > > > -       (FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_ASYNC | \
> > > > > > -        DRM_XE_VM_BIND_FLAG_READONLY |
> > > > > > DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
> > > > > > -        DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
> > > > > > +       (FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_READONLY
> > > > > > | \
> > > > > > +        DRM_XE_VM_BIND_FLAG_IMMEDIATE |
> > > > > > DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
> > > > > >    #else
> > > > > >    #define SUPPORTED_FLAGS      \
> > > > > > -       (DRM_XE_VM_BIND_FLAG_ASYNC |
> > > > > > DRM_XE_VM_BIND_FLAG_READONLY | \
> > > > > > +       (DRM_XE_VM_BIND_FLAG_READONLY | \
> > > > > >          DRM_XE_VM_BIND_FLAG_IMMEDIATE |
> > > > > > DRM_XE_VM_BIND_FLAG_NULL | \
> > > > > >          0xffff)
> > > > > >    #endif
> > > > > >    #define XE_64K_PAGE_MASK 0xffffull
> > > > > > +#define ALL_DRM_XE_SYNCS_FLAGS
> > > > > > (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
> > > > > >    #define MAX_BINDS    512     /* FIXME: Picking random
> > > > > > upper limit */
> > > > > > @@ -2829,7 +2826,7 @@ static int
> > > > > > vm_bind_ioctl_check_args(struct xe_device *xe,
> > > > > >         int err;
> > > > > >         int i;
> > > > > > -       if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
> > > > > > +       if (XE_IOCTL_DBG(xe, args->pad) ||
> > > > > >             XE_IOCTL_DBG(xe, args->reserved[0] || args-
> > > > > > >reserved[1]))
> > > > > >                 return -EINVAL;
> > > > > > @@ -2857,6 +2854,14 @@ static int
> > > > > > vm_bind_ioctl_check_args(struct xe_device *xe,
> > > > > >                 *bind_ops = &args->bind;
> > > > > >         }
> > > > > > +       *async = !(args->syncs.flags &
> > > > > > DRM_XE_SYNCS_FLAG_WAIT_FOR_OP);
> > > > > > +
> > > > > > +       if (XE_IOCTL_DBG(xe, args->syncs.flags &
> > > > > > ~ALL_DRM_XE_SYNCS_FLAGS) ||
> > > > > > +           XE_IOCTL_DBG(xe, !*async && args-
> > > > > > >syncs.num_syncs)) {
> > > > > > +               err = -EINVAL;
> > > > > > +               goto free_bind_ops;
> > > > > > +       }
> > > > > > +
> > > > > >         for (i = 0; i < args->num_binds; ++i) {
> > > > > >                 u64 range = (*bind_ops)[i].range;
> > > > > >                 u64 addr = (*bind_ops)[i].addr;
> > > > > > @@ -2887,18 +2892,6 @@ static int
> > > > > > vm_bind_ioctl_check_args(struct xe_device *xe,
> > > > > >                         goto free_bind_ops;
> > > > > >                 }
> > > > > > -               if (i == 0) {
> > > > > > -                       *async = !!(flags &
> > > > > > DRM_XE_VM_BIND_FLAG_ASYNC);
> > > > > > -                       if (XE_IOCTL_DBG(xe, !*async && args-
> > > > > > >num_syncs)) {
> > > > > > -                               err = -EINVAL;
> > > > > > -                               goto free_bind_ops;
> > > > > > -                       }
> > > > > > -               } else if (XE_IOCTL_DBG(xe, *async !=
> > > > > > -                                       !!(flags &
> > > > > > DRM_XE_VM_BIND_FLAG_ASYNC))) {
> > > > > > -                       err = -EINVAL;
> > > > > > -                       goto free_bind_ops;
> > > > > > -               }
> > > > > > -
> > > > > >                 if (XE_IOCTL_DBG(xe, op >
> > > > > > DRM_XE_VM_BIND_OP_PREFETCH) ||
> > > > > >                     XE_IOCTL_DBG(xe, flags &
> > > > > > ~SUPPORTED_FLAGS) ||
> > > > > >                     XE_IOCTL_DBG(xe, obj && is_null) ||
> > > > > > @@ -2951,7 +2944,7 @@ static int
> > > > > > vm_bind_ioctl_check_args(struct xe_device *xe,
> > > > > >    static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
> > > > > >                                        struct xe_exec_queue
> > > > > > *q,
> > > > > >                                        struct xe_sync_entry
> > > > > > *syncs,
> > > > > > -                                      int num_syncs)
> > > > > > +                                      int num_syncs, bool
> > > > > > async)
> > > > > >    {
> > > > > >         struct dma_fence *fence;
> > > > > >         int i, err = 0;
> > > > > > @@ -2967,7 +2960,7 @@ static int
> > > > > > vm_bind_ioctl_signal_fences(struct xe_vm *vm,
> > > > > >         xe_exec_queue_last_fence_set(to_wait_exec_queue(vm,
> > > > > > q), vm,
> > > > > >                                      fence);
> > > > > > -       if (xe_vm_sync_mode(vm, q)) {
> > > > > > +       if (!async) {
> > > > > >                 long timeout = dma_fence_wait(fence, true);
> > > > > >                 if (timeout < 0)
> > > > > > @@ -3001,7 +2994,7 @@ int xe_vm_bind_ioctl(struct drm_device
> > > > > > *dev, void *data, struct drm_file *file)
> > > > > >         if (err)
> > > > > >                 return err;
> > > > > > -       if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
> > > > > > +       if (XE_IOCTL_DBG(xe, args->pad) ||
> > > > > >             XE_IOCTL_DBG(xe, args->reserved[0] || args-
> > > > > > >reserved[1]))
> > > > > >                 return -EINVAL;
> > > > > > @@ -3016,12 +3009,6 @@ int xe_vm_bind_ioctl(struct drm_device
> > > > > > *dev, void *data, struct drm_file *file)
> > > > > >                         err = -EINVAL;
> > > > > >                         goto put_exec_queue;
> > > > > >                 }
> > > > > > -
> > > > > > -               if (XE_IOCTL_DBG(xe, args->num_binds && async
> > > > > > !=
> > > > > > -                                !!(q->flags &
> > > > > > EXEC_QUEUE_FLAG_VM_ASYNC))) {
> > > > > > -                       err = -EINVAL;
> > > > > > -                       goto put_exec_queue;
> > > > > > -               }
> > > > > >         }
> > > > > >         vm = xe_vm_lookup(xef, args->vm_id);
> > > > > > @@ -3030,14 +3017,6 @@ int xe_vm_bind_ioctl(struct drm_device
> > > > > > *dev, void *data, struct drm_file *file)
> > > > > >                 goto put_exec_queue;
> > > > > >         }
> > > > > > -       if (!args->exec_queue_id) {
> > > > > > -               if (XE_IOCTL_DBG(xe, args->num_binds && async
> > > > > > !=
> > > > > > -                                !!(vm->flags &
> > > > > > XE_VM_FLAG_ASYNC_DEFAULT))) {
> > > > > > -                       err = -EINVAL;
> > > > > > -                       goto put_vm;
> > > > > > -               }
> > > > > > -       }
> > > > > > -
> > > > > >         err = down_write_killable(&vm->lock);
> > > > > >         if (err)
> > > > > >                 goto put_vm;
> > > > > > @@ -3127,16 +3106,16 @@ int xe_vm_bind_ioctl(struct
> > > > > > drm_device *dev, void *data, struct drm_file *file)
> > > > > >                 }
> > > > > >         }
> > > > > > -       if (args->num_syncs) {
> > > > > > -               syncs = kcalloc(args->num_syncs,
> > > > > > sizeof(*syncs), GFP_KERNEL);
> > > > > > +       if (args->syncs.num_syncs) {
> > > > > > +               syncs = kcalloc(args->syncs.num_syncs,
> > > > > > sizeof(*syncs), GFP_KERNEL);
> > > > > >                 if (!syncs) {
> > > > > >                         err = -ENOMEM;
> > > > > >                         goto put_obj;
> > > > > >                 }
> > > > > >         }
> > > > > > -       syncs_user = u64_to_user_ptr(args->syncs);
> > > > > > -       for (num_syncs = 0; num_syncs < args->num_syncs;
> > > > > > num_syncs++) {
> > > > > > +       syncs_user = u64_to_user_ptr(args->syncs.syncs);
> > > > > > +       for (num_syncs = 0; num_syncs < args-
> > > > > > >syncs.num_syncs; num_syncs++) {
> > > > > >                 err = xe_sync_entry_parse(xe, xef,
> > > > > > &syncs[num_syncs],
> > > > > >                                          
> > > > > > &syncs_user[num_syncs],
> > > > > >                                          
> > > > > > (xe_vm_in_lr_mode(vm) ?
> > > > > > @@ -3210,7 +3189,8 @@ int xe_vm_bind_ioctl(struct drm_device
> > > > > > *dev, void *data, struct drm_file *file)
> > > > > >         vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> > > > > >    free_syncs:
> > > > > >         if (err == -ENODATA)
> > > > > > -               err = vm_bind_ioctl_signal_fences(vm, q,
> > > > > > syncs, num_syncs);
> > > > > > +               err = vm_bind_ioctl_signal_fences(vm, q,
> > > > > > syncs, num_syncs,
> > > > > > +                                                 async);
> > > > > >         while (num_syncs--)
> > > > > >                 xe_sync_entry_cleanup(&syncs[num_syncs]);
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > index 23abdfd8622f..ce8b9bde7e9c 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > > > @@ -167,13 +167,12 @@ struct xe_vm {
> > > > > >          */
> > > > > >    #define XE_VM_FLAG_64K                       BIT(0)
> > > > > >    #define XE_VM_FLAG_LR_MODE           BIT(1)
> > > > > > -#define XE_VM_FLAG_ASYNC_DEFAULT       BIT(2)
> > > > > > -#define XE_VM_FLAG_MIGRATION           BIT(3)
> > > > > > -#define XE_VM_FLAG_SCRATCH_PAGE                BIT(4)
> > > > > > -#define XE_VM_FLAG_FAULT_MODE          BIT(5)
> > > > > > -#define XE_VM_FLAG_BANNED              BIT(6)
> > > > > > -#define XE_VM_FLAG_TILE_ID(flags)      FIELD_GET(GENMASK(8,
> > > > > > 7), flags)
> > > > > > -#define XE_VM_FLAG_SET_TILE_ID(tile)   FIELD_PREP(GENMASK(8,
> > > > > > 7), (tile)->id)
> > > > > > +#define XE_VM_FLAG_MIGRATION           BIT(2)
> > > > > > +#define XE_VM_FLAG_SCRATCH_PAGE                BIT(3)
> > > > > > +#define XE_VM_FLAG_FAULT_MODE          BIT(4)
> > > > > > +#define XE_VM_FLAG_BANNED              BIT(5)
> > > > > > +#define XE_VM_FLAG_TILE_ID(flags)      FIELD_GET(GENMASK(7,
> > > > > > 6), flags)
> > > > > > +#define XE_VM_FLAG_SET_TILE_ID(tile)   FIELD_PREP(GENMASK(7,
> > > > > > 6), (tile)->id)
> > > > > >         unsigned long flags;
> > > > > >         /** @composite_fence_ctx: context composite fence */
> > > > > > @@ -385,6 +384,8 @@ enum xe_vma_op_flags {
> > > > > >         XE_VMA_OP_PREV_COMMITTED        = BIT(3),
> > > > > >         /** @XE_VMA_OP_NEXT_COMMITTED: Next VMA operation
> > > > > > committed */
> > > > > >         XE_VMA_OP_NEXT_COMMITTED        = BIT(4),
> > > > > > +       /** @XE_VMA_OP_ASYNC: operation is async */
> > > > > > +       XE_VMA_OP_ASYNC                 = BIT(5),
> > > > > >    };
> > > > > >    /** struct xe_vma_op - VMA operation */
> > > > > > diff --git a/include/uapi/drm/xe_drm.h
> > > > > > b/include/uapi/drm/xe_drm.h
> > > > > > index eb03a49c17a1..fd8172fe2d9a 100644
> > > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > > @@ -141,8 +141,7 @@ struct drm_xe_engine_class_instance {
> > > > > >          * Kernel only classes (not actual hardware engine
> > > > > > class). Used for
> > > > > >          * creating ordered queues of VM bind operations.
> > > > > >          */
> > > > > > -#define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC      5
> > > > > > -#define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC       6
> > > > > > +#define DRM_XE_ENGINE_CLASS_VM_BIND            5
> > > > > >         __u16 engine_class;
> > > > > >         __u16 engine_instance;
> > > > > > @@ -660,7 +659,6 @@ struct drm_xe_vm_create {
> > > > > >          * still enable recoverable pagefaults if supported
> > > > > > by the device.
> > > > > >          */
> > > > > >    #define DRM_XE_VM_CREATE_FLAG_LR_MODE                (1 <<
> > > > > > 1)
> > > > > > -#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT    (1 << 2)
> > > > > >         /*
> > > > > >          * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
> > > > > >          * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to
> > > > > > be allocated
> > > > > > @@ -668,7 +666,7 @@ struct drm_xe_vm_create {
> > > > > >          * The xe driver internally uses recoverable
> > > > > > pagefaults to implement
> > > > > >          * this.
> > > > > >          */
> > > > > > -#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE       (1 << 3)
> > > > > > +#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE       (1 << 2)
> > > > > >         /** @flags: Flags */
> > > > > >         __u32 flags;
> > > > > > @@ -776,12 +774,11 @@ struct drm_xe_vm_bind_op {
> > > > > >         __u32 op;
> > > > > >    #define DRM_XE_VM_BIND_FLAG_READONLY (1 << 0)
> > > > > > -#define DRM_XE_VM_BIND_FLAG_ASYNC      (1 << 1)
> > > > > >         /*
> > > > > >          * Valid on a faulting VM only, do the MAP operation
> > > > > > immediately rather
> > > > > >          * than deferring the MAP to the page fault handler.
> > > > > >          */
> > > > > > -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE  (1 << 2)
> > > > > > +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE  (1 << 1)
> > > > > >         /*
> > > > > >          * When the NULL flag is set, the page tables are
> > > > > > setup with a special
> > > > > >          * bit which indicates writes are dropped and all
> > > > > > reads return zero.  In
> > > > > > @@ -789,7 +786,7 @@ struct drm_xe_vm_bind_op {
> > > > > >          * operations, the BO handle MBZ, and the BO offset
> > > > > > MBZ. This flag is
> > > > > >          * intended to implement VK sparse bindings.
> > > > > >          */
> > > > > > -#define DRM_XE_VM_BIND_FLAG_NULL       (1 << 3)
> > > > > > +#define DRM_XE_VM_BIND_FLAG_NULL       (1 << 2)
> > > > > >         /** @flags: Bind flags */
> > > > > >         __u32 flags;
> > > > > > @@ -807,6 +804,27 @@ struct drm_xe_vm_bind_op {
> > > > > >         __u64 reserved[3];
> > > > > >    };
> > > > > > +/**
> > > > > > + * struct drm_xe_syncs - In / out syncs for IOCTLs.
> > > > > > + */
> > > > > > +struct drm_xe_syncs {
> > > > > > +       /** @num_syncs: amount of syncs to wait on */
> > > > > > +       __u32 num_syncs;
> > > > > > +
> > > > > > +       /*
> > > > > > +        * Block in IOCTL until operation complete, num_syncs
> > > > > > MBZ if set.
> > > > > > +        */
> > > > > > +#define DRM_XE_SYNCS_FLAG_WAIT_FOR_OP (1 << 0)
> > > > > > +       /** @flags: Sync flags */
> > > > > > +       __u32 flags;
> > > > > > +
> > > > > > +       /** @syncs: pointer to struct drm_xe_sync array */
> > > > > > +       __u64 syncs;
> > > > > > +
> > > > > > +       /** @reserved: Reserved */
> > > > > > +       __u64 reserved[2];
> > > > > > +};
> > > > > > +
> > > > > >    struct drm_xe_vm_bind {
> > > > > >         /** @extensions: Pointer to the first extension
> > > > > > struct, if any */
> > > > > >         __u64 extensions;
> > > > > > @@ -838,14 +856,8 @@ struct drm_xe_vm_bind {
> > > > > >                 __u64 vector_of_binds;
> > > > > >         };
> > > > > > -       /** @pad: MBZ */
> > > > > > -       __u32 pad2;
> > > > > > -
> > > > > > -       /** @num_syncs: amount of syncs to wait on */
> > > > > > -       __u32 num_syncs;
> > > > > > -
> > > > > > -       /** @syncs: pointer to struct drm_xe_sync array */
> > > > > > -       __u64 syncs;
> > > > > > +       /** @syncs: syncs for bind */
> > > > > > +       struct drm_xe_syncs syncs;
> > > > > >         /** @reserved: Reserved */
> > > > > >         __u64 reserved[2];
> > > > > > @@ -974,14 +986,14 @@ struct drm_xe_exec {
> > > > > >         /** @extensions: Pointer to the first extension
> > > > > > struct, if any */
> > > > > >         __u64 extensions;
> > > > > > +       /** @pad: MBZ */
> > > > > > +       __u32 pad;
> > > > > > +
> > > > > >         /** @exec_queue_id: Exec queue ID for the batch
> > > > > > buffer */
> > > > > >         __u32 exec_queue_id;
> > > > > > -       /** @num_syncs: Amount of struct drm_xe_sync in
> > > > > > array. */
> > > > > > -       __u32 num_syncs;
> > > > > > -
> > > > > > -       /** @syncs: Pointer to struct drm_xe_sync array. */
> > > > > > -       __u64 syncs;
> > > > > > +       /** @syncs: syncs for exec */
> > > > > > +       struct drm_xe_syncs syncs;
> > > > > >         /**
> > > > > >          * @address: address of batch buffer if
> > > > > > num_batch_buffer == 1 or an
> > > > > > @@ -995,8 +1007,8 @@ struct drm_xe_exec {
> > > > > >          */
> > > > > >         __u16 num_batch_buffer;
> > > > > > -       /** @pad: MBZ */
> > > > > > -       __u16 pad[3];
> > > > > > +       /** @pad2: MBZ */
> > > > > > +       __u16 pad2[3];
> > > > > >         /** @reserved: Reserved */
> > > > > >         __u64 reserved[2];
> 
