Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68BCC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 03:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8288710E385;
	Fri,  3 Nov 2023 03:35:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE5410E385
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 03:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698982539; x=1730518539;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NHoGUhVkD7I56GfcN/VfE+/juC+ufP8O9PwNKUu1NG4=;
 b=mwPI8T1Ty5Z2A+HyJt3xBmxkX0nr8GaagbVFUj4GZLn3mReLXL8fF2dq
 UazZPQCTPDeeqVkTqVgklp8FcQTX39bYT6dxP1Pg58neyLXhToigiGkk0
 Lxh1IlYxLs3PFHN8+ApdDu54FoshxraRqCmSFGq8RoTSYnql8PfKeS2rj
 wstvDmNJMRP08OrT8bN0rlC6x4ZLbvzB6CF/Z20T55s6tYB4aFQDKDCjE
 hBccIvwE5dStf1SH7QmyymErXNnqtMVRVrOmq6qh3Ca8aWQUK1EM0iXAZ
 WJUfigbxDKsoVWyGQ9pxGmqP78jymWosYR1k+IFwew9gfpiGvZX38PSCD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="379272133"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="379272133"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 20:35:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1092940574"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; d="scan'208";a="1092940574"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Nov 2023 20:35:37 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 20:35:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 20:35:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 20:35:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjZm4O0uXGGQIrCPR0FjXBJQXwwMDFEVwMHySyjJ6ij0+lsgzZjxUiMPM8Uz+BrE/Py1TGEp26BCsSi+QlffzFv0UriJccVHQUzIWK16SJEVp6IbzvW8oYfvr/VgfM3eG1wvHtDcZCI1C06YF0ajesNQy8O+QwM5YQTpun6o4iNE2B/laP7AMm5szR7iTS9XmWZ1zTfA5OON9n7u5FhoEtWt1byfSUaY0W7dGqV2bt2OEyh8OmBys3I5sTzy7GMYVayBwqWA2NRb3N52KqGv+IkJT4SINahgQIYShUKh90z2hasgTnBGGb6r7NIeDcExU/6HwTSB6D8tHddoHr1RVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CoRXnXapJLoNrN7qqrWQiQDw+ZWT+j+9H+5h8ZN7RI=;
 b=bU+sf6cAcbSUdmQFpVQs3GJfyUN2Uxc9fhA2A/v8C7sAIlMIJZGQdApYEFWngSEHOHf0eBSp0OjkkzuobSEONkCH474ESveVKQZ0317Rm1IfMmlCUmrJ71fxRxY/ZjXcCljsMeCvIyOQGoK6eg8sHcFPPmLJZmIYbzdSh/xiW1YJS4YfSutwSrPIRYXUjXFuTxwmscyDm1+xcILRCq/aFUExxiNh0Brj0LkBD3jLiIpR563Ov028V0/b0sgKsA580hjKlKVUrptH4uhmq6D+hPo/hnhU8mYHLqbPymN4MnNGUGefswvcEEPqt16J3jUxdWp5XWNR+Dd2T4xqmVW/Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7193.namprd11.prod.outlook.com (2603:10b6:930:91::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 03:35:34 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::dc77:69e0:a3bc:e3e%6]) with mapi id 15.20.6954.021; Fri, 3 Nov 2023
 03:35:34 +0000
Date: Thu, 2 Nov 2023 23:35:30 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZURqgvDLeJIu4qXc@intel.com>
References: <20231025040520.1236213-1-matthew.brost@intel.com>
 <c3ndl6pfzedexr3ukg6ym35stplij4ponp2uojuqytcerlishr@z5dsqljvtbi4>
 <ZTlLNHyzwqAefhx5@DUT025-TGLU.fm.intel.com>
 <eztcofcj4qwbokg6n2ua4t5okg6f24mksxgkgsewozvdbufe22@bt7pyoxs3s5r>
 <ZTmMdCIjRHP0K/SE@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZTmMdCIjRHP0K/SE@intel.com>
X-ClientProxiedBy: BYAPR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7193:EE_
X-MS-Office365-Filtering-Correlation-Id: 71c0eabb-beb7-4a59-46b9-08dbdc1defbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fwYwhAyJgWdsrQWKl2FsSjYXLvpfv+fiXqkWRQduO9oV4KxNQ17RDxWBCLWSlzzsHM/9exH6bE8G4vG8+tvIZbzLmqx2Mrm74DHsEOs7hEFgemDvRUBYFg/fAviQqauGt4nuy+iuhAh9sazldLajOzZ086Z8UmYgMrhWs4QKiipMmCMP1VLYy32MS0XzOgTWxak6WdN/LB1vFl+3stTazsVhJ0nYJaC9yxwvyrUGStZu5yI5cZAuBYKlzqJQfMw2GLyMVDV6IhKeauACjOL9+OY0aYYSdws4dIX6gvE9TyJL03f2C2/msvrCldMeF2PUTHN413Yxz1VxM2q1bO+8RwmKcmPNCn6yfrFfJqh4e4XfWlpHN4S93OikGn5RjJDXtUfCiwIsEHFN9iCdvNnNJ/Ap8FiJhRfPTOa3QUlwGzMTwsBmcY1Nb8LBZsfX7l/EP0owaMuVX9MCKeZf7Eyp6baso5XlK0Yf71SRtydQzfO83V5XJuP7p0pfl6T6/3lS4ISK0fLN8JMXPXdzViWxbVnqe58b2ygDFgQlkZgW0BDpBCTLCDuqD4JxBI9sigf0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(39860400002)(366004)(376002)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(36756003)(26005)(2616005)(6512007)(38100700002)(86362001)(82960400001)(83380400001)(2906002)(15650500001)(478600001)(6506007)(6666004)(8676002)(6862004)(4326008)(8936002)(6486002)(66476007)(66556008)(37006003)(6636002)(316002)(44832011)(66946007)(5660300002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?25csar8mT7hLh5bgBRTaVQhOZuV46bsBsnkYoiO7cEyWcJmf71epEwIvIbPG?=
 =?us-ascii?Q?JzvSg1QLSbaea8RTpvbqKn1SD087WnX1xeu1y9yo2sa+Srb5a+aftkIElXqs?=
 =?us-ascii?Q?SJROA5xqZ0fqIyQiZsd0U9nPXQSB+Vgz7m4DdjicPjoyrZm09+PQQiXL248x?=
 =?us-ascii?Q?c6Xt5pttDIYqU4ojUtF2D+5U8ogknViB1SaW/ECsFgxJ5dTH74oN8y70MErw?=
 =?us-ascii?Q?iJiCh6SIEF5GaBY+7dK0p2biJxexhDSTTKJkXcAZDLHrwtnbDXWg17fEwitW?=
 =?us-ascii?Q?G5IwppWZhxEWqNUW1Ccz4W/otzW4MqXIwguV1AfJZPgPEq9fD0jhr1ej2MIR?=
 =?us-ascii?Q?O5lk0V/UKMQhhhBNUaxC29wcCw3nJhmMvhjE8ljJ4mVZAWw2th+OFXgtATCM?=
 =?us-ascii?Q?0mOuenKlZlc30oWsVdGaPAGVihA24N5AP3nBsaEhYkC35EZVk3au/VPaJ0cX?=
 =?us-ascii?Q?2Kg7dD6L/2aQA6q2ooEJ+Rpu8XjxAXW6MHsjRPnPIs6w/eX0BYKgdaa0sKIq?=
 =?us-ascii?Q?57xz4ENdfoG6EcWNpcLlN6Mev/Y+p/OGk/kAhjdgemGISSs7Q9yhrRtseYhF?=
 =?us-ascii?Q?B6UNySGR9vo4L5ji6iTxPZTeyO7/+HT7oV1ThcM4k1YvBSf/zuvWvcdyXTHz?=
 =?us-ascii?Q?/r/qpujI4ztqsBt9Aa+aUYZEik3rFXJ5wiaGwyVoIfo73xI1EGs0nJdkpyLT?=
 =?us-ascii?Q?RTg63jDEhOMbix5BrTWUdM5AEEm4LUBYHsNntGRlUcDOUHGRZFseosZsAAcy?=
 =?us-ascii?Q?lhY31wDRnvZdoSNwfc8mel3bofxtKI/3AN7RWFiksxMHt/Go09h7W3BWdvc6?=
 =?us-ascii?Q?KSEqDqfLiaya9c/MqAerL5CEJMx0nMSXy5GDuLT1JRFmPYlFac/zrxkP90qN?=
 =?us-ascii?Q?A+6Qf7GYc2OnAkeYVmiZvvew906LJDghEp817NEnLV/1oqcU7sQ2Tl3HIuA0?=
 =?us-ascii?Q?uss5P46gq3ZyMWBhFv1/La7vfM61dmhQlUuw0hHrlh0wjUefD9brwGjyUDyu?=
 =?us-ascii?Q?mETHrVRT+BXHTuV3hAXoxiEDNkNOjo+EuLRpz99Y/KRa4t7+/TBl1fzw2zNF?=
 =?us-ascii?Q?F0EtA2kbUhH1NuS2xZVh2fed2Vd6Gjw9wAHgp1m03zIitUWOpsgp2r78Cw3u?=
 =?us-ascii?Q?OG2gicrE2sTZyRic8dWYq/C/i8Q+uSVbAkJbFsEI1cu2pzlXZKI6y+9PIGPD?=
 =?us-ascii?Q?ln1T5cqIe6B1AWSM/4gg4tYdXr69xnpax7ZBY7F1Mb+21R9kmGlpd7m1qL91?=
 =?us-ascii?Q?GQJNA9uMPftmyzKhTi98AwKj6s5RgdfzLiLV56Rh5UiK563iuhjru///po2o?=
 =?us-ascii?Q?211fRwZ2iCq0K9RRqVLJNa8H+G6wHSIwzXZF9rA09LMGi2PxZkwYyDnAWzSW?=
 =?us-ascii?Q?YV7qjKo5DhLp1fz79Jd6QDfeSbHRtWbLWXPourrAjk60pFtPlEQUMgtGM4T4?=
 =?us-ascii?Q?T4j+cpPeMVO7nh/7RBiOfOm/jDEJC2A6CE8ZjEzfJeLvXQrYFXxc5coqLkhn?=
 =?us-ascii?Q?uUM4kvQyI1nuWbvnrZN466idoqXycGo0yi826dEKDbXxkKBzQPfKjWa49tjp?=
 =?us-ascii?Q?ZwmD3DpMcPhW+AcsDqG/40AM+T901w6GjQqnsU3102lXwWXDU0AH1CovZNR2?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c0eabb-beb7-4a59-46b9-08dbdc1defbb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 03:35:34.0217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6Q8cNFIlISYBtA5DXpLpaJk4qgv/5iqlDBDtpIRkOS5USChSPkVGHA4qh7q+IVHB8ysy/AwggvLSegkpdt9nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7193
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Update to upstream DRM scheduler code
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

On Wed, Oct 25, 2023 at 05:45:24PM -0400, Rodrigo Vivi wrote:
> > > This is based on the upstream series [1] that hopefully gets merged
> > > soon. To create this patch I just dropped in the new drm-scheduler code
> > > (copied drivers/gpu/drm/scheduler/*.c / *.h into this repo) and updated
> > > the Xe code as required. The DRM scheduler coded so much in the baseline
> > > I'm not sure if it worth trying to do fixup patches, rather we just
> > > merge it on tip and find a proper place these changes during the next
> > > rebase. Open to other ideas too.
> > 
> > I don't think we should do fixup patches neither, but it's important to
> > keep documented in the commit message how and what was changed. Like you
> > did now.
> > 
> > However I think it will be quite troublesome to rebase the branch in
> > future since you are also changing other parts of the code. So it's not
> > a matter of just dropping this one patch when we rebase.  Lately it's
> > usually Rodrigo who is rebasing drm-xe-next, so +Rodrigo.
> 
> the rebase won't be easy indeed.
> Another aspect is that we will likely need to wait that to propagate
> from drm-misc-next to drm-next before we can rebase on drm-next and do
> the first pull-request.
> 
> > 
> > One alternative that comes to mind is: can you do the rebase and post
> > the result to a remote branch? Assuming your remote is called xe:
> > 
> > 	git fetch xe
> > 	git reset --hard xe/drm-xe-next
> > 	git rebase -i bb46e837b7e59c22a567ae6913ff4d6bf0e9211a
> 
> Yes, please! We had a similar situation with the display case and this
> is what I asked Jouni to do. Having the reference branch when rebasing
> was super helpful.
> 
> Besides the reference branch, we need a top commit on drm-xe-next.
> (Maybe this commit here?, maybe something more)
> 
> But in a way that the
> $ git diff drm-xe-next..reference-branch
> should be empty
> 
> Then we force-push origin/drm-xe-next
> 
> and when the rebase on drm-next comes, the drm-sched base patches
> will disappear and we won't have any conflict.

Hi Matt, will we have some update here now that the patches got merged?
I'd like to get the update in so we can send the update to the xe.rst
confirming that that is done and the patches here will be vanished on
drm-next rebase.

Thanks,
Rodrigo.

> 
> > 
> > Then drop the patches as you see fit and add the ones from this series.
> > 
> > Lucas De Marchi
