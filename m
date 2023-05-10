Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B610C77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 10 May 2023 23:25:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3585310E573;
	Wed, 10 May 2023 23:25:56 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECB510E573
 for <intel-xe@lists.freedesktop.org>; Wed, 10 May 2023 23:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683761155; x=1715297155;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZFoWiE1Hd96OaqaKSoym3YVrmQEpEkvGpOO1Ucsa8g4=;
 b=i6f5DXeuYUtWiLUUv8DxDOJCJxjONZZTeQ4tdmbG737nYdr+lnrmGgSU
 Ipx/0pF2gnRr4smdFuSZZKWtP6nVR0y7FHQPrTwPSesbvap92cHtMjiMf
 AqL1zBbUjFK85xSqjlsGKT7wPrPp4RdeK8HU1uA938/p/aiJuWviXgP5d
 in6p6jDUEGoL2ZaHAQROklrU0OkAQ7eO4+RgH1etkEC48MaEra4q0LUiQ
 MxPpWBxEr5vlIpTgOCuI5WapwzMEGqR9Iho7N2/bd9vQZpNzk5WxATFgq
 ALBfQzTUW6SSN88SsmuOE6CeSqaApjomEoCrJh0tlddRLjZn9SO8GQJnz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="329965455"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="329965455"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 16:25:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="873736420"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="873736420"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP; 10 May 2023 16:25:53 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 16:25:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 16:25:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 16:25:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CB4scTmCFK3nKB5H9esLz/lIh4fXTN+8hkc8wZY3yBIFLBCVcdwNpZABMhhngepdyh8kfwrJR4pqSk1YGz9pDW+6nzXwWFC/pO3axO4IAdvWYGss4auBDQrK4cj86/PUM68u2/azBZNW3Xb2iE4ftAgEz7+3XHhx5GAOqDPCCwfYh7DOATahASmCBpXFUAguY3jom0JRRMyvbS2l45J72h4ytg9aoWmOLXpafxUxtgPGjtmMWatOBnGuiYE+3wACOs+KRXfzif105q0cIRxjnx1oDH2VXtnRcInOSF/zQiPdRBQZgEkT9BkOdh4DtyiSJE+TTwIyLIcFCMCG2h9Yiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eqi3jy6FqgrIdSGu6h4jdwHciF9F+ZhzCa+KAAZdpf8=;
 b=khMjfdNddO5NnbqQelWg4MUry6ysKbY5ntQwePHghL4W1yDDxqH2Hd2Ncy+jGFHLXecgkxv43mtBqK/8hBzvcyI25IKJYd7TArc5X/ZKTg2I/h6KC/rswbc1m5E32RrpaMNALiMqMpLq7WWWDxsDNFJEPtIk2QEi9zZf3ZxmU7Igk0+JiHBVg1fia6ePE+Upb2sFW6INxjQZO6PbU48ZRv/O8W8EJhpnTmVWaUdUUnJGNcDQ5lXKIUq8+ZZYzqkhCXUL3HD8OlOnSUT/y24w5zRR62tXh72wnc1Vt4HSYxEIoRJF8wBQnqIndcCqol/tZH130fMVI9GQKZikhDQ/IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8398.namprd11.prod.outlook.com (2603:10b6:208:487::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Wed, 10 May
 2023 23:25:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6363.032; Wed, 10 May 2023
 23:25:45 +0000
Date: Wed, 10 May 2023 23:25:05 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZFwn0RGYdN7zFjWo@DUT025-TGLU.fm.intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-8-matthew.brost@intel.com>
 <ZFVNqF+iqsN059E3@rdvivi-mobl4>
 <ZFhLejusrFMU3dIk@DUT025-TGLU.fm.intel.com>
 <ZFlrAJI44mbZcq7X@intel.com>
 <58a2affd-fb1f-f703-80f7-836bf2a7e28b@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58a2affd-fb1f-f703-80f7-836bf2a7e28b@linux.intel.com>
X-ClientProxiedBy: BYAPR06CA0031.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::44) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8398:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa1e83f-ef9d-450f-6aff-08db51ade111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ++SEa3yq+I2Z1078fZm5cLzkUsBhLDPAQHb2Eu8Fs6zyvSrgzFWULdiYdhBnBm5WRDoTL0VAkcEMJ0c1gd5L/o72sJLHSzA3yaELj8SRW7i5Kj33lmLG111mBnBXtxsBKk7WbsRiUr5QykCflEkajDH+mn8sTLyYsbQnnOwfi0nLtxb6sXHw/BaYNDlHiVsNkz9VbUbqy47fBF/TCRRmwsMFbW1rZCHz7vIbc7F5RGVoahC64mva+TQy38/8aFyl3wJIrqm/XLoWzAlWPK04dkb9/ruUlooX3zNS/NLrlt3barLBmRhDTSX14Yju6jSIxy4tJO2npNqSiEHIqI2VAzNlC08l0HHCRTGnPo5bnekrwivvxJDyawBAEeD66XRoL6fAP5Qdc2SF8zgdQBFfmMRc4chgAK+3zUlhbJ7tUxDCRZxHEpfeLPi5kX3dQrUn0Evb3JuSls2SOO4IviOhNI1QaQzYQlzj7Ww4+sESfiPQgjvhc8wGuRG60RwNAQixDDFYgnq+s5CgShg+B0mv3SMPqBhvnT7qMAzxK0FhEeFYljD3xlR9Z6k0yZCVttcH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(6486002)(6666004)(26005)(66574015)(186003)(6506007)(53546011)(6512007)(86362001)(66556008)(66946007)(66476007)(478600001)(38100700002)(82960400001)(83380400001)(54906003)(5660300002)(2906002)(44832011)(8936002)(8676002)(41300700001)(66899021)(4326008)(316002)(6916009);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uX4hy2HKCUh9TNAmH7odttDgnEQjHICAzg7+Hb2587skNlSUugfvF3CyHz?=
 =?iso-8859-1?Q?//HHrIo9hpq53SuwuYckBmvPmMXoyyLhG1szslaip73eCwooTg26W9Gxmu?=
 =?iso-8859-1?Q?zMtx8dkYh38Px76cNAzH89pRAIUxjr5BoD9XlFoGdZM/YNjzM32my0oafp?=
 =?iso-8859-1?Q?YP52nSdfH/6vDaHDNSV2/RUabZBl3e9vU6quhYWgdyKKce642+BN4nlZ0M?=
 =?iso-8859-1?Q?IOQTjI1PoW9GSxuuswVhCSLjpsdPS3Nq18H+/QAELaS4JoIctB/VO26AEa?=
 =?iso-8859-1?Q?JajP6kRA1ocgKVhY9msHcbksUVzlw9uKpPf2HAGrCBPrRnoV8UEnIStwHZ?=
 =?iso-8859-1?Q?ZX395P0hRmx0n4CnHO/gNUmUiWZwo5/cmzRZ0BxXX8k4DHMrGlaC/sh9KT?=
 =?iso-8859-1?Q?FSlyO08/9B/NWsv/Kan4YpMg7OQdjRDA+9trhxZIM+MFu8rowqnYG2x+H/?=
 =?iso-8859-1?Q?IYWP7nnjYUk4LQofDrAN++jy7VhbsnW8TMWrRfRQ3PJXCKXUGHHytkmOfF?=
 =?iso-8859-1?Q?+0ZK0HspnZzJ5vGqrS0IRUE18/aVV8k0/iLgS1oN0XhEzqrXlWfFkKIUaw?=
 =?iso-8859-1?Q?iIJjApPvZ1GtEawrpbuKeeVtOJre5iBxMke7YNyRWIngJeyzjwkj68P6JR?=
 =?iso-8859-1?Q?DDj5sxUnpajK1ALdF5shQIiQZi3Y8lDOQE0kYNqk+is3jh+/5VcLgQrsR0?=
 =?iso-8859-1?Q?jz74dN44bFPRClHahZSlO0LaJDDTLcqwe8So8ELY+g+XBE34C/8V44OAOc?=
 =?iso-8859-1?Q?uw8QLoLJ2M0uM9Mm2NzKbGRrF7KaGYNoekIIxh8xTZBB+IhiAZaCdUxQQZ?=
 =?iso-8859-1?Q?lEN7jPwg2Lv6WoFAXBOFDycEMnSoy86MLuds39JQraHBQ+xLIIJdjFduGj?=
 =?iso-8859-1?Q?TpzA/+57INW8DntfB/Rs7G4AdPZs/bDaZsQrh/rNMRguMXVVaoha7l9bYz?=
 =?iso-8859-1?Q?cBcFwu/o/D0MoAKjmdG9WJa+EA2yX1syzoZJ3+zxiy1Md4iRUUGEt+XUo5?=
 =?iso-8859-1?Q?0jNwFXkKi0+ZttMyikvJpfuuXndiVJ/YIeQVfkxFIIxLa1lXEVBwkogxea?=
 =?iso-8859-1?Q?Zdn/LZKh+V4BlDQICNTud0CrHKoNWdhxsBxhd3p8+CYO84c5TNP8gpeLL7?=
 =?iso-8859-1?Q?L8vjiYTjN2Dvk9KdbZBYFwOhELBlt8ydmmTAX+HQbE1zpbgKfDP5p02FZF?=
 =?iso-8859-1?Q?6RXCvwz6HorMhKPSyDM3HQFM4MMyQAKbydsVI8LF+P8v2JEn7IZNYTHrq4?=
 =?iso-8859-1?Q?EhucpH23CK/rvRLsd84VHNHa+xeY50JCrQroq6QEBNdlT3EddQM5ZWD5sn?=
 =?iso-8859-1?Q?Nh4XsaZFVkh7i4dYBBrnd0oSO3rHwBQXmBhIP2zG2ZJJtHoQJajiTJzYSd?=
 =?iso-8859-1?Q?pVEIFWQJwYj+jOe21hIkXfZs9c4eWwJId4Cd9FLWOaYCJfDakgCBbHwZFA?=
 =?iso-8859-1?Q?qoCGfZegyO3lqNMtGGM9ra3j1KGoLUB4C2wNeuQ3FDCRM7KJOqpkFC1A8z?=
 =?iso-8859-1?Q?dhwRJbpX56tC1toTh9hZ0qBQYQo7E+hg/JGBGvVjGDOUaxtwxFv+045BvW?=
 =?iso-8859-1?Q?4M0gBGTdw43gFyMJr5/YueQy0rMx5DjSrW2hfl2hIdnvoww3jiDr2egztX?=
 =?iso-8859-1?Q?P4KmKOl5hmV33Nq6BANbQj8aOFfxVQ9DG5Xus+JkfWTMJPSzOpXNOm5Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa1e83f-ef9d-450f-6aff-08db51ade111
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 23:25:45.3359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/ChKdmpmtgyi64Nis0jHUkyqaWwNQlmGKsRZQEkIkMZQangUnkurLxmxmDkoaMOOCNe+sV2y91HrgeyeMyL3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8398
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 07/31] drm/xe: Only try to lock external
 BOs in VM bind
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>,
 Matthew Brost <mattthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 09, 2023 at 02:29:23PM +0200, Thomas Hellström wrote:
> 
> On 5/8/23 23:34, Rodrigo Vivi wrote:
> > On Mon, May 08, 2023 at 01:08:10AM +0000, Matthew Brost wrote:
> > > On Fri, May 05, 2023 at 02:40:40PM -0400, Rodrigo Vivi wrote:
> > > > On Mon, May 01, 2023 at 05:17:03PM -0700, Matthew Brost wrote:
> > > > > Not needed and causes some issues with bulk LRU moves.
> > > > I'm confused with this explanation and the code below.
> > > > could you please provide a bit more wording here?
> > > > 
> > > We only need to try to lock a BO if it external as non-external BOs
> > > share the dma-resv with the already locked VM. Trying to lock
> > > non-external BOs caused an issue (list corruption) in an uncoming patch
> 
> s/uncoming/upcoming/
> 
> Also it's not clear to me how this could fix a list corruption in the bulk
> LRU moves? I mean, if it's a duplicate lock then it gets removed from the tv
> list and not touched again? Could you explain the mechanism of the fix?
> 

I had my head wrappeed around this at one point but now I forget as I
coded this one a while ago. This changes later series (drm_exec
locking), so IMO not that big of a deal merge this along with the
following patch without further explaination but if you think it is a
huge deal I can try to figure out what the issue is again or another
option is just stage the LRU patch after drm_exec.

Open to whatever but prefer to leave as is.

Matt

> Thanks,
> 
> Thomas
> 
> 
> > > which adds bulk LRU move. Since this code isn't needed, remove it.
> > it makes more sense now. with this in commit msg (but with Christopher fix)
> > 
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > 
> > > ^^^ How about this.
> > > 
> > > > > Signed-off-by: Matthew Brost <mattthew.brost@intel.com>
> > > > > ---
> > > > >   drivers/gpu/drm/xe/xe_vm.c | 8 +++++---
> > > > >   1 file changed, 5 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > > > index 272f0f7f24fe..6c427ff92c44 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > > @@ -2064,9 +2064,11 @@ static int vm_bind_ioctl(struct xe_vm *vm, struct xe_vma *vma,
> > > > >   		 */
> > > > >   		xe_bo_get(vbo);
> > > > > -		tv_bo.bo = &vbo->ttm;
> > > > > -		tv_bo.num_shared = 1;
> > > > > -		list_add(&tv_bo.head, &objs);
> > > > > +		if (!vbo->vm) {
> > > > > +			tv_bo.bo = &vbo->ttm;
> > > > > +			tv_bo.num_shared = 1;
> > > > > +			list_add(&tv_bo.head, &objs);
> > > > > +		}
> > > > >   	}
> > > > >   again:
> > > > > -- 
> > > > > 2.34.1
> > > > > 
