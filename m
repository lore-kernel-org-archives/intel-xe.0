Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2A7CA5FA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 19:02:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF2C10F04E;
	Tue, 29 Sep 2026 19:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDV4/4LI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87DA10F048
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 19:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790708555; x=1822244555;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BZzDXQmhP4KG4edAswz4Ha7QKIAmdg9Ez4ZZPqbtWHk=;
 b=nDV4/4LIjlwXdZAbSE+eBuyJO8KwL6CHsZOKvrsyfIx5d8LNNaM/Qq97
 EUvfgPCwhI42j7kUhA9y+whGcKHOZZhWKRy56XX1IvF2JPfSELvcCklgF
 T2EBzKWNEm+BfNbd6zLW7uURqrQ44Exj+FrPZtDZseuqzw3SgTyhCQzlM
 vtQqZGFurr9MAwwH6kMPQwJQN4hXGqWfFgycKqOzY6C75mvt1gK49haIi
 OowLRDX6UljNDn7pq/bpMmBT5V9NhElcJZJd1NxaCFuwc9ByW+uWx4arq
 yEjfY4yV8pIN8CfxW8Lc4t0T3jiaIsal5DeMdiyCzeAHaWepsu50uHmWg w==;
X-CSE-ConnectionGUID: jJH3OQ60QD22PTsF7QTsdQ==
X-CSE-MsgGUID: 4JMMmvcoTF6X/VerEV1Quw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90386877"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90386877"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 12:02:34 -0700
X-CSE-ConnectionGUID: ebxYfGLTTiyxgRepjbNGBQ==
X-CSE-MsgGUID: OyiUh1+ySy+fZdynNd53zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="283544033"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 12:02:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 12:02:27 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 12:02:27 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 12:02:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mATaXxEve1XYsO2+WOoTqU7c+1IM7hdMhQbyMtJY3SdpkILr+JVCGw8+I5AlJzuQn9Pdh6ApnlBlc1aetPcFpq3+3G7xUwRRcJimePs1oPYwynqjppGOOf0sh5yy/gJiGxt8fetFBjqR6SOx7oJ5iWYsMQ7JMyH65BAkWtQsJq+k2lFUT/tJy+DO52as7WQxlFHZV9qkKjvcHlMJtFKveyNIisvgHv4e8OeqwoHnmmhxmXMc98sxO52nV6CzRw3jxWMl/3kXm3xTzl1cLvTpKQIGJ7tUXlrNzRrPAxApfbrR1SINR2SuxkRn+LCZy2l7trfeMg36fswBQFvokdMr3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ES3443atrGnOaPXEBQbR+h+dar1hCleEqa/2H5oJBGU=;
 b=f39o4d7a3dEUeoSROUmePO4me3uKBZXVHaDq7xSdK1T1b+BDGk3ai85xIdQN7+dzq/4tBzfOd85196Ctmfjo+z9LvEoSnYPXd2fiob+0DtPaCvvlCp9yitaaYELDxeIB6mwagsIM5h7rP9HyuDPmeU1VxF0jv3QJkgiFs+ZsKt+fjrn2pPHVtOCpOw1SQ7u40AaapH7sklt9jBfTDOntdad0FM47stM1vadLNPAQYxU87/ZPgFDmX36XMZCBkrq3ufFU0sqw6T4FvosePvCJFfnoVR6gFy8BkO8W8P4jn/WR395ElWYTF844YiePqbAjfvN1SPwpkwlrT2Gpj6oUcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB4897.namprd11.prod.outlook.com (2603:10b6:303:97::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 19:02:22 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 19:02:22 +0000
Date: Tue, 29 Sep 2026 12:02:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Varun Gupta
 <varun.gupta@intel.com>, <intel-xe@lists.freedesktop.org>,
 <zhanjun.dong@intel.com>, <daniele.ceraolospurio@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Demote uncorrectable local error log to
 info
Message-ID: <20260929190220.GM730887@mdroper-desk1.amr.corp.intel.com>
References: <20260917135310.3590412-2-varun.gupta@intel.com>
 <f49686d7-826d-4715-b04f-8818d6efc8d9@intel.com>
 <aq1MOCcJoTYCMToP@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aq1MOCcJoTYCMToP@intel.com>
X-ClientProxiedBy: SJ0PR03CA0188.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB4897:EE_
X-MS-Office365-Filtering-Correlation-Id: edc5b921-9fdc-4311-c444-08df1e5c3167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 0iunOC5u7Wf1xiM2cGUgfRRXyOkYmSwTzNApr0KPXoi170PoWHO5fElnSUZ/5n/VmvYEgV8sl/pussiJFwRnWBW5Xo+pH3hUQpebRifq1aQ9RCe1Qt+mBh4sfjYfrgN3RNPaY35Fngrt7T3AFAmDhW9uWN82qBRjfXJwOYOiroO8tzBZQbOt/Gu2F063GnIqGBS93BoN7mhj8sin/HWUs50U70mPxPGRu4qRmwFtNirZRKFSuzP3mzZT2I/D+t04s/FgOKJXdeqwHgyS8lZMIdkNaZUwkA/SLXoFHc1ZPRP0q4DCzuYnjNWlF9weMIBgd5Ruf2r5Ef81xDYkOaaOnzjqBkMkN5LdQh6joBBzHTfMes+fsX7GDG9pwnadpIMzmym9bqciLc6/mNKU+OzeJrKNG69/Jab+xx+aWV8qAYTTRUkCZ/GJWcbFk/nnZhMiQ2vyVQtjWxg3LSdBzm1pvkPKAVOs4VATn/N+8JO5Dx3ZsovWFyfJuUMc9dL9yFkSwMivEtz4KR6pMX7gUhcVObwaLpPwrsPDJL4EWQDstR/tKlykfnahA5POjAw4Tg3mlTRDOsa5oSkxgRnccr26ltYo0C2F/LDF+sZ2z9Rpy//3ja3RnRrON0euOXBFf5cdJT1iMuOFlXXLBGrMJxvjhJ2pclhXyzOledqTVfDWt98=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mwb3JQa+P8YUMWM1mtnG24Mh5tANefB23FuNOwYKkhvpBghmEdFlnsO06fWm?=
 =?us-ascii?Q?HpWvTjTkLPUZr4NKm8uHzYv7D69cRLJXzhg0gmI5RPSMRrt3DM3IlHiUql0P?=
 =?us-ascii?Q?/lCSBjWz/QYcSBR+QWJaepGMiCXc1K4fwlPpQ7bSIaGEl2vixv34UTNNZF9L?=
 =?us-ascii?Q?Sdc/dWlw7J8QHgk1wyMOcNCs9LO0eX2YQwPUoPNiDeOJajCEmnBInmpistzF?=
 =?us-ascii?Q?HGLuj+JDDka9r3y+eLVgq8ZjLiuhiTEXDPTZ7j7oItiF1XVjUA8dE22em6Lz?=
 =?us-ascii?Q?YwVk9eI5R08HgM+i2c6iYQzjW+LtJgUkM1N/6/SAHJh+CoTJnHTM8VLw/iz2?=
 =?us-ascii?Q?noXapwCPZ/UWnj96UAGIwGsePOd9cnb5Z3Kr2pR3k0w6hnimey8aqKaH/HzB?=
 =?us-ascii?Q?2hJSHX/0Tan621zgtzuf17gaqdNIhc62GDDn3hSbo4+ChAUFmGtEL6n9B+bQ?=
 =?us-ascii?Q?7bwb4JAsvHZ6YKNjEJ5APGuXb7pHSoKokr5mr77I1IsDauSjrbnYFV59vQls?=
 =?us-ascii?Q?Mh4fjC2bzCSIZ3iGlOAhBZlsth4aiDG96KE3hBZdW5YKteDUUfPsC7e9FCi2?=
 =?us-ascii?Q?Zzh70nrWrczwQcPGPJodh365p97L2MB7s4aZY9CPpsW1V7YRb7vkuZyNdEQy?=
 =?us-ascii?Q?qTnVPv8F5Y0MtbbgTpOaLva82H2ebgMGkSzIVcQicPbQWohjeT9zqY0qxDK4?=
 =?us-ascii?Q?RY9RsJ4wXJ6KbXwr7zhkuuLPSfmk4IlDYOLIYe94fDv2+f4GMSyax8lklg9i?=
 =?us-ascii?Q?DoJFS6JxTLGoCclPzWTOXSndToOz8xkKfx7rrlnzzqXicFJtgeiQCISjn5+P?=
 =?us-ascii?Q?BgsRQvLqagZTs082Tzo7nlblQDHb5AQZ6UUU4qkZUU4+ovV+jA2pDQXa5Aa+?=
 =?us-ascii?Q?JWyteBsew/Qe/Kl+32M7Xa+x6M3ObilEAoT4g3ntCMlJC3TL8WBSVtomV+8r?=
 =?us-ascii?Q?4nIK+HF09UqMU39zS7kfY4zJtvXkjfWHXic2dRwQuRiyQhwpqstwo0irMLon?=
 =?us-ascii?Q?Vcd3Vxepk7ShKjkAep0D06MLO6u8BZFQmrsgw5+/c3SpbmbfgpX74Ch5/h0J?=
 =?us-ascii?Q?j+X5N3QaRxWo0BJ/bQyYE+mzeGi6h6Fzp4etSJHgTtpYB3nNx50pxPLPjSD2?=
 =?us-ascii?Q?v78DJx0XdTbQow/LiYOfczqOB7IFz185ba0anlkw09netnmN7qqPaWxaOc/t?=
 =?us-ascii?Q?azgerodKA4wpVHtt3eWbzmYmRH0TwezoEynmkb4FkGTdgENc71dsKqjz0exs?=
 =?us-ascii?Q?pzGjrr61vUIE0zK4ZCrcZv+/NmvfLj8GfgEaK/MT3pvl2KxCazqINS8aY2lI?=
 =?us-ascii?Q?wByXPQhBmspPNAAGiapsrbWKNAq03negUIfIw9fI2WP/cCbn/b1oX9n1CK5s?=
 =?us-ascii?Q?H0IOYaN8TJ3t1IY13ji747vj9a6ytN8XTbdBvzOpEfGxxAKZQwk9ZMVbmk25?=
 =?us-ascii?Q?2U4VUDAi8fhEQDvILayy9DYPtbfeB8W9oQj+A6sAi/IV7nrhP4Rdf1VOjkGx?=
 =?us-ascii?Q?hLNhoZbkjzfvtbV2Ln4KbemAuvZJ1pWuIwOUAP4niSTzR+XYl4U/mV3+4Ysh?=
 =?us-ascii?Q?Ip12ZCqZaAK8nVTNe4skM7IHlLusO75YlgN7p8/yJQ/D5yfDHlbmtJsV9KZP?=
 =?us-ascii?Q?FlX05/+N+f+o+kEBly/Ndzn+gBpxVkS45xH222c0NMKJDchkCVX5R5juWkjf?=
 =?us-ascii?Q?hvUtSJeEjyjZcBKNxHoRftRP+mKIrV7x0ybFC1XWZN9T0SKbR3fmGRWSN4n7?=
 =?us-ascii?Q?MobjSZSfwsgMSzHmp245qMYRZ1lO368=3D?=
X-Exchange-RoutingPolicyChecked: o6AFwjn/QthvNT1BdFncvl10mp5ujeCW6tkCau+pU01uXNLkxdPssIqSCSECXLH+Ui3Vf7ZLFIXmhTKsnP93VaJ0tYO09Lqv/QtJbV0MishimF50UgpyKxfYu3LjoqpQgAArIB5BchoxeXx8phmWJr7NdHwfcNKXRLFsuFwV9tt/WRHbT4k0IRxik79wzktujogDpD8MnYYztx7f7tezziqR87iA6iF575Xs1x6Rg6WQtDhM2wD48k6QyvDyUJzqANmkeqEIR2FdRdbB0f5VoMnJUDK9tI53cU7+MvfbLO3ebyYXwvjxPw4jo3piiSxZ6OrHeoIuk5pldTPbq4kvmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: edc5b921-9fdc-4311-c444-08df1e5c3167
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 19:02:22.6699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oX+g2z25sVnMPWt+ckkGpa2ODDfksgInjLwa0xFtHTlQ6lrnrclG1g7YyII0/y9WDWL35LE/pfgw5gkbPEMM8h8opSPj/ats7GwoqabU71c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4897
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

On Fri, Sep 18, 2026 at 10:35:36AM -0400, Rodrigo Vivi wrote:
> On Fri, Sep 18, 2026 at 09:50:48AM +0200, Michal Wajdeczko wrote:
> > 
> > 
> > On 9/17/2026 3:53 PM, Varun Gupta wrote:
> > > The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
> > > local, queue-level context termination rather than a global device or
> > > driver failure. This can be triggered as part of expected recovery flows,
> > > including intentional fault-injection tests.
> > > 
> > > Printing this at ERROR level is too noisy and causes false-positive
> > > dmesg-warn failures in CI. Switch the log level to INFO, matching the
> > > adjacent CAT error handler.
> > > 
> > > v2:
> > >   - Also ratelimit the GUC_ID_UNKNOWN to match the CAT error handler.
> > >     (Himal)
> > > 
> > > Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error notifications")
> > > Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index f3ba8abfc228..6144a1767f10 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -3487,7 +3487,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > >  	guc_id = msg[0];
> > >  
> > >  	if (guc_id == GUC_ID_UNKNOWN) {
> > 
> > btw, shouldn't we check for guc_id >= GUC_ID_UNKNOWN?
> > 
> > > -		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
> > > +		xe_gt_err_ratelimited(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
> > >  		return 0;
> > 
> > if GuC shouldn't ever pass invalid guc-id here, as spec says this action is for:
> > 
> > 	"Notify the context which caused an uncorrectable local error to KMD"
> > 
> > then IMO instead of ratelimiting this error, we should rather escalate this
> > to -EPROTO to force the error dump and reset from the CTB layer, no? 
> 
> Himal, next time please do not rush with committing patches like this.
> 
> There were 2 unadressed comments in it.
> 
> > 
> > >  	}
> > >  
> > > @@ -3495,9 +3495,9 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > >  	if (unlikely(!q))
> > >  		return -EPROTO;
> > >  
> > > -	xe_gt_err(gt,
> > > -		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> > > -		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> > > +	xe_gt_info(gt,
> 
> Again, this is a no no!
> 
> This is not a CAT ERROR that is expected in any page fault caused by the user.
> If we hit this case it is a guc identified uncorrectable error!

I think this is the problem here --- according to the hardware people,
any cat error triggered by an unhandled pagefault *always* generates an
uncorrectable error on platforms like CRI that support the new RAS
flows.  That means that we absolutely cannot allow these dmesg prints to
be generated at any log level higher than debug (I believe even the
change to 'info' level here is insufficient).  Otherwise we've given
unprivileged userspace a way to directly trigger new entries into the
dmesg log, and that's generally considered a security vulnerability.

It really seems wrong to me that hardware is raising uncorrectable
errors on all cat errors.  I think we really need to double/triple
confirm this with the hardware teams and make sure that this is truly
what they expected to happen.  But if it is, then we absolutely need to
downgrade the dmesg printing here because we can't give userspace a way
to trigger non-debug log entries on demand like this.

We may also want to file some tickets against the hardware teams to see
if they can rethink this behavior on future platforms, or make it
software configurable.


Matt

> 
> Only come back with this idea if we can really justify why you can demote **all**
> guc uncoorrectable errors to this.
> 
> The errors you mentioned in the commit message are not a good reason and should
> be handled by the testing tools.
> 
> The patch was removed from the drm-xe-next. Please get back to the drawing board.
> 
> Thanks,
> Rodrigo.
> 
> > > +		   "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
> > > +		   guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
> > >  
> > >  	trace_xe_guc_uncorrectable_error(q);
> > >  
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
