Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37982C001E0
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 14:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AEA10E58D;
	Thu, 27 Jul 2023 14:16:22 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9BB10E58D
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 14:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690467381; x=1722003381;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y6xfKAOceWWcNIVOQWhY0uqoyTlflx5WOIYifnNO+1g=;
 b=M4lnmZi+RAK8Oe7ZtN7s8tXvYnxfycaP/WOOH62sjXi9oLPpidl86HHo
 jK2mGlXrYsKEveviGWsFz95pbLAWqxY4LbnyvK40jd2tD8OmG6MEgBHK+
 zfUXF3H37401TbFQAdRxoCe0xH42HGbFBWai07RHAgOQxxNZEF9tSzh4J
 beSimaYkDAaUmULYksRM6aBaRPXQVFLfZIlbTKGsWdkFZSg3j/twawLxk
 KVToqEcp7LSeUzNxYl1q83/oPZ1HRPWNBBH1pAy4OiVepqyBPamCy0zml
 h0i+QDQOLBG6l5vbnaFqdscmKvKM2kD1YdF3AbOOEygOA9/UbstqtUVyc A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="365781375"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="365781375"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:16:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="727008199"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="727008199"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 27 Jul 2023 07:16:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 07:16:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 07:16:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 07:16:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 07:16:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjScxR6eCIvVDjM/J7JB3YUgzzf+mLdYZbcFRyb8vPUjfUU+Z4J/SPZ58OUgcu5xp1dG1R/ZWk8YF3x3HVfJ4Y30bjiiRXE8+f6t6ON1zgdcHB2jJI66FQgoiDZsf/WugSK9AP8Qfvh3XHAWknOVtERuiCIl0NY9vH4vZth7w3/mDzxdiKBF7ksjuuoDbBWuB5GwmFLMMMwy/18AoRAi9xTI4+Pqj4+rrAEK9ABTx3b0ViRG5OSvxFP8rXV/ZVcD5Pmc92Z9VUB1MZN/MwXJhe6w+zcQRWhPr6atAbgqTWoZI4z4QaeK8ZO6nHCSe+Wc7tnk46XodHstIhbFbRtcjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElOGU+QCtE4BJDQMB0rpap/j1nbIWsLze85iBt6d0PY=;
 b=Kt0EE+wsqgz4Vhw3VhFxfKZiMPUZKuOR7uVPgAaaOsOdYRs4AuY0u2idooDaaMwAhY9SyozmuwY0vIbHA4b8flIdFG3H95qtVoXQ1kHwc6NJw91kXMCY+WA17wHHg5qYJWLe8+SQk/Q/Nvlp+ZjEOiEDSot+VF+C3EEYKDelGott7+SEBE8KoCtLhIcH5M95v+XeJ3XJhPJyCYRMs8RMu2z+MK98sigRpFke9gE4eDxPddKfAorlp16dJnGsACdnMqH2kc9GqvEuqsbTPNLd5hpIMNjCYA8AAbMvBrbnxucdCBnN3lbUvRtQKq3igQPVR+6loG/N6lJnLHAJNJseyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN2PR11MB4616.namprd11.prod.outlook.com (2603:10b6:208:26f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 14:16:17 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Thu, 27 Jul 2023
 14:16:17 +0000
Date: Thu, 27 Jul 2023 10:16:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <ZMJ8LeVqkmlcT+Wk@intel.com>
References: <20230726192520.383531-1-rodrigo.vivi@intel.com>
 <ZMF0LMxahswx9wyn@DUT025-TGLU.fm.intel.com>
 <01fad5a237f5018521cf426342fc2bac975e09f1.camel@intel.com>
 <apsfze2qz55irp3eltsantis7gkb55ig3snlobpmn5pdjelgby@jiyfoa3kelcb>
 <ZMGRjCuCVkXezCty@intel.com>
 <gfkhtmyxmaag4s2z7ux4a5lgx5l2ad2f6oohibbpvcidn4xngi@vfyqjexmrjwd>
 <ZMG2QeWpRabPTXd3@DUT025-TGLU.fm.intel.com>
 <xh23li7qzshcuheqlaue2pbwtfzdm7uygowpkovtgc52r6y2tp@apdgbzgegvpy>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <xh23li7qzshcuheqlaue2pbwtfzdm7uygowpkovtgc52r6y2tp@apdgbzgegvpy>
X-ClientProxiedBy: BY5PR20CA0028.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::41) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN2PR11MB4616:EE_
X-MS-Office365-Filtering-Correlation-Id: dd927e39-60de-44ae-1c5c-08db8eac0b0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JyUbSgRM4I0yCb7CUiSweG50C/WX7diVQ8r0JjDq6FcAzmiXFqBy6mDJQIFbkqhxOmUMNviHkR8uhzMUdQk5EykAcurvi5+m4Z0zdHQkEr18LeHM/Ai2+RMcQk8p1foZdId1Y9bXVbZIHnrdxVUHvycD2n+5y8513pPvU8RgBXAtuu/N2Knal+ptTyT899OEcXLXV+SqrVK3KPkoFdXH7l6Qa6WUSGZ5bB6OLjIMcCWgGzLI76lU1W5tJhNElsaYE8RUJsEvGYC6DKhmZdyENTyzeZEk6WJx7XdLlm0PNfxzP5fP770t2rJi0d13ATKGxYIjYppNc81UGHmxkTKNv9eD/cJWvCEtX5kJLp+gaKejMYpx1SwLWbx+aquF+ZID9bxrRjJo4dOGjna3IJqj/ld5HJsnWVQlwjsH5mmUkewgy0NCWTwW8Z4bDSSxhskPamI75NXJDMfOP4yhZt2TFcI/g6MfHQbjUqxUHxsAFTQ6Frjk3VvuEDiITfVu+DX+Ju9MucyqrOnDCyTdhiIXuj0Ph+K3q4BDd2Kp2E8HRCVEz0uPMIgV3cDCwRkYa5l6umBEko5WiptJAAw9XXgT3ZVyHHWMknEuQ4aSVDfgBec=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(2906002)(41300700001)(316002)(44832011)(8676002)(8936002)(86362001)(6862004)(36756003)(6512007)(6506007)(26005)(82960400001)(478600001)(6666004)(5660300002)(6486002)(83380400001)(186003)(2616005)(66946007)(66476007)(66556008)(38100700002)(6636002)(4326008)(54906003)(37006003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?u3GnKSs2SRIQRy12IRbCU4pNNiW8d2pAtO8xLKuSrfpkqJ2sJyUI7xRaFtXn?=
 =?us-ascii?Q?uS4EAKYzp9T7k9Qrrl4NGZg9chBI+AMPP2PYma2ck+I0/0GbEBEfEqrGDmyy?=
 =?us-ascii?Q?cObqWQtSWus+gKpCwrraHpf2k43q41ch/5H2go9x7gjwjO8VUvhSiI4U1ezr?=
 =?us-ascii?Q?DKGc9xf2J0B8UBK+c/M04tnptJYqcNcU1sAZWbWeJQWK3CIDJmVT71JQfW92?=
 =?us-ascii?Q?bVaeQs7wIG4wLoO4ObWoLnG9ODugitMGU33Xd5p0A1/f+MTZl2nVOdBVhwTk?=
 =?us-ascii?Q?JEo1Znrn+V18UoUd9/LKzcvuheh619xlhyu30YXcv/NJzhaGQj/NkDS2qMOL?=
 =?us-ascii?Q?fhs8HYs92SbHvR21IeFLimrf6Qjym8dbfQaQ8/BdTIl5Y5VnBHdA5u54+bU6?=
 =?us-ascii?Q?fTGM9L8t7ZHihHvJJi4GcrmdtxkF4w9U84A6ay3rfwlG9bRrlJVwXOCyVmVi?=
 =?us-ascii?Q?SaWdQ6PidkDwVjl3d77XX6MG+RS6GDVa2dPq/TOrSmE5EacnX/dLkxf7KcXI?=
 =?us-ascii?Q?OQDo576882hkhRWeTUogmEUUwHKEIYRYNu8DXUkYrvGQB0TDNtMVza0W7iNs?=
 =?us-ascii?Q?ezz1j2bYymjaIcJoAgl1kmDvk0t8EH/cGevNTXa8oDGWjllnl54TZTikfRm7?=
 =?us-ascii?Q?7XdztAc5t3t4CBXQiTf0vtApNJIavNjUnwZtAWWb3n8H3qi2c5l7FwL35a47?=
 =?us-ascii?Q?kKlZl/x61RpGElr/fr48vWnDt3D2lnXM7u6tN1tj3x+3pNWjX+pfJfiZrur2?=
 =?us-ascii?Q?7zTYaXZFiJgaGdyOzuCPNBnmLzUZ1J4xKk3hvnRar1kXeTOK3cFsne9kEIXf?=
 =?us-ascii?Q?ZQRKkU9IAGx9PYHOpYeE7IHY9/rW0jI57jjsW1oEygnLGcMUhdGcCNPmI8MX?=
 =?us-ascii?Q?MdAOs4JllbE9BI9OkvPKVfrwkfAWPyjiSVrl1Uscc88cfh9SJF4dDPwFnljc?=
 =?us-ascii?Q?Y4ED7v9my/ry4O21igyTbNvOpWayqwALuZCiBSMmXkZGW1vQg/iObL2UR6bC?=
 =?us-ascii?Q?6RN7KMFZ+pXPd6w7HUeXlV5PkD81QrRLYr2oSPMq110OnTHG0EAMd6xr57iL?=
 =?us-ascii?Q?25e+oG5nFcQhKGJp8L9O2RFMvU1I8bODEI3jgCefud2tJ7ofy+lR6xcF3Zpu?=
 =?us-ascii?Q?xFwlQv1CNJLBE21k71HffIGXC9EYx4W9RMP1EmJBmS8mpz/ddQM7Q6cdry82?=
 =?us-ascii?Q?g6oSt1LghZnEqn5BXO0z1IqEzQiENDlhvRubczldFA6HbeBR56XRXjX2ib28?=
 =?us-ascii?Q?eMVpt5wPDzVLwMzRATCXRwC8gwnigGIz4QZshwPnC3AbKP907Kl1k01gYtW7?=
 =?us-ascii?Q?+uNSWrXWxnVMTCNz73sqd/V1CT9pdS4gFLSpFCDQo19D82XD7b5IbuZs3ZRt?=
 =?us-ascii?Q?31rICXge6hT4q8xdc8fRsb/XIcvQwp0N8bEjWXrrLJHx7uS+R4IemhEa9ch4?=
 =?us-ascii?Q?c8Lz2LPD34rw7f3+HpIY4nJMSjNcXeh6dsgvcX+/g3qa+qJzXXsyXH9oyxtB?=
 =?us-ascii?Q?46Elb84bvBJDpcKYhhxtwg5wTkz8vCnGPx2k0pqrlqu5cUSu4iunSipKvjdC?=
 =?us-ascii?Q?tooTubpCOqB0lL4U+yVrbGiETOFDu889Q3UFXcXYSeBE8aMy96RRytZFXbQG?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd927e39-60de-44ae-1c5c-08db8eac0b0f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 14:16:17.7023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G6YsGlo4/c839kqsLc3feqbCjCQvncsTXrB1Z4JYwMsBCuiuux1jYT4HCjT1uGhpR7zgpyw9wVOhCDdorR0JtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4616
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
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jul 27, 2023 at 09:04:55AM -0300, Lucas De Marchi wrote:
> On Thu, Jul 27, 2023 at 12:11:45AM +0000, Matthew Brost wrote:
> > On Wed, Jul 26, 2023 at 06:58:01PM -0300, Lucas De Marchi wrote:
> > > On Wed, Jul 26, 2023 at 05:35:08PM -0400, Rodrigo Vivi wrote:
> > > > On Wed, Jul 26, 2023 at 05:38:13PM -0300, Lucas De Marchi wrote:
> > > > > On Wed, Jul 26, 2023 at 07:37:43PM +0000, Rodrigo Vivi wrote:
> > > > > > On Wed, 2023-07-26 at 19:29 +0000, Matthew Brost wrote:
> > > > > > On Wed, Jul 26, 2023 at 03:25:19PM -0400, Rodrigo Vivi wrote:
> > > > > > This might be an useful debugging information if the driver
> > > > > > date is properly updated with a certain cadence. With this
> > > > > > we know from which point in time in our development the
> > > > > > driver was from.
> > > > > >
> > > > > >
> > > > > > Make sense to have this, wondering what the cadence should be...
> > > > > >
> > > > > > before we are merged we should probably change the date along with our rebases.
> > > > > >
> > > > > > after we are in tree probably after the latest pull request towards the next version.
> > > > >
> > > > >
> > > > > does it really make sense though? I think this exists only because of a
> > > > > pre-git era. What's the problem with using the git short hash that will
> > > > > automatically be updated and accurate?
> > > >
> > > > well, we still have the drm->date to fill so we need to maintain it.
> > > >
> > > > maybe we could do like nouveau?!
> > > >
> > > > #ifdef GIT_REVISION
> > > >        .date = GIT_REVISION,
> > > > #else
> > > >        .date = DRIVER_DATE,
> > > > #endif
> > > 
> > > Sounds better. I don't see any value on DRIVER_DATE and having to update
> > > it. Just setting to some dummy value when GIT_REVISION is not available
> > > would be ok
> > > 
> > > 	$ git grep "\.date\s*=" -- drivers/gpu/drm/ | grep 2023
> > > 	$ git grep DRIVER_DATE -- drivers/gpu/drm/ | grep 2023
> > > 
> > > Tells me nobody really maintains that.

Fair point. Maybe this could be used to convince the drm level to get
entirely rid of drm->date?

> > > 
> > 
> > Well I think we should attempt to maintain this, a date is helpful to
> > give us a very quick idea of when the driver is from without having to
> > dig through the git logs.
> 
> I don't see how the date helps with that. Nobody really maintains the
> date as the grep above shows. Even if we decided "we are going to be the
> outlier and really maintain this because we like", then it would be a
> date every .... 3 months?  How is that any useful for whom got the
> coredump?  Once we are merged upstream, having the *kernel* version is
> maybe useful, but the date doesn't really tell much

Well, some bug reports we receive might come from end users without git
and from trees that are ports and not necessarily the mainline, so even
the version wouldn't tell where actually that code came from...

But well, without a good maintenance of the date, that is useless anyway
indeed.

So, okay, let's drop this patch for now... let's move with the other
patch as a fixup at last to not start with an insanely old version?

> 
> Lucas De Marchi
> 
> > 
> > My opinion is both of these patches are valid but let's add a 3rd patch
> > which also includes the GIT_REVISION in the core dump and perhaps a 4th
> > that makes the date plus GIT_REVISION easily available in debugfs entry
> > or something.
> > 
> > Matt
> > 
> > > Lucas De Marchi
> > > 
> > > >
> > > > >
> > > > > Lucas De Marchi
> > > > >
> > > > > >
> > > > > >
> > > > > > Anyways:
> > > > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com<mailto:matthew.brost@intel.com>>
> > > > > >
> > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com<mailto:rodrigo.vivi@intel.com>>
> > > > > > ---
> > > > > > drivers/gpu/drm/xe/xe_devcoredump.c | 2 ++
> > > > > > 1 file changed, 2 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > > > index f53f4b51233a..79b506dc2622 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > > > @@ -10,6 +10,7 @@
> > > > > > #include <generated/utsrelease.h>
> > > > > >
> > > > > > #include "xe_device.h"
> > > > > > +#include "xe_drv.h"
> > > > > > #include "xe_engine.h"
> > > > > > #include "xe_force_wake.h"
> > > > > > #include "xe_gt.h"
> > > > > > @@ -83,6 +84,7 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > > > > >        drm_printf(&p, "**** Xe Device Coredump ****\n");
> > > > > >        drm_printf(&p, "kernel: " UTS_RELEASE "\n");
> > > > > >        drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> > > > > > +       drm_printf(&p, "driver date: " DRIVER_DATE "\n");
> > > > > >
> > > > > >        ts = ktime_to_timespec64(ss->snapshot_time);
> > > > > >        drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> > > > > > --
> > > > > > 2.41.0
> > > > > >
> > > > > >
