Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC33C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 20:32:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F3910E949;
	Mon, 29 Apr 2024 20:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CUCD1gHG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A4A10E949
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 20:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714422758; x=1745958758;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=try6n7n5AwaLdS0lVKJ00xEJNsfUNFZ1enh0p2OQtk8=;
 b=CUCD1gHGwa5BTE6IOKQyfFgbjLgOvzWwq9U8j/EQ2vrvuBThWinVShb2
 ZlibATOFpjT1I6IbyJtbijDJpmokFiEKwQuFmfkTuFoqt1Co4EqWtB+am
 cl93IiIgDXoNhY0ExsCoX/U+Q0sfsfUN4mvGHu1MgZpVQ9BgASEHEVEya
 73gTuank1GoOvlRzpWqEMcOq8iPLrjuyZxoxuISyhQIiQ+TBSputZp4l1
 Mx2g4XfFByVYnXCBfsm2hbfC04N5oPc4kuSTeK0ucMiFqoBX65NreIhaw
 w58clPyyKEIB0YgZyxpqP1UNDQd7iAw+KMYFWCeOsV4Ukp0mvhnuLuwHC w==;
X-CSE-ConnectionGUID: bkRnMugpQnqdZMrpmKvjrA==
X-CSE-MsgGUID: b/3yA3i6TxyQBbyg5Jypsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13883146"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="13883146"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 13:32:37 -0700
X-CSE-ConnectionGUID: gXCNh4+fQSewylsvTjs/2w==
X-CSE-MsgGUID: dRTVFZlsQI2aHEOiQdjmqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="31049259"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 13:32:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 13:32:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 13:32:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 13:32:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 13:32:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+TIHbIAQ3aJhwWimY+mX/i2+dRTXHJ+xx4Cg03VlsxIlYSSrEoFLrYHIexwElrVmxDjb4sK7RzJ1f/oaBnIxWs9dz/Ev4JV8w3QwrlcUr/ydYa0V3SSpWENMCRWtFwLyW3b4Ow0BFiAOs1WfECDldZereBdz13VfqORd00geyQ8CPQpPYgvjMXVJzQEoxOurCYmLj1RzryQCezh0MuvtvKPMatA541XHFfaDMBBASx8w3RCT4fiJoEDEEM2uoCVOk0S9vvEXdggt2pEKEf6bwnwfOQjC9a8xug/862CmI7RuR6VH97K9tybiwTS8tAo49lWsugiiiLz2LmZx9UkkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfycTb99uTGCsU7qop3xuMRCDmscbsMjmRPF/KGn558=;
 b=UYZGbaazqgQHmC6d224MiNaBCoGG1j8a64XDDP+diKIOTccaQM7MoWoJ9IOshbcdzlC30bSIsp5GuQ2FmAm9uL3EjDXplIznCYgA7pwBbG3vFZ0XbXAWsDdLH8OglX5//EO6HzANOPh+5cGjSYY74gJ+IPYONS146phlLvtCXHOzdh7/B8SHzqI0o2SPoHNIc1rsz8iQ59MK1A5PD30H+sRIilIMz9ND31XY1VqzOXHroKjnVzAdhBmk7JN6YW3LbQRLnT86nEmMyypvqetQDQoSrikqXIMpJ0FPcwoOjjXiJ6zU0EZ27gqZGVTNyFZ85dFWlTaXmtTb7SxoJ+CiDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB7161.namprd11.prod.outlook.com (2603:10b6:303:212::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Mon, 29 Apr
 2024 20:32:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 20:32:34 +0000
Date: Mon, 29 Apr 2024 16:32:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: skip error capture when exec queue is killed
Message-ID: <ZjAD3Wrn19BPbqxa@intel.com>
References: <20240425122931.1851837-1-tejas.upadhyay@intel.com>
 <ZiqDf8xAFFssvImq@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZiqDf8xAFFssvImq@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:303:8c::28) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: ef2c3778-dc22-4ab1-e909-08dc688b800e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cn9zs64XcMyoCqeT2gm+noo9rxqFKr6ae3K6FZf4vbEvH+u7rNMGYVs9B+g8?=
 =?us-ascii?Q?Xccw84MOU7FRUznYva0A+P0j+e9ny6iXhayHlC6hx3WehNhIrXcAsIkRzVIR?=
 =?us-ascii?Q?ZaxaXJBZIxqXDC8A1xKNMDDqSolp06p4eMoNRhoZ6gw6wLPQm+b2PLhSjQLC?=
 =?us-ascii?Q?F5axiqc+Fr6pwrbyoVlxnc17xuf2zT3jmhDkfa8qFTz4LxqtHgq7fNk0IPJ+?=
 =?us-ascii?Q?4B0yNM7viQA13Fq0pwfuhTo9U73ux2sSCoq95bWfRYAP7ldyip5PPzmHr79D?=
 =?us-ascii?Q?WhE/gAt8RctqyhPjQ126FWp6SfFBEcZTDIOdWNhdl0AfbYmsL4VvLVDdh2in?=
 =?us-ascii?Q?IIvImCMeVLi2weS8pqy67eKp0q65xDcYJav2xOGam5KiEKf7XA2rrQmLT/0v?=
 =?us-ascii?Q?5EJinJ8PznlwPmPwUN4NOEBaaR8lJxVKRvPw0qBYuWOtiJprGswecxGZ3BDS?=
 =?us-ascii?Q?88sTSpQtxb5jOtfcWPDRzmzvq7zNbXwP51Lti8EZdzLKypMKiR0fSuoVgHtw?=
 =?us-ascii?Q?oUsBMt2G+OHcCnLp+tFV1So9IjLW6sDzuNnAE7G/SagdMXlhvANBgN5pLtX8?=
 =?us-ascii?Q?/DF0C6uM3qFtYEo6Z9el1dRjC8Qu0YE/yVz1+WhcaBBOrk5zF/+a6ry2x1L5?=
 =?us-ascii?Q?H3JU7sUFZgLfnlvb3zXdvzOxz3dOJvonT//6cIRidHznXG0p1ee0zoscSjNd?=
 =?us-ascii?Q?Zldflk9neEBJmkgVMXRVN/Xbn+ye4t79jUNHUiSpMnh8oaPWva5SJj4kkh4z?=
 =?us-ascii?Q?pfDdccHHT1to1qWKRAhKFX99XxQTa6UKLHn9MDWhWQIVSU2fRo/ZUXmIf8oJ?=
 =?us-ascii?Q?xSuZaVicdzbBOMyijEyRzLoU9QxnWExFLfsI5EOV4N1xzjtcuNYLFv8AMnaj?=
 =?us-ascii?Q?V/WZ2zCr98Y+YWLFZmHfRFPzToYjfkMiioWII/+WEYIKs52H5Njqi4/T1wVg?=
 =?us-ascii?Q?A1UrSNWOTDqISUKgtheJYwcLokrDZkfrET89jypQVlR73+I8+xHjzP+CsyEb?=
 =?us-ascii?Q?ztcWOjlm0cdKnkCYHDTkRPJgLEwmav6SJ9Y/B+ogF5nFUSSkovG0m/x/bSIA?=
 =?us-ascii?Q?hQmxb+W+GS3szL+zCVgw8v+agLR2s6EaHeA1ddy7jtojpNlf2VeTROQgO5kR?=
 =?us-ascii?Q?nd7H3lWIJvdg7KAc7JYHbDHo4MMMXYPxWbVz9na9n5Y/xFSm5/WlRMY2eppD?=
 =?us-ascii?Q?rSqXf4ITJ5D9lJEB9OeZUeASEQ/S/mSw4/AIUP9vTNPyiHFkxmvZU8B/Un+G?=
 =?us-ascii?Q?ODHICLbB2kbuyYxvp7NeHHu2s2UxgSzsCYNdJF31Zw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vc+iUNoAXkfgkGfbNoc2q+o3Z57WNsdbkUE5XZh35yKCeOAyCkXBsj/NW+5U?=
 =?us-ascii?Q?Pjr4BQCAy6gp5joJQNi0oYenxe8g7hg36b13eRQpls3NMIw+P8llxBbEzbfP?=
 =?us-ascii?Q?wMkIM3KKhIISMjLJT/beSnUz+uDywZsCtQkCiadA/GUA34HihmXrwxZDvHjO?=
 =?us-ascii?Q?cRGjZDns9c0pGjKbBWXRx+OqRjNcP2LQu9/Doh4PXE9L39IVilhBUoZw2Cfj?=
 =?us-ascii?Q?wBjWDxUdg/q+kTZUQyFDahGyNFJRtVTHrbXDRc3hqG2KgDlfRWCEX1FPbwpd?=
 =?us-ascii?Q?IAw/PRFVE33J9ykOVkPhQ8R6wAZR7MGbEx0IU0fRPnPwcc/Ykp6olPYrJQpb?=
 =?us-ascii?Q?C3t3Rxm/6n18WYo9McYKpHZC6nLt5U6nAFjHEPh7laajss1KvjK4SNHCdzde?=
 =?us-ascii?Q?x+huUcpPheTLwVdbOg7KpnEYg+yKo5CE6S2KFjVRKCjHKU6VXE80MTXfB/Ih?=
 =?us-ascii?Q?JFb3G+Sw8uRkWHmeladIcER2xl2gJtDSRMFCxJqdGl8A1FedBWXYzyb2R/S4?=
 =?us-ascii?Q?/qHNqzQskwVeQmcjmGRQWMQQnDw6MVxvR03+Xdn5szov00QusjTJwWkRvwAY?=
 =?us-ascii?Q?+67+uVXCvEJHerUWOEfmb7g8Vd+Cnlb6VS5R8Ku/RgqTwev0/F0srQ/JYjwJ?=
 =?us-ascii?Q?gyk/GMopL+qHkzHTpYnkWAiJbS1kegfLV2WxbEsMpUli5/WAJ5yryNaY5NJk?=
 =?us-ascii?Q?ucRLf53p5eQHLksWVu9heO1d1PXmWixxWJRg8QM7EfXyTRevtuiErtugrxJA?=
 =?us-ascii?Q?WQhaeSZsj6ubXWr5AKqqteU6JHWmRjW6/cExoZti6F3F3DjOBNmSer50juVr?=
 =?us-ascii?Q?bBs6Pkh0g0SiEZ3LNDY01ZXTMHY2beYG1rtIUqroNwm42j8z5b3YKV4wboJv?=
 =?us-ascii?Q?FRF1k8ItMNVbWAAek3DtO88okPrczCZAO+DzZTV9SuHmpgDdB21vJzyuPukQ?=
 =?us-ascii?Q?+KhR5Eb8Hk9wKaqy8i+e9Wu7ZZ7OsQE6sgi48wVQcUOLTzQMapce5Nx6eigf?=
 =?us-ascii?Q?YvvCheSzjgYNZbhdEzIjfaq29gjTkwESHN0oLG/4ODVpeSDnnCW+x+w+2xxc?=
 =?us-ascii?Q?jwprkEtK4sq+sFo3PmPcU0OK7Z8uV+ihsr+QFq6DVuGCGPrfFqBGDfnECSlU?=
 =?us-ascii?Q?e4buJ2klZw7LX3DHY/CRU3C1crbxaZCingBkA/a4x6mL4VIsPsm4LkjXHpqK?=
 =?us-ascii?Q?DKT7iizdhEGMjCKULa8/CBxGcItB+TK1+2ax4RkXWtp4ilKqQyGgRZnpf1zV?=
 =?us-ascii?Q?LxVQpnqfeniBmJAHyRYJf444FBRD6hocRdJanMmuznZjyEygOoc+kGKb1l45?=
 =?us-ascii?Q?5NUYYPEcjfc94LWn0p2QQswMj0eGNV8H/Wz+n2tVGEBfZFQIxolZ3qe6Lvm+?=
 =?us-ascii?Q?fYm/BYtQJIQ0ge1LMZ29C82x6DQxMPF4tpVvZSBo6X7FKrddzVzFVk9N28RQ?=
 =?us-ascii?Q?dTM8x9Zh0Wj6wjUlF3Ix+B45m7D8dXXWe9KmjSOYPaQ4ZOsE43XQilS4EA38?=
 =?us-ascii?Q?GWLsN2HlQJ+Y0Q2szeWfJxuFZzVSYmPnNqo2ygkorqJqfgOaEEORMgtuEhuN?=
 =?us-ascii?Q?IN9phC+tTySn1ZTHrtgXHaCCDnXdA/Ef03R0+oKD4Z7l9Yg4YujfjSm+7YM/?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2c3778-dc22-4ab1-e909-08dc688b800e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 20:32:34.0036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TaNdnKv0ydhhiZie5KzWFjJIs16tYAI464pzrnyqfJtsnjd1ZoqSzw158SIADUC8JFvPa4A10kGPOVvTa184kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7161
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

On Thu, Apr 25, 2024 at 04:23:27PM +0000, Matthew Brost wrote:
> On Thu, Apr 25, 2024 at 05:59:31PM +0530, Tejas Upadhyay wrote:
> > When user closes exec queue soon after job submission,
> > we are generating error coredump. Instead check if
> > exec queue is killed during job timeout then skip
> > error coredump capture, just free the job and return
> > proper scheduler state.
> > 
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 93e1ee183e4a..376a2c04e899 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -971,7 +971,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  	 * TDR has fired before free job worker. Common if exec queue
> >  	 * immediately closed after last fence signaled.
> >  	 */
> > -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
> > +	if (exec_queue_killed(q) || 
> 
> You still need to timeout the job if the DMA_FENCE_FLAG_SIGNALED_BIT is
> clear otherwise will never signal.
> 
> So it should be something like this:
> 
> -       simple_error_capture(q);
> -       xe_devcoredump(job);
> +       if (!exec_queue_killed(q)) {
> +               simple_error_capture(q);
> +               xe_devcoredump(job);
> +       }
> 
> I think I've convinced myself skipping error the capture if correct in
> this case. e.g. If a user ctrl-c an app, we shouldn't do an job capture
> on the jobs which the KMD kills.
> 
> @Rodrigo, @Jose, Thoughts? I know both you when done a bit of work here.

Cc: @Maarten

yeap, it does make sense to me to skip the error capture on canceled jobs.

> 
> Matt
> 
> > +	    test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
> >  		guc_exec_queue_free_job(drm_job);
> >  
> >  		return DRM_GPU_SCHED_STAT_NOMINAL;
> > -- 
> > 2.25.1
> > 
