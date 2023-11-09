Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B72C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 19:06:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E8A10E22C;
	Thu,  9 Nov 2023 19:06:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70B110E22A
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 19:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699556756; x=1731092756;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UTr0QpO/FckbYhKIRk5SYxixjlSTyY9wZ2hMVrW0KDk=;
 b=JAsCDC4uOKa2S1T/XYNUU8zjBfZVAV5wV10COFTLlO1AAlMkXuB0iJdS
 O4CmuN8DkTJkbu5wDttlkhfptUe7VFr8BVU30Fqd9XcxkllP6jZXCdU9P
 VtZTkUYG4fbJc9N1BWch9F49hjCuht8sBTI4UDa+FBYUqwmFKpa7Rli2n
 KfgfxKAocQQ7Psvkl/GrZxQvIHu9f6YCrCsjyhUM2uDXcvTwkRty1q0nK
 inz4oVXVvvQs6jUnl+l6WjFSpiPcEV0jAd3CmWuZ4xFA7KTHfllvAHOUY
 Wk4JNQpQme23+aJ2E+gsiVFgwwbGpHqJ2bsJYnHeKdyuXsz5EBzXhL6qF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="375096419"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="375096419"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 11:05:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="792643167"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="792643167"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 11:05:54 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 11:05:54 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 11:05:53 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 11:05:53 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 11:05:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvOraFJ1xHAVJz1cZ7UY1RjXymVQDfjvt04wWndGfMsZBWb4wGmB+rojaneSayQMHpEPLvIr1nu0b8Mz+SmUQdQ9bYoBnhHtm25ZZXZ1y9ycyYZa2m9UwKGPDvvzg6tko0p4LWpdfNrCjkajCXPmh+pUUkik5GSiLwP71kd/OkQlK5xYJ14k6LeAr62XsbA7oZGaUz4nKkiSkrox3MVARHU7J6Mg2Y4sKam5arp6DWLsM9Spm7VGemG1UPNiUanL3hu5qw3I9P+4OUgiNoLhg+3GpsYaeOWEFFcHr+zzrssDz9XDkYFq5Ex9gFhlBrkk9iGQ2V5x4LOfMco637a41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MebO+LcdjUpC9U9+qmKdHS4MQ2Bl7LPtYdzTqjqjz4I=;
 b=PTiLPtOlnUUMpSXpozVYdQ4Om4iHMWlY84VUvMY+UL+z9w9homnltaGwKasQTaBM4LuAPr9B+1MfS1FixWufWdGd2wBKHhkfVAYvwsG/3UNN9Q8oW+fklrLcWRd74xR96Y8NohMeK+8OelNC4PSAmJUpR81V7k/5BH2CR/beFNSaWulx+E7wGH7y0Q+TrDZQ+7/BQe/oh3xKajrUGKjeZdsbWg2G1aMzxyfgNGnW3igfXJEXvLQc7PS+sI00+DqHgJP3a0TvVVKaPRtdikkL42i/HojyCVOPpNyI5jXq1qZN5ZE/9ENrOezFyXGE5ghQVcrJga6cleZgnGaIlcJLLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB4848.namprd11.prod.outlook.com (2603:10b6:a03:2af::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Thu, 9 Nov
 2023 19:05:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 19:05:51 +0000
Date: Thu, 9 Nov 2023 14:05:47 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZU0ti1gWz4pQppDb@intel.com>
References: <20231109154457.7-1-francois.dugast@intel.com>
 <20231109154457.7-34-francois.dugast@intel.com>
 <ZUymje2SlXQuDzH3@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZUymje2SlXQuDzH3@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:303:dc::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB4848:EE_
X-MS-Office365-Filtering-Correlation-Id: 020ca357-03f7-445a-4c27-08dbe156e3f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g+CDYua7TwnlxM1Dsk9Kbl8rGZoyYN4w2aMx7XnT5nCwSm/vp4CD2LLSCXVg+zKjNC3jnl9om9VuaCa2940NcV9dJ9kpje5ESestieIJM/Jqrpjlqmr873gOGtFBSqRfNoYFxOT1bqqVYNuVYbdAQTyh8otq+WUVg9BfSK+ttXDAUFszDd9pCUM2DpKrLYm5iFVdAK5o0m1o15NjCFjW7YyrKMQbr2sq+Qf0RTW3A8/bg33vAEuqWDyNdhM/Nk36hkooqjpeTnmvq4Fj1009QcEH9ti/Xy3hnObB7fgOjnjrE39QPVkjsVw92US7kt7uJbGVvGUT43+LK7CO4N6Yy/jjXguOwNS/PppQsF63WEU1Ui1oqKEEXOO2jOpjV0DZjXVrzzwvQoOahOGvIBy7ZqzNXollp9vDQVVQM0zwjFIDjQEbQdeKzWHdKrGJTf8LRti0dJItWMe0nWsGwAl3fvCRqcE+0bO0sDJYqj+DrG0QkSUVeRkY/y+rjnd45kxjmXCSmk30cB40dO04VosVL3rPCxNmE4Zoo8k90hHhweJYx5aKhDPikuXTYASldga4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(346002)(366004)(396003)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2616005)(6512007)(2906002)(66476007)(37006003)(316002)(6636002)(6486002)(26005)(66556008)(66946007)(478600001)(5660300002)(6862004)(8676002)(44832011)(4326008)(6506007)(8936002)(41300700001)(86362001)(82960400001)(38100700002)(6666004)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xz1zPiUfAwF0Mq3EY4Av24YqWX2AnO0uqFlsR8M8qsmaBYXFHKLbFtB00yE3?=
 =?us-ascii?Q?4vGHaDprgoa4/gMCDpYWZ5Bk3q04p7SgAMS1/0HXA8KN53KkPM5BHUEwYwFR?=
 =?us-ascii?Q?kIAb+SOr7BkyE5EYc0OVfPwpYWOa1HIhvljYwZquBFqM0a+IiB8A93Z24fZU?=
 =?us-ascii?Q?pC9dG1pshnV2FlBPJSmr9KN89o8GI3sGANYtrKKgx4ho1DsiZngygQtykrdE?=
 =?us-ascii?Q?6h2pxhbEgfd3/cZTehvdjhc3RaskuFn+EvgtLYg4vAGYJjcFbdqbK0xMHDT7?=
 =?us-ascii?Q?dJDNfGr+LevC/EOWYsU6o2+Mn9DprQNUihLBpfgAT0RKJxnAzsdySbWVeanz?=
 =?us-ascii?Q?PhDcsJZsy58tiXNO15bWyIZb23Jvqghc8i+eoEyEebKjnl0ORZ2WCINT754i?=
 =?us-ascii?Q?XLIWV6CbXBPA1vpdDA06IkK80tSwGzgKrEZDKJMl+g0TpLCmh0PaEmDKvgKU?=
 =?us-ascii?Q?V1UVnAc4SOvknRiKnt4vCjgBqUhNyZWrrDRbFN0IC7YCgwdul5DkKh/1TN0r?=
 =?us-ascii?Q?Br+0CHrJWJdpWEoe/4tzPbK1HQQtHJERo8Pu8gGDMkIeIwTW27IwGZrBLx/u?=
 =?us-ascii?Q?A7ovXwoIaDVnuFK8Rdo8CPSUGXDUljtJodO4dsvR+5ym+2CE/gCd0mUNavzl?=
 =?us-ascii?Q?x0Tgb4vpbZHVQKhuQq6xp4BCHf5cNBpjB7pi58ji/bRxoXJk0kdU4vGvmwls?=
 =?us-ascii?Q?3Wni5Y3o7+FMj8dioVIbjIXJTg3OaU+UNVu9grhJIhdKuW8tvOZFK5cqIp43?=
 =?us-ascii?Q?UQYmPNFStHxH6NkwF05BNUb7WHMxIJE39K7cojTmAxWvBSDsAqSgceJC+JoP?=
 =?us-ascii?Q?OJB7Z/fXcQBn27NLdRCIruOKOaHR4V4qu5Ps9/iSCh+aTFF2Z4eqUN0GXhI+?=
 =?us-ascii?Q?Wq2oyKwA7EPvGm+Rinm6Fg7nlRmY7xnyFjhVaJBexAD3y1CzcLhPdEaAM7P9?=
 =?us-ascii?Q?/KV5M0AoE1l5PatG1+Du/KbNfU62hl3SHk2eVd/PXRtVNtvHmqMk8N50jy67?=
 =?us-ascii?Q?dvuZHLbQsJKp2MbPs0ylCe41z1eW26V1eMidmuVFsqlxLpr2oTD1j+bWH9mU?=
 =?us-ascii?Q?DL5eODqSGjQcPKsIqBd6Kp/Q7cnx4TfifiwAjPpf0nfaok2Tas3UabEGMHkC?=
 =?us-ascii?Q?yNQNn4h9WUSgddPrIDUaDk9qu0uotHaz9gnGskBP5bxkgcUCz/dGj4OhggB3?=
 =?us-ascii?Q?crJzpbx9nd0jsGcM9HvEMBwPilTSRXQ/ikOrSvAf4k6Tu2rXu/tLhgGVZFvc?=
 =?us-ascii?Q?AR7d1T1/6PtUeCjZK29zIzbMwvB7T8541NGp0XgUl/VFlpgGezgFJM+dib2L?=
 =?us-ascii?Q?YpkbMSxVYa2NTwOuoY8sqHAu9J5UPqKB8DO63O1ZzrhhtcpR7kgUwt+rY0/a?=
 =?us-ascii?Q?h63T+sSlVNi4IaeS+Mq67p+MRkZAqw08XpTSzvhDOnyTKNCodbZ8So0SZqca?=
 =?us-ascii?Q?ZuC6+0/J/034SBq4xrQkV8fgbGNyMvJ7wJFRrXX4RaUTyHPK61+8DrOqj9v6?=
 =?us-ascii?Q?adBRN4JMzvBH1gFm3EMz6Pm2hKP6cPXf2nu7mpXcDhcfG2usase/1PWMiRKg?=
 =?us-ascii?Q?fA0OdKaeOPjyl4uJM1D4Dxr7EdM1pHwfG1mfVyWJtRSKR0X/sAcDkE1Ew1Vs?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 020ca357-03f7-445a-4c27-08dbe156e3f1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 19:05:51.3103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7sm09RC5D3fQwXf/TBF3i94ewfWJHMelh5B5SMMaS7gVg6YdMSkZkZS/gpUh4TFgn0HJ8fsvtkPdqDoxQHaCfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4848
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 33/43] drm/xe/uapi: Convert tile_mask to a
 pt_placement_hint
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 09, 2023 at 09:29:49AM +0000, Matthew Brost wrote:
> On Thu, Nov 09, 2023 at 03:44:47PM +0000, Francois Dugast wrote:
> > From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > The previous tile_mask was also an optional hint, and only used
> > for the page-table tree placement. However, it was so tied
> > with the tile concept itself. Let's clarify things up and make
> > this generic enough. So accept any valid memory region mask.
> > It could even be a direct near_mem_region gotten from the engine_info.
> > pt stands for page table.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> 
> I thought we landed on converting tile_mask to sched_group_mask?

my bad. I had forgotten or misunderstood that...

> I do
> not like pt_placement_hint at all as I've statede what we actually care
> about is creating mappings for exec queues. The sched_group_mask is
> still a hint basically saying at minimum you must create a mapping for
> these sched groups perhaps more. The driver is free to place a PPGTT (or
> multiple) anywhere it wants to based on the platform.

or I might have changed when documenting it since on the documentation
it was a lot about the placement of the PPGTT that was what this was
doing and I confused myself.

I believe with your text here as doc the sched_group_mask makes more sense.
Let's change.

> 
> e.g. On PVC we have two scheduling groups, and two PPGTT (one per tile in VRAM)
> e.g. On MTL we have two scheduling groups, and one PPGTT (sysmem)

