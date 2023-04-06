Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A65EC7619A
	for <intel-xe@archiver.kernel.org>; Thu,  6 Apr 2023 01:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECD510E0DB;
	Thu,  6 Apr 2023 01:21:06 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236BF10E0DB
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Apr 2023 01:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680744063; x=1712280063;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MZ3o/xHtNkaP9IhC7ZXN0LRgEh3xYwrAdkB+Iso8H2w=;
 b=oHuPmW3PKc7E5lSqeQz5Izjy+7/7XP2uC4XXCE3LR533DxDFBZ3+lNmP
 8FU4pRWpLqUNuPrb3ClUdQh5vjuWk5s6hPoqDRk+N4osvtsHmvDPAMJ+Z
 m267eBigg9qA54VYb4/zFbahHr8Tjp/kTlgWMEQ9WGesqNhOEVi/vKYlF
 CPYg2RiDBRntfZz8ozmZEbCiTixinFrSdnmrrwzxiiFxF+EpwR80I5cb8
 3b/0fvkxQGBB9UX+FGG4DRoh6q4gQYUkQskQqcp6KHSOzmtMeKWeOIthM
 9i5ugcV6yDnNaMvjMQTxg9ow26M4aDxCLyha+RNrpMiMiRHpg3u93SIeK Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="345201879"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="345201879"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 18:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="810813117"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="810813117"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 05 Apr 2023 18:21:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 18:21:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 18:21:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 18:21:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 18:21:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHkqROoLUpZI6OVj8OYObSlOO8nNMi42bbuYmqQ6oEGmjKdYnY9it0Q4mB77HtImI7Vv+DBYsDusJG3+hJvkJInyRBnN367othUHKNZ/Pbx+D/SJO8roaaqVbTz2S3O6/9vUHTrDM89TEhcqREtTMgAB4B31Wbxi1bhQY6s1XzRk9Qu6okb3Ja5OE8/BigbPdBBtMUlwg9hGJ+d5OJ76SkTq5mD12KTw4dkAsz+78wD7hYMHGAn2dvdsT4wG61IN7s2wuauyGiYiOsdo6+OrphmuzRyIVZ49fzbgutdmpzd55Vf3InKwOInFzvJdfvsf5ZBpZ+HJCNuh9U0x7M+t2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MiulFbahgu5QDp1NtbJnVEZk58B59NnEGTr6Rk2lIIA=;
 b=jn6eO5KBNISX9UVOZECUv6hk5AkrD78kqJx6eFzE7tov62vZMK1U6kNqrLO9a0C1rl9Rut54Yf7tceO0CPcleIbeNvPxeAeDTqpTznAfiFnTyeMIzNh80+l0Lhsui3gcC7z29/TMV3sruCFcIlfm2Ybu/YMCzV/t+s2SymItomb8BCagQLLRAmvo1nL/ZcyPlCA8CR+WyBOriXkxpjkP2K2auyZCA6tKKQpxWAKw+51gRLjqDIy/dXzmBeljTyqbseOk2jPxOYjCMGXghPb5H76m+TT9slOGyoz63GwicgEEzBYz/Dvj+JSWR1amUmPl2LIVj21OuKOCG/v3w8yW9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6885.namprd11.prod.outlook.com (2603:10b6:303:21b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 01:20:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%9]) with mapi id 15.20.6254.033; Thu, 6 Apr 2023
 01:20:53 +0000
Date: Thu, 6 Apr 2023 01:20:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZC4ecOuyYMa+UAmF@DUT025-TGLU.fm.intel.com>
References: <20230404014228.3738347-1-matthew.brost@intel.com>
 <fc2de32e-9774-e5b0-3b43-e0e3eab74241@linux.intel.com>
 <ZCw6lTSIFd9FAaoC@DUT025-TGLU.fm.intel.com>
 <5ef57cd7-0c59-20b0-ba58-ad415c31963b@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5ef57cd7-0c59-20b0-ba58-ad415c31963b@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 64cd0493-7b02-4ce5-ee41-08db363d2a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zg+Ghq9VfxAuEZ5m3QQWKfopu5rHT87v44mo9af6GeHrythPep3T+YsQHFFXxa/BFJ4ktj2Ld63lzee3qAYPQeqzs51CFl6PXJU55ZSzIpd06WBU0KlurEf4uhmJP6C9V/MMjA8Y65rO/QjnNWtEUGJSYUcM1qFCfdIJ7oJGAE5SMclErCVaFfvR52ckJCB+M3MT9RZug+jNcjgt5wDX667gl+z/dBymumTr6jTCbiC5PXNz7+f9JI5yryDCLdB6dZVirtm3zc5Ya7WMT6GjXZyLhrdZ5ufRQstqWjSIHe3g/lkYuY1WyCKv2R0o2l3qCTzyH61fpPhMNqcc9ic86fsbvt/6/je1Vu4BRCh1vTOAtf3Kvn5JfYjPx9TtP8yTjk19ewapKeseDMGT0DoQrZaSPOVBVSr4+uZtriyEaISet/Se8Gm3JqZOD3e1hPwC3MQr4b4LtK3+b9fe/+eJSa6guwIs0rTk6+PGGuNgFwiuR9md17gBJ22aPd5uKxYgcZRVc54E2SoE/IWeeEkdBhZvdIcKm933uqUJIMButceLjNEwT+hFhqqiZFAFawSG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199021)(966005)(38100700002)(6916009)(6486002)(66476007)(53546011)(6512007)(6506007)(82960400001)(26005)(186003)(8936002)(44832011)(66574015)(2906002)(5660300002)(478600001)(8676002)(66946007)(41300700001)(4326008)(66556008)(86362001)(316002)(6666004)(83380400001)(66899021)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4QePHX5+fS4yWZJdKihn4vy6pnKntSGsvX8Sds5rm6wcqzQkHWNV+rWCsS?=
 =?iso-8859-1?Q?wNSeraQBaLY5LU6eLfakvxiN8C3OshGsI51iI4INIoaP2Uq/yaAyCX5aHo?=
 =?iso-8859-1?Q?L4gmrMM0ci9iObGWJwAIOgbwamov/wuUsImgEHVUEajwXfngGBm3218vtW?=
 =?iso-8859-1?Q?3umke8/KioiIM7BZTD/LGwVEdMI808UghS14w5H3uH+cRH7McvlUuwfd90?=
 =?iso-8859-1?Q?xEQBwtbbx5/wAQeTsnRfrFOCQqXMNOMt5urVWbchllnNoVtJzFG9wnzExZ?=
 =?iso-8859-1?Q?jgT9CtbKCadnkm2ujNWXdeg5U1+5SMwP/36C26SwHyqihbl08+0qplc+y3?=
 =?iso-8859-1?Q?ptYCOIcL/djDXiqwFbapMFzkfzuOa4vHiOv3o/tuNvcD7662/NSCqkH401?=
 =?iso-8859-1?Q?BN6fVvthXxjvfQsFsXHsvZBkTS1O231rPnOxj+/Iaw/6jmMVfUg7o0OI+S?=
 =?iso-8859-1?Q?GGFVnMHXA5L64TCcLW0t+wB3RiXECAtS3JIOifq02M+3VL82l0PPPF3/0U?=
 =?iso-8859-1?Q?jzA55+k7O+CA6HVZmnd/YOi78876TH/DwLjrK7li8PMqQpzWLlLo48Yid1?=
 =?iso-8859-1?Q?OnI//CI2C3hIyvrZnIDB74Yeq4cTKNIvB6bLJD+lKes7121+viRsJ1BM0/?=
 =?iso-8859-1?Q?QHouFbgp2zzA91VPRuYiBbVlHri59RByXCOk2QK050lc7WbeMqFpULKVc9?=
 =?iso-8859-1?Q?Yg1rIwSCnPS5wbkAHOC6vpequK7y17HhbJaSG1wE8Gfm2uc0+j3jdWtXHz?=
 =?iso-8859-1?Q?OoOzJ5QC+9I5HlZdP2dIKgciL+aMA7nbSKDiFDVdoq4cUa5FWCQcQ0J2M3?=
 =?iso-8859-1?Q?lel+Py3dPCDFk5G8ddSSLie9V7dmkiOGIZH8P0ac3o+nsRZrjrJTY5MIJh?=
 =?iso-8859-1?Q?BFjQwG/VKUXCMthYK5QD449weE7taa/5poNRygXnAgDBus2fQpKq9xPVc8?=
 =?iso-8859-1?Q?/3UJFqTFi2sL0WLjkHSRGQr6hyw6PDCakaznrTtKLmsY7nxan/cqfZa6xX?=
 =?iso-8859-1?Q?r3SIGMnsHyeOvhWhWaMtDzJyrKZ2lYwV0ffILHO7Hg51W0cZoRE5N418eJ?=
 =?iso-8859-1?Q?6kOjGCA54T6VsSwv6S0PAx1E1r/Goj/+nG5M0EihEU16UzBE8zcM51h1ia?=
 =?iso-8859-1?Q?dDFAkrOS7cODpQxu0CTLB0U5FKlC3gXcYYO2EBL9BzBT29S/qzt75rEq/s?=
 =?iso-8859-1?Q?sanNXPqQsb6bqObeT/rA8XPA4QktwBMgjhAyTr0f95G8TBym7fk2VQOfzM?=
 =?iso-8859-1?Q?ZLwo4mKQ3jO4upS98siEvjpEd+hg5sWOjefD5K0BfBvWWKVxUJXxJHuBpK?=
 =?iso-8859-1?Q?Efz9BzvKg53t17nsUpfwGGGVIhehKh1Yd/VEWJ9yev2gf8uvRohwpPqF35?=
 =?iso-8859-1?Q?gnSWAvuL18smCXABaoFDl3pmUGJvOP3SXfHVFjxXKj2QEkASPAY+082mju?=
 =?iso-8859-1?Q?O3vJWFUoeLTJcCcChqcFNoefdQvT51NcWrjGnahh5vNOIkVaqA+HuCoehu?=
 =?iso-8859-1?Q?waO43knzpXvLRo5w0SjzZPcgGuobxfsdcVYhcqTJT8iYNYCpaxrMXnTvNB?=
 =?iso-8859-1?Q?R+1vmaJaCE10jW5KkEdg0/xf+anE8VCc2PJjWAGTTWtGr53b4Ktb3/AovF?=
 =?iso-8859-1?Q?o0xSwXUPpwfGFw2KO3KgQucJFGgCUH4I/Vux8rl+PaT9jcaCbXFoR5sw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64cd0493-7b02-4ce5-ee41-08db363d2a51
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 01:20:53.5778 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gtjN4QrsMk2leXBmN1GRF11urhqhUbLpZedjFUnofLnyRJKzwXEbNQzsP0y7YccBpQA1bkT/ccl9/l46o3hYUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6885
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 0/8] Port Xe to use GPUVA and implement
 NULL VM binds
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

On Wed, Apr 05, 2023 at 05:31:15PM +0200, Thomas Hellström wrote:
> Hi,
> 
> On 4/4/23 16:56, Matthew Brost wrote:
> > On Tue, Apr 04, 2023 at 03:20:47PM +0200, Thomas Hellström wrote:
> > > Hi, Matthew,
> > > 
> > > 
> > > On 4/4/23 03:42, Matthew Brost wrote:
> > > > GPUVA is common code written primarily by Danilo with the idea being a
> > > > common place to track GPUVAs (VMAs in Xe) within an address space (VMs
> > > > in Xe), track all the GPUVAs attached to GEMs, and a common way
> > > > implement VM binds / unbinds with MMAP / MUNMAP semantics via creating
> > > > operation lists. All of this adds up to a common way to implement VK
> > > > sparse bindings.
> > > > 
> > > > This series pulls in the GPUVA code written by Danilo plus some small
> > > > fixes by myself into 1 large patch. Once the GPUVA makes it upstream, we
> > > > can rebase and drop this patch. I believe what lands upstream should be
> > > > nearly identical to this patch at least from an API perspective.
> > > > 
> > > > The last three patches port Xe to GPUVA and add support for NULL VM binds
> > > > (writes dropped, read zero, VK sparse support). An example of the
> > > > semantics of this is below.
> > > Going through thew new code in xe_vm.c I'm still concerned about our error
> > > handling. In the cases we attempt to handle, for example an -ENOMEM, the
> > > sync ioctl appears to be doing a fragile unwind whereas the async worker
> > > puts the VM in an error state that can only be exited by a RESTART ioctl
> > > (pls correct me if I'm wrong here). We could of course do the same for sync
> > > ioctls, but I'm still wondering what happens if, for example a MAP operation
> > > on a dual-gt VM fails after binding on the first gt?
> > > 
> > So sync mode we don't allow advanced binds (more than 1 map operation)
> > but I failed to take into account dual-gt VMs, yea that might be an
> > issue foe sync binds. This should just for work async though. Maybe we
> > depreciate the sync mode except for unbinds when in an error state.
> 
> I think we need to separate this from sync/async and what's in the current
> code. I've started to dig into the Nouveau code a bit to get things right in
> the async VM_BIND document, but the error handling should really be agnostic
> as to whether we're async or not. We should be able to run RESTART also
> after a failing sync VM_BIND if the decision is to put the VM in a
> recoverable error state rather than to clean everything up after each
> failure.
> 

Not sure I agree with this but we can hash this out later.

> > 
> > > I think we need to clearly define the desired behaviour in the uAPI and then
> > > make sure we do the necessary changes with that in mind, and Even if I
> > > prefer the !async_worker solution this can be don orthogonally to that
> > > discussion. Ideally I'd see we find a way to *not* put the VM  in an error
> > > state like this, and I figure there are various ways to aid in this, for
> > > example keeping a progress cookie in the user-space data or deferring any
> > > failed bind operations to the next rebind worker or exec, but in the end I
> > > think this boils down to allocating all needed resources up-front for
> > > operations or groups of operations that are not allowed to fail once we
> > > start to modify the page-tables.
> > > 
> > Agree on clearly defined uAPI behavior, I'm not sure if I have answer
> > for the error handling. Personally I like the stop / restart mechanism
> > as it essentially mean binds never can fail with a well behavied user.
> > wrt to Allocating up front, I think that is what Nouveau is doing? We
> > could study that code but allocating everything up front will be a
> > pretty large change.
> > 
> > Obviously we need to do some work here and this is one of our biggest
> > opens left but I don't view this as a true blocker until we remove force
> > probe. GPUVA regardless is a step in the right direction which will make
> > any changes going forward easier + enable VK to get sparse implemented.
> > I'd say let's get GPUVA merged and next focus on these issues you have
> > raised.
> 
> I think we need a pretty major rewrite here, and I think moving over to
> GPUVA would be cleaner with that done and possibilities of a clean error
> recovery in place. I stumbled on these WARN_ON(err) when starting to review,
> when it's IMO perfectly possible for that err to be non-zero, and since
> we're not in POC mode anymore I'm reluctant to Ack something that we know
> might blow up.
>

Everything will be easier if we move to GPUVA first and agree this needs
to be stable, from testing it is. Also GPUVA gets us everything we need
for sparse to which is a plus. Also I want to move some userptr stuff to
GPUVA, move extobj to GPUVA, some locking to GPUVA /w drm exec, and
perhaps preempt fence handling to DRM sched + GPUVA. I'd strongly
advocate for merging ASAP and stage the aforementioned + error handling
fixes behind this merge.

Can you point of the WARN? Is it not hanlding the error from
drm_gpuva_insert? Yea, I'll fix that.

> What I can do, though is to dig more into, Nouveau to see how they handle
> the error unwind, and start implementing a clean unwind also in our driver
> and rebase the GPUVA stuff on top.
>

Lets both dig in.

Matt
 
> /Thomas
> 
> 
> > 
> > Also another VM bind issue we need address soon:
> > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/41
> > 
> > Matt
> > 
> > > Thoughts?
> > > 
> > > /Thomas
> > > 
> > > 
> > > 
> > > 
> > > > MAP 0x0000-0x8000 to NULL 	- 0x0000-0x8000 writes dropped + read zero
> > > > MAP 0x4000-0x5000 to a GEM 	- 0x0000-0x4000, 0x5000-0x8000 writes dropped + read zero; 0x4000-0x5000 mapped to a GEM
> > > > UNMAP 0x3000-0x6000		- 0x0000-0x3000, 0x6000-0x8000 writes dropped + read zero
> > > > UNMAP 0x0000-0x8000		- Nothing mapped
> > > > 
> > > > No changins to existing behavior, rather just new functionality./
> > > > 
> > > > v2: Fix CI build failure
> > > > v3: Export mas_preallocate, add patch to avoid rebinds
> > > > v5: Bug fixes, rebase, xe_vma size optimizations
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > 
> > > > Danilo Krummrich (2):
> > > >     maple_tree: split up MA_STATE() macro
> > > >     drm: manager to keep track of GPUs VA mappings
> > > > 
> > > > Matthew Brost (6):
> > > >     maple_tree: Export mas_preallocate
> > > >     drm/xe: Port Xe to GPUVA
> > > >     drm/xe: NULL binding implementation
> > > >     drm/xe: Avoid doing rebinds
> > > >     drm/xe: Reduce the number list links in xe_vma
> > > >     drm/xe: Optimize size of xe_vma allocation
> > > > 
> > > >    Documentation/gpu/drm-mm.rst                |   31 +
> > > >    drivers/gpu/drm/Makefile                    |    1 +
> > > >    drivers/gpu/drm/drm_debugfs.c               |   56 +
> > > >    drivers/gpu/drm/drm_gem.c                   |    3 +
> > > >    drivers/gpu/drm/drm_gpuva_mgr.c             | 1890 ++++++++++++++++++
> > > >    drivers/gpu/drm/xe/xe_bo.c                  |   10 +-
> > > >    drivers/gpu/drm/xe/xe_bo.h                  |    1 +
> > > >    drivers/gpu/drm/xe/xe_device.c              |    2 +-
> > > >    drivers/gpu/drm/xe/xe_exec.c                |    4 +-
> > > >    drivers/gpu/drm/xe/xe_gt_pagefault.c        |   29 +-
> > > >    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   14 +-
> > > >    drivers/gpu/drm/xe/xe_guc_ct.c              |    6 +-
> > > >    drivers/gpu/drm/xe/xe_migrate.c             |    8 +-
> > > >    drivers/gpu/drm/xe/xe_pt.c                  |  176 +-
> > > >    drivers/gpu/drm/xe/xe_trace.h               |   10 +-
> > > >    drivers/gpu/drm/xe/xe_vm.c                  | 1947 +++++++++----------
> > > >    drivers/gpu/drm/xe/xe_vm.h                  |   76 +-
> > > >    drivers/gpu/drm/xe/xe_vm_madvise.c          |   87 +-
> > > >    drivers/gpu/drm/xe/xe_vm_types.h            |  276 ++-
> > > >    include/drm/drm_debugfs.h                   |   24 +
> > > >    include/drm/drm_drv.h                       |    7 +
> > > >    include/drm/drm_gem.h                       |   75 +
> > > >    include/drm/drm_gpuva_mgr.h                 |  734 +++++++
> > > >    include/linux/maple_tree.h                  |    7 +-
> > > >    include/uapi/drm/xe_drm.h                   |    8 +
> > > >    lib/maple_tree.c                            |    1 +
> > > >    26 files changed, 4203 insertions(+), 1280 deletions(-)
> > > >    create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
> > > >    create mode 100644 include/drm/drm_gpuva_mgr.h
> > > > 
