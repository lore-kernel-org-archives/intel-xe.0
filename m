Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3CAD2629E
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 20:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4906910E097;
	Tue, 20 Jan 2026 20:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWzPJXeQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EF410E097
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 20:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768941465; x=1800477465;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZDjIOmGObdy9db+AvprXTRaaaat8hcb1zSkoOr0lO2k=;
 b=XWzPJXeQckxgwwbsVqO555OURfC6juv7fnwt2hvRDZiBF2v1w79DaUra
 93oTnP3TraKV562TNquwiiMhBQH2PCYMT87kvDOfreup7b7VE9PD2LFE7
 ZMHfkduOzoX2tlclAxLueMqJw0r6LGw65VZU619lf1RoQBN6qklrax57b
 JZa8yuAgj3sjsgD9URmvmztmXoIF/DF//qHe7lH+aWgDi4NWHo0KHIHpE
 Nfdr2oocJMaveTYf+mCQWFGnPgfEtAWpxCqNYYyEwyq9h3L3zLzljL4b7
 NBWzvTZnQEp47QrHgfYizAQ77McPD18YTFywonpO7p+m95NL18daIaUyO w==;
X-CSE-ConnectionGUID: CwnZafMsT/evnNWhbjBZ5g==
X-CSE-MsgGUID: B9ssYxafSSuqTmcJLbNodQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69360933"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="69360933"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:37:45 -0800
X-CSE-ConnectionGUID: FvTBHdK7RfijC1U9B9ycAA==
X-CSE-MsgGUID: FKxR5UAwTCic2mLxeSl/Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="237476080"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 12:37:45 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 12:37:45 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 12:37:45 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 12:37:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jox3zns2tC/1+RNv1RuYqKZAXcPH5pNEJfh7Hk8u0xCbJFB34NljWPtO6rzuTikajRhCjrrTZRZyfCwM2ha4JnNuwDRH8mLHGU+2dh9yfu2WyykZcIwQSsTeBKIULjAwOxEDsvmS+f73xVgEw7RHiRBMyCZy6dKiY5eNgfNOvh7uujyW3z1mOxBvxvmSi+fq5pM+QUhCSF9aaedmFPvUTnKqm4BJSUKX2vBJDqlM4DENZs/fcJ6/yK8RzLoaRKgmiUVwLZFbbFGN3eCzwlrsfIA91+bV5xQD2fXngl0F8msjpkw7ARrGIkKGZgPLyEgcRW4wJhwztVGYpSvMGa5j3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fQosaE1jhZbWVTzY/61AoFtQHPg2xHVZPd1xJyVdzw=;
 b=j8jcr0LzvOU+YnJRZ8P84aJ4KFuIw37hVhFFNNstglUqxnAbYKI0YJ/8e4kA1tq4Uy28IBWbb3U7ZMu5GtDP1WKzkNBiHUX/9kw443I/kSZl4yWJTlYfe46fuDALXEzIBc9PY7RhS1NyUslZ0DzEITpcUuEUPPAmuj7XR4RHs62E+IDhBNP4ttGAWhUihSc45rAAfTQU+G9xNK1aKWcqJqqffT0/INS9spSmXCbxLU/vugf+NjyHPrkVfQkXyVbsIHWwgytbdRtvERWiCDjZXBWlYfMu0gB8mgmP78gYHKFv0lKHtgCGhy9lvp/PkNBLW2smadaffb7IfTCy5H5iDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV2PR11MB5998.namprd11.prod.outlook.com (2603:10b6:408:17e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 20:37:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 20:37:42 +0000
Date: Tue, 20 Jan 2026 12:37:39 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 6/6] drm/xe/guc: Fix page fault by moving
 guc_submit_fini to devm
Message-ID: <aW/nk/slTdY/JHwD@lstrano-desk.jf.intel.com>
References: <20260120201621.2442803-1-zhanjun.dong@intel.com>
 <20260120201621.2442803-7-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260120201621.2442803-7-zhanjun.dong@intel.com>
X-ClientProxiedBy: MW3PR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:303:2a::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV2PR11MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: c588f516-72b1-416c-b91c-08de5863c267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1RjsW8J8RGn/ltOcBhuYcXdUGh+B4ODJRxAImCK9xTk3FmyJCPoXPbr4BXEs?=
 =?us-ascii?Q?BYAVj/nHHweG+fIYG/WI9foB5o9QttM26zri3dbn8GCQTG41vFeeyEU+qr1o?=
 =?us-ascii?Q?tnz7QILurchOXy3SdNyGBbW2VCuocDsyf94wHxRylYEPg2uIIJco0thL4Txw?=
 =?us-ascii?Q?llAdFb/n6diV3bgPp+6ZCDwL14mwLK9ltoElGrBrn6rnSGC7DOzoW7UM7Pjl?=
 =?us-ascii?Q?NhAvR7hmcRdyAHY1paZakhT9/1Bml08h+e+ds26tcKibTcYsu4fEOSUskyxY?=
 =?us-ascii?Q?3YBmkGx26BYmapKxQZADZ6jWS3NELNQQ0qRhdgmjsjdbOnHMteOtEK5BlJuS?=
 =?us-ascii?Q?S/oQsIX8JCV/KZfQrPmByzdGvdRvoeDAL60+KHa9oGVC8r8Ot246YI7/uklV?=
 =?us-ascii?Q?ptNHbJIuNqXa9IeuKkv3tOVt2uhIBEYXVTy+cdSuAL/xPfyzyZd7atgJZf+h?=
 =?us-ascii?Q?UEQ9pIEYfqu3ixDdG0S2JONNaPZs7jG++FScISLvbKsMWRusFmwpGfuKCQqy?=
 =?us-ascii?Q?Wv5+gAPRmyCqchGxrwmXu9voY32+H/SohkSJS9IL2kRMMU1/756lHoEH6azN?=
 =?us-ascii?Q?MFoC+PrCNimU5Sqh9avFua1JVcs5RO+75f2TF4VfDkg65rla0XX0oVNQJRVl?=
 =?us-ascii?Q?ZLQqinYp/aoza1MC9YLjVnthAeGpiYD6uejIyYib073pfvIIUztvmtHTKSIP?=
 =?us-ascii?Q?ELD28Jx2w3iGtN0ViBUXhADlZYdcGyFbjZUkW/Cs/78SXMLltr0CnDYF2BLo?=
 =?us-ascii?Q?WUgsNZJwD33uS6uLBH+GTRVxXA6OgqW4ftnbUiQOfE1nO2O0AF9iz4wkO6lD?=
 =?us-ascii?Q?PA93zYSx7WGgj8z/Aaw6Pb33iD0MXe92G1Z1Qu+6+0awPljGQxgMjC2gzzPS?=
 =?us-ascii?Q?MO6iPDWjzwGa8jf/s5lxqzUvBLVYQB8MZd1bJ4t9K4JOgg2bnEUN5kGa2bmO?=
 =?us-ascii?Q?TmbaU4SGj3sQfJ7n5j6hm0FX56NV+hO2nRxaJc2JEK4fpgvRFNuYiijZkJVv?=
 =?us-ascii?Q?RK+HG64i1hUdmaGqP8pmxn9E4X/0NKsgnocBM9+alSRZLBwZuOAfQYy6Pptm?=
 =?us-ascii?Q?JilEzvux9+pzge4iDrR/6gF9g1Jwu4J/3dNGB88Y6yaj7+0JjnRwE+WJbPOC?=
 =?us-ascii?Q?f7dVC0xcDRAE28Atp3lKXTaek+uW5wmOEUAv2qSAynoh+POQEoE2SuVKTcuh?=
 =?us-ascii?Q?QYtkcBcmspTQr110teoWAKsT8NsjIsCfGdZTDB5w6Jc9aTKu023pVI6VU4Vy?=
 =?us-ascii?Q?Hltex7oq8cjD7tRO8uqHWShofpRr6HH52IAp26xqnJcl+Zh6hk7sOToYuya0?=
 =?us-ascii?Q?4E6IMimlPNiRB5FQsIo1vm0cGf9YPivgFdS1yHGwcBs/k/VUIvytsCOFKGT+?=
 =?us-ascii?Q?tX1s0SBUHS2MWW5Pe++5bUTQrpnwYOkjNHNMt+6hhmJjDDl/UrBs8ZGkb8f+?=
 =?us-ascii?Q?g992NIakC22AEUKqVdjThF/8SfjQSxp70Kum2S61r5REmLt7dVULYD1SFTPJ?=
 =?us-ascii?Q?PQM8HrxqMOVUivAl/y9tlLm/yxdRFEx4ZsWRRtthd5FboYErdQ97nPZe2gcH?=
 =?us-ascii?Q?jQlwx/My39nQAkqt73U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gCDDAzYbUG5Hi4nSWOV1vtCqTpME59jS/sLGGaw9bpieuziBMaINiuyXhuQn?=
 =?us-ascii?Q?z3E7Sv5qXBH8rMU7kvD0YvIn01y0bTKuJ5nPjtPr8G1BVO5cYXOvk64EABj7?=
 =?us-ascii?Q?MSVwyKKyWSbss6BA7xZXqZ6jEmILPt4yMy+mmd1NnxEHMgFJF1I6avIMGCO9?=
 =?us-ascii?Q?KvjMfBVgw+nMSCQA3UFyW++iHp1SOLpOLWAJNI48m+Uywl7v3OW6QiZtiz53?=
 =?us-ascii?Q?R+/0cfEPGptgQznR42sMLE4pQLTSuwlYw915GLx/+S0nuuVCeXcto2aMhjye?=
 =?us-ascii?Q?BfIAEsp8NMKDPfC+DIZLT3+YH5Ot0tcqeOaGfrrRN4JqNYSviFeFdCBLta7K?=
 =?us-ascii?Q?ecijcQwtL++Pops7Str6Cyds5E3YfAT2uBoGj49KVzSKMZMxWeqKJ12U0AXZ?=
 =?us-ascii?Q?Wn7B1BzDt+OXopOkObGNO5eLE4CeUFLXOJB+QN3Xl9aBLMNay8GgJajhbB8R?=
 =?us-ascii?Q?bOuIJF1u0QjuSvehfWJs1fPn83xsp0cI2voZi58cyWjKGd+HUKITOCmPJ46Q?=
 =?us-ascii?Q?dP/kLRKj0F7zHe8VHQU/ZvipqywVf6KeHsv5PbkK9WK5mOk00ww6ynSttz9b?=
 =?us-ascii?Q?dG5Hfji2hqfcVojWepzX8oWZzalh6+rpRJV+Gx81dOdURjP1TwzVAQU3d2vW?=
 =?us-ascii?Q?enluHpF8BmbXeF0zouiLSqIHgiLm+Wfv0LIKskKPM0kWVcSvd0+ma/yFD+gO?=
 =?us-ascii?Q?2NhFDNHpCv3lSAiz8UdUKvRAwHenVLbzppwExDlzk6TvPOkffLzTM/qAP//J?=
 =?us-ascii?Q?lPQPWCBh00Msxoijk2XESOPSTOz+HHsfJS0Sgscn8Ru4Dxc9B5ywCqByk/Xw?=
 =?us-ascii?Q?7CoOSh0H47tZIHRJuMXGTatUBOLkMUOCg6Qo/GNCt3w4oHY9XQLbILlJhXQc?=
 =?us-ascii?Q?SozUUyBJNPKdR2ovdybD4kAR/+oPuLFqz8iOMQLgQs7S6/NfrLyl03bQRxnL?=
 =?us-ascii?Q?14e9MhWJdBH8dqypp+Djgc6kX9QTv4FlJLSuuNtGo0Zy2ycgbUJOt/oMMdAl?=
 =?us-ascii?Q?Wc6ngcTVTyEHHfKMKwgih8z+u/5/V6wTzfhcg10HHkR7gZVlGAL5f49mgVZh?=
 =?us-ascii?Q?Scig7MY7HqPq8eF9nNH2zI5iIuhC7Dr9eSTi/nt07sxMGKvwg/Wu7mjHdjiP?=
 =?us-ascii?Q?B4qbE1BV8f/F9BFQ0T20CfBAb2ZitiAJnLhsJRzzLIp3zzEDJxe49VyrX+h/?=
 =?us-ascii?Q?JIlxJl0SdRFA9x5shWm9WCk6S0t7zG4Uzz/mWtkEYEndk6AW0FAiiQkeOyoQ?=
 =?us-ascii?Q?e/+wPr3pIWgGkH6Q1iVoxgk6iWl0szC0c3JG5Tk+RJhvoEk/ujfH+QulqUo6?=
 =?us-ascii?Q?UavBwNo6FZURb+Xb5ZKLuDZCY/P1cFJUv3XHoGLZkBrfi2NhUwV8bLsrNxxK?=
 =?us-ascii?Q?lh5F9WbwS9wAD3kIYcto3O4TniVDheAap7T8798vTwLq9vShu+TRe8lMVeHu?=
 =?us-ascii?Q?BgYj08SpC+nR9/cV03kVBnYOQKsQHtbX1fMOjJ9PzpkkspitEXU62fw9TcYM?=
 =?us-ascii?Q?06uYSpGfRSOk2mI3lbEaD5+qXLv9aLA5i59iqZVyeIL1GV9CbXPC7Hfq6Pul?=
 =?us-ascii?Q?InuhUO4jea+35Rd05GU86jopRCexm6GNrpxwM859e6IidM2AWTet4wORo5KI?=
 =?us-ascii?Q?NMtJRcEaR7TUHKI0oBytWwMswEnI3noAmidIyoewrnYbDzv/UidDH+d2NHa1?=
 =?us-ascii?Q?66I2uznZR0lo0TVipQZIUf/n5JXtAxQkIFVUIeag4ZTfZdf/h6BDEHouUOcb?=
 =?us-ascii?Q?cnOJVXPFXOmIM/YaflPw+uU16q6sV0E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c588f516-72b1-416c-b91c-08de5863c267
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:37:42.0711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHB0fi3Bu0CuIXVRGpz3IrW3uAsEFRscm/yrsQlbY/OwEdgNrH94fyU/Tb2PlKNBlSonE9M46M7GqaAh7aLCtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5998
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

On Tue, Jan 20, 2026 at 03:16:21PM -0500, Zhanjun Dong wrote:
> guc_submit_fini requires access to device memory. Using a device-managed
> action guarantees the correct ordering of cleanup relative to memory
> unmapping.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

Since patch #2 is a fixes and this fixes patch #2, can we squash this
patch into patch #2?

Aside from that, I do think this is correct as guc_submit_fini now
initiates a hardware teardown so this should be the DEVM handler.

Matt  

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index c848615d6057..f29ed62d2b12 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -241,7 +241,7 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>  
>  static int __xe_guc_submit_reset_prepare(struct xe_guc *guc);
>  
> -static void guc_submit_fini(struct drm_device *drm, void *arg)
> +static void guc_submit_fini(void *arg)
>  {
>  	struct xe_guc *guc = arg;
>  	struct xe_device *xe = guc_to_xe(guc);
> @@ -334,7 +334,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>  
>  	guc->submission_state.initialized = true;
>  
> -	return drmm_add_action_or_reset(&xe->drm, guc_submit_fini, guc);
> +	return devm_add_action_or_reset(xe->drm.dev, guc_submit_fini, guc);
>  }
>  
>  /*
> -- 
> 2.34.1
> 
