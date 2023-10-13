Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4473DCDB482
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 20:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC2C10E03B;
	Fri, 13 Oct 2023 20:40:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FC810E03B
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 20:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697229656; x=1728765656;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=w6urRIyfYMunnKfSYDAsJqSDaPAtMBvQ4+chswVd/58=;
 b=CRyU4k/yMxv2Jl6cGuRLD5Z6VnDFR4XjdzncwZlpCFjHbO6oWaGFpJRY
 6u3lEjxwRsZ/e/YGor80HWqMA+N6916yRPxyrrSbmx/rTcD8LxRKiv0m/
 OmtFLAK26ysz8b61ABy2HrpyUTCUIl6CCVcEuE8fBR6w3q1Ko8I1Fy/t0
 0pMmXL7AFxzZhMI8zary+AmdCbdAOAn4NTHZrGAil+xufahWD/4jL8pwc
 GcG/nzI85GdAQECbx/ceHV7NBdFPX6Exxp9zBvUz5oyvXbG0k13kg0TWS
 jdT6aqSZrRAic16FBFzs9W4+nl4qckYG4F3uLT5d38ahORY28v4nY/hX1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="471493735"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="471493735"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 13:40:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="928560475"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="928560475"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 13:40:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 13:40:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 13:40:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 13:40:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 13:40:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGnaqQkODDeSeE45h2mSDXP7M7mvTDr4kUfwNiP/fc2cDMbueIdkCI0r+nucLEfe0rWzodPWhYq09uos/E36XIBx26YKcV0cTrmRbipCEg7ARDBExD9cB3JkFVeD0tshQbSsQpIRGgNeIuTO8hLB7vztK1cfvwQcw2JRDoYdxdKnEyDmJOssnFiUVzmFggi5o8lqnrXLBG94TGqJkYER5pRlBIWptJ7A0rsDatH4bB2MuothT51j4nq5nALY73HYmdOoB5SRenisPxm1HoVofXFEVdm+LASycEErLtTmPWR08f/pYaCaO/tLrOzFm9DxIkp8W/bkMg9LH7u4n5gaXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKNah7gfkRXvUBIM/3ciSI47pwqiZxQRAK0IIRPxJZY=;
 b=azl0sxQZi5oXwcUstj8Faza/1HxA3HowT/HaPH6EPErqEOf9PejttZCYBoyidwusan8gu2tYih2rwlLkQ4H/2ET57iBJJXJBv5CRvkxPo3DGK+gnYkVQtir8hAUvOwX/IiC3OLkt7I4hd4coIt4ovMDegoqtk2RKEIt8wUYjlmRZ7bjl36VEoW6jRS17Athww0EEoFnXfTz44T0piG7nYXzx6u8SYihpO5wDOa/nIEL1Q06cMB9zOANBWyKeTcqJERPXms0yStge49KCUTz97Rh2b8qs5jj44oAMbcOJSu/ufOOtOot1e14TBaPj5xueLFr9TusG17MwnX2deXtppg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ2PR11MB8471.namprd11.prod.outlook.com (2603:10b6:a03:578::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Fri, 13 Oct
 2023 20:40:53 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.040; Fri, 13 Oct 2023
 20:40:53 +0000
Date: Fri, 13 Oct 2023 16:40:49 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZSmrUfC9CAECorcJ@intel.com>
References: <20231010184151.91195-1-jose.souza@intel.com>
 <20231012171628.GH21382@mdroper-desk1.amr.corp.intel.com>
 <ff3e03acf78dda8cb52bde94de70f89a005596c7.camel@intel.com>
 <20231012173036.GJ21382@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231012173036.GJ21382@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ2PR11MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb025e6-6c48-4d6e-686c-08dbcc2cb13c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wGSpJbHjCW3v3XXEZrXyS+Nk2AlWKdgys8tNi8ASN0wAvqMaIiOk4yySbjslNiOQE5p9kfyt9dsiHaVrW3mTp3AycWTGh9NAuCr1ihfB26McqWJW5d5tX6A1qQ//bZbJOPIrH76ZB2Kgt67BASjHU+qjNLzVdjNTS+WFWTrQKhlsJU0DBmuxxrgW+oyiJFoD0JdIJ4b675cSN6+y9sHxD60zNwnXSUv0X3Lx0G5ONnaqUH6eeTFCqPsIzhpAtqhLz2Zte8fw1HZIYyMP9CTFS2FVczaEYiMfg7mrmee8sgta3EHKPOTU6jaXXjSpjSSZ4c1sEWlUfw9b4iA/dxeUsDU6v6GuryfaKmL139qpE0j3+MoGLH/nquPfx5QxQn1peZvGOJZ2KyMdBkyDeuhfdOyrEwq6zRkABijzw7N7oihEQHMZydYu5BaHJ0qqsH9bniM6wMTCjo7th3moqbRiuIkem+VL4gvdarsgmIPettvcEOHCbhEar7vLHCu1+GocsmIaW6FyZsqnjy6LdtQYBP2GNPSl5kWB9qQVw0RGn4k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(8936002)(8676002)(4326008)(6862004)(44832011)(66556008)(41300700001)(54906003)(66946007)(37006003)(66476007)(6636002)(316002)(2906002)(5660300002)(966005)(4001150100001)(478600001)(6486002)(6666004)(6506007)(6512007)(82960400001)(36756003)(83380400001)(26005)(38100700002)(2616005)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pTLr3lllVv5R53Imy0D4aSZ5Qql/H9MGztKeeZTBK0u/GwpwCJkP4NiMzr?=
 =?iso-8859-1?Q?v/3nFNg0eRFP8O2RfmH+MbZI5xy3MHyliiVpZXEvXlHqwHH/H6DXNnQIcg?=
 =?iso-8859-1?Q?Cmn4TL6LayKwGFSBaeBpd1v6H5PnEeh1fuua6PLvsFF5Bp+VwGKvrQmjt0?=
 =?iso-8859-1?Q?KiACdoG6NrSUQr/qQT9yaOBoEsGxNCGGpnXukIk3aRy/+U/GxBMp8xoG3h?=
 =?iso-8859-1?Q?dRXeJ6n1KQCAfgo5XHj2uPvqxgccEj8/LM5vaeJiF1tk2Qb5J8S8oH5m/4?=
 =?iso-8859-1?Q?YyGEX65GDyS81ndfqkfO3yk81ZHYOuP+lvbNbxmy/NiB5Ct5xgR0J1D/BQ?=
 =?iso-8859-1?Q?KhZQU3cQjo/WvKFJsv6mYrKnsEAPajy8dyzpWc+to82Ic8MNd6yT9UOKI8?=
 =?iso-8859-1?Q?k3gbNG+ST8Vu2pR4QiH839/pVVn3OgNtqrOIbHILLQyWd1jWtunJ3l9qEo?=
 =?iso-8859-1?Q?UN08Wb0+V7JbOoniRXmHFVmEu8Ev469hLk3w0/zlcq3ozTmFxWJuGvw4QV?=
 =?iso-8859-1?Q?Ag3o4700R8q6DuWQQdMMIHVUTCVZBjM5XzU1sngofF2A1TPuEelVt48OsP?=
 =?iso-8859-1?Q?stJivddIaSye8PjCJzXsweclne0mvmqEl+gAHJTL/8d2pmETS6+zlZ2L8F?=
 =?iso-8859-1?Q?iAmv9yZIL4e+RRhF4Zw3Ul6GTzOWB84fUh2JKmgz12lsJV+usrTEMM/Sog?=
 =?iso-8859-1?Q?S3cJgRII43v9qxvp/RbB8GOgFq3nO+uYBQCM6goDRU/EFFWtrsrktaJ75e?=
 =?iso-8859-1?Q?BWpg5z01NhZNLrct814RS5H13zVEghjjiUmX0egUhwXLf+o1AUtPId9w2g?=
 =?iso-8859-1?Q?ZjCllwtgpsRVUcaqPR5c7wRbdczU1/I54PaBrziNfooAaMeGjSI8Z4neC9?=
 =?iso-8859-1?Q?SVGKIhsj0DXQX/VDAKbFPNkGpk6BBqVthUjeCEXQqC8KHufLtzki8nDKkc?=
 =?iso-8859-1?Q?KPmYbwVQq6s5aoo9WS9bvX3L82i01p4qQj+0jRDD6U4GU3FBI9Rw7eCCD2?=
 =?iso-8859-1?Q?HdCwibCFpnEQAJ17MxxrILIMdybcnEjg/bSByk8KCbwJ4wsk3uJWlh+BOS?=
 =?iso-8859-1?Q?8cfvy8EZYV+U2SSueJNF+aIAo4AKxyVkH0Uss01v2aJuyopb+mxIy8rEzN?=
 =?iso-8859-1?Q?wKX+AtqSmWYOnIqax+mNm0NHB8Njr1BhnMnOgNfhfQlaeqlYVVOPAn1G2g?=
 =?iso-8859-1?Q?XpeD6n8u2Y5HqUQaal361No7lJRM695fqgVtoON70ibJT7XsnrP0K+b6jG?=
 =?iso-8859-1?Q?forim8WgfkFVZg3gT53eVOgTAxMoXvJBC94N00HwZESwbjkIB12gx4tjip?=
 =?iso-8859-1?Q?uZ2L+JlH+OZdVHChzAWbpO17McxzpGYNH0m017CtIZdDlIHHYszv8QF6oB?=
 =?iso-8859-1?Q?Gq5dafLyka64fjt8snCK6ShVZRkJ7Q4yoNofmnsuEj/ewyfv4e7NjUIUFI?=
 =?iso-8859-1?Q?ZHJ7Ellbcq4FT+eg3j7kBjqOVxRuIiuB2eeWSfLc23peA9yhz1yI93Wje0?=
 =?iso-8859-1?Q?e1c08gmTwpBilYqbDfnGOpR2LbKmunI7BDjEtGvTprTN37ouP//GbsUHTj?=
 =?iso-8859-1?Q?lIi1p6EedliwNrL+bS2Iw+PD6wATaXtMweXBW+n+BYFr5ih9QtV69lyBHn?=
 =?iso-8859-1?Q?nT0JTL7tkwWvZECa0CNQ79Boq2W8Gv4J2OAElmiO4dOXzNF/OBo/mTSA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb025e6-6c48-4d6e-686c-08dbcc2cb13c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 20:40:53.0550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XvHa2OIMqv8Ie5xpc/NsGkIfre/RbWb115ihWtxDbdEcxdH6MzzWQOeQ8onK0B1pvrJfvFZVBnbS16dtHBGFEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8471
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 12, 2023 at 10:30:36AM -0700, Matt Roper wrote:
> On Thu, Oct 12, 2023 at 10:20:33AM -0700, Souza, Jose wrote:
> > On Thu, 2023-10-12 at 10:16 -0700, Matt Roper wrote:
> > > On Tue, Oct 10, 2023 at 11:41:49AM -0700, José Roberto de Souza wrote:
> > > > A future patch will require gt and xe device structs, so here
> > > > replacing class by hwe.
> > > > 
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_hw_engine.c       | 6 +++---
> > > >  drivers/gpu/drm/xe/xe_hw_engine_types.h | 4 ++--
> > > >  2 files changed, 5 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > index b5b0845908887..37b3ee1268090 100644
> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > @@ -684,7 +684,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
> > > >  	if (snapshot->name)
> > > >  		strscpy(snapshot->name, hwe->name, len);
> > > >  
> > > > -	snapshot->class = hwe->class;
> > > > +	snapshot->hwe = hwe;
> > > 
> > > I haven't really looked into the devcoredump stuff much, but it's not
> > > clear to me from a really quick skim whether it's safe to save away the
> > > hwe like this.  Is there ever a case where the snapshot can persist
> > > after the engine itself has been destroyed (e.g., if we capture an error
> > > encountered during a device probe that results in the device being torn
> > > back down)?  If so, then you'd probably need to make sure that the hwe
> > > field here only gets used during the capture, and the 'print' routine
> > > would still need a cached snapshot->class to avoid use-after-free
> > > errors.

This is very real! We need to cache everything we can and consider the
device itself is dead at print. But here we are at the capture no?!

> > 
> > Xe devcoredump dump is also removed with Xe module, so no problems with this.
> 
> With the module?  Or the device?  Even if probe fails on a single
> device, the module may remain loaded (and might even still be driving
> other GPUs).  If the dumps for failed device(s) are still accessible,
> there might be a problem?

Well, this is a bad devcoredump limitation at this moment. It doesn't go
away with the device or with the module. It blocks for 5 seconds before
it is gone. I have couple patches [1] to suggest to devcoredump itself so the
driver can also decide when the dump device is deleted. But I'm trying to
get us first in upstream for a proper handling of that.

[1] https://gitlab.freedesktop.org/rodrigovivi/drm-xe/-/commits/devcoredump-removal/

> 
> 
> Matt
> 
> > 
> > > 
> > > Rodrigo probably has better insight as to whether that's something that
> > > we need to worry about.
> > > 
> > > 
> > > Matt
> > > 
> > > >  	snapshot->logical_instance = hwe->logical_instance;
> > > >  	snapshot->forcewake.domain = hwe->domain;
> > > >  	snapshot->forcewake.ref = xe_force_wake_ref(gt_to_fw(hwe->gt),
> > > > @@ -731,7 +731,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
> > > >  		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
> > > >  	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
> > > >  
> > > > -	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> > > > +	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
> > > >  		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
> > > >  
> > > >  	return snapshot;
> > > > @@ -786,7 +786,7 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
> > > >  		   snapshot->reg.ring_dma_fadd_udw,
> > > >  		   snapshot->reg.ring_dma_fadd);
> > > >  	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
> > > > -	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> > > > +	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
> > > >  		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
> > > >  			   snapshot->reg.rcu_mode);
> > > >  }
> > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > > index 5d4ee29042407..71c0a0169e62a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > > @@ -156,8 +156,8 @@ struct xe_hw_engine {
> > > >  struct xe_hw_engine_snapshot {
> > > >  	/** @name: name of the hw engine */
> > > >  	char *name;
> > > > -	/** @class: class of this hw engine */
> > > > -	enum xe_engine_class class;
> > > > +	/** @hwe: hw engine */
> > > > +	struct xe_hw_engine *hwe;
> > > >  	/** @logical_instance: logical instance of this hw engine */
> > > >  	u16 logical_instance;
> > > >  	/** @forcewake: Force Wake information snapshot */
> > > > -- 
> > > > 2.42.0
> > > > 
> > > 
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
