Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDC3C25B7C
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 17:50:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DAB10EA09;
	Wed, 29 May 2024 17:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ScwmAOQE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F5E10E7B9
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 17:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717005000; x=1748541000;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UsGAwEeBE7ce7eO+M7kFtwjhdURslQUEZLmzb/xBCXc=;
 b=ScwmAOQEWov6R3xTHjhdj+3mORdO7MVSW5Ltt4snf8pEVFpuSMNawQiF
 FsWkCb3/iUd4McyM332mlB+/khxTffCQp2YtzLaHv9/XFHapIhBb6RBRj
 j01Zo4MVp5112J4xRE5ivDrQWWou709iUtPr9sxJGX75F2dJ+YjDhNH/p
 jISBCIcjVBPZjyP5Qu9AGrKUmqp7c017zFopFp4UqWQoEk/C/SDaFelSd
 e9a8krhcc/OD1+JHAyai5KoynWUWOcfTPojh1eUMn1FwV3EweQz1fyQIY
 U/eWWZNJ5fhk5r32eaVlCtZrIHusuqZq/RGwD7SrNtD30BQyeKUsvimbD w==;
X-CSE-ConnectionGUID: Lu/rJJb7SJKHZceGnJ/SMQ==
X-CSE-MsgGUID: 7Qc/4T5NTAWwOebwRBs3mw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="16378738"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="16378738"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 10:50:00 -0700
X-CSE-ConnectionGUID: TGBeE04AQxy5HspfwiJX1Q==
X-CSE-MsgGUID: q89o6KhETeCb1kpLxJ/YCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; d="scan'208";a="72972762"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 May 2024 10:50:00 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 10:49:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 10:49:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 10:49:58 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 10:49:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YO1Gd/ooySPYEsmFAJyaK5DCyhKpVum16lmeu3wgaTjIUW1dyhkYZWv+MCKgmQva1Ak4J0eSzGoZwccEmMyyR1DDqJCOIqewxksTL0okZ4NV5ZSRZ4pBdRiKkEXhlI3oOxhO9iAduAqOeKMEWSMh7r14Jtc00JvMS7ps/UfllY63sx6qHzsJ5I4K8M0/Fx86rr22axlOZh2LKF8c6vFAfIjmk3/1r0flmlrW1j7U2wbWTrvfm1KPachH1Auzam4YVFd3op4sNeqpHic0SQ5GXdGRga3ZpqJXneonEgQpzEF7jsCumZnmwon+T35Jvxzp2+m2j321w5ZCtiHmcA2HVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHkqEr893HheOYhiAjbz6WGcgiz/EK2I5ZMN2prCld4=;
 b=Pp4/qNqU7osfRt1pbny/zu59jOrDyWqK4nN5pLM8PVlJQGizxwRUbuayyy/CcolLxbY/qwzoAp4jbSQo/uyRZrENwpaeN/Wp7uw6ceSSgLihOkwos5Yd6VoKewNKDI2IVMC5ZFyQmKYjfNwR6BJbXmi0/5V17DoCfJgnQuW9LN1hfdYeh9ylDJziS39u732xxC26Vx8iKzlhIK+x2buZ/eBxlKqmsfW8zjBsxDzRYUlOM9uXTZLH96kd2yWmTjNa895HmD5t4A8+XFtPZtOYWg0u0UM9kMEokvYdoV/P/psAtbYKU+QEONgxZ5dOHw8LG+rJNMnZE85GkGQBcB5STg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB5216.namprd11.prod.outlook.com (2603:10b6:a03:2db::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Wed, 29 May
 2024 17:49:56 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 17:49:56 +0000
Date: Wed, 29 May 2024 10:49:54 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH V2 2/2] drm/xe/xe2lpm: Add permanent wa_14020756599
Message-ID: <20240529174954.GN4990@mdroper-desk1.amr.corp.intel.com>
References: <20240430075609.2216291-1-tejas.upadhyay@intel.com>
 <20240430075609.2216291-3-tejas.upadhyay@intel.com>
 <20240515033047.GA2343622@mdroper-desk1.amr.corp.intel.com>
 <SJ1PR11MB62041F220E3B0EF11E1AAA7381EA2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB62041F220E3B0EF11E1AAA7381EA2@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR20CA0005.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB5216:EE_
X-MS-Office365-Filtering-Correlation-Id: c45e24a3-e95d-4129-4c57-08dc8007c083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Clrceota3rHzJ+YeFbIer8Y6mVPU+5disWNCOiw+PpGllO58S/bUz7a7xMLE?=
 =?us-ascii?Q?g0m2ffhidWGA/piQ8eVFg152vn5MjibbqasoC59ZC/5Kau6FjYlAoIiOnH+F?=
 =?us-ascii?Q?2uDzgF7qvc/7su6BZVhupFbqTuOjzMKi0fEdQPz34AKbq5As49aq+P9d3ztI?=
 =?us-ascii?Q?dHC8KrmjiKpYWiobwQuRYASss/dsyoTn/m1jPuv96rvF9ZPhHJoZ6Dd2GQvK?=
 =?us-ascii?Q?VdaIqJ71wpD/QPHLI7FI/TeHXwalN1RRALE9r6fEDjHTsLyGhg6lKXCBkBuM?=
 =?us-ascii?Q?XUaeOoetnQl+eZQ4TcnN18Fb4h6wZNgbx+FqyHObWHvOVYZgRvrQCviHxMHk?=
 =?us-ascii?Q?/Zbqm4BEZGVk2Exw1x23Q4P49yRUPRqGps+K2h9Ipl61npAgxbBeONEncbb1?=
 =?us-ascii?Q?sA3nY+SJGZvMtW8tYy6YNh7iwFTrN8vsyjCX3POdy3453ue/ZmuRguYBsO68?=
 =?us-ascii?Q?xYh/BKGnhEyDezZFkVEOTbWfaodnKKiJKpobqOe/nPQCuYz7qwB3lFEQitS2?=
 =?us-ascii?Q?+lHUbAnsizPx8Ac/ZOVzZAaZRapmtxIB5hsxCVZGlmMkl3y3PAXUqqJKSE51?=
 =?us-ascii?Q?U7J4uHtFQlIVttYS0VZY34yB/G5TVAe6XxQN/f1g74+sckMBMJplbsr+PWsw?=
 =?us-ascii?Q?5GNfhaQwlP3Bq/FFepqkqFGPsfRX74WpXvVvJn9zgGf4/ICBmLJ0MSVW6BG7?=
 =?us-ascii?Q?ORjxfvtR1j1g4wo5upORMZgTqufSYd/bj6efWHdutoGogb2PLAH5OHoPwHxE?=
 =?us-ascii?Q?iaHY6bdbyrMWktriQlwhNewac9bPYI0XZMzlkJsxjdAJDFNv30EElVon2pMM?=
 =?us-ascii?Q?8n8MsqjIx9ijH4fkDjHJ4CQA+djN2xVaxD6tDttEMPNTEKTxIAqN9UyPWXLD?=
 =?us-ascii?Q?p2zqEfhSBrCKO3DDvRuAHa9ZWHC3qgHmjcoqDUzGSFGxiLaO5X7a4SfyhZ97?=
 =?us-ascii?Q?eBL3YojHbqElDdf0FLu0jLGVmB8q8rBphI9uOl0AlbxIg23ikUfMJuOKph/T?=
 =?us-ascii?Q?LQuufzbJgOINwaOeIznY3HBPAgCPbni9k4j6r88wS56HVtRSAP7EPUoTMnXZ?=
 =?us-ascii?Q?I702nkiWJzxvar3pCFBymj9mfSaC89NrzGa6FqLdhZcopR0ZB3jRXgJFXHYm?=
 =?us-ascii?Q?ui/askO+HEf3LPEPyqGa4a5rMwkR4VySJ+BF56cZ8uBJBau9pvTpgyb6p2cP?=
 =?us-ascii?Q?WM+NQ4TLLzCRodUbTcIA6mgyK1kWaQWuYLFJibi6WjAD4rgPmucDi3XGU7h3?=
 =?us-ascii?Q?qNpBgGsbStUQNWIfthQBwaWnC6mNv5yWYDPcI42wlA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nqunIN1O1RxGhmcwl5xr5WQQCIV/r7j1V8VrJiSAh4Uk/dI0bnNOsPvlxPvj?=
 =?us-ascii?Q?ha1+QCdvKbwixX+gXAY4CK3HWkIIUrA65RZsCIU2nevWbkSY98JyaRcDzMUp?=
 =?us-ascii?Q?8XSonWDe8cnxouGpDw/fL0UFtQRnqBNHubQcLnLuMAHCacY5102Y5otESfZq?=
 =?us-ascii?Q?X5BOR5+BZZcJTLLpBXCBGo+Po0IHVn3r2k7dbOREQfdZz42hOl7jRsMbzv5L?=
 =?us-ascii?Q?8tjq5Kv+6g58QZd5Lmp/zEgqZsl6dGWD13x+FhjZpPr4Vm76DlYQzUvZy969?=
 =?us-ascii?Q?RisyRVoJppe5dmCSn0qWqC2vGaashZmu8Z9PGsdpCMIcbBgKJA053AbCYVww?=
 =?us-ascii?Q?cgYxbn+8B8JT4Pd/EQwUxoL343HN0x8+2EZAXLPKswW8gYkOMtGnk4bysY0Q?=
 =?us-ascii?Q?hB/P9HnIhTkSpv05TAdwsui+GD0XgRoJ75dczJVnsgYWJMQk+XNkWNMCISqf?=
 =?us-ascii?Q?cYb87O0HyxKHqbRGIOdFzCrBvyh/YPtGkf+Jr8Sh8xpASGclYhJAqpRTH7Ws?=
 =?us-ascii?Q?Xge0llxAX+Pqg32RffMSeW3tJwUJ/AX5cDijVY7rL7wVsj1gE+tN3yh8LUkO?=
 =?us-ascii?Q?FUeG03tnQ5N6wXMR3tNNIfnByVTBvYXjHYRFbGOfiL7fB2/9sNhPuFT2Sfj+?=
 =?us-ascii?Q?0T/DlWps+rwmU/Zm+y1QmwhAkXtBrqi0r1XUGVi/nSaQgjA+3RAJRDE6N7Hl?=
 =?us-ascii?Q?gyUhthTgblv38sMMn0kQAA0MOut4hxXJmZ65NTClhMFlBcyDQTXJc+rKKAJu?=
 =?us-ascii?Q?TXAiXo0iHD/PqJivCYz/V2QJnDmrmJRMMQOrjKpCCSViIsue9ocEhP438DqE?=
 =?us-ascii?Q?NnMTSFBLQFwMk0gHe3+7eUl9VYb+dE0xBNVaNgFKjVckB7TDPQOXIwTohlL8?=
 =?us-ascii?Q?YA2nRmomD1jXzte4jPgfoWVscePFYkNpVR6ToWUhiG7bIU0uTkoMP2RnfwzS?=
 =?us-ascii?Q?0uIxvUr/UXR4F+6VynNxbXgoYGLjC+eoFHXzV9Vp66S8Y4J5tCS4mdpp/ALi?=
 =?us-ascii?Q?yU+XmoEh3pOtPfQA3yfkTfn4jyxm2mFgqleEfKpFRTJxqFRgnYwwwx7opNFG?=
 =?us-ascii?Q?dKvm3UeCzWTxCMMqfZvJWkO7Nr21sTcv7gq8Fu7RZvS+AGTknIcDqpvscKFR?=
 =?us-ascii?Q?aj7EvSTIeUD6JJJJHZwOBqCIetglEDWBPyPntHjGQyoBTmuOByoJLtVQOE8G?=
 =?us-ascii?Q?r45Xu+VN2j1m9OPDxz6N028bLxtFoScafHqYkJ/OhdjNKuUxiibP72aXEVdS?=
 =?us-ascii?Q?hUxV6GLBEyk3LVT81rZK91yXYTZ1qWAXmOy61pRoEj0sOyWy/TaoAK8GcUN9?=
 =?us-ascii?Q?sUCofTqvV1mi4rfh0Szg4sAHGF5wBhp7pMUQoMO9QXmTZF7sdo95ssRZFmue?=
 =?us-ascii?Q?FzCnOUXk6YueNDiDtb/ZFDqy/h80/BzR+YgP/lS6kyvgvzSFjPJ5RCILj8NB?=
 =?us-ascii?Q?s05iLi+pNdwFEonDs+0xH7TEfXCQ2CbrGC6mUsRVbDHkjI5A0kL3NMhIK5mW?=
 =?us-ascii?Q?gT5r3ZyjfIOpB8h34LiNC4eah0xZnUYMwahNqeHbLYD8k+mASPFtfG4e9XGE?=
 =?us-ascii?Q?5AC2ZDtn27iv0uhJFlcv49OQ2n2L4VIpvi+LT7M+wUdVUWWlCjciw1ae9ya2?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c45e24a3-e95d-4129-4c57-08dc8007c083
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 17:49:56.3732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54RI2gHKtAPdJzincUY0NRWpA5H8iuoMUu33duX9eHIRtwfrVI+bUNHYKyd6e/clahzgP2Mq4Sfb4qQj9bXlsqwl3VsU+DovMj73XEnSd3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5216
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

On Mon, May 20, 2024 at 11:23:12PM -0700, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > Sent: Wednesday, May 15, 2024 9:01 AM
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>
> > Subject: Re: [PATCH V2 2/2] drm/xe/xe2lpm: Add permanent
> > wa_14020756599
> > 
> > On Tue, Apr 30, 2024 at 01:26:09PM +0530, Tejas Upadhyay wrote:
> > > For xe2_lpm Wa_14020756599 is applied to all steppings.
> > >
> > > V2:
> > >   - Remove engine filter video decode
> > >   - Fix typo GRAPHICS/MEDIA/s - Himal
> > >
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_wa.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > > index 7657aadf217c..76f7a7e3ee61 100644
> > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > @@ -701,6 +701,12 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
> > >  			     DIS_AUTOSTRIP))
> > >  	},
> > >
> > > +	/* Xe2_LPM */
> > > +	{ XE_RTP_NAME("14020756599"),
> > > +	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> > 
> > Even though this workaround needs to be applied on any platform with
> > media version 20.00 (regardless of the primary GT's version), there's still only
> > a single copy of this register and it resides within the primary GT as part of
> > the render engine's LRC (bspec 65182).  This is a pretty unusual case (turning
> > off something in a different hardware unit than what the workaround is
> > marked against) and we might need to do something special for this
> > workaround since we need to emit this workaround specifically as part of the
> > RCS engine's LRC (you don't have an engine filter here, so it's going to try to
> > put it in every engine's LRC), and the use of MEDIA_VERSION also implicitly
> > makes our RTP framework use the media GT to apply it rather than the
> > primary GT.
> > Since this register is within the GSI range, applying the workaround through
> > the media GT will make it try to write to offset
> > (0x380000+0x5588) which won't do what we want.
> > 
> > For now the only platforms that have media 20.00 also have primary GT
> > versions that match the Xe2_LPG version number, so we could probably get
> > away with just putting a comment in the table saying that we're not adding
> > the Xe2_LPM entry for now since the Xe2_LPG entry already covers the
> > necessary programming.  But if they ever pair media 20.00 with some other
> > primary GT version that doesn't need this workaround, we may have to think
> > about adding more flags to RTP to deal with this kind of situation.
> 
> Do you think, handling it this way would be good for future use well?

Yeah, I think logic like that should work (although you might want to
use MEDIA_VERx100 and match 2000 exactly).  It might also be worth
naming the function something more specific (e.g.,
"xe_rtp_match_rcs_when_media2000") that makes it more clear exactly 
what it's applying to.


Matt

> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index fb44cc7521d8..54b99f31a538 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -309,6 +309,14 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
>                 hwe->engine_id == __ffs(render_compute_mask);
>  }
> 
> +bool xe_rtp_match_media_need_wa(const struct xe_gt *gt,
> +                               const struct xe_hw_engine *hwe)
> +{
> +       if (!xe_gt_is_media_type(gt) && hwe->class == XE_ENGINE_CLASS_RENDER)
> +               return MEDIA_VER(gt_to_xe(gt)) == 20;
> +       return false;
> +}
> +
>  bool xe_rtp_match_first_gslice_fused_off(const struct xe_gt *gt,
>                                          const struct xe_hw_engine *hwe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 05db53c1448c..8a374afb789f 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -227,6 +227,11 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>           XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
>           XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>         },
> +       { XE_RTP_NAME("14020756599"),
> +         XE_RTP_RULES(FUNC(xe_rtp_match_media_need_wa)),
> +         XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
> +       },
> +
> 
>         /* Xe2_HPM */
> 
> Thanks,
> Tejas
> > 
> > 
> > Matt
> > 
> > > +	  XE_RTP_ACTIONS(SET(WM_CHICKEN3,
> > HIZ_PLANE_COMPRESSION_DIS))
> > > +	},
> > > +
> > >  	{}
> > >  };
> > >
> > > --
> > > 2.25.1
> > >
> > 
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
