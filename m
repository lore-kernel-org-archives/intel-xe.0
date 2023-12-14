Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF9FC4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 03:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C7710E8BC;
	Thu, 14 Dec 2023 03:25:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EBD10E8B1
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Dec 2023 03:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702524303; x=1734060303;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ox2aftlDofFCu+08zqFrG6owAckKNaGrNqzhHw3NBB4=;
 b=DSg6t7KNYsBNZVeTfAgL23xEuks4Mnh9ePjbx7NCMzaK6R/UFCmkkM2Y
 Ius6WVO2XDSNv7PJ8JQ2MINuUhMSTzAa2NT6HZ4EWG3MCPIBTSgyhuJBQ
 XNNZHCf2m4wPCZHSbGrDsbwRRf93xjNu3ioSQzGssFQ6xb0xOe4GJ2lho
 r1MR+oMG3BkKOsGUoXyGjPUpdEKsAduncNmhrkZEG6+yZ3uQPCv68I7PV
 TbUtJxFH/TWL4Y08CRbPUVpZAQ0D8nWCWtWQkZwYvlPrQZ7ZN9AjLaeDI
 FFRDZ7jhAkByWTJUTKSzyAPavf/D8hsmw+prT6cHnnRep2RqNXNghqx4y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="1895893"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="1895893"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 19:25:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="844553155"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="844553155"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2023 19:25:02 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Dec 2023 19:25:01 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 13 Dec 2023 19:25:01 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 13 Dec 2023 19:25:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLNEcJOy336NszOjxO3J6CTSz8EpvWz6JyNQ3448z4fEgt7D19w2fRWCRnlw0xlhGMxeRprE7fpRKei0zCUzk9aC42E7BJv7knlAoJBLuiS6LoGhbI1u397xAvCR2+5gjRs8p8p2AJLU5RFsqlSWiq6M80i/riLjvftPBdDnIdQez8XaZuNY60EDTGcYFxx9y1a3AzOX12le0fxOUN75GSWln5LSPgJPxub5CsVBz/fnBhUHVe44yVhNxLLjWtXKbZtvS0rjMBO3Twd8YE9mkIUofzCPZqr4SnzGlnuvgWGtWp0BhDOTXl7BpZT68QhxRy7ZvPzdU8ATJbTx9lBj4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1St7GTbY+g2EfrbpXrqBCiY2ZKK3TMXK/MbKO1L2Jk=;
 b=kQpX9Slskxbpu1m11DoSq0alp5O0Pb5umsK/a/rnwzn+IJeO8N6+/Iok1I+dLTBOuolBL3JwyCEpmh8ElMMGjvKAv7oyviJILedY/7PB1foflVL91ioOkquPBz9U1moVmNNsmfdAtAZdEdIi+QGTfSXug6+HG5F1gM1sfBj6jyJd0ziT/SsuBLYPlRpjs0t6n1H65R9rt520IJeCOBlyWgnQhcNQyKcwog5QC9czPRE/EVW1pQ3pMA78BLiXDUVzg8gwl+8X6j85h+tZzmWolgBDPRs/i/tB/XZOTRfaOt6ouyq1C7V4ygdX2ph3A0hLAnDzxFGeQ5eeMzKNSN9kHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5256.namprd11.prod.outlook.com (2603:10b6:208:30a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 03:24:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7091.022; Thu, 14 Dec 2023
 03:24:57 +0000
Date: Thu, 14 Dec 2023 03:23:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Subject: Re: [PATCH v3] drm/xe/uapi: Uniform async vs sync handling
Message-ID: <ZXp1S/+0o1bEWV/4@DUT025-TGLU.fm.intel.com>
References: <20231213222957.624515-1-matthew.brost@intel.com>
 <f4f35746bbdb583c5aaa26e4f190acebd30a30ab.camel@intel.com>
 <ZXpLwsTARao26Hd+@DUT025-TGLU.fm.intel.com>
 <77675bb1bc4ba539ed437d5b6492bc07a79e7d94.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77675bb1bc4ba539ed437d5b6492bc07a79e7d94.camel@intel.com>
X-ClientProxiedBy: BYAPR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:40::38) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5256:EE_
X-MS-Office365-Filtering-Correlation-Id: d6360d1e-f9ca-4690-1c30-08dbfc543f76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KrE6LcHlNN0gRPF9X6jNLtVXjvXelR5XuxxIbkbr/7OmtEknXJwuiUrZT5359v///fI2c7E+l4cx7daMMtUC1I/lu75rl1DVJuOCiiLF1k4DCif1A+KMWbj9QZP98lwRoIAqkaZvF5WrxSUMAIgNXiwUakC5s1J1w4vmcKGEvTqaurGgrJcEajsAcqAW8uhwihcjqRySQx0kG+qh8YbR8HrSa4V2NJh55efDrQufOR5LgnX/A916Iyq/pXgu9gDn+61POaqCT78XfmFHYta/PpBCadR0aXKTWieqIVM0nhS+dbfNwuqoB396m0RvJljmIXjDu3HOVY4xCGj5PyHQyEeCSqIJeghI2SJzoUmn0YW5MVZ0bIgbY06TracLoyMGHx4fpoyzWCLRZp4NroQb9Mt/aDibIRUwnhFdwLNFcjAZMsoPDYBYN+Kqh6Q+ym1ulEaa+oZW8HVKLpD9M+Z5XgvU6vd/z1aiGrAn0POvP6s2Cz8E1TlGgoGfcT3KGxyuyFVY/bW3hPnMrbfaj744iGykvBJUNkeEOX5Ph73tVxA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(366004)(39860400002)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(26005)(66574015)(83380400001)(107886003)(6506007)(6512007)(38100700002)(8936002)(8676002)(44832011)(5660300002)(4326008)(6862004)(30864003)(41300700001)(2906002)(4001150100001)(966005)(6486002)(478600001)(316002)(6636002)(54906003)(66476007)(66556008)(66946007)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rbq8jUS85ny841pQ1iBhp1Y1HCqtdfIDEgsw9QzbL+dQJY4rwA0NOuvwky?=
 =?iso-8859-1?Q?kbltnMYnA7EYq/9f8NBPJ/EpUEq5A2h9+ySa2+Tr0MHKQnOQPAkBd+yH0v?=
 =?iso-8859-1?Q?u/qR4NH+XK9/NgNvjuYmpoe99iBa2ETNnZS4X4+Fk91CR575JRAAssXbiU?=
 =?iso-8859-1?Q?iuHAOt9Cyl4sSOW+3kCVxOsy/mboFQ+TL2ScTrDBE0nvfp6yCBqrKq7ro0?=
 =?iso-8859-1?Q?PE/yJzdXPe4qxCu7F2DnIIjdgcSbb1bPHKjJ14wc4cp/UFv4pAfvfhGqKn?=
 =?iso-8859-1?Q?VVaveu8fbxuqaS0Ks+ru3lglmCTeLiNftTCL3ZG6fzLHzVWvtOv78XYqrf?=
 =?iso-8859-1?Q?G1reX07S2dJhWuRoUVTZLMG8n7Wf88WiwS7aV10J7OVcSjM1ZDlPW2tyca?=
 =?iso-8859-1?Q?CsEOTFLFpvwYM0SxstflVJlEH5lRU5sXxHaKsug2nZa3e85ZHnKy1MvWqk?=
 =?iso-8859-1?Q?LIYi3HxLif91GB5cAVDt87tiavbKfNVVAg46Z/u0Y/sqeeJDa/cS33n77L?=
 =?iso-8859-1?Q?2XLLYhwtGc+p/S3j+/rj+eaz8Q2eRyIep8CwaYY3ocs6jd4N6Cj4QDFHUa?=
 =?iso-8859-1?Q?rpNPEPVf2gxBUAMOTuw+F2+jLzdSqMlX/G0hi9zdRXO/v8PF8BbZ0H7Q8w?=
 =?iso-8859-1?Q?Q3vGxEtZ37ELTB+4wc38GB/yULNY8cY0ckyXKRM5n3z5yDBdaTeY5o1Dpi?=
 =?iso-8859-1?Q?W0C3shZTSoUKGUzBhKiIq7CM6BUZtOimH8jjVxwmZUiCkWrVEE2dTrF8v0?=
 =?iso-8859-1?Q?cprDltaDl7sgvgWnK/LgC5/xUTN2+RszRS8XmwpPZoPnWfmK1cv1ztrR7l?=
 =?iso-8859-1?Q?qHhueMZuNKgYFuUxvqtaUjbSim5I+IDbiR/baasKdsYlSWUlImOT/JWaMm?=
 =?iso-8859-1?Q?qkF3lYG1yGN+r5e/ijHgAxL459X2U1YyyfbXdmxw8hF5lrqc8c7ALzFWOk?=
 =?iso-8859-1?Q?j8LhAtAD4PwaXbo0mkX2wqbLBTKIGpGnfxzZAe5VW+7b6ex2FOTYHx8zNJ?=
 =?iso-8859-1?Q?5cXFv4ps89U8KTNL1PZuZ+1ehvn4KK0SGactl/igZd37YZ1UBMCoBbLCe6?=
 =?iso-8859-1?Q?qx3TCWabIp8GO9HhbLe6Ir7GVi0LsZE4goSl91dlBG3I65bELEeOZSjYph?=
 =?iso-8859-1?Q?JF/w+dajVWkFnFR/4l4/b/oUgi6fiN3Z09NF7Oe/fll3SziI9uRthPIvYA?=
 =?iso-8859-1?Q?JjHaacVeGV/RH9qQJ9m4sztwDCNnbF84zhbR6kTsfhJwUYD/QOKLHOIF67?=
 =?iso-8859-1?Q?XhoG88G1XHjD9lKHblLe666Cn1zmGy14qS90/HrIUKnwwk/dFFR/3sB7xj?=
 =?iso-8859-1?Q?1qu9M85IfvbFB1BT51WvPRbWq4O6dWBr91Jp68uP8tdoe7QrEpKg2yghYr?=
 =?iso-8859-1?Q?nyUOH0JcIm6HfagFbAZ0Wy377w8ro506l6VDBUmNjggLWu5xbJCqx35wCw?=
 =?iso-8859-1?Q?UI11Pnsa7Ew+AC3Tt9jYRTEOF130zicibkA0sYZ2Lmt41U+d6nDq9jRq+E?=
 =?iso-8859-1?Q?UVD6Zm/abqOzCd1f0wMEBC+ARpKjEiDPlE2uuOwDChVcc0tRCV5Xt29QpX?=
 =?iso-8859-1?Q?FP3xGWozc3d0GgfDhhIDoJ7mfXbbOEm9hBST4SkM9hBAQ3SSvNnD1rf1QB?=
 =?iso-8859-1?Q?uiGlzNQpSh7/mUuYajyy4jnNOPHn26gv/yqjS0ywTgDkZxagUMDPZHHw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6360d1e-f9ca-4690-1c30-08dbfc543f76
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 03:24:57.7266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BHuqjU5VpztQkeeUAI4P2217PPqhb8Z12U79eW6zWbJNQMjm11ylibW+GZa8cRAlWKIwOETqxfChxYdjArICtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5256
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
Cc: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Dec 13, 2023 at 06:51:38PM -0700, Souza, Jose wrote:
> On Thu, 2023-12-14 at 00:26 +0000, Matthew Brost wrote:
> > On Wed, Dec 13, 2023 at 03:49:53PM -0700, Souza, Jose wrote:
> > > On Wed, 2023-12-13 at 14:29 -0800, Matthew Brost wrote:
> > > > Remove concept of async vs sync VM bind queues, rather make async vs
> > > > sync a per IOCTL choice. Since this is per IOCTL, it makes sense to have
> > > > a singular flag IOCTL rather than per VM bind op flag too. Add
> > > > DRM_XE_SYNCS_FLAG_WAIT_FOR_OP which is an input sync flag to support
> > > > this. Support this new flag for both the VM bind IOCTL only with a path
> > > > to support this for execs too.
> > > > 
> > > > v2: Add cookie, move sync wait outside of any locks.
> > > > v3: Skip bind operations if *cookie non-zero, check reserved bits zero
> > > > 
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_exec.c             |  13 ++-
> > > >  drivers/gpu/drm/xe/xe_exec_queue.c       |   7 +-
> > > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 -
> > > >  drivers/gpu/drm/xe/xe_vm.c               | 140 ++++++++++++-----------
> > > >  drivers/gpu/drm/xe/xe_vm_types.h         |  13 +--
> > > >  include/uapi/drm/xe_drm.h                |  65 +++++++----
> > > >  6 files changed, 131 insertions(+), 109 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> > > > index ba92e5619da3..af2b676c8eef 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > > @@ -104,7 +104,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >  	struct xe_device *xe = to_xe_device(dev);
> > > >  	struct xe_file *xef = to_xe_file(file);
> > > >  	struct drm_xe_exec *args = data;
> > > > -	struct drm_xe_sync __user *syncs_user = u64_to_user_ptr(args->syncs);
> > > > +	struct drm_xe_sync __user *syncs_user = u64_to_user_ptr(args->syncs.syncs);
> > > >  	u64 __user *addresses_user = u64_to_user_ptr(args->address);
> > > >  	struct xe_exec_queue *q;
> > > >  	struct xe_sync_entry *syncs = NULL;
> > > > @@ -120,7 +120,10 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >  	int err = 0;
> > > >  
> > > >  	if (XE_IOCTL_DBG(xe, args->extensions) ||
> > > > -	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
> > > > +	    XE_IOCTL_DBG(xe, args->pad || args->pad2[0] || args->pad2[1] || args->pad2[2]) ||
> > > > +	    XE_IOCTL_DBG(xe, args->syncs.flags) ||
> > > > +	    XE_IOCTL_DBG(xe, args->syncs.cookie) ||
> > > > +	    XE_IOCTL_DBG(xe, args->syncs.reserved[0] || args->syncs.reserved[1]) ||
> > > >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > > >  		return -EINVAL;
> > > >  
> > > > @@ -140,8 +143,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >  		goto err_exec_queue;
> > > >  	}
> > > >  
> > > > -	if (args->num_syncs) {
> > > > -		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
> > > > +	if (args->syncs.num_syncs) {
> > > > +		syncs = kcalloc(args->syncs.num_syncs, sizeof(*syncs), GFP_KERNEL);
> > > >  		if (!syncs) {
> > > >  			err = -ENOMEM;
> > > >  			goto err_exec_queue;
> > > > @@ -150,7 +153,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >  
> > > >  	vm = q->vm;
> > > >  
> > > > -	for (i = 0; i < args->num_syncs; i++) {
> > > > +	for (i = 0; i < args->syncs.num_syncs; i++) {
> > > >  		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs++],
> > > >  					  &syncs_user[i], SYNC_PARSE_FLAG_EXEC |
> > > >  					  (xe_vm_in_lr_mode(vm) ?
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > index eeb9605dd45f..a25d67971fdd 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > @@ -625,10 +625,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > > >  	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.gt_count))
> > > >  		return -EINVAL;
> > > >  
> > > > -	if (eci[0].engine_class >= DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC) {
> > > > -		bool sync = eci[0].engine_class ==
> > > > -			DRM_XE_ENGINE_CLASS_VM_BIND_SYNC;
> > > > -
> > > > +	if (eci[0].engine_class == DRM_XE_ENGINE_CLASS_VM_BIND) {
> > > >  		for_each_gt(gt, xe, id) {
> > > >  			struct xe_exec_queue *new;
> > > >  
> > > > @@ -654,8 +651,6 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> > > >  						   args->width, hwe,
> > > >  						   EXEC_QUEUE_FLAG_PERSISTENT |
> > > >  						   EXEC_QUEUE_FLAG_VM |
> > > > -						   (sync ? 0 :
> > > > -						    EXEC_QUEUE_FLAG_VM_ASYNC) |
> > > >  						   (id ?
> > > >  						    EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD :
> > > >  						    0));
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > index c7aefa1c8c31..0f7f6cded4a3 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > @@ -84,8 +84,6 @@ struct xe_exec_queue {
> > > >  #define EXEC_QUEUE_FLAG_VM			BIT(4)
> > > >  /* child of VM queue for multi-tile VM jobs */
> > > >  #define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(5)
> > > > -/* VM jobs for this queue are asynchronous */
> > > > -#define EXEC_QUEUE_FLAG_VM_ASYNC		BIT(6)
> > > >  
> > > >  	/**
> > > >  	 * @flags: flags for this exec queue, should statically setup aside from ban
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 2f3df9ee67c9..8407c4d54a45 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -1343,9 +1343,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
> > > >  			struct xe_gt *gt = tile->primary_gt;
> > > >  			struct xe_vm *migrate_vm;
> > > >  			struct xe_exec_queue *q;
> > > > -			u32 create_flags = EXEC_QUEUE_FLAG_VM |
> > > > -				((flags & XE_VM_FLAG_ASYNC_DEFAULT) ?
> > > > -				EXEC_QUEUE_FLAG_VM_ASYNC : 0);
> > > > +			u32 create_flags = EXEC_QUEUE_FLAG_VM;
> > > >  
> > > >  			if (!vm->pt_root[id])
> > > >  				continue;
> > > > @@ -1712,12 +1710,6 @@ xe_vm_bind_vma(struct xe_vma *vma, struct xe_exec_queue *q,
> > > >  	return ERR_PTR(err);
> > > >  }
> > > >  
> > > > -static bool xe_vm_sync_mode(struct xe_vm *vm, struct xe_exec_queue *q)
> > > > -{
> > > > -	return q ? !(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC) :
> > > > -		!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT);
> > > > -}
> > > > -
> > > >  static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> > > >  			struct xe_exec_queue *q, struct xe_sync_entry *syncs,
> > > >  			u32 num_syncs, bool immediate, bool first_op,
> > > > @@ -1747,8 +1739,6 @@ static int __xe_vm_bind(struct xe_vm *vm, struct xe_vma *vma,
> > > >  
> > > >  	if (last_op)
> > > >  		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > > > -	if (last_op && xe_vm_sync_mode(vm, q))
> > > > -		dma_fence_wait(fence, true);
> > > >  	dma_fence_put(fence);
> > > >  
> > > >  	return 0;
> > > > @@ -1791,8 +1781,6 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> > > >  	xe_vma_destroy(vma, fence);
> > > >  	if (last_op)
> > > >  		xe_exec_queue_last_fence_set(wait_exec_queue, vm, fence);
> > > > -	if (last_op && xe_vm_sync_mode(vm, q))
> > > > -		dma_fence_wait(fence, true);
> > > >  	dma_fence_put(fence);
> > > >  
> > > >  	return 0;
> > > > @@ -1800,7 +1788,6 @@ static int xe_vm_unbind(struct xe_vm *vm, struct xe_vma *vma,
> > > >  
> > > >  #define ALL_DRM_XE_VM_CREATE_FLAGS (DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE | \
> > > >  				    DRM_XE_VM_CREATE_FLAG_LR_MODE | \
> > > > -				    DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT | \
> > > >  				    DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> > > >  
> > > >  int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> > > > @@ -1854,8 +1841,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> > > >  		flags |= XE_VM_FLAG_SCRATCH_PAGE;
> > > >  	if (args->flags & DRM_XE_VM_CREATE_FLAG_LR_MODE)
> > > >  		flags |= XE_VM_FLAG_LR_MODE;
> > > > -	if (args->flags & DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT)
> > > > -		flags |= XE_VM_FLAG_ASYNC_DEFAULT;
> > > >  	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
> > > >  		flags |= XE_VM_FLAG_FAULT_MODE;
> > > >  
> > > > @@ -2263,8 +2248,7 @@ static int xe_vma_op_commit(struct xe_vm *vm, struct xe_vma_op *op)
> > > >  static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
> > > >  				   struct drm_gpuva_ops *ops,
> > > >  				   struct xe_sync_entry *syncs, u32 num_syncs,
> > > > -				   struct list_head *ops_list, bool last,
> > > > -				   bool async)
> > > > +				   struct list_head *ops_list, bool last)
> > > >  {
> > > >  	struct xe_vma_op *last_op = NULL;
> > > >  	struct drm_gpuva_op *__op;
> > > > @@ -2696,28 +2680,28 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > > >  
> > > >  #ifdef TEST_VM_ASYNC_OPS_ERROR
> > > >  #define SUPPORTED_FLAGS	\
> > > > -	(FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_ASYNC | \
> > > > -	 DRM_XE_VM_BIND_FLAG_READONLY | DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
> > > > -	 DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
> > > > +	(FORCE_ASYNC_OP_ERROR | DRM_XE_VM_BIND_FLAG_READONLY | \
> > > > +	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | 0xffff)
> > > >  #else
> > > >  #define SUPPORTED_FLAGS	\
> > > > -	(DRM_XE_VM_BIND_FLAG_ASYNC | DRM_XE_VM_BIND_FLAG_READONLY | \
> > > > +	(DRM_XE_VM_BIND_FLAG_READONLY | \
> > > >  	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | DRM_XE_VM_BIND_FLAG_NULL | \
> > > >  	 0xffff)
> > > >  #endif
> > > >  #define XE_64K_PAGE_MASK 0xffffull
> > > > +#define ALL_DRM_XE_SYNCS_FLAGS (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP)
> > > >  
> > > >  #define MAX_BINDS	512	/* FIXME: Picking random upper limit */
> > > >  
> > > >  static int vm_bind_ioctl_check_args(struct xe_device *xe,
> > > >  				    struct drm_xe_vm_bind *args,
> > > >  				    struct drm_xe_vm_bind_op **bind_ops,
> > > > -				    bool *async)
> > > > +				    bool *async, bool *skip_ops)
> > > >  {
> > > >  	int err;
> > > >  	int i;
> > > >  
> > > > -	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
> > > > +	if (XE_IOCTL_DBG(xe, args->pad) ||
> > > >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > > >  		return -EINVAL;
> > > >  
> > > > @@ -2745,6 +2729,30 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> > > >  		*bind_ops = &args->bind;
> > > >  	}
> > > >  
> > > > +	*async = !(args->syncs.flags & DRM_XE_SYNCS_FLAG_WAIT_FOR_OP);
> > > > +	*skip_ops = false;
> > > > +
> > > > +	if (XE_IOCTL_DBG(xe, args->syncs.flags & ~ALL_DRM_XE_SYNCS_FLAGS) ||
> > > > +	    XE_IOCTL_DBG(xe, *async && args->syncs.cookie) ||
> > > > +	    XE_IOCTL_DBG(xe, args->syncs.reserved[0] || args->syncs.reserved[1]) ||
> > > > +	    XE_IOCTL_DBG(xe, !*async && args->syncs.num_syncs)) {
> > > > +		err = -EINVAL;
> > > > +		goto free_bind_ops;
> > > > +	}
> > > > +
> > > > +	if (!*async) {
> > > > +		u64 __user *cookie = u64_to_user_ptr(args->syncs.cookie);
> > > > +		u64 value;
> > > > +
> > > > +		err = __copy_from_user(&value, cookie, sizeof(u64));
> > > > +		if (XE_IOCTL_DBG(xe, err)) {
> > > > +			err = -EFAULT;
> > > > +			goto free_bind_ops;
> > > > +		}
> > > > +		if (value)
> > > > +			*skip_ops = true;
> > > > +	}
> > > > +
> > > >  	for (i = 0; i < args->num_binds; ++i) {
> > > >  		u64 range = (*bind_ops)[i].range;
> > > >  		u64 addr = (*bind_ops)[i].addr;
> > > > @@ -2775,18 +2783,6 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
> > > >  			goto free_bind_ops;
> > > >  		}
> > > >  
> > > > -		if (i == 0) {
> > > > -			*async = !!(flags & DRM_XE_VM_BIND_FLAG_ASYNC);
> > > > -			if (XE_IOCTL_DBG(xe, !*async && args->num_syncs)) {
> > > > -				err = -EINVAL;
> > > > -				goto free_bind_ops;
> > > > -			}
> > > > -		} else if (XE_IOCTL_DBG(xe, *async !=
> > > > -					!!(flags & DRM_XE_VM_BIND_FLAG_ASYNC))) {
> > > > -			err = -EINVAL;
> > > > -			goto free_bind_ops;
> > > > -		}
> > > > -
> > > >  		if (XE_IOCTL_DBG(xe, op > DRM_XE_VM_BIND_OP_PREFETCH) ||
> > > >  		    XE_IOCTL_DBG(xe, flags & ~SUPPORTED_FLAGS) ||
> > > >  		    XE_IOCTL_DBG(xe, obj && is_null) ||
> > > > @@ -2854,12 +2850,25 @@ static int vm_bind_ioctl_signal_fences(struct xe_vm *vm,
> > > >  
> > > >  	xe_exec_queue_last_fence_set(to_wait_exec_queue(vm, q), vm,
> > > >  				     fence);
> > > > +	dma_fence_put(fence);
> > > >  
> > > > -	if (xe_vm_sync_mode(vm, q)) {
> > > > -		long timeout = dma_fence_wait(fence, true);
> > > > +	return err;
> > > > +}
> > > > +
> > > > +static int vm_bind_ioctl_sync_wait(struct xe_vm *vm,
> > > > +				   struct dma_fence *fence,
> > > > +				   u64 __user *cookie)
> > > > +{
> > > > +	long timeout;
> > > > +	int err = 0;
> > > > +
> > > > +	timeout = dma_fence_wait(fence, true);
> > > > +	if (timeout < 0) {
> > > > +		u64 value = 1;
> > > >  
> > > > -		if (timeout < 0)
> > > > -			err = -EINTR;
> > > > +		err = -ERESTARTSYS;
> > > > +		if (copy_to_user(cookie, &value, sizeof(value)))
> > > > +			err = -EFAULT;
> > > >  	}
> > > >  
> > > >  	dma_fence_put(fence);
> > > > @@ -2875,21 +2884,22 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >  	struct drm_xe_sync __user *syncs_user;
> > > >  	struct xe_bo **bos = NULL;
> > > >  	struct drm_gpuva_ops **ops = NULL;
> > > > +	struct dma_fence *fence = NULL;
> > > >  	struct xe_vm *vm;
> > > >  	struct xe_exec_queue *q = NULL;
> > > >  	u32 num_syncs;
> > > >  	struct xe_sync_entry *syncs = NULL;
> > > >  	struct drm_xe_vm_bind_op *bind_ops;
> > > >  	LIST_HEAD(ops_list);
> > > > -	bool async;
> > > > +	bool async, skip_ops;
> > > >  	int err;
> > > >  	int i;
> > > >  
> > > > -	err = vm_bind_ioctl_check_args(xe, args, &bind_ops, &async);
> > > > +	err = vm_bind_ioctl_check_args(xe, args, &bind_ops, &async, &skip_ops);
> > > >  	if (err)
> > > >  		return err;
> > > >  
> > > > -	if (XE_IOCTL_DBG(xe, args->pad || args->pad2) ||
> > > > +	if (XE_IOCTL_DBG(xe, args->pad) ||
> > > >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > > >  		return -EINVAL;
> > > >  
> > > > @@ -2904,12 +2914,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >  			err = -EINVAL;
> > > >  			goto put_exec_queue;
> > > >  		}
> > > > -
> > > > -		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> > > > -				 !!(q->flags & EXEC_QUEUE_FLAG_VM_ASYNC))) {
> > > > -			err = -EINVAL;
> > > > -			goto put_exec_queue;
> > > > -		}
> > > >  	}
> > > >  
> > > >  	vm = xe_vm_lookup(xef, args->vm_id);
> > > > @@ -2918,14 +2922,6 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >  		goto put_exec_queue;
> > > >  	}
> > > >  
> > > > -	if (!args->exec_queue_id) {
> > > > -		if (XE_IOCTL_DBG(xe, args->num_binds && async !=
> > > > -				 !!(vm->flags & XE_VM_FLAG_ASYNC_DEFAULT))) {
> > > > -			err = -EINVAL;
> > > > -			goto put_vm;
> > > > -		}
> > > > -	}
> > > > -
> > > >  	err = down_write_killable(&vm->lock);
> > > >  	if (err)
> > > >  		goto put_vm;
> > > > @@ -3015,16 +3011,16 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >  		}
> > > >  	}
> > > >  
> > > > -	if (args->num_syncs) {
> > > > -		syncs = kcalloc(args->num_syncs, sizeof(*syncs), GFP_KERNEL);
> > > > +	if (args->syncs.num_syncs) {
> > > > +		syncs = kcalloc(args->syncs.num_syncs, sizeof(*syncs), GFP_KERNEL);
> > > >  		if (!syncs) {
> > > >  			err = -ENOMEM;
> > > >  			goto put_obj;
> > > >  		}
> > > >  	}
> > > >  
> > > > -	syncs_user = u64_to_user_ptr(args->syncs);
> > > > -	for (num_syncs = 0; num_syncs < args->num_syncs; num_syncs++) {
> > > > +	syncs_user = u64_to_user_ptr(args->syncs.syncs);
> > > > +	for (num_syncs = 0; num_syncs < args->syncs.num_syncs; num_syncs++) {
> > > >  		err = xe_sync_entry_parse(xe, xef, &syncs[num_syncs],
> > > >  					  &syncs_user[num_syncs],
> > > >  					  (xe_vm_in_lr_mode(vm) ?
> > > > @@ -3035,7 +3031,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >  			goto free_syncs;
> > > >  	}
> > > >  
> > > > -	if (!args->num_binds) {
> > > > +	if (!args->num_binds || skip_ops) {
> > > >  		err = -ENODATA;
> > > >  		goto free_syncs;
> > > >  	}
> > > > @@ -3060,8 +3056,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >  
> > > >  		err = vm_bind_ioctl_ops_parse(vm, q, ops[i], syncs, num_syncs,
> > > >  					      &ops_list,
> > > > -					      i == args->num_binds - 1,
> > > > -					      async);
> > > > +					      i == args->num_binds - 1);
> > > >  		if (err)
> > > >  			goto unwind_ops;
> > > >  	}
> > > > @@ -3077,7 +3072,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >  		xe_exec_queue_get(q);
> > > >  
> > > >  	err = vm_bind_ioctl_ops_execute(vm, &ops_list);
> > > > -
> > > > +	if (!err && !async) {
> > > > +		fence = xe_exec_queue_last_fence_get(to_wait_exec_queue(vm, q), vm);
> > > > +		dma_fence_get(fence);
> > > > +	}
> > > >  	up_write(&vm->lock);
> > > >  
> > > >  	if (q)
> > > > @@ -3092,13 +3090,19 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >  	if (args->num_binds > 1)
> > > >  		kfree(bind_ops);
> > > >  
> > > > -	return err;
> > > > +	return fence ? vm_bind_ioctl_sync_wait(vm, fence, u64_to_user_ptr(args->syncs.cookie)) :
> > > > +		err;
> > > >  
> > > >  unwind_ops:
> > > >  	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> > > >  free_syncs:
> > > > -	if (err == -ENODATA)
> > > > +	if (err == -ENODATA) {
> > > >  		err = vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs);
> > > > +		if (!async) {
> > > > +			fence = xe_exec_queue_last_fence_get(to_wait_exec_queue(vm, q), vm);
> > > > +			dma_fence_get(fence);
> > > > +		}
> > > > +	}
> > > >  	while (num_syncs--)
> > > >  		xe_sync_entry_cleanup(&syncs[num_syncs]);
> > > >  
> > > > @@ -3108,6 +3112,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > > >  		xe_bo_put(bos[i]);
> > > >  release_vm_lock:
> > > >  	up_write(&vm->lock);
> > > > +	if (fence)
> > > > +		err = vm_bind_ioctl_sync_wait(vm, fence, u64_to_user_ptr(args->syncs.cookie));
> > > >  put_vm:
> > > >  	xe_vm_put(vm);
> > > >  put_exec_queue:
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > index 2e023596cb15..63e8a50b88e9 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > > @@ -138,13 +138,12 @@ struct xe_vm {
> > > >  	 */
> > > >  #define XE_VM_FLAG_64K			BIT(0)
> > > >  #define XE_VM_FLAG_LR_MODE		BIT(1)
> > > > -#define XE_VM_FLAG_ASYNC_DEFAULT	BIT(2)
> > > > -#define XE_VM_FLAG_MIGRATION		BIT(3)
> > > > -#define XE_VM_FLAG_SCRATCH_PAGE		BIT(4)
> > > > -#define XE_VM_FLAG_FAULT_MODE		BIT(5)
> > > > -#define XE_VM_FLAG_BANNED		BIT(6)
> > > > -#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(8, 7), flags)
> > > > -#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(8, 7), (tile)->id)
> > > > +#define XE_VM_FLAG_MIGRATION		BIT(2)
> > > > +#define XE_VM_FLAG_SCRATCH_PAGE		BIT(3)
> > > > +#define XE_VM_FLAG_FAULT_MODE		BIT(4)
> > > > +#define XE_VM_FLAG_BANNED		BIT(5)
> > > > +#define XE_VM_FLAG_TILE_ID(flags)	FIELD_GET(GENMASK(7, 6), flags)
> > > > +#define XE_VM_FLAG_SET_TILE_ID(tile)	FIELD_PREP(GENMASK(7, 6), (tile)->id)
> > > >  	unsigned long flags;
> > > >  
> > > >  	/** @composite_fence_ctx: context composite fence */
> > > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > > index 0895e4d2a981..8cbe7ca6fe57 100644
> > > > --- a/include/uapi/drm/xe_drm.h
> > > > +++ b/include/uapi/drm/xe_drm.h
> > > > @@ -140,8 +140,7 @@ struct drm_xe_engine_class_instance {
> > > >  	 * Kernel only classes (not actual hardware engine class). Used for
> > > >  	 * creating ordered queues of VM bind operations.
> > > >  	 */
> > > > -#define DRM_XE_ENGINE_CLASS_VM_BIND_ASYNC	5
> > > > -#define DRM_XE_ENGINE_CLASS_VM_BIND_SYNC	6
> > > > +#define DRM_XE_ENGINE_CLASS_VM_BIND		5
> > > >  	/** @engine_class: engine class id */
> > > >  	__u16 engine_class;
> > > >  	/** @engine_instance: engine instance id */
> > > > @@ -661,7 +660,6 @@ struct drm_xe_vm_create {
> > > >  	 * still enable recoverable pagefaults if supported by the device.
> > > >  	 */
> > > >  #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
> > > > -#define DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT	(1 << 2)
> > > >  	/*
> > > >  	 * DRM_XE_VM_CREATE_FLAG_FAULT_MODE requires also
> > > >  	 * DRM_XE_VM_CREATE_FLAG_LR_MODE. It allows memory to be allocated
> > > > @@ -669,7 +667,7 @@ struct drm_xe_vm_create {
> > > >  	 * The xe driver internally uses recoverable pagefaults to implement
> > > >  	 * this.
> > > >  	 */
> > > > -#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 3)
> > > > +#define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
> > > >  	/** @flags: Flags */
> > > >  	__u32 flags;
> > > >  
> > > > @@ -777,12 +775,11 @@ struct drm_xe_vm_bind_op {
> > > >  	__u32 op;
> > > >  
> > > >  #define DRM_XE_VM_BIND_FLAG_READONLY	(1 << 0)
> > > > -#define DRM_XE_VM_BIND_FLAG_ASYNC	(1 << 1)
> > > >  	/*
> > > >  	 * Valid on a faulting VM only, do the MAP operation immediately rather
> > > >  	 * than deferring the MAP to the page fault handler.
> > > >  	 */
> > > > -#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 2)
> > > > +#define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
> > > >  	/*
> > > >  	 * When the NULL flag is set, the page tables are setup with a special
> > > >  	 * bit which indicates writes are dropped and all reads return zero.  In
> > > > @@ -790,7 +787,7 @@ struct drm_xe_vm_bind_op {
> > > >  	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
> > > >  	 * intended to implement VK sparse bindings.
> > > >  	 */
> > > > -#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 3)
> > > > +#define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
> > > >  	/** @flags: Bind flags */
> > > >  	__u32 flags;
> > > >  
> > > > @@ -808,6 +805,36 @@ struct drm_xe_vm_bind_op {
> > > >  	__u64 reserved[3];
> > > >  };
> > > >  
> > > > +/**
> > > > + * struct drm_xe_syncs - In / out syncs for IOCTLs.
> > > > + */
> > > > +struct drm_xe_syncs {
> > > > +	/** @num_syncs: amount of syncs to wait on */
> > > > +	__u32 num_syncs;
> > > > +
> > > > +	/*
> > > > +	 * Block in IOCTL until operation complete, num_syncs MBZ if set.
> > > > +	 */
> > > > +#define DRM_XE_SYNCS_FLAG_WAIT_FOR_OP (1 << 0)
> > > > +	/** @flags: Sync flags */
> > > > +	__u32 flags;
> > > > +
> > > > +	/**
> > > > +	 * @cookie: pointer which is written with an non-zero value if IOCTL
> > > > +	 * operation has been committed but the wait for completion
> > > > +	 * (DRM_XE_SYNCS_FLAG_WAIT_FOR_OP is set) is interrupted. Value of
> > > > +	 * *cookie MBZ for IOCTL operations to be executed, if non-zero
> > > > +	 * operations are skipped and blocks until exec queue for IOCTL is idle.
> > > > +	 */
> > > > +	__u64 cookie;
> > > 
> > > just left a comment in v2.
> > > pointer in the comment is misleading, looks like UMD needs to allocate memory and set it in here.
> > > about the name I think it should be named as reserved, so UMDs dont touch it at all in fact I think UMDs should not even know that the reserved field
> > > is being used for something.
> > > 
> > 
> > The UMD does need to allocate memory, here is an IGT snippet:
> > 
> >  93 int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
> >  94                   uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> >  95                   uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
> >  96                   uint32_t prefetch_region, uint8_t pat_index, uint64_t ext)
> >  97 {
> >  98         uint64_t cookie = 0;
> >  99         struct drm_xe_vm_bind bind = {
> > 100                 .extensions = ext,
> > 101                 .vm_id = vm,
> > 102                 .num_binds = 1,
> > 103                 .bind.obj = bo,
> > 104                 .bind.obj_offset = offset,
> > 105                 .bind.range = size,
> > 106                 .bind.addr = addr,
> > 107                 .bind.op = op,
> > 108                 .bind.flags = flags,
> > 109                 .bind.prefetch_mem_region_instance = prefetch_region,
> > 110                 .syncs.num_syncs = num_syncs,
> > 111                 .syncs.syncs = (uintptr_t)sync,
> > 112                 .syncs.flags = num_syncs == 0 ?
> > 113                         DRM_XE_SYNCS_FLAG_WAIT_FOR_OP : 0,
> > 114                 .syncs.cookie = num_syncs == 0 ? (uintptr_t)&cookie : 0,
> > 115                 .exec_queue_id = exec_queue,
> > 116                 .bind.pat_index = (pat_index == DEFAULT_PAT_INDEX) ?
> > 117                         intel_get_pat_idx_wb(fd) : pat_index,
> > 118         };
> > 119
> > 120         if (igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind))
> > 121                 return -errno;
> > 122
> > 123         return 0;
> > 124 }
> > 
> > The cookie is a user pointer. If this IOCTL has interrupted and then
> > restarted by the UMD the value of cookie would tell the KMD what to do
> > on the restart.
> 
> I cant see a reason to not use .syncs.cookie directly without any pointer.
> 

We'd have to mark the IOCTL RW which the results in the entire contents
of the IOCTL being copied back to the user on every IOCTL. A userptr
allows the KMD to only copy this field back when required.

> 
> > 
> > Does this make sense?
> > 
> > Matt
> > 
> > > > +
> > > > +	/** @syncs: pointer to struct drm_xe_sync array */
> > > > +	__u64 syncs;
> > > > +
> > > > +	/** @reserved: Reserved */
> > > > +	__u64 reserved[2];
> > > > +};
> > > > +
> > > >  struct drm_xe_vm_bind {
> > > >  	/** @extensions: Pointer to the first extension struct, if any */
> > > >  	__u64 extensions;
> > > > @@ -839,14 +866,8 @@ struct drm_xe_vm_bind {
> > > >  		__u64 vector_of_binds;
> > > >  	};
> > > >  
> > > > -	/** @pad: MBZ */
> > > > -	__u32 pad2;
> > > > -
> > > > -	/** @num_syncs: amount of syncs to wait on */
> > > > -	__u32 num_syncs;
> > > > -
> > > > -	/** @syncs: pointer to struct drm_xe_sync array */
> > > > -	__u64 syncs;
> > > > +	/** @syncs: syncs for bind */
> > > > +	struct drm_xe_syncs syncs;
> > > >  
> > > >  	/** @reserved: Reserved */
> > > >  	__u64 reserved[2];
> > > > @@ -975,14 +996,14 @@ struct drm_xe_exec {
> > > >  	/** @extensions: Pointer to the first extension struct, if any */
> > > >  	__u64 extensions;
> > > >  
> > > > +	/** @pad: MBZ */
> > > > +	__u32 pad;
> > > > +
> > > >  	/** @exec_queue_id: Exec queue ID for the batch buffer */
> > > >  	__u32 exec_queue_id;
> > > >  
> > > > -	/** @num_syncs: Amount of struct drm_xe_sync in array. */
> > > > -	__u32 num_syncs;
> > > > -
> > > > -	/** @syncs: Pointer to struct drm_xe_sync array. */
> > > > -	__u64 syncs;
> > > > +	/** @syncs: syncs for exec */
> > > > +	struct drm_xe_syncs syncs;
> > > 
> > > if not implemented should not be used
> > > 
> > 
> > The idea is 'struct drm_xe_syncs' is a unified interface between IOCTLs
> > that require syncs. Currently execs implement a subset of 'struct
> > drm_xe_syncs' features.
> 
> But not mentioned anywere.
> I`m against it, Rodrigo and Francois might have a better opinion here about leaving stuff in the uAPI that is not used.
> But if leaving it shout at least have a comment saying what wont work with drm_xe_exec.
> 

Yes we need a comment. Let's get everyone opinion but I do like the OO
design of drm_xe_syncs.

Also btw we might just drop sync mode too [1]. Any opinion on that?

Matt

[1] https://patchwork.freedesktop.org/series/127780/

> > 
> > Matt
> > 
> > > >  
> > > >  	/**
> > > >  	 * @address: address of batch buffer if num_batch_buffer == 1 or an
> > > > @@ -996,8 +1017,8 @@ struct drm_xe_exec {
> > > >  	 */
> > > >  	__u16 num_batch_buffer;
> > > >  
> > > > -	/** @pad: MBZ */
> > > > -	__u16 pad[3];
> > > > +	/** @pad2: MBZ */
> > > > +	__u16 pad2[3];
> > > >  
> > > >  	/** @reserved: Reserved */
> > > >  	__u64 reserved[2];
> > > 
> 
