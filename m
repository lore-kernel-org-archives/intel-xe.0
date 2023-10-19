Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9ABCDB483
	for <intel-xe@archiver.kernel.org>; Thu, 19 Oct 2023 13:51:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56D710E4FD;
	Thu, 19 Oct 2023 13:51:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE28C10E505
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Oct 2023 13:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697723462; x=1729259462;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P1K5fRk4D28m0CP+y5ZX3ON/QIk0rt4fZ76LjhSTSNU=;
 b=HlUzwwKI6SPOToxvrQjIrGIFUmQP+zzApugxnMN6njcXSr01SovAJ911
 BKVwXxHKEwCIg2JNreedi9SzmqumlKw0z0t1mrmIbIOn6uCvoUw0Q6luk
 AM7D86BDKz7/ptQh4w1zPD59nx4sbkjJWZXzCOzU+qXfqX8vPqa8K1C3r
 LN0bgw4FmET1f+pz3VmcK+6rcabxJ3MZv/KVECeNb2Bb2E8HA77KkbmIN
 WgulzCG1jAoHHUIpwlW3M2lSxQ9xMJUVfO/pItizHt0F04ofIWSnmE9vI
 j1Zy0W9UJaK19mbhHpb1guqMtHXQZq1E9udAm2Wj5pUWH4wvA6Zu9qtNb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="376640216"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="376640216"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 06:51:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="4990099"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Oct 2023 06:51:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 06:51:01 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 19 Oct 2023 06:51:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 19 Oct 2023 06:51:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 19 Oct 2023 06:51:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgLUvnO6tSlMAroPTcd8LJbrLchBkdOZgpxDkfXh0z15kK1mQBAVcuMutPi/tdInQwov5PyhuL+XGbeuf2HOc7j4be64vGM+jmSE7DnAN1hLtCvfUw+9hfmDrpzuUmVZc4iY/2E5UF9tg5xKqG7nB5rnV8eXCbFOyA9e8PcyHEr4YoL9IqpvmEX/dkEUXSudN0iK0VvWpMKMarWJWDo+vPctpoqtSBn/X0jw1I8fOWypAqURT8X6+/6uMGaEMOozgf20unaqqq0eswTKnOcdvtz2y8nV1O1pDBIIXZ975Rbidz2kUTuJjxEZ6s4r8AMCaSQyXBzqYaZUbVf0L9J06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6x+8YG9jrzFnC6LgxgmvnhYe+CPHEViwCJZJPvZuXE4=;
 b=ipcfaeknVCwSDE9zmSPtVHddKQxKLiI40zStZq4Fy4LXIO73e7mPTXyjfUdSvVU96xAdoVQpBOLVK9bDUSnv0FzroCIOJsJGDa13+DQUpdLDo6dZ4n7/T2VIrwPJJeYPf0f7oc2XQ1mlGVxjsqLf6gr+r63EKF3PxbmbB4vLuj6rY4gtIavarmBEl8SF5xMid/bcb7cdDJKZe7b7S7absxHd0FS4DuOD5hta3sH7qG/DumUnDeujH1Js97jHr9W62Q8xErfZY34nCfOe4dis4bkbtSyjIQdQ4o6V6kMdqcel6pbthahfQzJtO32mtIZi73FdloXRggdnmt7v1W1n9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM3PR11MB8682.namprd11.prod.outlook.com (2603:10b6:8:1ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Thu, 19 Oct
 2023 13:50:58 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6886.034; Thu, 19 Oct 2023
 13:50:58 +0000
Date: Thu, 19 Oct 2023 09:50:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luca Coelho <luca@coelho.fi>
Message-ID: <ZTE0PRFUaC/Zearu@intel.com>
References: <ZShRTTLRD7ltDGSS@intel.com>
 <f352c534f049f7068cef667b4faa88d7cca9b8fd.camel@coelho.fi>
 <ZS18QYFnoxZBRAtl@intel.com>
 <cfac5572e3d1ea7e0363cc58d4230ce7135b10d0.camel@coelho.fi>
 <ZS2YMf+umJSSYkh3@intel.com>
 <eeb0a65118c80a61c8cd1e301ad3c28592cfde40.camel@coelho.fi>
 <ZS20xlCm8DMTH4bQ@intel.com>
 <20231017005841.GB1327160@mdroper-desk1.amr.corp.intel.com>
 <ZS6kWW9oULDTRPjY@intel.com>
 <53c4b27aeb2aa333c288b3c0c867a04035b72ee8.camel@coelho.fi>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <53c4b27aeb2aa333c288b3c0c867a04035b72ee8.camel@coelho.fi>
X-ClientProxiedBy: MW4PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:303:8f::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM3PR11MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: f0ae1c44-a453-4290-c742-08dbd0aa6c1e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c7YteVtEZhDTcYXRXGsuirF8UhHsOv7rHMZXgfBa8LimQGOOLwaQL6nIR7jHF+3VuhJiwIrVBODojJoVT63OIXRtIJE/vGiK6HsjXV8GEuPk9xdht7HVx4QkNidep1zmRPMw2/S6q+LLyFmGHCEvHNybnjJkb1ByehhQ1MWVysPanwJr7ZFpwXqhLG1lmXvMz8XCyUHbijtD8oMf7Vt8DEv2PuXclk3wx3wa0I5gpUfU2LA6xEUFMOKk6aJy4AFxipSj0SCEvqF76UQeWoZGvsmd6M8jS/u8WLvUl7twsrPAHouOR0GtYUc23AVxJg5rqJuE78v+70Bi/LJZ3F9iE8A4eiw5fOBqy5CgUJZIZDQjxT9SMc3rMFRhvsbqWDSP/T4xzR2P0+OcprJA12WZX1uQHbvEz5moNXOObnVL6b90c2Hvqed/Hgb5FItikY+UMZ6GAU4Mjo3VwjSoE+v5lqpbq5tsNCuJUN5cIG9ox3cBo08WN42+3qufYiEuk2zF8VGDU+an/WcsrjgcJAbOtn/H5fSe4BXYiQrbONE9+leUNegwfdq/O36iwui2UMGp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(366004)(39860400002)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(38100700002)(2616005)(26005)(83380400001)(316002)(6916009)(6486002)(8676002)(4326008)(82960400001)(66476007)(54906003)(66556008)(66946007)(86362001)(36756003)(478600001)(8936002)(41300700001)(6506007)(6512007)(6666004)(5660300002)(2906002)(44832011)(4001150100001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VNIbh3D1fedlmWg5wBak5hf4ejhtT9KgGWs1HOFMCkS1T7VYmFdZRFixTxti?=
 =?us-ascii?Q?Ox9qvUqmO+yhzK7SWdQJ1oXs7kJOV1u8hzH9AxmDtcWIa4rtPQEHNChxdt8j?=
 =?us-ascii?Q?oG82MEleMKcIAiEeszIOgb5cobNJwInbtBsa2IP3jd2fISjFZAawrAxdpnVq?=
 =?us-ascii?Q?nv+5D6zztBaUY3DVtsH5DdZpWHs5geNuyIQrH+EWmQ2Tz7g+L/fDJZ60QbXQ?=
 =?us-ascii?Q?E+C27faIAHVkxaJZopXCJzEGU8kuyIouwHSEOyT9Wk9rztqc1EK1vh9e9MpU?=
 =?us-ascii?Q?Dcf1r91oqeO64n+wp5g2h5MmwumUx5AhODf3bSKD7pnOyO+v1OFqGAdzRpYy?=
 =?us-ascii?Q?VsgKZMj6IlsKgaaB4bTTTRVqeD/BMfw6+29hDOIAwdTJXzCAl7DcFOxnN3x+?=
 =?us-ascii?Q?kRCq8+dvfGAWl7eq58cUAypd7oGqlJjY6+YJdTZOIDsHTurXNbA4GeBl4Obx?=
 =?us-ascii?Q?y7mmJ89K+a/hawlqo5VahmLwUEcI8Kyk6cve/SUk4gL7wNZnDkATbryMrYy7?=
 =?us-ascii?Q?jA0u5hwBymM39BLswOLyzKSRGwxEGX8xe9zFcRWkVPz1SDjoDoNy0PIRkU4C?=
 =?us-ascii?Q?U0LwMNt9G4vHfeDRsE3Pxlnd6mW9mh6DXzVeLorZrdWZlMi3Q/QrvgOOQytF?=
 =?us-ascii?Q?PN/jOVJ6l8AEG8jzKwrDiZlQ+n0iA7Dr9V5XzwioA9Gi2oGYL6vGdV9AC+ij?=
 =?us-ascii?Q?+4XIxWCZsyTtI3bBZEvcbtXVfqgVrPFrJxJiZqA1kn8ASBsJ8zSEbFR68qco?=
 =?us-ascii?Q?VMVmfyZVlz56axFQPSX0AbJHQ5gBjh/7aoHikISpAgs9fKmo4ke0Rd2DDJJA?=
 =?us-ascii?Q?/987vSjEmyRqib2qnZkBkRD03avF4q7DgQhqdkW+Cgz6U3BZzO9Cia27o7tC?=
 =?us-ascii?Q?ExtaU+diLnSvVFEOHmxuiJxCuINS8bgpf1uDG9UoXw0HOcCuqERCM7yB4JBd?=
 =?us-ascii?Q?Pv/judSxnR4LgzFNKhNocGi6xXtRaFZ3bBE+yHcDproyM8xovO/AeXhL5xEG?=
 =?us-ascii?Q?PAb6DwBEX3jJvGG1MyDvOVD4/fGARGcW/ff/GGLLAoqgUN7YPkB2g6To52yI?=
 =?us-ascii?Q?kUaLiOl2R6hp+VTOw5NMt91TAU7kbl81zoNSWlgoFsIFnw+tQAbbP1jX9/4M?=
 =?us-ascii?Q?2Z+4GMixlSuvpvRy2r/gXFTAPQcxm/U0CvBepWY4bShJBfVy+WqxwF3RJpaO?=
 =?us-ascii?Q?z97J5c6DMucyJCCuqc67+DT57gtoQpWBZhR2lyauMz1aJnRHXYfplRoFGSoB?=
 =?us-ascii?Q?rtIsQrR3UE2GQmoNNHmalYn8FZrrkcsXGNjb50K3aKfL29x2BIEfVVHQrXeg?=
 =?us-ascii?Q?+TAQ6VgAe8nAwZyhLlsiTyiWbeSZQaat1/lMDUkQJmXxyI7LT0vDk8/pyqb5?=
 =?us-ascii?Q?zT7nPhn3NqFQ2cVYXOAikWe8Kjc242M6+GfdTHfp6IXdf1wDEOulX6ZanmmC?=
 =?us-ascii?Q?uteP4P+/u5lfxP/nNrh6jjjT/RhyX53nai8tzMiEELIYU6F0vvTYoqXWcyj7?=
 =?us-ascii?Q?eZxsPeeLm4eWFFxjWYKoDMmHO/SEJo7xYtzNh//KkIagdAMi43unNu0ovsJR?=
 =?us-ascii?Q?vKTcgNz3krHab9p5+5VLpWWtYeAzfRdzUN1OBcBR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ae1c44-a453-4290-c742-08dbd0aa6c1e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 13:50:58.2649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9R+0EAEY9amsy5SjrNjRqQ5MRsGp+1EjIlpeMzKztxmpkiz2XW8kulmQxHAA5CBgZZBFKLdt3sHsY2NaZGziwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8682
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe: A minimal assert for some forcewake
 domain on xe_mmio.
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
Cc: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Oct 19, 2023 at 11:43:10AM +0300, Luca Coelho wrote:
> On Tue, 2023-10-17 at 11:12 -0400, Rodrigo Vivi wrote:
> > On Mon, Oct 16, 2023 at 05:58:41PM -0700, Matt Roper wrote:
> > > On Mon, Oct 16, 2023 at 06:10:14PM -0400, Rodrigo Vivi wrote:
> > > > On Tue, Oct 17, 2023 at 12:33:39AM +0300, Luca Coelho wrote:
> > > > 
> > > > > But maybe I misunderstood the proposal.  And, if this is not the plan,
> > > > > then the only way to do it is to add the "wakelock" logic to the
> > > > > display orthogonally to the general MMIO access operations, which I
> > > > > wanted to avoid.
> > > > 
> > > > well, let's have it inside intel_de_ and we have only one implementation.
> > > > no port needed. Regardless of the future of the xe_mmio or the future
> > > > of xe_forcewake.
> > > 
> > > Implementing it solely at the intel_de layer sounds reasonable to me as
> > > well.
> > 
> > yeap, they appear to be orthogonal discussions. Even going with the
> > intrinsic forcewake inside xe_mmio, I still believe that the right place
> > for this wakelock is inside intel_de anyway.
> 
> Thanks for all the comments and helping me understand this a bit
> better.  The way I saw it was that Xe would be where underlying HW
> access is implemented, so to me it would make sense to have this HW
> access restriction (regardless of being used only by the display)
> there.  I don't think it's a "display thing", but a HW limitation that
> affects only the display.

I believe the best way to see this is the display driver driving the
display IP block, regardless of which driver it is 'paired' with.

So, it drives the hardware...  at least the display block of the hardware.

Then, the side driver provides a path to the basic hw *access* and
basic *resouces*, only because we are in the same pci card and share
some of the resources.

> 
> In any case, doing it entirely in intel_de is probably the easiest
> thing to do, so let's go with that.
> 
> --
> Cheers,
> Luca.
