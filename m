Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD79CDB483
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 21:07:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5557910E640;
	Fri, 13 Oct 2023 21:07:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C699210E640
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Oct 2023 21:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697231253; x=1728767253;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IQakAmVcgofPnuXeC2N7vWH9ddlen7Pwvg14oRqi6G8=;
 b=eRePRSIkokKNrFVMQfIu91fLA6+18vkahVkOcFjK81cw0la7QZd5v2cM
 +w7HfHFgRNmGg/Wc7h56Gtn+FAlvKafubdVrDQ92WZQ7wNCI8VJ7q/lG4
 drfgHpSonLvKz8Q7rQRvhA84jeZCMLLQAkBIdi5NkrTvsv28GURrgDIWD
 Bl6YNuNdK7YvuFaWYSxYHEMSay318ekXL/p5AYYP9FIMmGQOca3OfMr/W
 X27fiRpjVuGXsPi+xSvD4qavnaubrSkslzlRSyZUAafnthYMwl34/Lps+
 aBeJnjGihP9eXnCj9NSkcUt7uE8HQw8jTOB8HUbi1wX0sGajk0okucL81 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="6830632"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="6830632"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 14:07:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="731499493"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; d="scan'208";a="731499493"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2023 14:07:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 14:07:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 13 Oct 2023 14:07:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 13 Oct 2023 14:07:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 13 Oct 2023 14:07:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEh4+VH3OBYpt7/2Z+TIcOP1YWUVC7A6+TXPUh1BY7kr6S0hJbVhbXModIaOWDwJ6RAaFSQIuEhLyDAfa4Mthgd3iRnk9yG9nKdXpv9UX6cJ63rVFBl64VLuH8QqNG1/vQw1ZVJQS4D6Y9mE4GiustOgka0/UtesGDj48FNi1ctk+JhuZp6nZfvWOgBW90iEJ3uo24flKCtkeimbScivESpn3v6Ib46n/3wPyxm68ughNPjHa5DmQ1gTtNLY1i251RXzoHPbqqEFscBLLRY2KdhWmf5olAjzSSLDkxS+pcas3Fg117rdsrodgSZa6Cs8dBXACtp2zDltXYU0fq5Z4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeUL4ep1/4V+8FmhSrstXXY2KBgSUgOLhjGYPiytlfg=;
 b=G9ZgexklVSbYTp5MHk3bw81eYH2hbGskND3RD6e2uvoFOxSNxgyVCyEEJNfnduzOHQJH9/SvxIwTQINjVvBatGm/FCQF+BWEA2GlyjA5BH7I2vxqKbbsy/JFHFMzx7P0UTD7RdaRdWajEtkLVy+QyK3nJ27OiqKB1irw6vpq01UwyYgF7FhknFXjcjtMknKVmPUfem/0ecUPueX5vyPUUEhrYfYcVybfRVTbVcxsNFRehoilwAlZPz7Aw0UPcXL9WBUBre9xLjYPbhXGGE/UUfBxybQ7Bt3p/vZe7n+qZocgu1WmwSrEAv60oREFbk6WWaltIrFlxy+FsTdMxYtmTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.43; Fri, 13 Oct
 2023 21:07:24 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 21:07:24 +0000
Date: Fri, 13 Oct 2023 14:07:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20231013210721.GP5757@mdroper-desk1.amr.corp.intel.com>
References: <20231010184151.91195-1-jose.souza@intel.com>
 <20231012171628.GH21382@mdroper-desk1.amr.corp.intel.com>
 <ff3e03acf78dda8cb52bde94de70f89a005596c7.camel@intel.com>
 <20231012173036.GJ21382@mdroper-desk1.amr.corp.intel.com>
 <ZSmrUfC9CAECorcJ@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZSmrUfC9CAECorcJ@intel.com>
X-ClientProxiedBy: SJ0PR05CA0130.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::15) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: fd662561-9265-4e4f-e883-08dbcc3065ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kkgKd+YhWSu4MGHhwjAWOWouQVCq5MwDGZwohJh9P2ZrT65Afk8UV1xHAU5pNWSt5ZoksvJY1GLn5rqCW23Fcj+NevhdgmlCSGRVRdiXIMEEW+1127AJSN8bsfbSdkvsTFfOWk5HppWakN6VbdXiRyQ5AdxmxHsaVyTipFeUa5ff0dq29wa11LzRYqSCALEZA0KwA+inJoGJmBJ5sMoAxiKJ7Qgdm0YB9yakWAqG6RYdaNDubqE4Advno33QOIgkx2yQ+JraSOT+p/bp6U0eO+LbxH5j4S9e4eFcyvuDSRp4PHRExJiOAaSRaZVyDAnYnaOjOog6R6QN0i7jbvL+/tIqbn4vAaUL2YgZAJ9Mep3BM6c0lliaW6edF4cEl/ixzmzt6G5xtYqgdMzLq1Zeke/yt9heEcngIAKCx5Xeqq9CpS9P4U4leZgouU/GjlSJOPt7t605rYWaY+bpzCSV1Ftm+t+V9DhR9z36tu2A8PtV7CoHHj0O7H2ulIhiU6TMZKdijLQivGvXe4MS7OUKynqG/tvE1NooeVInmBCVNN0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(376002)(366004)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(6862004)(33656002)(966005)(478600001)(5660300002)(6486002)(38100700002)(6666004)(54906003)(66476007)(66556008)(66946007)(41300700001)(8936002)(4326008)(8676002)(316002)(6636002)(6512007)(26005)(4001150100001)(2906002)(83380400001)(1076003)(82960400001)(6506007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uPzcoS+cfHb43BDPFdLxfPxpU921UujZb8/rprq1OmFyC15RXvc1nUy9qq?=
 =?iso-8859-1?Q?bLEx8Hmt27IeR/or67gDrshq5LS/h0DN4civKS//DK10/Am8nf18rbKgUo?=
 =?iso-8859-1?Q?n0gf2RFRbObaCfTbUaYboucRD/ORej/MuzAQoHY9pJ199mnbP8O/g7siwM?=
 =?iso-8859-1?Q?f3HvBaObXDczlkxxXLtfQ/mJkdvVNG4TLCoSRmof5hwwxquamBK5Vow9Mn?=
 =?iso-8859-1?Q?9d7e0RyQgw80sYKVfYwwbTTUTT049AFSdMlDExH4wZuonXbbp+uyizlWqQ?=
 =?iso-8859-1?Q?RDNiOVXt40H5UdqC2kKeN6iieKw0s+M0fe7R/R2xrH2N+ahk5dL13aLJnE?=
 =?iso-8859-1?Q?Jw6dYjBZNsGK4Ltv+zd47ntqKPhOlmh2zlaxjPMIbTB5bBEjlRUWQ5WLDa?=
 =?iso-8859-1?Q?JYysZckXmdQOAtqnYHjlbNuS2er3oJzh8EtxaEOKvedk4O0mGYwFhssHGQ?=
 =?iso-8859-1?Q?IqVLv/2tLi5gGgATSGV/XjjgsKQRUJ9OO/6w0mgAOiR7x9j8bFiT7+tPLm?=
 =?iso-8859-1?Q?6KkRamdHxOkbU3VhTVRvnkbjvTSYQ34UQ5VkRUwtq4J4H/9F0dwtXjcz6q?=
 =?iso-8859-1?Q?6pPNHzEcU2rjo4T/QxRixiyjw9cVqcEOowmgt9XiMjM+oEdKqg9sPuDboI?=
 =?iso-8859-1?Q?EbrcEGPBIbT6Dh8Re30tV2cs7DoJQWMMQg+q9WYVv0ft3AKThmBhfzNrT2?=
 =?iso-8859-1?Q?3wnsyDjxdzVbMORKfxTNMfQqFbSz7gKVM9VaM9wO5tOqjm/VWNkJL9QAYA?=
 =?iso-8859-1?Q?MTDZ660984orGToaxQNfmMtJzbqvOEvm8USRda6rucgn8lbjQkuSd6YbA4?=
 =?iso-8859-1?Q?RkWXcPKsZUBkSer6PkTmto4qi1rMUGrLzaE7aNjYCsOD44fFstbK/CUqZp?=
 =?iso-8859-1?Q?BNfqHGugCufqNWDrBWTepWmh5C6s/bemhpnOtCTCLmArznnwOVyInRoYOD?=
 =?iso-8859-1?Q?6nDr4Dx2P+Pyfhmsj3C88IYSTdNn/jlhjhHk17O8YuHAtt6ZwY2gJA0/7n?=
 =?iso-8859-1?Q?plj8xbPKWECXBeh+CQ/hqRuzmcdJ4i6O7+h+FOyKhD50++jTjBlu5/LpVu?=
 =?iso-8859-1?Q?LzxHNvKzAtG81KIK9KXZttMXUDfFdMyr/rMYSGqDJoXoftzsksF5oPKfdY?=
 =?iso-8859-1?Q?YPOX6qJPn+LBoKcB+Z5SOcPXMHXaPdj3246gCTEUdAOM73OAZ7X3MTncuE?=
 =?iso-8859-1?Q?olee4LCcGDruVzhP0A9TjGXigNrNGWe/1MaMBr7IiPhqSnC9JeVipNsb0z?=
 =?iso-8859-1?Q?YQAwAayCL6BHUMVJlIIZM6vbafob1sVl5KnFkmPWpwayBT+pUHH3l4Wqyi?=
 =?iso-8859-1?Q?PnxkVJDk90g+8kCGyJpU51mN/LQGpp6lGrW1f6Y1m7dvvqS3KTS4eHdq4m?=
 =?iso-8859-1?Q?lxmIqSs5MTWxBGu0fZWS2Wky+4QWUlCt+ALq/TFlTwfXlvx8ig1a+XB5Hm?=
 =?iso-8859-1?Q?JRUIPc5hKjwevqxsibJzFLNiuHHUuvmjMgXF8+UDXPRnST5pD0tmOI8ewA?=
 =?iso-8859-1?Q?Td1MmvZqV6KldkecSF+7bw/lnT4dq3MuXpHA7HnqZ//Pvm7NVZ4XH7zY0+?=
 =?iso-8859-1?Q?Kw/cYnYlv/Vf1qHWOwV4mLQTKSTXrEbfNExPDr5Lrj0k49hV7dnxEPnwcC?=
 =?iso-8859-1?Q?GgXhIgz5hhg8BSxMUtL0KRNdJ3xVPwzpYRaN26Hid/yvVPUZWgYccWlw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd662561-9265-4e4f-e883-08dbcc3065ec
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 21:07:24.5443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjdoXST2N7VFwgApZBmXkXVubYtjJQP5dhIUND3MmqhMBw1EpoNRgKEP0Wb3mhcwNDho71zJGAxz+BRRF4/qql9KWmd6XEbqAbP681l3XyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6006
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

On Fri, Oct 13, 2023 at 04:40:49PM -0400, Rodrigo Vivi wrote:
> On Thu, Oct 12, 2023 at 10:30:36AM -0700, Matt Roper wrote:
> > On Thu, Oct 12, 2023 at 10:20:33AM -0700, Souza, Jose wrote:
> > > On Thu, 2023-10-12 at 10:16 -0700, Matt Roper wrote:
> > > > On Tue, Oct 10, 2023 at 11:41:49AM -0700, José Roberto de Souza wrote:
> > > > > A future patch will require gt and xe device structs, so here
> > > > > replacing class by hwe.
> > > > > 
> > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_hw_engine.c       | 6 +++---
> > > > >  drivers/gpu/drm/xe/xe_hw_engine_types.h | 4 ++--
> > > > >  2 files changed, 5 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > > index b5b0845908887..37b3ee1268090 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > > > @@ -684,7 +684,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
> > > > >  	if (snapshot->name)
> > > > >  		strscpy(snapshot->name, hwe->name, len);
> > > > >  
> > > > > -	snapshot->class = hwe->class;
> > > > > +	snapshot->hwe = hwe;
> > > > 
> > > > I haven't really looked into the devcoredump stuff much, but it's not
> > > > clear to me from a really quick skim whether it's safe to save away the
> > > > hwe like this.  Is there ever a case where the snapshot can persist
> > > > after the engine itself has been destroyed (e.g., if we capture an error
> > > > encountered during a device probe that results in the device being torn
> > > > back down)?  If so, then you'd probably need to make sure that the hwe
> > > > field here only gets used during the capture, and the 'print' routine
> > > > would still need a cached snapshot->class to avoid use-after-free
> > > > errors.
> 
> This is very real! We need to cache everything we can and consider the
> device itself is dead at print. But here we are at the capture no?!

This specific line is in capture.  But then the captured 'hwe' pointer
gets used farther down in this patch during the print step since we're
not caching 'class' anymore.  And a later patch in this series also
tries to do a version check on gt->xe during the print function, so it's
potentially chasing two invalid pointers.


Matt

> 
> > > 
> > > Xe devcoredump dump is also removed with Xe module, so no problems with this.
> > 
> > With the module?  Or the device?  Even if probe fails on a single
> > device, the module may remain loaded (and might even still be driving
> > other GPUs).  If the dumps for failed device(s) are still accessible,
> > there might be a problem?
> 
> Well, this is a bad devcoredump limitation at this moment. It doesn't go
> away with the device or with the module. It blocks for 5 seconds before
> it is gone. I have couple patches [1] to suggest to devcoredump itself so the
> driver can also decide when the dump device is deleted. But I'm trying to
> get us first in upstream for a proper handling of that.
> 
> [1] https://gitlab.freedesktop.org/rodrigovivi/drm-xe/-/commits/devcoredump-removal/
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > > 
> > > > Rodrigo probably has better insight as to whether that's something that
> > > > we need to worry about.
> > > > 
> > > > 
> > > > Matt
> > > > 
> > > > >  	snapshot->logical_instance = hwe->logical_instance;
> > > > >  	snapshot->forcewake.domain = hwe->domain;
> > > > >  	snapshot->forcewake.ref = xe_force_wake_ref(gt_to_fw(hwe->gt),
> > > > > @@ -731,7 +731,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
> > > > >  		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0));
> > > > >  	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
> > > > >  
> > > > > -	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> > > > > +	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
> > > > >  		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
> > > > >  
> > > > >  	return snapshot;
> > > > > @@ -786,7 +786,7 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
> > > > >  		   snapshot->reg.ring_dma_fadd_udw,
> > > > >  		   snapshot->reg.ring_dma_fadd);
> > > > >  	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
> > > > > -	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> > > > > +	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
> > > > >  		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
> > > > >  			   snapshot->reg.rcu_mode);
> > > > >  }
> > > > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > > > index 5d4ee29042407..71c0a0169e62a 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > > > > @@ -156,8 +156,8 @@ struct xe_hw_engine {
> > > > >  struct xe_hw_engine_snapshot {
> > > > >  	/** @name: name of the hw engine */
> > > > >  	char *name;
> > > > > -	/** @class: class of this hw engine */
> > > > > -	enum xe_engine_class class;
> > > > > +	/** @hwe: hw engine */
> > > > > +	struct xe_hw_engine *hwe;
> > > > >  	/** @logical_instance: logical instance of this hw engine */
> > > > >  	u16 logical_instance;
> > > > >  	/** @forcewake: Force Wake information snapshot */
> > > > > -- 
> > > > > 2.42.0
> > > > > 
> > > > 
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
