Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54913CD5BD0
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2514310E124;
	Tue, 19 Sep 2023 14:58:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798C210E124
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695135513; x=1726671513;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GAH4GkjRzLGhrzw0e40PWsBKMIfb8rKEJSSCaUA4Nuc=;
 b=jQsokNqIsyJ8hk/FmyBNMQ0nQEl4s0iKO9NLy5I0mAcoMIcVVbIAzSUh
 //dJU56pAJW4Z/lpiUviQ2PcsnUKzNpa6aY4xUZC6BTFkfG5xIHGadGYO
 SiTH+ou5Kvd5O0dPo2+JApXHksVGYmEp1R1SQoVk2q/2Apj+gVPDxCTOc
 YlkuGTGZmVPHVePm3AHnGfd0zZM/KhLKOWUA51f7NUJDItabs4P6Rc80z
 l+yRgQageJwujhQk4Z4IxUOUCH/3OhpabcM9tbo/VpyLujuPXm0Vb8ae+
 LQ0V/o9XEtxfMyvEm6x5TJq+f0wKNlTTJkFIa5nUliISRUw+5Bt7Ajhy+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="446432775"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="446432775"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:58:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="1077000716"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="1077000716"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:58:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:58:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:58:31 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:58:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBqYiX4cW1xaPB3oNC6faAA/K53pkGMDnpgcXZxkIEuP8chsbHEGCcSVdRMUVZZhYcGGy+PQJea+7mVdmGjb9UJh6e9jGr+NQGEl4b1TKxFg6tjkV4fxiGNrDIzS+Ts8VyUBx2vUe8HnBhpqkV4xz3HBNQRWoZ4VnoV2p5M3mbVBYhdkC5gT9pV45lawUgNR22kBcgpZY3tJko0yiVErqFUcQFUl74zbuEk2Zn4HAZrvKeaqjpOMDA3Halq7IxVHkX+bR5xebQdLFMvBn7025SROc3ClsVI0g+1jCtlEwuAhXqgHLTQHEyK8yjnPuRvLeuL+vWDBX/rpaqH7fVEjeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lmzGS5KO4QIisL8/78SqGJHdIuc299A312J0k88PXE=;
 b=mi1EhmhMA+ojN+xIR7giqogj1odAO7ws0ayx6l0W4hXCq36rgbmI4MKdJQXuV20NSDJnU8suay8haBwqSCOjCQxLW6clWAHoTYq39IMbvWiMAbmjDx+FBmCRX907wqrQqtUDF3rdzPmA4SwG/MO9DjkJuGtw6VcbvfIhUKNcdZqJ49zsMqyPkMpxuGHxwkUm9Ck4StkaDJuXBBvQ1vQLCA2tLFK9Z59z4+QZ54WXA+O99SwYNe8WWZrnDxPQj8UB8alX09Z75rayGSRq//wKs9tqc51Hd54cXQnWj8JLXc3B1KQRl7qxLhOaYMaPl3KfmA5d88fh/rES2+uiTmz3cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB7206.namprd11.prod.outlook.com (2603:10b6:8:112::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Tue, 19 Sep
 2023 14:58:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 14:58:24 +0000
Date: Tue, 19 Sep 2023 14:57:19 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZQm2z3PSaIm3ZPHB@DUT025-TGLU.fm.intel.com>
References: <20230915233445.2241554-1-matthew.brost@intel.com>
 <ZQmenqsn4JVHeoDr@intel.com> <ZQmjph//w3+9mKOI@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZQmjph//w3+9mKOI@intel.com>
X-ClientProxiedBy: SJ0PR03CA0355.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB7206:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc5e018-15b5-4a7f-d24c-08dbb920dfb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4bLR/ktT8ce3j3TZAt0oEYbUvMzJaRaYREhOoX1c238dTG+9wCJE1DVS/7BLN5ICf5nU8oxw5scWNWcaeTpvHRaF2WwSVTRwdMZjVNl32BSuEhZLhlHNgz0chf0rAgr4tQixZTZJ48D7qdpsxeIZZA13IrnDKOEftz5ZRUHdJgZNGE0ev6hhKy0x0LPc+jTjlnFrwTsYtKsa9kWfl4g6nOKSJ+MgOG/SWHhNCREYjzdYB2FUbkUOC/GdaWk/muGM/UnyPZX7vGc3HkwsPEzF2uOPuu2hJqqVIY6PoQZEaRVbt323BCBE6/6HCvrLoIDkRNOaJjkqRrLfrfJ+6gfuPajMJOMTjg2AkUSYfAY3WdFKJ6vedmkL/Ti0scAYYq6UEXiCQDZs5G+QZvUI6bpmQCPmKqQ5WjiSbEP0EnnHPikhqRoVaGnT8RWydroRGFnlAGGz2yN6pOqfWRHloi90dXcumOkDGIy2QCPt/eyErS9oVK5xD3QosxQXcjvciE0He5yY32cVeXhbaJnDKg8J8600hnwjwWyr/HFU2k0SEjS+/VXJUVuQu01jCe+NIZ7sDPvL7+1+dM0GAKVoVxkd6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(136003)(39860400002)(366004)(186009)(451199024)(1800799009)(66946007)(966005)(6636002)(66476007)(66556008)(316002)(26005)(6486002)(6666004)(83380400001)(6512007)(6506007)(86362001)(38100700002)(82960400001)(478600001)(2906002)(5660300002)(41300700001)(44832011)(8676002)(8936002)(6862004)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7h/dKY+J2oSgoEs8DYWBYOe8mT0sMuebZBdbTFME591rVxkS5Q216rgv8kmX?=
 =?us-ascii?Q?73aczWK4L950OuNlheqcCv6jwNzfbmIUeutvlFnanNvhq6jmI19mKMMNRvDs?=
 =?us-ascii?Q?x4uPKBAwNlqucYvTBtyfMsE39BlgW9mDyO81FjN/JZYjuKsBvb5p2+PValFZ?=
 =?us-ascii?Q?h9n8/B+V9ED0C/HaSOfx/vP6Kv7nRcJ5wMm622LCXr1e09aHN57DZXqZerhv?=
 =?us-ascii?Q?ag6ZCtAc3oKgUg7jHpqp9GigtmEI3iDyUp2meFby/nuI6275cUXq5N8Tysxl?=
 =?us-ascii?Q?+eY/p3wM1Ak/2/U+xxFta+Id9kUWpxuvlvh5w0D21Y6SYELgecQTv51GGVqi?=
 =?us-ascii?Q?68SCs3lINbUZTHaTWqGebz74yBTdSQA3s/pnIjBjtuXTWACII0ixgGB15s6a?=
 =?us-ascii?Q?AHHXXXEJAE+kwwMwEUat/SOk3d74E1oRiWwvTs5jUypb2FmqY+Hz3+jVkwjY?=
 =?us-ascii?Q?319xEFDr9jo0mYvkWBe/AYCcRYRhmaQ9LuRFoCX9CvHTKeEkSV6rm/MM2SWf?=
 =?us-ascii?Q?mMdUseHePZj4vgJNb4h4L/FnE07So6TRzveoxeZQAQDmmwF6bcB/Xg6rpFaT?=
 =?us-ascii?Q?6wm+4ZVGPF/01QM+OXCnEG0bPK8T3zvcmz/WSljUdKDDm5Xikn+Xd6sIE/y6?=
 =?us-ascii?Q?EJRb1ByLeYtzPRhed0stq8/S8Pe0c3AhoBWDYF/eYtMY4RpIBWIJHc3IsBjq?=
 =?us-ascii?Q?za3FDqQZYWMdNF75xHB6VfCZuzzG2FEwikllrttWn3LeTUAObnT/OeyQwd04?=
 =?us-ascii?Q?AfN72O0TArqZ56LMzdU2Al1DEfvctvzfEXF3BF3OBwZXCBIKRN8GLRwsBiYe?=
 =?us-ascii?Q?gqpw4SWEJ+5sZHO7SizKqtGkSKfR0Amj2cu+TCNNEitur+94WgeB6GHPHR9O?=
 =?us-ascii?Q?yNbP8pFdPVkADlaLpQr66Ctr+Rzbz5be4FJ3HF4ecGEpwQ18AV18NMvrAqgw?=
 =?us-ascii?Q?99NyFHr/T2w9c8i/xP9pZ53wWWIiOvnEZmB8wGA5Px4YG6JDQxUzo7OpjoRb?=
 =?us-ascii?Q?86+xvoVLIRjU6vvaqrvEpx/JVretz8H4vBcuh6njojWRD1mx+iulpYkdF2s0?=
 =?us-ascii?Q?CB2EGihALl/wcFsvNh8p2rFsKqMTTj0jIsBVmktAplRAynKL+T2va2tUyYZ8?=
 =?us-ascii?Q?O+yMg+MJ063L41+zNsEWa8ag3TWmROjn2h+lyMO3IZ8iYVE/tvWxvRFxoM0f?=
 =?us-ascii?Q?Q/Rdg6GBVrjdtLh8+BNoRCHAi75fqVw4UQI2TTzCFKRXmJLFOTke0MWOkCH7?=
 =?us-ascii?Q?bXCQJmlke4q86z5zZed6lzCk2452ZTcQUG9IgKqe7vmMZ5cpbCjYJ/ca8jCi?=
 =?us-ascii?Q?MOud4CD6ZP60C2DXB6RdsNzi34drwhUzaUvskUeWiMu8XJvm2+qrEf99VOC/?=
 =?us-ascii?Q?vQNdKeoE04elUrJxVgBqxl49UAb5Z5JqQ5OOf/80imSCZEWjuWod2EF6LzhK?=
 =?us-ascii?Q?RaZOzvlFDJNZZ/w3wp2mdw4HgfMLzsHMig/jKgx09dkxNbNwGqqYrunajE5f?=
 =?us-ascii?Q?7t3Ds8chhU5Y9BD/qNCK1OJGlHVIZ4yLnkRukl4XPCCmpC1GYh3ggcX2Q4ei?=
 =?us-ascii?Q?/OL2iwTcV5p4wHLHDWg/MkPfizjYey+vF6GnX3BzmdVcm3SnfyTiDWx5164K?=
 =?us-ascii?Q?uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc5e018-15b5-4a7f-d24c-08dbb920dfb4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:58:24.7916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsPtz41gcbrcIqEwiZUZzQwSiEEDfh/ye7A5pg0AndOPP7SZAWYgy+GmKcALyU1oi86hKiiL8ek7qvDYtMO+yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7206
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/4] Remove
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 09:35:34AM -0400, Rodrigo Vivi wrote:
> On Tue, Sep 19, 2023 at 09:14:06AM -0400, Rodrigo Vivi wrote:
> > On Fri, Sep 15, 2023 at 04:34:41PM -0700, Matthew Brost wrote:
> > > Backwards backing uAPI changes, getting on the list.
> > 
> > Patch 2 breaks compatibility.

How? I just tested again with old IGTs and everything seems to work. Not
my intent to break the uAPI.

> > 
> > > 
> > > First 3 patches already on the list [1] and free to merge as soon as it
> > > gets an RB.
> > 
> > Please do not merge this today as I'm getting these patches with
> > the others that Francois and myself are collecting to have a one-time
> > shot on breaking the compatibility.
> 
> I just noticed that my message came too late. Since it breaks uapi
> compatibility and no userspace, not even igt is ready yet, I have
> removed the patches and force pushed drm-xe-next.
> 
> Please do not push these patches again since they will be part of
> the uapi series we are preparing and will be pushed when the UMDs
> are ready for that.
>

I see that these are reverted, fine with holding off on pushing these.

Matt

> Thanks,
> Rodrigo.
> 
> 
> > 
> > > 
> > > The required IGT changes are also on the list [2].
> > > 
> > > Matt
> > > 
> > > [1] https://patchwork.freedesktop.org/series/123820/
> > > [2] https://patchwork.freedesktop.org/series/123821/
> > > 
> > > Matthew Brost (4):
> > >   drm/xe: Fix xe_exec_queue_is_idle for parallel exec queues
> > >   drm/xe: Deprecate XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
> > >     implementation
> > >   drm/xe: Rename exec_queue_kill_compute to
> > >     xe_vm_remove_compute_exec_queue
> > >   drm/xe: Remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from uAPI
> > > 
> > >  drivers/gpu/drm/xe/xe_exec_queue.c       | 97 +++++++-----------------
> > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 +-
> > >  drivers/gpu/drm/xe/xe_vm.c               | 21 +++++
> > >  drivers/gpu/drm/xe/xe_vm.h               |  1 +
> > >  include/uapi/drm/xe_drm.h                | 19 ++---
> > >  5 files changed, 57 insertions(+), 87 deletions(-)
> > > 
> > > -- 
> > > 2.34.1
> > > 
