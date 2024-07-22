Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B53C3DA5D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 08:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE86310E415;
	Mon, 22 Jul 2024 08:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVhD/d4c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46DFC10E415
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 08:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721637116; x=1753173116;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JovVwN59cIMq9AuZ4Spp/yiHc29xXy1uFWrKC1Ubky4=;
 b=ZVhD/d4c/AsMUd/7RZ8vXBGF/MNDk+xwTP4cezOa1arGjE49FBGTsLKp
 2hnMELivOUMbnksk4ot7tDhmNcCwbNTo+YeTpXuoB12IXJQ6mYUEMhcje
 qJHGt6tHqv07duoPf1D9Qd86t8Olq7MHbc5pXpFJgaTH7WtUqgc0uqVfp
 5vbXGEIT9gjMra2AqFKa6BMH9cEGskuyhWLKFqbHhJi74IL8C/3PB1w5A
 H99rinoNjWvwjrei1LfvR1QWq1Xv/Qulhjjbu1iVU3E+gVIjeu/ytICXi
 032pBKrWpquMrAU9k9tmAg2I157Yhs39ay5oTH/T3zg2F4fHXN7jhFDnC A==;
X-CSE-ConnectionGUID: aduplewrS/uEy11hvvkaUg==
X-CSE-MsgGUID: EBci7MQJT66ht3QFx8VGsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="19041526"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="19041526"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 01:31:56 -0700
X-CSE-ConnectionGUID: i/desW7ERGCWGOUcCLH6pA==
X-CSE-MsgGUID: O08vIO7kSmqDDUwT4hcGXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="56667850"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 01:31:56 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 01:31:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 01:31:55 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 01:31:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mG7VeOhi4K6hGbYI6xEdRES9JmeIbXs90xjOlInmI5Nnzz9R4Pyxcq68CSOPPRqUkRwVJJO3B+hb3YInrx6dLa8UtNMit/bcQRFy/46skho0V/bv/jLW7oklYOG8yMr4QbphJJlnSqkiPi5qXl8uX001JjHYsMFT1i0jxZOEAndyascnFE/73G0xSZ6NS3Lz3QwJGeTHgGplM+6KZbxutNrDUDB2rjTf7q3qN+1BmhC8P+bi746lOPEOfRYvhniazBL3Fq/oLFk/edQymxbh9acLTtBZnn9xO3XUACIPsUUxp1NQ8daQXKdns457g49TNE45vOW5n3ppT6YWRj9uLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AnEc3ZEnOQKOnNmiTExde22xLih7MGhrrkig9X+65E=;
 b=iy2zlk4rWKaVsFCwE69/HlCG51CvvaXYp7n6+8txmv79Ruyn+bHp1yJNIRlOE4lCW99YcGW/N3gqC5KWE6lmWi7x7mYL6i5r4kGiwnAazuGfhLVInpIeYgSNHTY8fcFDC5gulb9Ho+karN5dy07l++Ejnrr66HmO1Fqhcs4DVrJ2M2jkO0mhkUPVeH36NWtVyfi69In0glfk58TKV8yyKwQIPEINZTq+0x2jM9Jpx6o4DCK7SyLpIi0eJPVb21bllCijuKgcOGLQbn496VjaOMQXbwcqznSx4FwjtoMCQu1B7NIILyn5V6eLwnvmi9S6cdrBx0Negn6f1fbRzASzgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA0PR11MB4558.namprd11.prod.outlook.com (2603:10b6:806:9e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Mon, 22 Jul
 2024 08:31:53 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 08:31:53 +0000
Date: Mon, 22 Jul 2024 10:31:49 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 3/9] drm/xe/hw_engine_group: Register hw engine group's
 exec queues
Message-ID: <Zp4Y9ZHA51INVtr1@fdugast-desk>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-4-francois.dugast@intel.com>
 <ZphRcXT8IkwUWBOW@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZphRcXT8IkwUWBOW@DUT025-TGLU.fm.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB9PR06CA0017.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::22) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA0PR11MB4558:EE_
X-MS-Office365-Filtering-Correlation-Id: 33f83fe4-4dc9-486a-094c-08dcaa28bd44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x92zBKMa2Ohbv7+iYKiJ63pWuYbmIteWy/vawa4TdO23lCRRB6zXaD7Ezk/5?=
 =?us-ascii?Q?bgsFH/6gE0bv8cVV7zPAbxfMoBEqvbNKrthnMbdNVUhoR42gbrakosoECgLJ?=
 =?us-ascii?Q?EkWTDKTE6jHLjw//6J6jA4nD+jkMfQrxrLlrMOkoXlkP0V33rJgw1h2iwVvM?=
 =?us-ascii?Q?yCtOGF+PaDM4/2mDIlh9WEIUBuvEerMfsxQ5jNRGXx2RqOXhULaHAZ93PXap?=
 =?us-ascii?Q?BdRcA90QYn7WC7NfSHaI5X17ik/iABeehqYOUD0GLbxxOHtKQ9t8RORiZ7+Q?=
 =?us-ascii?Q?vnhVlyVf5SASaMLa94gI+K9hqvu15MbySke6zqMR2o4ZL2uDpDFEwOVj047T?=
 =?us-ascii?Q?+3IvE66TBeQmd7FelC6T5SCqrwjVfHWrGdy7pr1qbH0r/iPmvVdJa1jlMEOY?=
 =?us-ascii?Q?paUF6M6etYmkvtbrGkt91QahI5Id5T/sm+tboOQH/7Dxk4uSHI+Oal7N6I5E?=
 =?us-ascii?Q?Nb7tLPYzMPYAl1CaD1RzFke1xDRajnjW71e2CTJJceZY1TwotxFxelVNggGU?=
 =?us-ascii?Q?WflA2zvvjxWOQJBmIanHCUj8hviTxNOLBj2CISmgLqvDOk8mmAN06mV7PtXx?=
 =?us-ascii?Q?nA4aMU8CAG0K2SKQtKVblZ2pdX4shw+KrIdtV0mO6mhomkHujhIxLIPROMYg?=
 =?us-ascii?Q?unbLNw8kw3l7MBNenzrfZ5ZIO8ZRrfz9MzgoKsjLz686slSn11ymgCAplY0p?=
 =?us-ascii?Q?Dycv4WIwVdl/Tf8vwR4AlDuR1t200crGkvwKRvCTusS38j7sgoQZClKHEeJQ?=
 =?us-ascii?Q?qJIuWri0Rii3Pw3JkQnSxi21DLWtbAYC/wB+bi8mpyG8/W63X3qpu7i1siXP?=
 =?us-ascii?Q?TbJhsa4VPww4DCb07SvNmXz1W6yPlapJ1nbCCTVPIAd92zwb2NPj81ZkIorq?=
 =?us-ascii?Q?1iEnr6QagbUBpEK//FrwETlvOZ5tP7cU8HTfT/8YfFYTwfQnPIHeb9xT7529?=
 =?us-ascii?Q?/hY5OVlmV4jBzYC+auUBlZCzF6LY3Rz/L3EeoT0SFbDqYO/Q3qGNU+yvvwkv?=
 =?us-ascii?Q?oH2lKEmj6gP3M3GcqIwiol3cRZlwxYm39aeWVekD9xFOegIlszwdP8Dt3862?=
 =?us-ascii?Q?sCxMegKumEQvTd1p/s3JffgZ4HH1ePkFyO6DU5ckupFQu30jn3W3avR8N+oU?=
 =?us-ascii?Q?YmCs5YF9+H94RmmNhy3is6iduL6fbQ+ncmLoZnERHh6ELeJXplIO1Epn5Z55?=
 =?us-ascii?Q?VVwBaqJ3eCuQ8sxWS90FDVcxG9qURYEJ/MjMWN1RXjLcWGjL+0GguCZO42Ou?=
 =?us-ascii?Q?nFNEm7tWH88NvxBlVSapkoV3BkUyvCzw6eiXvVOYH5Hcc0Uof2UYUnM44QzB?=
 =?us-ascii?Q?LYi1sHVmBKRfyarrq29rI+YUB1QwIo598/ch6aJTjGK+aQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mtthVQAtQtoSzJAvM9ClL3UAd09z0fDgWApDhQoAzdsh+Nb0g4gl3NqwVV53?=
 =?us-ascii?Q?O4v+yUSjA60fPtPGF0j29AGQojQ1MIjGJ/zA5ODywmcMle9YM2fRVAFGC/vF?=
 =?us-ascii?Q?7iJJESNg7sef7YpYpL3UcmjkTRpj2HKBzJ4IDjQ/sGxqBPZ/4P5P1xh5GHd2?=
 =?us-ascii?Q?UNIpdGxA4oZABHZx9xrvCgeZGtAabw8zbzNNh5epW79QLzNqm75X4lybAeMZ?=
 =?us-ascii?Q?DqbdhL5RgYoAMgQkDCo5SPi6I4eA0kk7X0mn0lnMWBKEwBS3Ze4PhoVMg1nY?=
 =?us-ascii?Q?dufSJJuq7o91ARXV3mFOc5ntgai7Oiej3I04lY7Z4trxW9QGGwJZxu12K/Nb?=
 =?us-ascii?Q?YReh74FwPP0kSnI28qYkuzdxFU6U1ePFaT5zw//f/WHCkj3Ip8aYHjdjmO4M?=
 =?us-ascii?Q?H+OxBPiKM8wyV7WhmWQrig4S4FEgJAXWym0Nhd9Pats84cTLN5rocd1f+/xr?=
 =?us-ascii?Q?vzjmCQa0L7tq0k6v/DP06MZLrN7hG+ckIEthab/JnHmutcvnCW4MVzRU3XMI?=
 =?us-ascii?Q?DrsDTJvzX/J9cz8XBSwvdjde1ibqhuLXlcdWzrjUhTD/cbdoyaLKJNeJ/R1n?=
 =?us-ascii?Q?DeK0sLrQyT80Ys8yNwYbisw3MLxnVZv0ozi/M46qb14nLw6sf0ZWg5RM8i6x?=
 =?us-ascii?Q?su2LtUmWVC8BoZkPHwDvOO14Lja4pz9p8E8HJZGQLIuE442+bjjJL4vTuOaI?=
 =?us-ascii?Q?Tt8v3ZZP+l6bZuFFPaXwl14LX3qeiMZR4GC95TQp6JqL5+rLxMzfex23dGOc?=
 =?us-ascii?Q?Wddhfr4k3+Q0dVzRIbCTlsqOthgF2zrcdnrrVjXGAsPkyXLJaHjeXjQs1MRn?=
 =?us-ascii?Q?+01JmUYB0YtjDjB1VuWCyq8JK9VGPl9kJa4ROHqQK6eYOf+LEEzVpW5c5BUl?=
 =?us-ascii?Q?kHxwGCGL0vUHhC6gmb3WwBwFN1ta0Dw5/9X/A39IGNoyBdWRYnGOGj+By9Tn?=
 =?us-ascii?Q?OJmv9QDrJ7Qb/IoTUhq8zWSdwF0sSYAHqeR0ZXG3CIQSydbReP6re6RoMhDj?=
 =?us-ascii?Q?aUi7aXpx/D9mqUKQzcA4ZTD0d3Ei/rNID2Bz91rRjj6bhemOuEA22pcTji5l?=
 =?us-ascii?Q?Bpr9YPGGLHdKA4coiOQ6kpWlpoU9pID/0GlDmNdncMcT/+F4cy4ZzmVfeu28?=
 =?us-ascii?Q?qHeXSqFqFxr8TzZE3NUaHZwSPQlpPBYew9ktGL6+t99mdfe6WSLbXlmmyACG?=
 =?us-ascii?Q?4qHD85NXptejesW0HXckLOTNnTatmtHFLPJB6Ev3nTIPPgiAxmqYjuWUdrip?=
 =?us-ascii?Q?Rk+Y+k2GDy/TR71DfvrvEh7Z3MWgSg9prGDVfw3//hMl6ahH74jUtP2cIfbs?=
 =?us-ascii?Q?pJZtVUM/yi9HmE59JhP+VOrv3nL2TOZO3ZSQ13L9UBEmamyLK//7BaC200AM?=
 =?us-ascii?Q?DcaiH6uDiPqGEiK20oaZw4bEbE8/oRuKlrvWpO+zrIzRlJ+N8blJkgomnp8w?=
 =?us-ascii?Q?ggX+M3JrTgdlSISd8gCdbB6BXYja7zWzRDpzozfZ90sB6i8qUtqeoCkXszdr?=
 =?us-ascii?Q?11BOXFtSjCqy6krxKTEu9qTVheKM4AzmmZm8t/v1T0ljNVZ56jeIX0nqrsbw?=
 =?us-ascii?Q?73KizJjBqCfKXrDX+2OjvvPugdbmKhGL9Ck+2/6vW/DC7E6gyUzpsEcbS4kN?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33f83fe4-4dc9-486a-094c-08dcaa28bd44
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 08:31:53.1864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZMkqw73ZY7VCd5HjbZeagOZbv/1J5dgRnxhz4Z7ALL3gd/eNSg/wzV0D7HBz+TLv7c6cl9vtJ+pYH0ercF8BO1t1RpMietrW6ocg++kfPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4558
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

On Wed, Jul 17, 2024 at 11:19:13PM +0000, Matthew Brost wrote:
> On Wed, Jul 17, 2024 at 03:07:24PM +0200, Francois Dugast wrote:
> > Add helpers to safely add and delete the exec queues attached to a hw
> > engine group, and make use them at the time of creation and destruction
> > of the exec queues. Keeping track of them is required to control the
> > execution mode of the hw engine group.
> > 
> 
> Ugh, missed one thing.
> 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c |  7 +++++
> >  drivers/gpu/drm/xe/xe_hw_engine.c  | 45 ++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_hw_engine.h  |  4 +++
> >  3 files changed, 56 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 0ba37835849b..645423a63434 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -192,6 +192,9 @@ void xe_exec_queue_destroy(struct kref *ref)
> >  			xe_exec_queue_put(eq);
> >  	}
> >  
> > +	if (q->vm)
> > +		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> > +
> >  	q->ops->fini(q);
> >  }
> >  
> > @@ -640,6 +643,10 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> >  			if (XE_IOCTL_DBG(xe, err))
> >  				goto put_exec_queue;
> >  		}
> > +
> > +		err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
> > +		if (err)
> > +			goto put_exec_queue;
> >  	}
> >  
> >  	mutex_lock(&xef->exec_queue.lock);
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index f8df85d25617..4dcc885a55c8 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -1178,3 +1178,48 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
> >  {
> >  	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
> >  }
> > +
> > +/**
> > + * xe_hw_engine_group_add_exec_queue() - Add an exec queue to a hw engine group
> > + * @group: The hw engine group
> > + * @q: The exec_queue
> > + *
> > + * Return: 0 on success,
> > + *	    -EINTR if the lock could not be acquired
> > + */
> > +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> > +{
> > +	int err;
> > +
> > +	err = down_write_killable(&group->mode_sem);
> > +	if (err)
> > +		return err;
> > +
> 
> You need to ensure exec queue in fault mode as in the suspend state if
> the group is in dma_fence mode:
> 
> if (xe_vm_in_fault_mode(q->vm) && group->cur_mode == EXEC_MODE_DMA_FENCE) {
> 	q->suspend();
> 	q->suspend_wait();
> 	queue_work(resume);
> }

This happens later in the series when switching execution mode to EXEC_MODE_DMA_FENCE
at the time of job submission. But this function here is called at the time of exec
queue creation, am I missing a path where the exec queue would be executing before
a job submission happens?

Francois

> 
> Matt
> 
> > +	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
> > +	up_write(&group->mode_sem);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_hw_engine_group_del_exec_queue() - Delete an exec queue from a hw engine group
> > + * @group: The hw engine group
> > + * @q: The exec_queue
> > + *
> > + * Return: 0 on success,
> > + *	    -EINTR if the lock could not be acquired
> > + */
> > +int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> > +{
> > +	int err;
> > +
> > +	err = down_write_killable(&group->mode_sem);
> > +	if (err)
> > +		return err;
> > +
> > +	if (!list_empty(&group->exec_queue_list))
> > +		list_del(&q->hw_engine_group_link);
> > +	up_write(&group->mode_sem);
> > +
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> > index 7f2d27c0ba1a..ce59d83a75ad 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > @@ -9,6 +9,7 @@
> >  #include "xe_hw_engine_types.h"
> >  
> >  struct drm_printer;
> > +struct xe_exec_queue;
> >  
> >  #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> >  #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > @@ -70,4 +71,7 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
> >  const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
> >  u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
> >  
> > +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> > +int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> > +
> >  #endif
> > -- 
> > 2.43.0
> > 
