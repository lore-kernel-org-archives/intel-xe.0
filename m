Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A242C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 18:11:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09FDF10E11B;
	Wed,  6 Dec 2023 18:11:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22C9610E11B
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Dec 2023 18:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701886312; x=1733422312;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vEKHzBRpwgvOarA4jfp1hgSMEbh1VAiqQlh0yHsmcy0=;
 b=keS5M6Afaj3k/m/+F2tYg3I/cQmPUw7UjeXC6vwE0glQCYSiN5X8p0cl
 D45JzWev9EecaGtLu1Hz3ipaIHm2sNN4p+vo9NN0lnfeO6n5s4fbgBuBC
 i45+v81lJXGdHveN8QUx32f4j4KF9pu/HZM+oJ+aMYcN+m1e6/xKlHzsA
 Nf/3W2nAdaRtqhIRBovub3rCyT3Dqu3YiCxhcPfw6iYZwn1IlqnNCDjnl
 SsltJVXvuCESpKIe2h/IkSOEFe939B2vRdk8bKjlWcNDwV0mzKCoYPznJ
 NX6gPKlSa7q0IQAP7uiIotYn0gOWj9psx/pxdHrBK0BCwLIhSuH6KE40/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1170015"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1170015"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 10:11:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="721165260"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="721165260"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2023 10:11:51 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 10:11:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 10:11:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 10:11:50 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Dec 2023 10:11:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=le07vLVarsBGFjGegGbMgiTeNcq4hb/nXkX3lSoqzHbPSb2GRXlqltx9qJh9Y4DMITvhcJKNyArRg9CfogbVXcK8Imq/hNNVBv2cIAJ7QshE+Y2ZcdlTL4KvvWZy4M1s0m76IPKIUCm7bymYJJz3qX8XePiAQt9WRf+1daW4PvAiAivC4q5VEgKzhDLXAcTVu+A/mM5SUIqRbVVVnkKAeG+lg9mEl/dW9qT9uVAeFp47v4K+SF022AT3LLgyJrBWmv7Tma9IjAyAgdVPlbQXlUT3Df5c1LFAN2WVgDIDn0bfx0TU2iE8F/HlgM1NPAZNLVgrDzMF07B8fimf19YxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvKIl8Yc6fSzAPku4/yzNzry8pz0Z0wGAZ803Ni/jDI=;
 b=Jsyrb2lKYcXun89mZm4HYQbW0Nms/s5pxkL0GP1DGCiII7YsgVcDw5K8aDoP/MHJeawfL+lrDXLchjgW3bLvsEtCeYeMuki3N3XgLs1SNg1qrKJVAr0fuU0betDXPJ66YhWeioyr2V1AbuGOURYJTRFWY69Pcq7DVI1XhSusbOnH/XI6L4t5LjJizuDwpNvCmw2rJDGW/0Vli6X1zu8iTygKrgVVUPY9hd+bYvTDcKVd9VdklYHOjvRu/76sXgyabJ7qTTkye5u1WlsTS/q3zVN2DcImAzmkq6Y9xFaM/OU0xFd7fwWBOeQUfJ+M5Fdjw98vtd68YBJIGJbIK/jThA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV2PR11MB6048.namprd11.prod.outlook.com (2603:10b6:408:178::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 18:11:46 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 18:11:46 +0000
Date: Wed, 6 Dec 2023 13:11:41 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZXC5XblGwzRhEaZ8@intel.com>
References: <20231206160617.7-1-francois.dugast@intel.com>
 <3v6lvfmd37hezn6tudgzrwv235f7wv4wct4d7zswa5qres7sfx@jovwzf4vgh2l>
 <ZXCgqvhDlMiEJNFo@intel.com>
 <wpaxuzibwzygcbkoxzznwvjmb3ruvjbfauzvbkmjebq6jyxlx3@krcvv3no3x6o>
 <ZXCyg6rlskWo9T2P@intel.com>
 <3thkin72xw73v2rnbqd4reuuehwqzfioyuuyqfqospv3vabxfe@27ggwnwadhcv>
 <f15faa0af5fc03f8da360dbb7bfe3a6d7a92d4d3.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f15faa0af5fc03f8da360dbb7bfe3a6d7a92d4d3.camel@intel.com>
X-ClientProxiedBy: BYAPR07CA0100.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::41) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV2PR11MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df76624-30d9-4ee0-ceb8-08dbf686ceb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yP+R6Tfe3uFYmFSVQcWuHbhrLLYi5psmUO29BOAUCMRVubGS/1hd9mSKgU0/FDWrA/+ntdV3CeWX0MH6bbhfcQldotJnJHVS0+ObSh1KWL3cMhEnEhgDqOCwOofsIxVSFUK+0GYlW9HzREuqQnIcQbkAPl3KII+80jpPwypT1Qa+g6GE8cbhhn5af63wx7W0h7v/SIbMLDzQ9XKMvQ7aPt0yP0urNoAA6XDTJFTCPHtvpXA/6os6LvB9FFxtP93ooYloIxulJ33uxiMb2dbyGhj55EyEr/dsnSoRXRdDAuaPPLWH/J+pSrQv1/3smtmYRWKHHhTIY1j9WxJeOEtrxUmQD8VoKkt+8uXNLCripEt67uA5LVjOD8V997ZseHvy7yrH9wu7MF/bNNuZhNYNNOpVMrNCUCWOFy3YnkRINB7bP1XmrCdvcQE28/R2EufiiUcDthZHzu6xPUADhFZJqtrFpjDxd1iaGXYQpr9ZVnWrTHK6xzELRF+T78+YZIidRC+e1kQZOj+jN+uqTGDxQCx0mH8DOcprxjBt3VCWH+am/eLzfWDoUYNiKeVnP08J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(8936002)(8676002)(6862004)(4326008)(44832011)(6506007)(36756003)(2616005)(6666004)(26005)(6512007)(316002)(54906003)(37006003)(66946007)(66556008)(6636002)(66476007)(6486002)(478600001)(41300700001)(5660300002)(2906002)(86362001)(38100700002)(82960400001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n9R9X+Kb1/Pipc321caR7bCyOVJ4g4TUectonHeGqs/6MinIxn6NRI9a6N/b?=
 =?us-ascii?Q?waidOScbnEaTgN4lbtrJvWFNya7SrXIN1fTF66iQOAkKe8MLfmKdubf1J8np?=
 =?us-ascii?Q?km/6hdxpqMvIfgwoydFviS0YPmG4xYKoSVxzNqThQqokzGbesRmuTAZBHTOL?=
 =?us-ascii?Q?MHboC7UXkCUk3HBEHuQ93UjRfmbeHWvWJEN0GWUS/q15jmfi/w4tL9BsjUCJ?=
 =?us-ascii?Q?Tpb04grf/CrNOsnDthRZose97hmJ30u1G1hQuvWWU6l8odxWrTqRe/lFNJxm?=
 =?us-ascii?Q?8f09YlxzpqxS1FuTKfIEk2x6RJ6f+RBDBLTeb3MVEntMfdXTdIhlTv4ateFK?=
 =?us-ascii?Q?crdq1nUG0fBqoVMDSSsyjOa7AfI1qpoXzwwDxfTyOwb9DBNq27piaPYyw0WK?=
 =?us-ascii?Q?GFgsrEIA+htWak8bU8nwQR5p5Y2r3A8twW/5v1X92PopQoIsk28Xc3kZIPH8?=
 =?us-ascii?Q?IfV8Xwh/tSWaKBgCSG2375qfOJH/pJOe+6Hu3BnEHNN6Swhhjp4tWj5zfXjs?=
 =?us-ascii?Q?vT9noBqBrztN4HToHbjozekkQFeIUVk8Z9oB9hkVBCoW/NQkOzQT1RCMGz5P?=
 =?us-ascii?Q?r8LhKNFALIsQV9gffEvlbXONv9oQqsbc+575dKMKLfQpa55aeqwsFZhBvYM1?=
 =?us-ascii?Q?Q/dFC/sgW/+gkRf/vrqWuHic7ls2K6mHkS43xL+Xxi/wLGrT5G6Esxj55O8V?=
 =?us-ascii?Q?aKRxRvEaOyFx0eetOwjLFAe4G5MtPEImWFjHN5HF1gea/lWh4s8Ht5Bdin88?=
 =?us-ascii?Q?bRW+csFvV7sI6bFxEnWV773L1m4AJH796K2JXR9bHQQx95G+rGDD86KWmz7g?=
 =?us-ascii?Q?sE2ka2rWMy5d6ls957iAw22i0f+sXzA3NFzL5gobPN3upgzD9CP6dDseTc/b?=
 =?us-ascii?Q?TEXCbVZAX8tS2GRX3WzUPCeh64fOPR4Zi8k5KAmXZD11tTTQTAD5O19mKGlx?=
 =?us-ascii?Q?D9UGQxnqtI1Vr+L7eOhKQ7fqCGxlYZI/LGaAKG8WYj8o+6rGdf2VOb/ju5TO?=
 =?us-ascii?Q?YYzCo4rm0xcanTPBilxGaq6YL5Hl/UdRKYMe68XkeAfhxSopCzRp3daTgaNT?=
 =?us-ascii?Q?TiF4mvSz+b4cHxYz4G+A5dOKgFgjGnX4s87JwFj1qE9tdFuxhoQer9OXRnwx?=
 =?us-ascii?Q?PKsy48EPWQZwE8mJi9/TBvvgfsuFBT8Ey+INdcFOk5QyRLpsGBmR5qo88XCa?=
 =?us-ascii?Q?rUUSBUsSFuy1B/LFOPDOUvPB3HIF3oYFcai9OFER7X3JQpGmzlKwvzN7Km/O?=
 =?us-ascii?Q?/S7RpG2VQdZIYkgs440zYCamTsElyeuby9XtRYcNheraMBGH21yB++rCrwo6?=
 =?us-ascii?Q?wZKroWZbmrrxUp21Xyk0LxBrn7bBm4BtdH+f3JHCVfBMav0AGjLs/smhZJIp?=
 =?us-ascii?Q?Rt85kBgjUqp0xEFVABJDROH2tJvpLyOMMtYVS8PSGQ32wswEs8ZbfD5mIIAE?=
 =?us-ascii?Q?vBnoW9MXRJG7hdkW1Z1enrzZI5b0Y2bUuvZB6Y/0qcZXCVaLWLDA/vI8d5gt?=
 =?us-ascii?Q?OWQ0SjTjqWDiUfyZVlZZ/ZB/OyziUThW1u2rmkwtAXH3aIpTU1ABuw722LGI?=
 =?us-ascii?Q?GKAJoY+UJQCHbtz7vCW9Em8ttfgC/MdndJEEqGFzHDc5GGZ9qGGrGGU5wKfz?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df76624-30d9-4ee0-ceb8-08dbf686ceb9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 18:11:45.9758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tTsKFhoVXW/ZLW+Ujm2/gcX3QxRCwPzRbPPGtQAAgSkFAKE4C/gewiOBNS7rEmTclOH66Jzw+E/o11Fpxl7vAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6048
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/uapi: Remove
 DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>, "De Marchi,
 Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 06, 2023 at 05:52:52PM +0000, Souza, Jose wrote:
> On Wed, 2023-12-06 at 11:48 -0600, Lucas De Marchi wrote:
> > On Wed, Dec 06, 2023 at 12:42:27PM -0500, Rodrigo Vivi wrote:
> > > On Wed, Dec 06, 2023 at 10:33:35AM -0600, Lucas De Marchi wrote:
> > > > On Wed, Dec 06, 2023 at 11:26:18AM -0500, Rodrigo Vivi wrote:
> > > > > On Wed, Dec 06, 2023 at 10:16:22AM -0600, Lucas De Marchi wrote:
> > > > > > On Wed, Dec 06, 2023 at 04:06:17PM +0000, Francois Dugast wrote:
> > > > > > > The exec_queue_set_property feature was removed in a previous
> > > > > > > commit ("drm/xe/uapi: Kill exec_queue_set_property") and is no
> > > > > > > longer usable, struct drm_xe_exec_queue_set_property does not
> > > > > > > exist anymore, so let's remove this.
> > > > > 
> > > > > my bad, sorry
> > > > > 
> > > > > > > 
> > > > > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > > > 
> > > > > > should probably be a fixup to that patch? Anyway,
> > > > > 
> > > > > no because it is in the uapi header that gets "copied" by the UMDs
> > > > > and IGT already merged and Mesa likely... and we cannot do fixup
> > > > > on their sides.
> > > > 
> > > > wat?
> > > > 
> > > > any UMDs would just copy the header and point to the commit it came
> > > > from. It doesn't matter if we used a fixup or not.
> > > 
> > > But history wouldn't align. If they have already merged the commit with
> > > the sync pointing to a kernel commit that we do a later fixup, there
> > > would be a mismatch. Anyone looking the history in a later time would
> > > think that the UMD code was wrong.
> > > 
> > > And instead of blaming me for having missed this line in the first
> > > commit they would unfairly blame whoever authored the UMD patch
> > > 
> > > right Jose?
> > > 
> > > But I would be okay with a fixup if that is okay for Jose.
> > 
> > 
> > when a fixup is amended, it's not like the commit remains the same. You
> > will have a different hash for the new commit. Just point to the new
> > commit which has the same commit message as the previous one.
> > 
> > And we are still on top of drm-tip. All these commits will still be
> > rebased and have their hashes changed anyway.

for this reason, any patch like this I do in IGT I use the commit subject
but without any hash.

> > 
> > As long as we keep saving the tags so commits don't eventually
> > disappear from the remote, we should be fine.
> 
> I agree that for UMDs history have a fixup would be odd.
> 
> Mesa would have two commits pointing to the same commit title but with different hashes.
> 
> > 
> > Lucas De Marchi
> > 
> > > 
> > > > 
> > > > Lucas De Marchi
> > > > 
> > > > > 
> > > > > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > 
> > > > > > 
> > > > > > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > 
> > > > > > Lucas De Marchi
> > > > > > 
> > > > > > > ---
> > > > > > > include/uapi/drm/xe_drm.h | 1 -
> > > > > > > 1 file changed, 1 deletion(-)
> > > > > > > 
> > > > > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > > > > index dee750385161..346007e8074d 100644
> > > > > > > --- a/include/uapi/drm/xe_drm.h
> > > > > > > +++ b/include/uapi/drm/xe_drm.h
> > > > > > > @@ -53,7 +53,6 @@ extern "C" {
> > > > > > > #define DRM_IOCTL_XE_VM_BIND			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_BIND, struct drm_xe_vm_bind)
> > > > > > > #define DRM_IOCTL_XE_EXEC_QUEUE_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_CREATE, struct drm_xe_exec_queue_create)
> > > > > > > #define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
> > > > > > > -#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
> > > > > > > #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
> > > > > > > #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
> > > > > > > #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> > > > > > > --
> > > > > > > 2.34.1
> > > > > > > 
> 
