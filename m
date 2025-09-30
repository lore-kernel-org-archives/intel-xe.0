Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE7ECAC5B8
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 22:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749AB10E2DF;
	Tue, 30 Sep 2025 22:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gUMZo2eT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A185310E2DF
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 22:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759272832; x=1790808832;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MbDovZIQ2NxtlrY6MB7IP7mMVGyjxXj8O1e8SYZss3Q=;
 b=gUMZo2eTc6/4zeE6OVv0BIkzubI0kBlYWEUcpoXSo0HK5twLGQT4MZJK
 YUX152HsuR8aQZAcSCjFqw0HbnjRsK+rHxEz7jGgT5bq1wVew6FzKLADT
 uHs1ZDZUjdnicZeu3x8vk6m2XEFAeOnBiWCq206EuAoYC+x9xmHTy+s3q
 5rpdWXJBncZdoXE0mJ9Irp5iVnLHEYbEg9Ge+9TjjhWFURQjaeqW7o74C
 O2vOezjGP0hdes7F8Lf1tamN3VxvFcpsUkP/jpb72k2oyE4Dk9Efallha
 DErzKhEeW34bmh/XkKhky5L5wtkkSF6BGMOMOvk5bDHDu5/FfD/Uwia/g Q==;
X-CSE-ConnectionGUID: xniRmOkhS8CNxaC0vJtYnA==
X-CSE-MsgGUID: H3GrSfPKSb+wc6elhkx74A==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60754589"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="60754589"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:53:51 -0700
X-CSE-ConnectionGUID: GgM5YZtDSTGWZk2fWj6msw==
X-CSE-MsgGUID: m6zJHb0KQcWnVCiqQtMjzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="177918656"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 15:53:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 15:53:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 15:53:50 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 15:53:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6eMOHAJgwntXiVqKgApsV8ccCz8Fbd05YU6dw5V1UHqYHUSbkrCkbCNTsXPkM4fo8rvYixxb8tf8IsTUAYKl6bcAvASAp7gelPTrimzusY9rTrMo/iekNuAkDw6GCNoQw1b0YM8pfqCX3RgYzGq4vJaSAzIJ/HsMb6WNuwuaJHHW8DL2nSu+h5X2zOfoXqS8Ml5UAIPvO5v41I5GbjiVF5lr6shQ7J2h4Rk+96UAnuAEhVKwVBsL0PcD3sjtrWhAk+WhVYNg1sPeWHlLlaIlp7C36bOMFxrCLcsaUVi2js6buCvjdKxr2PuC8p3uNRArikwTALAZS4s/Ed4j7aaMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kqkSib6DW9FOECnbjeZCZNZ/nr/10e7m0sL0g6VIdw=;
 b=wPCcfBxLOky02OD/WiYFCkiKxOYaitEceYEt30qqihP1AJo2xzyjNmy6ltAj079dwVsD0fT++E3AwqrIkQU3eEV1BazzP2gH9Fr8kKFRrxj6PokQ2gUfSQV/jbBG0BzV1CNVALzuDRtTo1YLXDuru0titRTi7ztmJ6UFH6oYDFg+pLQ6lL3DQx0mnEvGD+038yaJ3tclUdodTQRdqNs9BrxoLUe5YeguF+mONxaOfYh8IZZ+RJydcSoutEV37MTov9SgDW8Kn7O1nDvikAWklKwkbTairUmRown+MGElckeQF8UJpD54kbrlNF4d4R3sLOn23OG1Ml+ljQlwIYEn+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4835.namprd11.prod.outlook.com (2603:10b6:303:9e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 22:53:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.014; Tue, 30 Sep 2025
 22:53:47 +0000
Date: Tue, 30 Sep 2025 15:53:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 01/36] drm/xe: Add NULL checks to scratch LRC allocation
Message-ID: <aNxfeR8YyLHlvL6a@lstrano-desk.jf.intel.com>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-2-matthew.brost@intel.com>
 <c16cf470-a725-4d21-9c54-b8a0686a3d99@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c16cf470-a725-4d21-9c54-b8a0686a3d99@intel.com>
X-ClientProxiedBy: MW4PR03CA0305.namprd03.prod.outlook.com
 (2603:10b6:303:dd::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4835:EE_
X-MS-Office365-Filtering-Correlation-Id: da149ed5-0798-405f-a79a-08de0074373a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jujvjd636+HzjVjoZIxtWsU4cTGsYIfx6/OyUHaqIF/3yuix72PsrbiyeSko?=
 =?us-ascii?Q?wywG8/HlSrYbARIB39HXN6UdD2eUTpjFE1x7y6StJ8otKewtIX0O6Fxcx+dI?=
 =?us-ascii?Q?U3G+R+F/271TQsVq1ciSeoM0CLJUHLPxACmT2zzQnTtq1slDejKBOuoE9Li8?=
 =?us-ascii?Q?srtJRQvuP8s/Aw4axt9rlOyk/lorBg/Yr6tIk8XUNVFupLh0XAFZKcIhCdIC?=
 =?us-ascii?Q?+vi7OtinsRpcOhVrDMvNQEfRWTOKzr4oQGEiFRTXfcWyCN97swcNOVAL1g7h?=
 =?us-ascii?Q?WJqDodWsIW150dblQVkTMVpDpBESRUWuLAn8+Ml+SNEKD0onUHjagASh6++5?=
 =?us-ascii?Q?pS5xWrz5prnSet03srwEniBLIWpHcGnYNsXmwgtd0ahIp2kBVXdH7xgUTNFs?=
 =?us-ascii?Q?B1ZUsBwoOJQU4APJ70BST44dpnRX1VL4Za8Hz4InMn8aozX6QeDs4n5qsXSc?=
 =?us-ascii?Q?Srf6c9Ye3FJOvnZjbXhIuunNXzMOyfb6eDlXP0YOeWlSyBr9CBLYOn13a7XZ?=
 =?us-ascii?Q?q75qcQ+W37Nx/GkPS4++l/ldwlq0OtyM/TUaXsXaagRBaLsKQH0L/goAOu1q?=
 =?us-ascii?Q?NSQmBptAAJnCKSjfiY+Jpq9beN7GTO0IlI/0YNTkjvFxZFGlxI8kENxJ47EU?=
 =?us-ascii?Q?ji7U7xhaaUP56SXlzq6TD3rwqTsmP7Z1ZaftR34U6hpuB/iLf8+tGWxc8jnb?=
 =?us-ascii?Q?dn00ISEc04CSOwazSORCUOWrbtWe8QpBIFUafdWvMAVy4THcMWYiow2gjHSe?=
 =?us-ascii?Q?aJZ5M46cNIgIbl1BLR+NqT70W23rUzFA6Jh57WB4XmOcwmgf+cgLEvRO7Af2?=
 =?us-ascii?Q?FjZkJDhif6ADJP4LhGU+epi3QKUUBzXGDRHG1hG/7ppenoj/Wwdm89TiZYmY?=
 =?us-ascii?Q?GCZZ2DCtPCEDrsrJ27yBHHvJjwQXiK90NF5q4uByPu3UP7R3dZiop4ZKdoLn?=
 =?us-ascii?Q?cecSO6cu0PyTYTOl8IVWeYOSSCchV5BJWpDMHG/oKPIjWF5rg2jynH0xnzjk?=
 =?us-ascii?Q?swjtF/52wbVeUON7Zehjp1tx4pLHI31rVBuGOUG9CyygxvSkmklw+KMgTRW+?=
 =?us-ascii?Q?fMzvh39CgfPgAC4MLIkrSzK0WB3zNzcWihpEDG0B69JPn78pxnwoSdpMh8/Z?=
 =?us-ascii?Q?OkSl/BT6ctkkJyz7H5u7vGPWOzUmU4MlhaCeusk1ndauplbyfM65lCsUBGai?=
 =?us-ascii?Q?9KNmgX3ezgV87ZaNlfr1A4gIKmiRRzafxODNNSQrxdiVdtLZFqmKrY3Cn0Bj?=
 =?us-ascii?Q?+Nvms582yhA/bVouMumQiPp5oSdzjSzAcMklp9dwRJR7s8cU1JrHbjpd1XP3?=
 =?us-ascii?Q?hlRcMUNlM4bZexP8IyFBbOSvEh3x58Pfjmr7n3QMZt5RRs/PhomIo7phrU7A?=
 =?us-ascii?Q?1JRX2CzotnmCq325Jx7+vRIHCjM2wzsAJZK1GO8soYJU5iQm4HUYixtEXWIF?=
 =?us-ascii?Q?uCLirkYC48f1EULJZASBnoC0K+pFqDSx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bu1TsEn99QnjTSn2gQd3KlmF3bGJ8lvgbLr94QY6pGKm9CzqBGFrpneuHLpl?=
 =?us-ascii?Q?p1/5ZhGJCQWB4sOS+yQADeRyo/7FDyCJoCt535X+5Vth8ahz28ALiw/pEodZ?=
 =?us-ascii?Q?3+LlGT7VEfVKLHKU7OYeFKnmZvsAoc1fsXC1yyBP0lp1YQyXr9+H0TNPxBI+?=
 =?us-ascii?Q?FN6Ow/lgI9wMJEnDzcug8DO1zISBo87AfNl7ijnbyMSTYVbCFZ5A+Q3VV1Qv?=
 =?us-ascii?Q?T22bLOuy93q/g7ZtdKrc39XixzxfIiiNGpOp7YuoP0YMnrOcBfL9IOqE0x15?=
 =?us-ascii?Q?yhIgxQ+TnUrayVgMF3AeaagegkizaHPmogxBMXTbpid1IYkV4BNrPmno5NlX?=
 =?us-ascii?Q?34i1EF34AIqv+/90OkNR1LOtOlM16/+TiaDQ69kvy94rtQ3OBAWxoAQEWSaw?=
 =?us-ascii?Q?M+1qhF7dDpC7EGRGh4UZQ9Is4vtFzqACnJ14eCJ0bcpPbz0y+Xdnw01Gipmb?=
 =?us-ascii?Q?JUYY0D67h+wmo44gCUQwbC5qVryqsNIU/GbxiLeu4y+KITVBp+2iq2sYtqwf?=
 =?us-ascii?Q?ZGGTIPbVTeCf0AQJXcRIcgjQmVfw4TlUx+Ahxw0w4W7z+5anmBXcSIkHs0E5?=
 =?us-ascii?Q?dT4QE+fccQmfdwC9fcjTtBcUipDmH1wDtb1SOX8g81q5KDQokuTC839S+PVY?=
 =?us-ascii?Q?zmPy4WloAzl9UpERrmobjBTjsHZU8TxQaMn4Nt3dPU0W1KpsT5f0rVsCEhN2?=
 =?us-ascii?Q?SMOYLSGLaG2ShNcM1gByt5AvyJMCqsojnYO2PX1r8QpU29HFAVyBncqVJcan?=
 =?us-ascii?Q?Jg6re7XBSmQxZOi5CcfIYGg+PVVN/gF+nUNWpPB7DujSruqqh/3MWteInBmG?=
 =?us-ascii?Q?BZEe7VFLCQo6zQEHX+PLnpG9QbQePaxbRUdb+tEC6JE+rX87yxE8xn0aoEEI?=
 =?us-ascii?Q?NRqD+cGF9zCcCUkHQkU8ROiP9GVKBXVfzjO5tnLgFdMWfVIMJfPwutwkrOya?=
 =?us-ascii?Q?BgmvoksVPzOue8G4tsRvFnof1YHOwNeOnphVQk/Aey57cjThEJivZ7uZvJvV?=
 =?us-ascii?Q?htzOXRsH3/vGwxBoabkxH4W3Ja/NQPEZ9caE0MUihsb17K5OxwVPX6L/6vhb?=
 =?us-ascii?Q?GZLGAvgIW3IsHi9ZNJUPq2KqaYED9mpan/NU2iMJ/MkOrcMqZDZ6eXF4XKTo?=
 =?us-ascii?Q?jHFsXgb+vbdPx1kNmUplqu7CpzWgOCtjE69EYlAhgb+Bw7/je/n4cfea4lxD?=
 =?us-ascii?Q?sRuc6eejYq7mIaoQOghIkz9vd+3HzszbXVf3F24posQ8akeHJcJrEpAon4rf?=
 =?us-ascii?Q?GyF9/MOMMndr0gV+zXhn52wOldwbxU+AEeFBQqVnUfDPbpEIfRbXAsy1k3Ye?=
 =?us-ascii?Q?g4+HAeOXBYDdizDRQIITwoWtgaMBSAkYYliNRyXjbqRCEYhOBwTQPyRlB8mK?=
 =?us-ascii?Q?DH1P4iFjZ4oKOFUGAXKYR8+nXXZbkGB7dacxyAymFwMBkDLhCHecNhlTxHv8?=
 =?us-ascii?Q?DUh0el79WnYOqjw9XaMdiDwSuJ/NoF4eTsvCEvStJ7DcjaU9UnscOih0c0kG?=
 =?us-ascii?Q?TJRo1/OFXtRSy/gtZmhxlTnYFdIK+7SgjxJmIJMcNFFdwciyLx21MHyt8ZjI?=
 =?us-ascii?Q?Jmj6HQv5gwoiL83u4Qs4q1AVjuv6aVapADCd9HddA0bw8WelL6TV18CgplG+?=
 =?us-ascii?Q?MA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da149ed5-0798-405f-a79a-08de0074373a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 22:53:47.7843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmj186jQwP/fcbJz2x4sPPlU2h/pJMP5kZ7qtb2x1raCIjV6jIenHeF1CbiYC98mOYuTKJyg4XP3Px17wFEb2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4835
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

On Tue, Sep 30, 2025 at 04:06:55AM +0200, Lis, Tomasz wrote:
> 
> On 9/29/2025 4:55 AM, Matthew Brost wrote:
> > kmalloc can fail, the returned value must have a NULL check.
> > 
> > Fixes: 168b5867318b ("drm/xe/vf: Refresh utilization buffer during migration recovery")
> > Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_lrc.c | 10 ++++++++--
> >   1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index 47e9df775072..e1bc102a6cae 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -1303,8 +1303,11 @@ static int setup_wa_bb(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> >   	u32 *buf = NULL;
> >   	int ret;
> > -	if (lrc->bo->vmap.is_iomem)
> > +	if (lrc->bo->vmap.is_iomem) {
> >   		buf = kmalloc(LRC_WA_BB_SIZE, GFP_KERNEL);
> > +		if (!buf)
> > +			return -ENOMEM;
> > +	}
> >   	ret = xe_lrc_setup_wa_bb_with_scratch(lrc, hwe, buf);
> 
> xe_lrc_setup_wa_bb_with_scratch()->setup_bo() handles the ENOMEM return, there was no bug.
> 
> > @@ -1347,8 +1350,11 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
> >   	if (xe_gt_WARN_ON(lrc->gt, !state.funcs))
> >   		return 0;
> > -	if (lrc->bo->vmap.is_iomem)
> > +	if (lrc->bo->vmap.is_iomem) {
> >   		state.buffer = kmalloc(state.max_size, GFP_KERNEL);
> > +		if (!state.buffer)
> > +			return -ENOMEM;
> > +	}
> >   	ret = setup_bo(&state);
> 
> setup_bo() does another check with ENOMEM return, no bug here as well. Also,
> with how setup_bo() exits, it ignores lack of allocation in case it won't be
> used anyway. -Tomasz
> 

Ok, I see this now but stylically / from layering this simply not how it
is done in Linux - the pattern is basically always kmallc + immediate
NUL check.

I can drop the fixes tag as it don't require a backport to stable but
for style and reability we should merge this patch or a version of this.

Matt

> >   	if (ret) {
