Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14304EB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 17:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995E010E308;
	Tue,  4 Jul 2023 17:54:37 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2378610E308
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 17:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688493276; x=1720029276;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=209lrMfs5+uz3gMhQBmG7Rcyf26fagvpUEH0bRjuSI8=;
 b=TxUldXZz/2OSs9J2fl+qbil10aVkaMsSsQFpCCqdCtKbkJUdCadjOqW5
 wq705UjfAX/kjT5ki1qz12ADTBgTekY+Q3KXnS/6gT4SL6PFrihYtwaAg
 uJRtapQh22O7ebSFtuaVCU9yVRamwavKkm4SSA70bg2ssfQqHbBisymJL
 +ntMzvG6tPOnBtUkHJ/MeDpiJDuX5fW3iADPhGW9N0BHvKf8Sa/bNbLTv
 Ei8L4eg2/jQwj8GMTPoKY3gb4OEfcWc30tQAuHq2z/eEAKG8ql3cv/sXp
 RFkHcYQfVv03HEwe+zILVrfI6j6wgbllWy/91Gqtzb7lVDsW54s47gugH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="429208524"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="429208524"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 10:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="1049455452"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; d="scan'208";a="1049455452"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 04 Jul 2023 10:54:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 4 Jul 2023 10:54:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 4 Jul 2023 10:54:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 4 Jul 2023 10:54:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7sfKFz0xxgf+ejP9mMVMRduC0uo0Yn+IUjaTYyunDhF+8SA7rQNfmwllCYnQbmpMx8FiR/OQJ6ibXHOsqk0JrDYX9fUlBhYIYXTKxeWA1o4pbkrQtAJv+yOyULFqkRIBSzbLE3J4huu60fadXG+ZV4glQdEsBqZCRek2tYji9pk03J+GBawUZzis8hQHsD+2Doe8JliSiHl5rIwZianQWl5ZMUrbtZDgVsfTDep3ovRk926nQ4xYoArQRHcImbxHTttPHY6uxY6pfr3pvEnka6I4hXvAT13KbmcF8xkMhrWUS1aYhZ0Xv9HkCDrja/PuB3Zo5qrH1qe38fVYSitww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kR3VfTvqZEVpQ5wwd52lY3l3EhkfowW/1iahAIRPCkI=;
 b=gJ+bFwQztZBVR9S74SnqXRqG7kv50MBxeDGqzu4narIC+87U6PI0XYniE/vmfdYhlLAvhRz3ivFmZZ+PscsvZEuNnYTC470ix6Je3N+6byCDE8x18sLUqDNhp0M78eAW0ObQcWwn/rQQMtGz5bEaemxT6OEJZ8x0pGwAf0VYs+H+eemFvWgaCaFJfNWwM1lEWPWg8oTsW15QYOtR1x1XMIsGeJ0ronyxo18k5u3zqk8G1XEIvloFkWzQziLxSLZyAowcqw1FcuPdi30AnHvsQP1vZqxM1fS6Kfx0kZ7l/LcOCBvlZ44z6JUSYAk584/MM6MzRVEr/q7fF0RbUQyLRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5365.namprd11.prod.outlook.com (2603:10b6:208:308::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 17:54:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::bc0:ef1e:892a:e49f]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::bc0:ef1e:892a:e49f%5]) with mapi id 15.20.6565.016; Tue, 4 Jul 2023
 17:54:30 +0000
Date: Tue, 4 Jul 2023 14:54:25 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <jekzhxw2wolzv522fduami2kk6qr5fvakjcwsjeqybavcbhw3e@wv4hvefwebq6>
X-Patchwork-Hint: comment
References: <20230704153243.2489821-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230704153243.2489821-1-jani.nikula@intel.com>
X-ClientProxiedBy: BY5PR16CA0029.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::42) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5365:EE_
X-MS-Office365-Filtering-Correlation-Id: 80eab4e3-1239-4402-746c-08db7cb7b742
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7fVJi5NjpTPOQnZBnRezlqj9VQa7VVTJZnxyMeut/dwQr2+/ZZzfDm4kviJUrmQUEtR2ZfWCVzRCQmWg10WJefI4r6ff8CYVd4xdX1CvA5W2ZiwC+zk26ZzV25kncFCmSPtzJyUvP50Id+dBMbATo9J4c8oNJmutIEcNp7vs5uOAe7NDx87kjDEt/lHyClrBtG7I9xPN8+he2BA3fMXFxkI0s+L8Y4GezuQUeZT2nSw21da5kNanCQNCIdNrz1IxzMMT7Cd/DJaGJ0gUWNvCd2TlmHnYYZ1zxNXHDC3rGciKVyTA9n+Kdev/UAqko9mNOwLBwkRwB0/27R9iJSlYZbsem9kksZ0CZnKTtBIeAyABkAEuZQdx0Ixre8YVaHgplXJ4eEgRRMCUpnawjnJ0N9Jy8//eQGsmEdG+PjnMeAGoG9ItEWiY1293njfgWJ23xyJD6jNf/UbXWFhH1Ib6BAoZxBqBFSZea+9pkmnhwIykBWQh/RHEu/XPc841jgaAPyVc5i/4Iob7NxXHzTeXX1nHs1xWYDwKx/3HQihLjMNX83cAgOZbT6wmv+IkHP0D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199021)(26005)(478600001)(82960400001)(6666004)(9686003)(6506007)(6512007)(86362001)(186003)(38100700002)(6636002)(66556008)(66946007)(4326008)(66476007)(83380400001)(6486002)(316002)(6862004)(5660300002)(8676002)(8936002)(4744005)(41300700001)(2906002)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ikOU1ABrx76u9iQRC6cQoMthYWYOkMon6weofJDg1eJElTI/4DbyszsIxjbm?=
 =?us-ascii?Q?RDB8XWfiPeg9Uv8SG71NwYGFVy0haDztlZIJUdAIjTqpPO1/d3b+LoQL+a7c?=
 =?us-ascii?Q?vWrWRY9jGn5zffJv51cpCoKcTiFFu/muCkVxZYi0g72opkAZPuyeJcRUo8oc?=
 =?us-ascii?Q?hgLs0Rwg6tMIIXP0iYb40JhkknxcJ9GEfi9ULqtA/lBAhh9hlLzuG16inv2A?=
 =?us-ascii?Q?hHP5/TucjPUVt8IN3ba9Ef1suj5ZJTwqGbQkLSbLNAMUmoDjrBHOT2uvMNhs?=
 =?us-ascii?Q?tbER4OzgiUGF+l+/3ubbbpMPxxhQ4K/4c9XAKZIYXSzeccv9sUijbT7sV4/p?=
 =?us-ascii?Q?n9s4xq5tQv7Ndpae78kCaLrcUzo3kMw3p3VGuOCOeVoqRjHnSFXKRhM0GKhu?=
 =?us-ascii?Q?T/G3eaVlQAJrXjGFrP7IBWdoKkWNbAqGTlBdY87Rx1Z0Elqxx6VYlyDxSYiy?=
 =?us-ascii?Q?dFZCruY702pVpfximCTuxzvBhbaLrZHSgBsN0wHJPb8zt7TJABrUKm3U42QV?=
 =?us-ascii?Q?qIj36dlLrPt2O643MWDT3z7983J80aKhZYozHmvCs4WMcMjP4ilkazEQX9ih?=
 =?us-ascii?Q?pK0O9LrMbPL2d18jcc5KNLcBmHwKBYZPIc+toqu+swNJQdlH60+SDLDsnoCQ?=
 =?us-ascii?Q?9AWGd0rq4tmuZN8fHE59EK3Z+KC+QyvUADeT4d2nizXPi+WAwwN/bveSfb1m?=
 =?us-ascii?Q?lYlZ5c7KduJ5uERH6d5Hyb8DcE9wjWG25iQrAlWA6Lrd2iWjIkMAU4iPZNKC?=
 =?us-ascii?Q?7Wl8vqMwcJSFZPOvgFm5mLKU2RjRomXiR9Ua0IP5elHurw8iLf0aXjrbJmZG?=
 =?us-ascii?Q?VmlEot3ZVzPTMzsjuGaNICyNDzd+b3U4pNzxktXc7ttG97gqNoE16FshsIe6?=
 =?us-ascii?Q?nTOkfUsZnUOtNuwRV3ubxnwn62J7hUlDYWsUUiDV72IFJzUnkhnrKfr4AsiU?=
 =?us-ascii?Q?fhxHR+JSnOT6eLrVp9160jQ5PtNNYCuxY0H1Uj9ap77Ap92oImtei/rq+mf+?=
 =?us-ascii?Q?QgbSpSIky4vHmJ04CyMylaWl6W68LDcBJ9apOBl/6cre8xNa/y3kTvSNF2q0?=
 =?us-ascii?Q?Y2STQxDIB9h4n1i4lUeqU/Zp+lu5WQphkfm3k9hfelI0voIo6wI6ZgRAE2qp?=
 =?us-ascii?Q?nQxQcLde4mSmSGm1uYEqsDjl0iHEGVDlHMwH71T0JXmDL4+x7e9lk5oCceFu?=
 =?us-ascii?Q?IzIQR/wQrS6vRrWElR980LuoMtt5tTV7JRjvcbJbiWBD4Pu7uCciphWqczsO?=
 =?us-ascii?Q?Vf0BWl00R+ltNsZwJpNwNM/RVuVpThU/T7acecox6mVZmGoxDVR2SyhdGl0K?=
 =?us-ascii?Q?/VBBJbFu9viiXBczG3PoepyDEdAThnPAQ388vag7e8oBzK08vwgC3aSP156t?=
 =?us-ascii?Q?Rb1Ur0HxFdxi9gAakwY6uO5dDoklm3iVvmtwoIu6r5xByhl3anTKiabqPGto?=
 =?us-ascii?Q?p+eFHfQlHUQLmUccUiGYt/g8jCxqRGPlzeW6ALQkQm8KSG3haxWbQdgIMl7J?=
 =?us-ascii?Q?ehQuH/0/BM/HD3ssPeCDv3AP//2GcFveEkBU0y3fj/HemMTbQIpCoAmthBB9?=
 =?us-ascii?Q?J7W4pOT6ART37XgqvVYKWaoSv9097yT39nQ5gVd++Z8SVGKMlmGOfViJDkZ0?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80eab4e3-1239-4402-746c-08db7cb7b742
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 17:54:30.4597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0Z/NpI4O7qGFg82lb0h0Q6ql+M1I7/mTQi/JXv8Gj7yk2W0gYikFOk1qs9RFepiM4HW4bkruXJxfZg7aRqttGsqZD5r1ZXo0RN7zVX8Rr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5365
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/4] drm/xe/display: reuse soc/ code from i915
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

On Tue, Jul 04, 2023 at 06:32:39PM +0300, Jani Nikula wrote:
>Remove a bunch of duplication from xe by reusing the soc code from i915.

Great.  I had sent earlier today this:

	Subject: [Intel-xe] [PATCH 0/1] Synchronize ext/intel_dram.c with the i915 source
	Message-Id: <20230704160907.2173428-1-lucas.demarchi@intel.com>

so we would get the MTL part in sync, but also added a note about "we
should rather de-duplicate this). Nice that it was just a race condition
with your patches.

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

in the series

thanks,
Lucas De Marchi
