Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1279DC0015E
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 00:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC17F10E044;
	Thu, 27 Jul 2023 00:12:46 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823C010E044
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 00:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690416765; x=1721952765;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vOe6jaXQvPCzUNNLX/dxfnTjCklz7QD2bd1Tn8mNL1Q=;
 b=hXTsMO2GWOuTo7fSicGP5prQpaSKy4kE4gO84joM/TDd3QvJWkaSjDwL
 kUU98bP9igHLEw006KRqLcABlmJ+vIF8wciuP8Nld/If0ZmXhkk9GJ+Hi
 yq8PHj7zCKfYNBm7yBVKtIaPRLlOfSr67OCQc9vckkhMA6lroO/smgdT6
 SyUki8RSlhMJXskVSbRXHBulqlqp57GDBgCupTfk7lZPqUiZ8p82HGqn7
 CT8peZ701kxowdWHl7sYSTzviUCFzLA1MrZAtKp7Xxqg9gSxxLdP00eyn
 6AvAVRZBvsq9xyNpASnP7I/T6fMSORiM1taha+XSkoaJBXu8TeMMGMkGQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="434438945"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="434438945"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 17:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="796763724"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200"; d="scan'208";a="796763724"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 26 Jul 2023 17:12:33 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 17:12:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 17:12:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 17:12:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 17:12:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GyRGQ9R4FgeDvRqnc0TQ1ztr0H09HDVm6nTUFj4SbRiMd7dpEXOMPw+UGFZSSQhudTnb8CsPoM51fKvr9ninmNkwGXhFQKFZhHftI0h3WDGKCj5uS8wKfhs+u7awEBPu+aa8eQN4HtDOK3Zarm53oRkCbTZyg9jGSGssygf/L6QDlAWVBhrHxsM88+WeDE5PYNXgPuDUp7OoCCTxzduFre1wiJXB5tJaBxo+JbQqUf+/as3+kIP0INgxYy1TFsyNme4jjTHKxBMzGLwmajnLgPqF45ZMk/A87B412nlyrGxJR2flZwx07kg8vCMhk+Naz3gs/blzzhkMsMe23aQggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dw/JIIxfGiYnFsNzcJaWaEJm+vog1sx96giLzXdWDX8=;
 b=U9dM94SdvyHxWtzjnaMgUBX6m8Hh+Htj/hAOwmqtkLcnHnMEH24OHfsO7SnOjlYgVnKZ1y8R/IDpMNfgPU6imkfQsGQNTmdDFwyih6BpNNPE2BzMzKED7Dq3Vs41RHldW3gU69hoZWUsT2tG01q6ySdjy75NdkcP/ZyT+tqFi83ZKUXmnxi8S89T0x+bUmr32YNzKSZUtUs1zt3Y758oKH/4HvklAQitd9NjE0IUe+iClH8UhgqpShUYOh6GYGIo5DM5u5jERg0NhTLkYE6v20DbiACtrMXvgx7GpjM+b7iv7jVI065M8o141xV2TSsJz9R8TIRlCOY18TWQJStifQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5028.namprd11.prod.outlook.com (2603:10b6:303:9a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 00:12:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5645:50f0:9b06:1dd0%3]) with mapi id 15.20.6609.032; Thu, 27 Jul 2023
 00:12:30 +0000
Date: Thu, 27 Jul 2023 00:11:45 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZMG2QeWpRabPTXd3@DUT025-TGLU.fm.intel.com>
References: <20230726192520.383531-1-rodrigo.vivi@intel.com>
 <ZMF0LMxahswx9wyn@DUT025-TGLU.fm.intel.com>
 <01fad5a237f5018521cf426342fc2bac975e09f1.camel@intel.com>
 <apsfze2qz55irp3eltsantis7gkb55ig3snlobpmn5pdjelgby@jiyfoa3kelcb>
 <ZMGRjCuCVkXezCty@intel.com>
 <gfkhtmyxmaag4s2z7ux4a5lgx5l2ad2f6oohibbpvcidn4xngi@vfyqjexmrjwd>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <gfkhtmyxmaag4s2z7ux4a5lgx5l2ad2f6oohibbpvcidn4xngi@vfyqjexmrjwd>
X-ClientProxiedBy: BY3PR05CA0048.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5028:EE_
X-MS-Office365-Filtering-Correlation-Id: 59981a88-8ad9-46af-44f8-08db8e362ad2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ntg9g5IpjE5KGriZKK2xPwtewH2/TbtcVTCHd2qWGLT1ScGvwlqEeTF2r0z3Od+DnWPrbt4xbJfMVQqvkaeopSaNfuyiJ2LLC2wNVwnru7GoK9ji/F/C1r8qPzygndQNqm+N9+/erHgCC9YZ7kqFxH1MwgUO27U/jDp4eArjLDoPVDccgpfNdOGH91T3NF3BkpmsE12jwg3n2Svuy0EFA6/Jnf7vrFTgipPdqqNevXFdwElBtk61CO+/PglU6aM9aYMiQVXjG5RSvqgxwoRqO4KbSJg3gjfIDinL4eIoxzAo+gwDT3MooUUyh+n8hTcE1L9lmzNvNi820zBlTk+aqxsWT5i/UKFLmBZuMk/MwJFV0OyopeL8iXc2FJxmRF8LJFGSR1wzbXjOIgQenps1MWullvXR6ZauMgvOhoA4eYDYqbQOJiIzeIETf8S84YbNriqOoAj9tJ1tgzyqeJo7B15uDouD5D1wKkpi2Gk9DLE3tpj/6YfOG0ovqb3ldELJsH3+P4A+CJhfdp5t0fe5l+hLRpWHDkbcGjm9PLTX/oxTpOcgB7s5mb5U8QKl2bwN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(6862004)(2906002)(6506007)(186003)(26005)(316002)(38100700002)(83380400001)(41300700001)(5660300002)(66476007)(66946007)(44832011)(66556008)(4326008)(6636002)(8676002)(8936002)(86362001)(82960400001)(54906003)(6486002)(6666004)(6512007)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/nfPbFs3nuXJ7B64hiKw8YQdDltwJSGHthnj5d4hpPrXxYo5DUcDH3q+xvyX?=
 =?us-ascii?Q?V3R7an6PCTlSq6cd8/f+s8d7u8GQKeKrRNPBsQB+SUygDLa2MJ9lh9xksRkH?=
 =?us-ascii?Q?WKrbowAhGc1KS5efVqKUbZdqp+33qzubRvjL77jIKwwDu8mdJMwBydFanszf?=
 =?us-ascii?Q?iPqTKJOyFFjeNOcb6/ma4Qqryo4oxsXilL+sfUq9oqe3y4A8sNQm0g7umCpK?=
 =?us-ascii?Q?rx11WcyFwlCDtg7Dl3Y1ERvkS/W9nB1/szPcfaioTLqvGwelovihLelx/kwv?=
 =?us-ascii?Q?NLuPSgOLgB7BJp6zSTX546L7GAPR2eUsTcCN0dixNor9KBlMLol5Qaegc9Nu?=
 =?us-ascii?Q?PfBo22wurzfYg0syseigw5faDIBvqBbi/pHA9sO7bLjl2QHviRro42muwLL6?=
 =?us-ascii?Q?xSqnJbX1npJHIbCSHSIjZxdXfNO9i6IBAL1g3FvGGaOAZ0bibjrkP7CslYJi?=
 =?us-ascii?Q?pizlZNi0jBYPiagtE1xenmKCaeCkfvHPK00xTrSy5arnVNK1CWFyKxFWvYXg?=
 =?us-ascii?Q?fw5DI64RGdfWIWuoQV2xqVbGo3+DL7Q67IkDFOm0PF5275jOFn7gQiXDxYpM?=
 =?us-ascii?Q?NADtb0StkhqfJg0LYPxPwOdDvhfCMHEW9d1xcKe41+7/UF4B4xQmmjdw5IBl?=
 =?us-ascii?Q?ngi9b8uevb0YjnpVp9xle4yJs6lr53VgOhdE8NvBzEzXeiaDNrJeTTGfQYjy?=
 =?us-ascii?Q?NtC24wi81Smz1dbfDeb3dCHOAzjVXeNzMsFwqcOMSwwfBn0OAbFJ+qvnnC5D?=
 =?us-ascii?Q?rvJDF/tY+p6TxRL9P/P861xQ4BuXCjQS4mQJFoBAOd0/snGMnz3wwR2C0pBx?=
 =?us-ascii?Q?dZtnPZ6M9v5zZb2xcLVKTfgiHlI884vpbipuS3omAHYaMp2K1nFn0snK1g13?=
 =?us-ascii?Q?/acS+dUsxt9uBhluK8IbmEe5CaMU8IayNcDAaRtoGguAAxKEOhxbGofk1SfF?=
 =?us-ascii?Q?gXyc/y3APSPsFYUYj6QvjFFUpbcjxtJE0m9XC2xW3YSupG2sLKssn6XfY18n?=
 =?us-ascii?Q?zY3dFq2IWwk8Ng8veuHQQIN5rGIVfs8KIZGcRy140qyl5lBBH+g8U4DRcKJJ?=
 =?us-ascii?Q?o4yvQPhEIF7FdpRas9AtuIqr5ugVPokZdPPyD9esZhHkku/W2nTGTzu2lrtd?=
 =?us-ascii?Q?AnuAxSZZt4ncuvS9KydSHy8WZwofW+W2AItwkJYfCpyLfpyolRml5/X77w3W?=
 =?us-ascii?Q?Dwf6WMj8Oy+y3tPlen9Yj2qD/RNWSmdCvD1l3UgmIbH9+VOom0HKW9ephQCi?=
 =?us-ascii?Q?JYZApI9kJRpYyCXy1HuhycYTDv3TR0HAKSW4lHKwFkwG/DTpWuzSaU2Fg1sc?=
 =?us-ascii?Q?oE3FBT5Ft3PDIqUcn/CUiP+YrKqIjPUZgkpZxaisi5Ov8C6y4TuCXkvn++3i?=
 =?us-ascii?Q?K68O4NQWr42t494DL1HADUuQqm5EDaiNyidC+C+RoDpXFGYgvT1VbrtyMuU9?=
 =?us-ascii?Q?nKEYf8P4Wh5sQUpX0VyULIM1ubVGN9B1isZCw+egD3tbZZWo5AyFYhc+Rps6?=
 =?us-ascii?Q?kZzLhBGKzdSaSOsvbYBQv+j7b/abSPuWqSyX1Pq/b955Cvs5orz8L8WbCXEB?=
 =?us-ascii?Q?Jhk/dyrHuzaLBLmPwh49/oCTrj8WIl/Idh9OLIZONpNIEOjRYOH6cF8yJ69g?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59981a88-8ad9-46af-44f8-08db8e362ad2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 00:12:30.2573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JsW/r9BB+RCyDrmoD5UtfCz1FIhea9dDOUVbonVvrUnnJju8bYX4n7iXLgnS3LsL3KS86ekaPpAn+Yhj4jdAzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5028
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Add DRIVER_DATE to coredump
 error.
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jul 26, 2023 at 06:58:01PM -0300, Lucas De Marchi wrote:
> On Wed, Jul 26, 2023 at 05:35:08PM -0400, Rodrigo Vivi wrote:
> > On Wed, Jul 26, 2023 at 05:38:13PM -0300, Lucas De Marchi wrote:
> > > On Wed, Jul 26, 2023 at 07:37:43PM +0000, Rodrigo Vivi wrote:
> > > > On Wed, 2023-07-26 at 19:29 +0000, Matthew Brost wrote:
> > > > On Wed, Jul 26, 2023 at 03:25:19PM -0400, Rodrigo Vivi wrote:
> > > > This might be an useful debugging information if the driver
> > > > date is properly updated with a certain cadence. With this
> > > > we know from which point in time in our development the
> > > > driver was from.
> > > >
> > > >
> > > > Make sense to have this, wondering what the cadence should be...
> > > >
> > > > before we are merged we should probably change the date along with our rebases.
> > > >
> > > > after we are in tree probably after the latest pull request towards the next version.
> > > 
> > > 
> > > does it really make sense though? I think this exists only because of a
> > > pre-git era. What's the problem with using the git short hash that will
> > > automatically be updated and accurate?
> > 
> > well, we still have the drm->date to fill so we need to maintain it.
> > 
> > maybe we could do like nouveau?!
> > 
> > #ifdef GIT_REVISION
> >        .date = GIT_REVISION,
> > #else
> >        .date = DRIVER_DATE,
> > #endif
> 
> Sounds better. I don't see any value on DRIVER_DATE and having to update
> it. Just setting to some dummy value when GIT_REVISION is not available
> would be ok
> 
> 	$ git grep "\.date\s*=" -- drivers/gpu/drm/ | grep 2023
> 	$ git grep DRIVER_DATE -- drivers/gpu/drm/ | grep 2023
> 
> Tells me nobody really maintains that.
> 

Well I think we should attempt to maintain this, a date is helpful to
give us a very quick idea of when the driver is from without having to
dig through the git logs.

My opinion is both of these patches are valid but let's add a 3rd patch
which also includes the GIT_REVISION in the core dump and perhaps a 4th
that makes the date plus GIT_REVISION easily available in debugfs entry
or something.

Matt

> Lucas De Marchi
> 
> > 
> > > 
> > > Lucas De Marchi
> > > 
> > > >
> > > >
> > > > Anyways:
> > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com<mailto:matthew.brost@intel.com>>
> > > >
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com<mailto:rodrigo.vivi@intel.com>>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_devcoredump.c | 2 ++
> > > > 1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > index f53f4b51233a..79b506dc2622 100644
> > > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > @@ -10,6 +10,7 @@
> > > > #include <generated/utsrelease.h>
> > > >
> > > > #include "xe_device.h"
> > > > +#include "xe_drv.h"
> > > > #include "xe_engine.h"
> > > > #include "xe_force_wake.h"
> > > > #include "xe_gt.h"
> > > > @@ -83,6 +84,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > > >        drm_printf(&p, "**** Xe Device Coredump ****\n");
> > > >        drm_printf(&p, "kernel: " UTS_RELEASE "\n");
> > > >        drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> > > > +       drm_printf(&p, "driver date: " DRIVER_DATE "\n");
> > > >
> > > >        ts = ktime_to_timespec64(ss->snapshot_time);
> > > >        drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> > > > --
> > > > 2.41.0
> > > >
> > > >
