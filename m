Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA5FC48BF6
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 15:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76C310E77E;
	Mon, 26 Feb 2024 15:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qx3drdoh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01C2110E788
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 15:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708960101; x=1740496101;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xyELCsDudJ/d6usu4SRdKzJvY6vXNXDzFsNvyLEcmbE=;
 b=Qx3drdohWtVFr78lwpYEBGH3kiliYUYhLUL9/npfgHidmPqwAuKY2cMu
 3cueGbYKXjSkHWNiXdO3vry/JQmUv5ug2fD29nPuy0nZUpwhzDMHmaDu3
 nCovoi3EXWOmX/Kf2HBA5Fx1bcTExiV6pQ7JsxT/3Bd5Emk2IgeXnddDk
 su1geQJsogwaXedF0iKPEbOVNEHMm0euzKDWMXY6CdlhrXESTzU04KN/c
 4+4xcElaicqTinYOrKKLMXKv9eChED1VgtR68JzIJY87TcheJPoKWyqB1
 CHt3c3RWALCpRc8N5pRhUN36+ADn5RHf5UxXiWbw5MmwZTv7ZTFf6phcC A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="7065044"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="7065044"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 07:08:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="7048828"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 07:08:20 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 07:08:19 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 07:08:19 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 07:08:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRpY34HZGCrFeazn6T/CqbmuTu6E/O+gS4Mt7mI5tYV4ix2w4CVCpT795sgKXbutoMfheBjciMxVvo67RhRZ/R+faOMw3xK77XqHBK057H6ISZdkb9RuRgJYYDgRZ2iuLbnP2TyNGUvXN7yJzsopeQoUL7Wa3eGsCsEFymfoTC47IMUhp7rUNPEaQ3o69F6zZIkpM34XQHvx/vd+ToBx4XbZmNkEBf0efu4sFPu0BmJEY767DP82o65SCMk+x8/zbhirstTxgqaieyemNI/t5hJR2M8C9R2WzeMK7xPcYJNOf9FOGPfCYa0HmCFU7017CgA2AO9+rfZfQKFRXfgxww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+RNovgg42R2mpEcEBp2MjwgQN15FzV3vYnHz8bV2c0=;
 b=fQ7ciZQcYq0YEamDOMfmED8HiOgqpMI1HwL9pqsdzBweZEVV2m4wz/JfjnJa6cSjh8qVcwc/mfYNHwHeDRPhKyfgHNstrfP+vyeUzoJYkUQgvIwrrIzu+lYB/0SbcDC6aGRN1z/pEAiVoqU1ByMlX5QatAPyG16Gy9KC7i1zBUqGTcf2rMiLaNHhwX/Q+OfrHSrfGhQvhzeANCAij8i6CtJNt44Vy9/bwHjePNlfmyXtLHyC6qsdpsjvWkrAP3sDwBZxkjQSScRT8vnDiMqIRMJ/4FucSRXd9umiu/oacKirVwBkTwR6EiyMOmLJmRyhbSIL0HkEW7S9pU8rCxQUlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5101.namprd11.prod.outlook.com (2603:10b6:a03:2dc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Mon, 26 Feb
 2024 15:08:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7339.022; Mon, 26 Feb 2024
 15:08:17 +0000
Date: Mon, 26 Feb 2024 15:07:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Use vmalloc for array of bind allocation in bind
 IOCTL
Message-ID: <ZdypP3kKDiS6wQYA@DUT025-TGLU.fm.intel.com>
References: <20240223193719.6495-1-matthew.brost@intel.com>
 <5d3d54c8a37debbff3f597c1fad36be90637ae81.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5d3d54c8a37debbff3f597c1fad36be90637ae81.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0137.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5101:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff08473-5f6f-4309-1d5d-08dc36dcc2fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xQSNGzi69ShLHA7mHVMlwcK9bM8WRdYHkBKAv3eHY2UBoSCNe1WDfL81kxRcw4TxgwSlJYNQXHhFGatZcaFuZkVfAAo0SH+waBFq/XBWNvG+pmbowxzN6T4rTR1qKv+QDT8bmtLYsqe3LvaL8IG2f4UB+rFBgGik/IhYKfQZARUwa/VP1nWzZfv6wtK6ZmbWMRJp78kzOT02CK4fbupBx5rWBYwbJEcH2kX9IaCV2Lwi94TUf2h3fvGuWjrMM2IzF4nS/3cfW3vvqGJzx8iu8tzDjxX2ntdhM58GrKRsxoD7ggOuG1qj1HdwIw9USP0r5z+pqE3/jBam5x8bnqITMbRmPc8EO2RkhHbCeDkYYufYik7Uuql3/Hg6ruDDujUPmf2seQBzYLWG+x7FH25mkBsQKRa57zaoxCeXo3VoIpHHmA0Mto39moT7+B+ZDIbE12GUC8d+PPlJfhdc7xWWA6nv3wAOzwiUL5YGSAC/0S2ZuVVZ1eVpv8vVpbCOBXO3FSpJctXs0og+cmfCM9WUTxt/wmkkVL0gUmWJBV28K2dEklyCEBTl8Khc6p5fEOksprXIcSBC4920pBkE5nwBQzSeos6HTVrU/PBmFOhIsfAy//A8ZvaVZZITdfyt7Grr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qoxZCqwMbkfW+9uqH/a7cKnLqTsTDPm5j5bv1ayHYvp0xylpNJ3wSExab+?=
 =?iso-8859-1?Q?n16qsFXutt0m68LU00O205rvh1k0lDfLD5j7vrgiMQmnHZ0TGN6Ctv//GG?=
 =?iso-8859-1?Q?NzOixjWn6FnV8eyJn4UJc7C9/K3kgu/rqUJkSS9V8Voi8cHR44VzNHBV6w?=
 =?iso-8859-1?Q?i4rlIVtwzXwljwfKBjvZ4nQ977aaiBsrp2SIh/Vci0S4z2kiESoY2obLAT?=
 =?iso-8859-1?Q?5+g9wAXXqKSylsd+0A9Rj/wpKJcw/veOOGgmU03VzELX+jkQYXo51Xa3VS?=
 =?iso-8859-1?Q?Za6wyHM9wPggNNJ9y4kgDJqGtGqSEBEjv33MVQx4eDbcfjauvJ24vCO9pz?=
 =?iso-8859-1?Q?hdSr3++G+YgX5AzBCl9Sp/uC5Pd9KkkHBZjfs+tiU9badr5eHgnjDnF7tl?=
 =?iso-8859-1?Q?DrhufDbE+aJkU59LBje5apLr4zXtY64PXDUs2aVTN+JsaTcMcEUqEiIQPP?=
 =?iso-8859-1?Q?+YvHiFSdvf7Uz8ozS+czWr4vDj4hMEa+eLekfubfEyQWjbZbgsxCPX0tAo?=
 =?iso-8859-1?Q?tB/JzzuoUFQI9lFyyh1nkLSf2HQR8RRzFchpMsRWmtOs8pSOkOjqZ09QR5?=
 =?iso-8859-1?Q?NT8amW4+KPWdyrKUk8CBGmrPjthc/2PzKnqvb5mVQCyz1/MeQsIwmeo34N?=
 =?iso-8859-1?Q?wETDIeMWe2jzDqrhFu7rt5ai7iUT1cNqU3sEjv4LNgrKjtl7u2FE5Voj1D?=
 =?iso-8859-1?Q?noVlpy5DhmhFyQool1mLW2BwkThzkaapcxXoZFOihfH6q5jFtnSA6uaoAQ?=
 =?iso-8859-1?Q?d2ffe2BHgHoa1TLqu8mo4DE9bKckPNulknevs6UiAdPx1wKs/f+WkgQJkO?=
 =?iso-8859-1?Q?9gR27T2FWaiz1yEc0gIF7J3OykOgw90bxg7riN8szZgzMsPQSczxCqKhc1?=
 =?iso-8859-1?Q?OtB52PWLvNRYjgwfpLdV45tAIUSJRVTV5NoDitDizwdcImK1Yf0fkb0kzK?=
 =?iso-8859-1?Q?n9/yk75CLmAExz9nHQ+QB3dR3E1pHBU0TXVwaw+O78dlbzjiUl5nElvyhr?=
 =?iso-8859-1?Q?5f7wyYNIUPDOoIhel5C5PxcKKFKQivTxokrb0pjwBkVgFayXTUENFuwuIr?=
 =?iso-8859-1?Q?uAbsCitFWhaUwrs9Sc6Ar/BVNR92whcx0jvEEEhty09Tq2gCbZkR8DqykC?=
 =?iso-8859-1?Q?WjDvCeHvnjZX+janZ2QUztqwr3zhtgKEDJswO1MKHAhFHPjksE5nWb4xrI?=
 =?iso-8859-1?Q?foLR8gS3blNQGqoFp91CLJUwsCWjLdi2ss5sBBVC/wge2X6VCdUbQ8cC43?=
 =?iso-8859-1?Q?yvLOTELDPyNPMU2z1A3jGXJv2BjoCSKH/LDQCSXSJxYlK6gn38RX6Wk/Vu?=
 =?iso-8859-1?Q?xbbIVs2TCLCx2Cv3NATO0xuCcelnehZeU7uhmcs/J4R3877Zh7e+O6I9L1?=
 =?iso-8859-1?Q?j2dro1j5ctt6GwpvatKJMYajo3SUqIygusDi9MGUOlojcRoKOkeaCuT48O?=
 =?iso-8859-1?Q?3vgii0uDqXM8cZU7FjHIMmtoy1Ev7ImyoX5DgF8c4sIFELB81IRTnIa67U?=
 =?iso-8859-1?Q?Rq/1ucnm9uXzl1reBctz9HxYAeC5VxwbQFtDqJd9q4zbxR0KT7RhOIgZln?=
 =?iso-8859-1?Q?opeL5wFZpoZTWjfp5XBjuluHw61Lz/eN1l07vhS/6jxJC3X2bQIxekzq+A?=
 =?iso-8859-1?Q?ww6Alh3gJ0rllZTo4gd6SYFJzpkT4K41kfIAgd+9Ejp4P6Y524V2p2Ag?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff08473-5f6f-4309-1d5d-08dc36dcc2fc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 15:08:17.2931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mz8M06TjkuSd7n5PAriO2NzOAUKYMMyfA/To8lEq2SUfQunhLjFfbMD/7O8izpA/aeeOrd4Qu17UpBCFeyHQpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5101
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

On Mon, Feb 26, 2024 at 10:18:06AM +0100, Thomas Hellström wrote:
> Hi, Matt
> On Fri, 2024-02-23 at 11:37 -0800, Matthew Brost wrote:
> > Use vmalloc in effort to allow a user pass in a large number of binds
> > in
> > an IOCTL (mesa use case). Also use array allocations rather open
> > coding
> > the size calculation.
> 
> I still think allowing a large number of binds like this is a bit
> dangerous, because to avoid out-of-memory DOSes we will need to
> restrict the number of binds in some way. And if the UMDs can't
> gracefully handle the OOMS and retry with a smaller number of binds
> they will break. And we're not allowed to break the.....
> 

See below, with [1] and this change we match Nouveau.

> Did we end up keeping a max number of binds that we guarantee for
> forseeable future?
> 

Based on Paulo feedback I think we need to get [1] in 6.8 as without
that the array of binds is kinda useless. Also Nouveau has similar uAPI
and not such limits either and also uses vmalloc for these types of
allocations. With that I believe this patch should be in 6.8 too. If
this proves to be a problem we can fix this in future releases but if we
impose some limit I guess that can't really be changed as then it is
uAPI.

Matt

[1] https://patchwork.freedesktop.org/series/129923/

> /Thomas
> 
> 
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> > GPUs")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_vm.c | 23 ++++++++++++-----------
> >  1 file changed, 12 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index e3bde897f6e8..45a12207ebf5 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2778,8 +2778,9 @@ static int vm_bind_ioctl_check_args(struct
> > xe_device *xe,
> >  		u64 __user *bind_user =
> >  			u64_to_user_ptr(args->vector_of_binds);
> >  
> > -		*bind_ops = kmalloc(sizeof(struct drm_xe_vm_bind_op)
> > *
> > -				    args->num_binds, GFP_KERNEL);
> > +		*bind_ops = kvmalloc_array(args->num_binds,
> > +					   sizeof(struct
> > drm_xe_vm_bind_op),
> > +					   GFP_KERNEL);
> >  		if (!*bind_ops)
> >  			return -ENOMEM;
> >  
> > @@ -2869,7 +2870,7 @@ static int vm_bind_ioctl_check_args(struct
> > xe_device *xe,
> >  
> >  free_bind_ops:
> >  	if (args->num_binds > 1)
> > -		kfree(*bind_ops);
> > +		kvfree(*bind_ops);
> >  	return err;
> >  }
> >  
> > @@ -2957,13 +2958,13 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >  	}
> >  
> >  	if (args->num_binds) {
> > -		bos = kcalloc(args->num_binds, sizeof(*bos),
> > GFP_KERNEL);
> > +		bos = kvcalloc(args->num_binds, sizeof(*bos),
> > GFP_KERNEL);
> >  		if (!bos) {
> >  			err = -ENOMEM;
> >  			goto release_vm_lock;
> >  		}
> >  
> > -		ops = kcalloc(args->num_binds, sizeof(*ops),
> > GFP_KERNEL);
> > +		ops = kvcalloc(args->num_binds, sizeof(*ops),
> > GFP_KERNEL);
> >  		if (!ops) {
> >  			err = -ENOMEM;
> >  			goto release_vm_lock;
> > @@ -3104,10 +3105,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >  	for (i = 0; bos && i < args->num_binds; ++i)
> >  		xe_bo_put(bos[i]);
> >  
> > -	kfree(bos);
> > -	kfree(ops);
> > +	kvfree(bos);
> > +	kvfree(ops);
> >  	if (args->num_binds > 1)
> > -		kfree(bind_ops);
> > +		kvfree(bind_ops);
> >  
> >  	return err;
> >  
> > @@ -3131,10 +3132,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > void *data, struct drm_file *file)
> >  	if (q)
> >  		xe_exec_queue_put(q);
> >  free_objs:
> > -	kfree(bos);
> > -	kfree(ops);
> > +	kvfree(bos);
> > +	kvfree(ops);
> >  	if (args->num_binds > 1)
> > -		kfree(bind_ops);
> > +		kvfree(bind_ops);
> >  	return err;
> >  }
> >  
> 
