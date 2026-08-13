Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88C3C5CFDB
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 18:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C45110E2F0;
	Thu, 13 Aug 2026 18:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/ijXS6z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0644F10E2F0
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 18:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786646566; x=1818182566;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9LiH/JrbGoB2RyAUox/0otABYo9+4vp7vZgXg6NXKK8=;
 b=i/ijXS6zJfQtmAe9KhBzTVbXpN2xjWlNMJi0MbuxhHazYY1NksMtJFTM
 9vhYaQzBkYQzcUtS2pmmYVQ0BnYj+YllcLrVMBD/av00Ji7t1WH8fGONC
 gz23T2Lk17K47nekdcsK72d6EQEhPu04gHYqV7D0zNfBeBG9yujYRtHtm
 ZGj4eBHEr/HzUpDhNI/bIJuxB0Nf7Wm7Ip6BagGAShjsibJk3XHCHHsM5
 FtgtgspV4QVSuKQsb3uEOkdlyUchdbBCTeMGjkK5+RROvScSK3WtNzLN0
 5OMpnOKDYZRzCBDQzO9rN04iIIibd1yNvcnU5V5KXWd8okyfe1rQTvp0c Q==;
X-CSE-ConnectionGUID: 8EhAqQLNRmu5etIkNzMvww==
X-CSE-MsgGUID: ES48JmtpTCOXO8Iiel7FIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87357228"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="87357228"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 11:42:46 -0700
X-CSE-ConnectionGUID: bnabVjPORK6A2bRB2c2RmA==
X-CSE-MsgGUID: bmJmVAdnQYijhkRYoVG7yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="288799605"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 11:42:45 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 11:42:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 11:42:45 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.63) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 11:42:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kKAvEE5youFazg0cPLwO065Kd61J7ovyffpFxeKCjvCB/U4X+jbj4Y5Q5Ey6P61IQ4LorrA42k8UI9BqFGs5ZVyzpkbs5p68JgPASQu7LbX6dZye8NCQrlEpYwPqIM4aHMgu1w8bl50MnTnfUpaodZr9qjYQXFHcx/FuOw3M2wp08BILBXtXm9ZjAL9KWGDQ5aQP/ZsumC+tPhrMFMfRkDOuUp3ZKfU4QIYX72Y1MoVSbhA8TFkjwgwwlEtowMDnva6eU4roEb03CLSHVROAi9C5Uolu73Dlu+G3waiJVvRvyMgNxhoo8guuwA04WT05Z05d3RYyL1mDpfGQACwCrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Vp4CaUk9Xu/nSuoWkxdEuMOcFRi9LrA8NQstRcXpe8=;
 b=HJ5KHQ2u3vfd2vCGYO0QX4XI/6PMX9WL5pOJFJQd8+2bgV2gnRPo418Ydy9HLLKvdwHdeyG4DxdbmH7ry7M31MTqj/CrzaUtkTLWzVw/yUfgf/Gi36p0UnaC6gxvOhGYMQByp7RihumQwF+Z2mWN+acZomc5em43iIF/gWB8vXM0NsqtUtEw9Lcd2qSRR0YElvd7p8M9eBEvKFdIQLloWXsWqq3cKVQtF8L+0c+CczID6O1ACN/FmqccCVRFNEaxzXriVcNmIjidvdYp773a2bGX/jtksnWfH7kkJJHUqW/H6GG2BRinImsOw2tjyKb6h55c130x7XMWZOgcq5f1Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by PH0PR11MB9609.namprd11.prod.outlook.com (2603:10b6:510:3b0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 18:42:43 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 18:42:43 +0000
Date: Thu, 13 Aug 2026 14:42:40 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v4 26/32] drm/xe/pcode: Report 'timeout, retrying' error
 using SIGID
Message-ID: <an4QIOoKdccfTilI@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-27-michal.wajdeczko@intel.com>
 <an306HdJdiz3V0qP@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <an306HdJdiz3V0qP@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: SJ0PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::27) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|PH0PR11MB9609:EE_
X-MS-Office365-Filtering-Correlation-Id: 579db3d8-3ec4-4789-6c32-08def96aa909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|22082099003|18002099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: UpWVBBvFf5BWSjObITocOnwO9+C1VNksoesLII69oOQOEnsOVRtvzb703Ok9WFw+vlcf2HfuXu9XoVzClTe4jaSqWCI7tgPN1HjpgpkM58eQSWuhvsFB0LJ7jIEFdnQxlk7j9vYv+Nwi3czJF4woQP/nAtDl8NG8pqBzjmUUnoBX47kI9/t/XKGWr5kduXNJH1QsVodYp8rt77/GKJcGvZQ67SxJwk9S2sy+unWyxERplZOjXNkCqBWZWsQvP+ZQmzAc7t5u01X0Sk7hUX36MqA+gF+QkkiHqE8ZjwZ9A8NZ7pK/fOuXETpjToSP3gWPFM1e1OWDm6rIfdTu9VOVt+oUiDb1/LDCsqtPaoQMgGcax8+aSBHJodzBBv3mXSYFVgHzwEBAqgci9PeNl+D/5SfaLSSNEXUoOJKKXLuqqd2GRA2/T6ffgtLxuTsu+V3fmhWaGrFoxY2cJCqBD8dnIsiTBB28aTquAUeatYx99Qfjp0H8qLFZVy1WijHB1MJ8V4Tmd6bw05W756LzCtnFVCt3TzytbWz3yqjrkRg9Ev8El4PZIcH4LxrBeQNu5rb2vLE3Y7Lsqew/WQoAg65UPmkvDxy4pfMxvez418kpjgBbjaxXA9kMSB0QJw0SGDozTci1oi4OIFnTDgWNZbCczLSxujLw8omGpzz0d67rGo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5k68bER2BEP4kzz3VdKCslSpaPzha5oqOewMeYYpf8Vlw+/xumbfl8w+6yVo?=
 =?us-ascii?Q?bD6ZNbLeAK8bk2Gep6P+ilLmda7ggw794MLuO4psD37JELbzmms//80PC9dC?=
 =?us-ascii?Q?3h2WxOozLmt+5inQDUFKoweSg8qjgOL/UZ0aQxvbJ1KLh1ip09w9K1AGJof2?=
 =?us-ascii?Q?nTF83TIuK+Snz3vgdGFeCMwOnq88z9elCb/FZhhGzZ1k+Th0jIXFjhqUXEOo?=
 =?us-ascii?Q?UXcGsZeiYWTu1Npd2uunQQElqRYNWuorTHC+4cJNrJtZb760FDT/BGr66d42?=
 =?us-ascii?Q?3qfZhzLmz5SyxCqAWli+ASHWSIFSLF2nHRkXirbaY9BLNIPuAvxlfkipsEKk?=
 =?us-ascii?Q?43x7zgGjuJlq6QczbuzhVvjlGf0ttxPyOpA+kF3SAJQilSebN322rZCd+okt?=
 =?us-ascii?Q?bqpPQWDYQF39oOFZe8Kj6n0XkB4yFQ+L/4uPwg17ur+i2PTEzWfmQ1ata3Ak?=
 =?us-ascii?Q?rzrRlUxOR0lMRyne5ZMb6j7p4NROTufaiBH9r3FKTfRoMwr8+AbbuIFfoamv?=
 =?us-ascii?Q?kxvvSQ4PiU8nvXr07mekSS61CsnYdsVijxIX5UYbaoVQC0Xhag8Hzw2gseVS?=
 =?us-ascii?Q?M7lMb+yjem723+XRsQJ6M+X0GnvhVeQqdYyE+cKWY1dnNKRxfza/TK1lZLtc?=
 =?us-ascii?Q?ENWIZkjOmbusWFIlBlG0GQFL0ySEwJDWO4LYN4hs5tDF7hZ6aZCIGg1h8uvW?=
 =?us-ascii?Q?Us7SjHE/2kPT/RFls6/x0NdeP4TwaLfQJJ8ZiUlBM8b7qp+Ce8dwkC2Jf9Ig?=
 =?us-ascii?Q?USZ4exad4mGiGeoRmdKaGPLyYLpZHjg6Mr/FR2kCUGwcvpfmzhVbgcOTiy3u?=
 =?us-ascii?Q?/Agb5kDAc+PmyA5cqdWm49mS3rTCG/HGsFqoQhT3QeJ0ccxEdSTVouQGvc2X?=
 =?us-ascii?Q?++2us9tKdvxo9qOhxSVFoI19EbdX3o4kfATLchOPtVW2QwOaaeyEXp0M5B/o?=
 =?us-ascii?Q?5NMfe8pmbu2C8f5aZ4dUHtHDnSDoH3n3Ye3eqKOJVVGo1JqLMRxQbo+L4dsx?=
 =?us-ascii?Q?jisjQbBg8YEieXWOX8sJ89a7NRf4IchB3noIlXKFSwmCFOmiPAl3klgE3B8r?=
 =?us-ascii?Q?0DEaiITrkFLWrGk7gPkXvMIEup3bUFf7DHYClVGMudMd2iBaOY2dkGj7ZO/L?=
 =?us-ascii?Q?CmdBMIG3ZWAbGJQeAgDRtacaUsJPPUxKtSjoNTKB4otfMLsabrWEVFTImvVT?=
 =?us-ascii?Q?/JHhLU0zdEOLrMpwdDWMyY2wsxjQnZg0PrYpob4YRisyhASeBuhX3JorNg1t?=
 =?us-ascii?Q?mIkqjaQu928ZTBcYCX1zsrsu8Q41EaEENtfmug+cYGUGY+er6r/9a31x2tib?=
 =?us-ascii?Q?lqBiIIe+FYb8zlpP5Nkmv/DU/eG4iTtZrstNnfjGZmhjfmrQN3etuIOwibwj?=
 =?us-ascii?Q?6CXyv16AIGPC5avDhjwe3JJYKow+DSu/nYZD8DmNDh2/1RY+LrGninJ6dlsc?=
 =?us-ascii?Q?llCYhcej7bTGFCjTohqID1GjB9inCFiKjZOfQMGMMg45B2zrA+yxaS9EmEI8?=
 =?us-ascii?Q?1OCNfmycdgdcdESS0SMFBjG9F+y0w7Kf4d2783p9H1x1VtWHq9G54e0+JZhI?=
 =?us-ascii?Q?lMgtZxvKz62jJVkGASDrF7UMlBIQFKSB3aoryvGCO2i5SKc1iTolrzad+h9h?=
 =?us-ascii?Q?fE0BlpGZU8TxoeNCY2h688pSfwIWP+3JRBdjENH0FpLK0PtC7hqe10Qw6m+p?=
 =?us-ascii?Q?GlWYiTGY5goQ4zeRhJgi6DwJFRysSqBLOH0hoUlNKIURsBqCdwtfCWRtFYm3?=
 =?us-ascii?Q?F0AOsaeS7A=3D=3D?=
X-Exchange-RoutingPolicyChecked: gvP5m2oweOyjfZ4uRfjW4V/TqBT++tbn5dqp1nhpaOUcIxFoDxTnQGW7Oi0crMsOQ2ojy8DJi5Z/1WmeNtlInyOgXbkVkZh43cQ2LF4MsQTg93rWfSuccrjh0xmZvOGP9GDIjbN1naNi1O2cnxNAcoNbW8aMa5NazSMlhUFP9e95KF4XL0GFbJ9w4w3UCQ0Uk9RBexuP5yUIU9aQnO3Qi2gu0PkRb8UOcZ6Lbr7KU2tY9ZCTtLiPdQsccj4Tb3nzWpwx9iWI4RaprW3ND2HYZ5gUlyfrI8sUabYx1tHLJYmmvToNMzGaEMiOrdMzomo3N4GHm1jy8u9e5xkGJSJwCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 579db3d8-3ec4-4789-6c32-08def96aa909
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 18:42:43.2915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maEY2yv3aSQPOFFlqKb/5uF4kH6Z9wFZGB92JgGbqOViHqKHLqU6SZfUNeJDZCfWv3I37c/6KE7GEjXpYUQ0GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9609
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

On Thu, Aug 13, 2026 at 09:46:32AM -0700, Umesh Nerlige Ramappa wrote:
> On Wed, Aug 12, 2026 at 09:14:42PM +0200, Michal Wajdeczko wrote:
> > Report 'timeout, retrying with preemption disabled' error using
> > xe_log_err() helper.
> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Cc: Riana Tauro <riana.tauro@intel.com>
> > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_pcode.c | 3 +--
> > 1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> > index 014632e11338..14b13a11d1d6 100644
> > --- a/drivers/gpu/drm/xe/xe_pcode.c
> > +++ b/drivers/gpu/drm/xe/xe_pcode.c
> > @@ -218,8 +218,7 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
> > 	 * requests, and for any quirks of the PCODE firmware that delays
> > 	 * the request completion.
> > 	 */
> > -	drm_err(&tile_to_xe(tile)->drm,
> > -		"PCODE timeout, retrying with preemption disabled\n");
> > +	xe_log_err(tile, PCODE, ret, "timeout, retrying with preemption disabled\n");
> > 	preempt_disable();
> > 	ret = pcode_try_request(tile, mbox, request, reply_mask, reply, &status,
> > 				true, 50 * 1000, true);
> 
> + Badal
> 
> Should we report the drm_err before retrying?

agreed. This should be an info at this point...

> 
> Should we add a new log to report a failure after retry?

right, and an error after that if not already there...

But this can be done as a follow-up. Don't block the conversion imho

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Thanks,
> Umesh
> 
> > -- 2.47.1
> > 
