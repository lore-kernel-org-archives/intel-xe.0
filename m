Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C57FCD98D2
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 23:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B5E10E8B9;
	Tue, 16 Jun 2026 23:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ibxchibc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF6F10E8B9
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Jun 2026 23:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781652703; x=1813188703;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AW6EqxYYHhvXJAXglDvfQ9ck3WK2IyNm2yBSDY+jWZ8=;
 b=IbxchibcW1Zf3bgSqMPHKKTleFubZ28BTi/uo6ESN5/C1nk6WMv966Vt
 h6eD9mvb60+zwPBlEjcAOR5hvGMmuaz2vgvC55MLjMMZXCCllWx8A+7d4
 4+0oPkgt4MwkhlBaKxb/kjVVynGQXKhS8dnfMkBeQJ3CPuziHQLricaLs
 h5e1Oe5+jvt6ArG33vkaFX1JyuIJxOndQDPiO/k/8PJOnC895wTh3vAfP
 4/C3o39Lhk+F1gG6vOZeK9pcJ7TYwlbNRIj5jkpSy1tluxGTa8No2KjAc
 572kkfDIYWlCSjpqRBX1aGEby4hbvwu47DLJi2DqYkds+uOXToFt2IHdO Q==;
X-CSE-ConnectionGUID: jg5eu05dRaeenJSrlPat7A==
X-CSE-MsgGUID: iqlYYXs8RximqC9PHqVeAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93555131"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="93555131"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 16:31:42 -0700
X-CSE-ConnectionGUID: 7jKu1jwwQhykmf8h224fYQ==
X-CSE-MsgGUID: HHYS2ZZ3Qw6WN+VKTAhmMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="247785116"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 16:31:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:31:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 16:31:42 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:31:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y70wCYe0f/mpaRnp93d6CfEvoRlprNHb7hPPYHbTSI+b8zbtd1TrVhdqZef1Fyyatit+xXeQDmyotzpwpYcek3Jrv+aHVvbkpLO2L97+o0pPi0JhYhi50rcssXRbhI6NVWJzY9dlPPvBoTotLeuHGhVkRxucmAriEjfVoiY2hs7W/+aiEtMCM4I4DWpx7m7G6jhPl/qnUGHEor/WnZ2YoJPbBKAm1A0SJbZo1/1XiOyJhl8qO7ydkeg8ggx5/K/FgtklqJ8MK279BpKof+iTOPWDnHy+UCP+QfRbLjqh4SfibrO+f1kZX9cpQ5wTrT6KuPIBYWtWhI/XiG6pQ2fScA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kZB1G2aAVCVF4JWHm32HkEwPGitytr+YYIU/Ff4JGs=;
 b=eK22IdJC1cExMyHv69IxcQAIxCY7iAxXltCC3iCPCurlZnyUv54QGXooNYXiWcNX0AiexZPUVLTXtlwpvrjADnscCovmNJ5ps2ZPMCQFGrjtuS6DYZTxrMOUSkU9IK7F7VHhC+hlOcEA/j8Gj3LzHTsgThOzHjLyItyBIXu2MOCNlcvhzuR/shU1I1mf/TCXT7/e/dMGqcHtA7UDVF1hX+T8yFwst1TwQDmbi+SQGXzh/+dIi6rrjqsTu/WaYNwVwIquFQ36zJwmwGykkCaVQ/jLLSyBYxO0Mi3LBOr97sTAKqVQgdK1o+OZVnd4WY6d97UvT+icD1dLBTbuvUR66w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB8002.namprd11.prod.outlook.com (2603:10b6:806:2f6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 23:31:40 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 23:31:39 +0000
Date: Tue, 16 Jun 2026 16:31:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4] drm/xe: Disable scheduling early on FD close to avoid
 CAT error cascade
Message-ID: <ajHc2aryQQKWChVY@gsse-cloud1.jf.intel.com>
References: <20260613013859.3886196-1-matthew.brost@intel.com>
 <21184f8c769545e6e077e17985f858dfe9b7ea64.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21184f8c769545e6e077e17985f858dfe9b7ea64.camel@intel.com>
X-ClientProxiedBy: MW4P221CA0010.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB8002:EE_
X-MS-Office365-Filtering-Correlation-Id: cd77cf59-7a3d-4855-d4a6-08decbff6a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 4Nw6SYHtpB9YliDmnbjl9oyWgu+HpHLaDwL1PR4oilYkpeCcCdaFp8Yp/FimPfFsfMHjmiqKfjns8IUIRejtGoRMY10vk2/03FFhll6mknCeRithrcyEmJ8HI2xp0xtH2Hl74s03VDjPNjFhkpnh0QyPdPr/WKBvinXjWwlwncfGTeSEjPUtTVgFBLA4I9WaAjSzs814aUNpvKZEwBAwSYFh+aRmuoa+uj8oiZicbNqnTsEDMQZZKWG49sTTrvkvB25YmXFSwJRZkL/H32p45eqjRFsSy3UQS3IYJgt48lYB1jMNLJjTtZTjogZEOl3gxmJlQ9rr5RDTUwGk8tMowq8I4NfOgpaTj8irfjTVmqFelH5UfvKxDdd6eTaMCnu9f9SoJEcB077o2Xd9+KATJGcuFvLHiOc43obmWYIZpMsOelBVhU/nDxCRa1c0R+lFptuKLiUlclx0eyWPY0vEbbkwCLfYzjFXqSH3rH1GDUaG6nzCHh36o9fmSJEk4IJydkPdw3gZtDTwBTJBhtlu358IfYuKo5lRr229+YUh9JclN/UC1U7GDGLhBjYPmCpWZCS82QODTEoGe8y42++37vGCZLj5QWxEaiYQbKtlIhibM0z+/PswN9/1h7xFb6KcQh6Tu6A+XOyEYTYEc4wq77KFfdqOEcDA+RXjTkFdc5y2HDulJ/F3XD6/XhZSGXcm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?x2LN26aiJwc13spYS93JZthDOw6RbXfh6XrxLJxS5ct6VRzeWDmgSNz+4x?=
 =?iso-8859-1?Q?WFC6vKZaPlKrr7jOLxskF3sKkhOSqAffuBpkWGPCZbNECx+l9U7FfO9+Iv?=
 =?iso-8859-1?Q?zv4LT0i3odFcQCbM4mOc2itFRKpR+xB3lcEU5sPVGFvpCKDTVQZTq8nLWF?=
 =?iso-8859-1?Q?Omsc5lQB+jEN+C6X4LtdR7FxOOkYkK6yiDKDGMZ8WOXfxu4UFQsuc7uJMa?=
 =?iso-8859-1?Q?/HkblcW2N+9nQSfvO+yZ1XFLMTbDRE//UTxZkjkqF34tw6C+NeYddoErwI?=
 =?iso-8859-1?Q?Q0zQ7S5REIt4JRZ8uZ/Qi8eJ6jb410MCDkJATVmxC6h/kSOcefhpRbR/pE?=
 =?iso-8859-1?Q?Z8uPmBJJUDkLtbGmoxvqFQEHK92/zVTLoN9s+2NVr+fKgLfNhY9c5iX2Qj?=
 =?iso-8859-1?Q?8VeRZiBXbCoojxn5R66OhSOI3xlXtZoZ7VbdnyNqQJVaOyoj+R8XnWgsIc?=
 =?iso-8859-1?Q?MP7ggAdNa2sKVWe7bMzHM0S/xp5YDBb+8QSr43n6D7+0deh+0H3orBjecv?=
 =?iso-8859-1?Q?V2m/EUzq4sLG3IB52r/SCTLp2+CEP1Oxuvnw/JYU2rIP3RU9Oh2eVyxJHu?=
 =?iso-8859-1?Q?63S7f2vMwmTSwx3sPXz2RWkHS70ZRe+dZ2MApYc9VRvpWKHimxIzBhFJ93?=
 =?iso-8859-1?Q?8amV5ylRIC+I+woR7q3gNr7GvDFimAWRWsB9fokMPUpqZACo1LwQfp93D8?=
 =?iso-8859-1?Q?WRbx7Nt0ckUQSGtM8iVlGtGU271WsVbKEPM79jixAcYcbYbf9LnHMLLPh5?=
 =?iso-8859-1?Q?Gjp0dNqqocjyRhLg95yfRYLG88aEdSqNC+JRiC3zEwEI9zIFr+OeEQOial?=
 =?iso-8859-1?Q?RTz9aMjLpeVMqeKnVO5lLs/+TBO7asyZcZK5P6vCULpaP0Zbh+UKWTrE+8?=
 =?iso-8859-1?Q?mh3ssds+/RNF9tbEmV4mEt2TVWXiUctf/2SfvasoSwiH+ihlivUdZzagsS?=
 =?iso-8859-1?Q?VTpk0OLTBMVjUO9LkJ7lJ5EBp9cFTgv3GTdNnrl79zu2s/8l51KojQ2+/7?=
 =?iso-8859-1?Q?mR6L2V7WKq+nTwlClncKTty0wOMzrOdEmi7TaMdz9lhn+D7VXFvStTD4bl?=
 =?iso-8859-1?Q?hfhDL1Liah3ZhfmKSJwbqsqH2TU68Fk48+wjLWyi52iymyO7b1Mmt8ToCU?=
 =?iso-8859-1?Q?Mi9Anp1lwvhc6ngZ63fkKx4Sgcumhv4eRLvSwokFRb3nm0AX+gVPyQMmC7?=
 =?iso-8859-1?Q?utatcBq05/1Bnzhm4dT5Ka4pS+cexdi0hgbQGR7IeIszJBrLdQF/wxh7qs?=
 =?iso-8859-1?Q?8Lpcd1RPEuiI4UmQI3nm8JNJ39IaM0VOfm45e7faZfj6A1SmHUz2oPArMI?=
 =?iso-8859-1?Q?TR8g+EAh2NU73ij91m7UT0hkrlGhJYnHbwDdmrkwoLj5djGxcHaQSPG9Hg?=
 =?iso-8859-1?Q?1CcoV0GHNzMkXVuVee5ffZCreRjWkn0jlZckfZIM8fgLl3TvC//XcTWwcV?=
 =?iso-8859-1?Q?dq/2+DaTbbNLFVMnQELJbouBgLTmrfT/+Dq32u7bnSinTJAQez8ieGuNVC?=
 =?iso-8859-1?Q?/cEtoBaAsxxPFQw/WZ/jT1zVIDPUEeQzdb3wO2ehKy9fH6sQHyzUComgKV?=
 =?iso-8859-1?Q?QK8fD+L6hJhFkqK0AKRPnAewVcK3p2GMz7bItAGWEYhErRGeE3DXMmYHZ4?=
 =?iso-8859-1?Q?Y4IWCaGF0RQkrsJp/+o9/oKoh7RIgO1B31BfIHQ5kKY4rjyj6hIFXF0PW6?=
 =?iso-8859-1?Q?AsdD3X+qPVpqcaJ1PcW1hokwccUiMKz4sWtqpYtqGTY3SHa09HtXjX16Pw?=
 =?iso-8859-1?Q?b+X+Sm3lvDBy6QfkThagvF2rdeWaf/YFYAYkJz+WoJtwBs452HnVoaURhK?=
 =?iso-8859-1?Q?zW/nuh9vKTBOfZLEJjULFawqV+sycTQ=3D?=
X-Exchange-RoutingPolicyChecked: QR7ZXs5KhSSN0ZdUyH0pzt4HGgAsK3dDDPRCrt4NvZjlG8EWHDVgULGlJxcT1Mkeb3td6Kgl6KnG+TfrN0S+JbhSbow8vjKziU3yPad5lf2xFjMfvk6H73VOJQC+BhaZLYpZM9HP18uqq6k+PJn2Eoz0cqm2cvmD7KWQyxdwYspbLzeQZCUsMmkrMGURwl5Y+0rNJz1NZt9APx7w0fMDmoDDTVu/rxWa6wGZOwmIFg0PZixppQq5wUhnsvlR2GjRhv0wPYf6Q8fVBbi/16OaY3aT/p/QE0dYnMlS/l+ecLCtiOpCLvRSjOdgO2CqOL8lTUbt6zfCE+9mm6LxDVRsnA==
X-MS-Exchange-CrossTenant-Network-Message-Id: cd77cf59-7a3d-4855-d4a6-08decbff6a5e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 23:31:39.7072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrAqlWIvxxF151aNjkyEwlK0jznJ07k9An2tVKDFis0GTe2u2lnr8zYOhjcCYgIsXL9AoGWETf0QlCUmFtQweQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8002
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

On Tue, Jun 16, 2026 at 02:08:00PM -0600, Summers, Stuart wrote:
> On Fri, 2026-06-12 at 18:38 -0700, Matthew Brost wrote:
> > When an FD is closed with many exec queues, teardown relies on the
> > TDR
> > path to clean up scheduling. However, the TDR handling is serialized
> > (i.e., only one exec queue is processed at a time), which can make it
> > too slow compared to GuC scheduling activity.
> > 
> > In this window, GuC may continue to schedule contexts backed by
> > invalid page tables, leading to a cascade of CAT errors and repeated
> > engine resets. This significantly increases recovery time and can
> > degrade system stability.
> > 
> > To mitigate this, eagerly disable scheduling by sending a self-
> > message
> > outside of the TDR path. This prevents further scheduling of invalid
> > contexts and avoids the CAT error/reset cascade.
> > 
> > This change improves robustness and reduces recovery latency in
> > multiple queue teardown scenarios.
> > 
> > Cc: Wang Xin <x.wang@intel.com>
> > Cc: Jia Yao <jia.yao@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Tested-by: Jia Yao <jia.yao@intel.com>
> > 
> > ---
> > v3:
> >  - Make kill message static tomake reclaim safe (CI)
> >  - Do not issue kill messages for queue which bypass cleanup messages
> >    (sashiko)
> > v4:
> >  - Add missing message lock
> > ---
> >  drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  2 +-
> >  drivers/gpu/drm/xe/xe_guc_submit.c           | 44
> > ++++++++++++++++++--
> >  2 files changed, 42 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > index e5e53b421f29..247947fd357f 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > @@ -31,7 +31,7 @@ struct xe_guc_exec_queue {
> >          * a message needs to sent through the GPU scheduler but
> > memory
> >          * allocations are not allowed.
> >          */
> > -#define MAX_STATIC_MSG_TYPE    3
> > +#define MAX_STATIC_MSG_TYPE    4
> >         struct xe_sched_msg static_msgs[MAX_STATIC_MSG_TYPE];
> >         /** @destroy_async: do final destroy async from this worker
> > */
> >         struct work_struct destroy_async;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index afe5d99cdd8b..5ec1dca0324c 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1875,11 +1875,21 @@ static void
> > __guc_exec_queue_process_msg_set_multi_queue_priority(struct xe_sche
> >         kfree(msg);
> >  }
> >  
> > +static void __guc_exec_queue_process_msg_kill(struct xe_sched_msg
> > *msg)
> > +{
> > +       struct xe_exec_queue *q = msg->private_data;
> > +       struct xe_exec_queue *primary =
> > xe_exec_queue_multi_queue_primary(q);
> > +
> > +       if (exec_queue_enabled(primary))
> > +               disable_scheduling(primary, true);
> > +}
> > +
> >  #define CLEANUP                                1       /* Non-zero
> > values to catch uninitialized msg */
> >  #define SET_SCHED_PROPS                        2
> >  #define SUSPEND                                3
> >  #define RESUME                         4
> >  #define SET_MULTI_QUEUE_PRIORITY       5
> > +#define KILL                           6
> >  #define OPCODE_MASK    0xf
> >  #define MSG_LOCKED     BIT(8)
> >  #define MSG_HEAD       BIT(9)
> > @@ -1906,6 +1916,9 @@ static void guc_exec_queue_process_msg(struct
> > xe_sched_msg *msg)
> >         case SET_MULTI_QUEUE_PRIORITY:
> >                 __guc_exec_queue_process_msg_set_multi_queue_priority
> > (msg);
> >                 break;
> > +       case KILL:
> > +               __guc_exec_queue_process_msg_kill(msg);
> > +               break;
> >         default:
> >                 XE_WARN_ON("Unknown message type");
> >         }
> > @@ -2018,11 +2031,39 @@ static int guc_exec_queue_init(struct
> > xe_exec_queue *q)
> >         return err;
> >  }
> >  
> > +static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
> > +                                      struct xe_sched_msg *msg,
> > +                                      u32 opcode);
> > +
> > +#define STATIC_MSG_CLEANUP     0
> > +#define STATIC_MSG_SUSPEND     1
> > +#define STATIC_MSG_RESUME      2
> > +#define STATIC_MSG_KILL                3
> 
> This isn't related to this series... but can you explain these static
> messages a bit? We're adding over and over to the static_msgs linked
> list. I don't see that we're actually doing anything with this after
> adding though, so the list just grows indefinitely? Or maybe I'm
> missing something in the teardown here...
> 

The xe_gpu_scheduler component removes the messages from the list.

The idea behind static messages is places where we are the path of
reclaim (no memory allocations) we the static messages embedded in Guc
exec queue object to communicate with it self (i.e., kick the action to
the scheduler work queue).

> >  static void guc_exec_queue_kill(struct xe_exec_queue *q)
> >  {
> > +       struct xe_sched_msg *msg = q->guc->static_msgs +
> > STATIC_MSG_KILL;
> > +
> >         trace_xe_exec_queue_kill(q);
> >         set_exec_queue_killed(q);
> >         __suspend_fence_signal(q);
> > +
> > +       /*
> > +        * We eagerly send a message to ourselves to disable
> > scheduling, as the
> > +        * TDR is serialized (i.e., only one exec queue is processed
> > at a time).
> > +        * If an FD is closed with many exec queues, the TDR can be
> > slower than
> > +        * the GuC scheduling contexts with invalid page tables,
> > creating a
> > +        * cascade of CAT errors and engine resets, which is quite
> > slow. Avoid
> > +        * this by immediately disabling scheduling outside of the
> > TDR.
> > +        */
> > +       if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) &&
> > +           kref_read(&q->refcount) && !exec_queue_wedged(q)) {
> 
> Should we check pending disable here too?
> 

No, but this is an old bug I thought I had already fix - in stead of
__suspend_fence_signal we should wait on suspend fence to signal - that
is only place a pending disable can be inflight + signaling the suspend
fence here actually opens a memory corruption window. I'll fix this in
independent patch in the next rev.

Matt

> Thanks,
> Stuart
> 
> > +               struct xe_gpu_scheduler *sched = &q->guc->sched;
> > +
> > +               xe_sched_msg_lock(sched);
> > +               guc_exec_queue_try_add_msg(q, msg, KILL);
> > +               xe_sched_msg_unlock(sched);
> > +       }
> > +
> >         xe_guc_exec_queue_trigger_cleanup(q);
> >  }
> >  
> > @@ -2066,9 +2107,6 @@ static bool guc_exec_queue_try_add_msg(struct
> > xe_exec_queue *q,
> >         return true;
> >  }
> >  
> > -#define STATIC_MSG_CLEANUP     0
> > -#define STATIC_MSG_SUSPEND     1
> > -#define STATIC_MSG_RESUME      2
> >  static void guc_exec_queue_destroy(struct xe_exec_queue *q)
> >  {
> >         struct xe_sched_msg *msg = q->guc->static_msgs +
> > STATIC_MSG_CLEANUP;
> 
