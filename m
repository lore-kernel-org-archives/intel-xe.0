Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A75C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 01:14:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A95BD10E376;
	Tue,  5 Dec 2023 01:14:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD97E10E376
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 01:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701738864; x=1733274864;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/hc36m0bdYtwEoCudkKL63ikmjjXwpiaHYCxurcaXKM=;
 b=EHzA9muoW7XWgrB5GnQo4iQ2Ax7IDL4bxVWMpmGdtkW0C3ShkdDLQCRh
 Lwert+M92Jf4WlWAB8NdDoE/UMIdJeFDWaWnvlZuqsrig67eTEPVSH7Ya
 0DCTqjX1wL3VOGn86u1mYtwyLNMoVFsPd92w9RSKvq82hGbSvXwJo0FAv
 Ls7T9PM1MrVhwkNr1XyqK0diLv8x1q6HdCjoFJDqOeTRcVlb2uierddgq
 9gQCq47CNVyBjQfjhceMq5NSZxWaEcHQ5Z+/gM9ybvwjpD8iAOuz12eJG
 I5ksnVGcqafcth0KYELRT84bkq8kcJgQusve37SWn7LxxjjfsUsynQ+D8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="390975179"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="390975179"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 17:14:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="841252448"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; d="scan'208";a="841252448"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 17:14:23 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 17:14:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 4 Dec 2023 17:14:23 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 17:14:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+sfJsYjFFrod/8T7StmTs3LzOWydAQyyldXnj5fOSGV7CXxcoyjgur224zCcV8n0oXtB6nUKg2focQbsrurJYm+HCyVmKImgkfyx8OmkOlVYb8TyPyC+ipdo177tQ18JYayU/l1Vi4D9OyJFvbUBRlc0PZwMaqCPfrAh2gipmXdme1h1ExKdWm/xwX8BuMuuKsl5I3NW9/Q+y1bEBZ9CJ04uF3BVcgEhXdr9AaeQeqpoPtPt8Tt7Qdn6DHoTEEFb5ey2MxBN+YMbOPRTBtVHqHkP2ceTLgfc6jJccZiMaebDlk8WevZnnkcLX5khy4ehfcSBqrX1Q5+t43ct3NDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSwdIzREUsS8JjS9HPDAVIuQIuKo2fN0bCKUSIwOczo=;
 b=CqQ25Nhra0jOYQ8lWIEmRwN2PoSsr4zlCiVuq9Ontr39rHMkd0eJlbdP4627SrOeQ76F1dGi7H5T1ld+Dc1YTkkQHfOsMvEgCmT+BwgO8/q7l40WCK5BuTf5IeIrol1cKbL9p0he3OykY+uXzkq4qbwl+0oRyCDzjgeZ4KgNOl8CSbrxlYxLVr//c6MspUsUNKyIV7v2dZYmEkJaco+trcjvVJVuDxfGADnFiBKC0E/9oc3KQ9YT+Qnclf5bCqcUMbDA7L2lax5FSvj5dHGiuqVxcDJ4Xw73LIB7Zt+L/lYPkz9dMnAR5ONhRCjFM2gc+eWXkLEWGtyksoLMMaPFDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ2PR11MB7618.namprd11.prod.outlook.com (2603:10b6:a03:4cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Tue, 5 Dec
 2023 01:14:18 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::f105:47dd:6794:6821%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 01:14:18 +0000
Date: Tue, 5 Dec 2023 02:14:14 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <wejgza2ogax6yfek76rcd2d3emfdezzbs3ysfolnbphmwe4j6y@gbvni32l7mmp>
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
 <20231129214509.1174116-10-michal.winiarski@intel.com>
 <493d1a6f-35b4-4670-a65e-771bc7237fdb@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <493d1a6f-35b4-4670-a65e-771bc7237fdb@intel.com>
X-ClientProxiedBy: WA0P291CA0005.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::13) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ2PR11MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f1388de-5f33-4a57-1f7f-08dbf52f809e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mspCIgQvAoHanG1s+/hcO+YBmB42nmvL6TCYrRbfOetY2D/Js2YxNolJtoTuG+g4hGD9F9rNTiP15o0UCcmu287MXC4TcYN18rq1VSCjfeaybCXmRVAQ0OkcC3tYRvBJYxQHZ4sS+0L+5O8WMfeLQNSVsQAQV+Po50Fk1SNc1MkrwOpdePO4Zpti8NLE2a5GzkUmCCotqWcTkjRVLnoVpr9pWMW7caEb2Xz/eDlimX8jy0FRvIdygQihpAWCeewQCgUL7DHyANJxRk2irqzxJURO9u/40/2ilRlBnqNhEwWAs6rjCvZ8H7l2eMKnomHz5N4100phSuuQC181ukTWHOhBxvS/UYLn0d+hQi9sNCYhxLJoa/vFsU74subdGbZR9NLR28WhaMebiwmqxbgBJy/kRpQSHIZ+I9xhW7f1PG6FAJcyrxCreVqAa7sK9rorYX9ui8jmpiwozRdPqEFQ71SY7vGRtyo6I8mBERiSQL+EdPN/NzL24nmXLoaowM7HBB64+FdmfWzeTObHmTknXAs0fJWP/JDV2piaobXHReE1uE0IKGP03yk970PYm9Oi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(39860400002)(346002)(376002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(5660300002)(86362001)(4326008)(6862004)(8676002)(8936002)(2906002)(33716001)(41300700001)(6512007)(107886003)(9686003)(6506007)(82960400001)(53546011)(6666004)(83380400001)(6486002)(478600001)(26005)(38100700002)(316002)(6636002)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXBIWm9CNlBCWHRtOXFpZnA0TUxZTE01NzIzYzZxZ3BZM2UzQnM0cGRVNzlv?=
 =?utf-8?B?VFJ0TzNlZUZNWGYwMktvZ3B2YjNGWlh4TE1pTGFtUVByUTRsMzNWdTk2SXJC?=
 =?utf-8?B?alAvTFNNVFAzZFpZU3I3MHJFQWZWZElWU20zUW96dGEzSmxNSURJUFNsd2FE?=
 =?utf-8?B?QWRzcTNjK3c2eGMrSVlZQjhqQ2Q0YmtBYmFwRjl2S210dnlQdmhwaXByOUtm?=
 =?utf-8?B?azBnZGF6aTRiYXpGY3V5eEdCcmJnZ011U1FCZ0ZMNHBsS21IdG5QV0Jub0Za?=
 =?utf-8?B?NnEvNUdReFZCTkp6RU83UHcxZVQ2OGRhMjlpNVZac2dOUjVKTG9pZzJyRzJn?=
 =?utf-8?B?d2hSaFRLZ1p6VG5xZTlIVmxLUnRQQ3NJMFk4NEVjVXR0T0NCOC9UbkIxMWx4?=
 =?utf-8?B?Y1RlT29hZk42NU4vRXRNRmlxUWpxV3UvOTlLL0VPcldRakZ4TUlMdkJ4akpz?=
 =?utf-8?B?NUdKclFsQVV1cnhEMTFoQW9aWWF3ekd5MW1UeFdBWmJiS3BUeG1NYTNtQzV4?=
 =?utf-8?B?M1E4RmZWWFBTT25pNmkxeWNyOEsrZHlkTFZ3dnJBL3hGbWQ4RWdscjRJT3Yw?=
 =?utf-8?B?Snp5NGRCOW01MUlDMlA1TGNLS1U0M044QktSVkRLQ0dYRTQwU0pRR1VKaTN0?=
 =?utf-8?B?NzZJUHJsUzd0eDZMY2ZZY0ZZdG91RGpBUjEybndFWUZIQmVyQW0wczkzeTA3?=
 =?utf-8?B?QnFac0tBM2NwRytPN0RSTGZ2REFYK3dUcWcxUXA1aWI1dnMzOXJ2OHVxRjVL?=
 =?utf-8?B?R1p6SlhYaXpFcHZMUHFEazRYVjhMY0FlSFZWdGl2RUQzWDBOTUtmUVZQbDl3?=
 =?utf-8?B?U1oxWk9taVJUSVE1WWJ3UWpoaXpRbmMwK3ZzeE1xZDZJK0lpYVpTYS84bE5o?=
 =?utf-8?B?c2t5S1VSWjVyS3gyTnNXU3BPdkU0S3FsZCtJT1B5K0tCaUdCWjB3Qm41RUFO?=
 =?utf-8?B?NFhQWlhweDYxYlRhQm5obHJBeHJ1VW50RFNFMTZIRHpFREdUUEVLWkJ1N1lt?=
 =?utf-8?B?ZElFUmFFQnR5NlFzci9YTzQzcy9MV0EwZDFjeTEvalFOd0ZkbEpDZmxyRUdk?=
 =?utf-8?B?QmFhbTVtQ2diYXlPWGkwaGNoQU5OcENHODBHMkJqc2FrR0d2UTJXN09LY3Fq?=
 =?utf-8?B?WHR5YUV2QzV6K3VEdTQ0NWE4KzZaQmVNY0RZV1loKzZKTGFVS2w5ODgvL3V2?=
 =?utf-8?B?L3F0V0NJVlpLRlc0NFFrYTF1QnlnUXlEbDhsaXFvQzdrekY1YXQ3NnRKR3RP?=
 =?utf-8?B?a1ZkYTRRbWtYNW5yNFdIdjh3eWg4NUlsbE1yZ3Q5UVF4NmZ4NkI4bmh1YmZZ?=
 =?utf-8?B?TXFuaUpUNzNkRHRIUjYvNlg2RCtxTjcyUlVGeEFXTkQrTXVHQTlqQ3lXKzNj?=
 =?utf-8?B?MFhPYVdMeUJrbDZMZi9vQXJUTk4rN21PV01YN0szMmZuMmxNb3VzSTRueEZk?=
 =?utf-8?B?UFg3SGpYNmtScWgwK0M2VkNwYUlPMkc4THk1NmxRaEJkckpoTXB3TGZIR1NM?=
 =?utf-8?B?cDNhNGRtYXJIdTJJMGhnbHk3Snh3bkl3VklGSENhQlgwRm1OTTZZZUpUNWRK?=
 =?utf-8?B?b2xKL3ZhUDlGdVlLRG1LZjk1VURWS1oxa09wNFNFMTc5ZjhyTVlSSWlDSkdV?=
 =?utf-8?B?OVZKNHBneHptN25zcG45Z2I1S1Q1RjVRYURyQXEvYUZkbHZJVFlVb2kzOFc0?=
 =?utf-8?B?Vjkzc2VYUGw3NWZJbEpVSVo2MURuS1FnV1o1VTAwcE5LU0xkUVZZaWM4MjRa?=
 =?utf-8?B?Y0thdnRCdUZjVUorS3dUcEtFem90KzZiY0FwN0NrbEhRNnRFVFhNWDYzaFZG?=
 =?utf-8?B?VXBnM1dJRUEzZVRwOFZJZmFwSmRqbVJvZlB4TDJGZHJwRWNlTTZZalB6RG9E?=
 =?utf-8?B?bm1qa3JxamIxSCtRVFlNeU52SnNNTFFzSDBVUHNleE5aNThCUDlkREc4alJk?=
 =?utf-8?B?d0xYZDQ3WGZubmh5Mno3aU1JRXRwTDJxYkUwKzFNMEJRQk5YV0FNNDVhRzJs?=
 =?utf-8?B?NmlXNnRLejdZREhGSW83SGlEd010N0pXVVc1Z3JodmlSRStvVWlhZndVcnNQ?=
 =?utf-8?B?ZjFOODYrbmpJS09TeDFEZUxzd000MGQweTlWUkJ3RStYUVdJdkxEQ1pZdUNO?=
 =?utf-8?B?WGFERGlxMTdQY2lvemlFOFlEV1VUZGVtK1BYZ2dZK2x2QVUzeHR3Y3lpNE9N?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1388de-5f33-4a57-1f7f-08dbf52f809e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 01:14:17.4452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8WLX/fs86WyIZ28paekY6S7yZMDKqREHImHttmQ02LlRchRPNkJbNIdOOxt8Pi3clgjJuHNUGNLm5ux4PWXvQX21pNvP0cXbN5SEZUEAoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7618
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [CI 10/14] drm/xe/device: Introduce
 xe_device_probe_early
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Dec 01, 2023 at 03:28:15PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 29.11.2023 22:45, Michał Winiarski wrote:
> > SR-IOV VF doesn't have access to MMIO registers used to determine
> > graphics/media ID. It can however communicate with GuC.
> > Introduce xe_device_probe_early, which initializes enough HW to use
> > MMIO GuC communication.
> > This will allow both VF and PF/native driver to have unified probe
> > ordering.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 22 ++++++++++++++++++----
> >  drivers/gpu/drm/xe/xe_device.h |  5 +++++
> >  drivers/gpu/drm/xe/xe_mmio.c   | 16 ++++++++++------
> >  drivers/gpu/drm/xe/xe_mmio.h   |  1 +
> >  drivers/gpu/drm/xe/xe_pci.c    | 26 +++++++++++++++++++++-----
> >  5 files changed, 55 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 5e1f73c8c77ad..f4be4b13a506e 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -375,6 +375,24 @@ static int xe_set_dma_info(struct xe_device *xe)
> >  	return err;
> >  }
> >  
> > +/*
> > + * Initialize MMIO resources that don't require any knowledge about tile count.
> > + */
> > +int xe_device_probe_early(struct xe_device *xe)
> > +{
> > +	int err;
> > +
> > +	err = xe_mmio_init(xe);
> > +	if (err)
> > +		return err;
> > +
> > +	err = xe_mmio_root_tile_init(xe);
> > +	if (err)
> > +		return err;
> > +
> > +	return 0;
> > +}
> > +
> >  int xe_device_probe(struct xe_device *xe)
> >  {
> >  	struct xe_tile *tile;
> > @@ -393,10 +411,6 @@ int xe_device_probe(struct xe_device *xe)
> >  	if (err)
> >  		return err;
> >  
> > -	err = xe_mmio_init(xe);
> > -	if (err)
> > -		return err;
> > -
> >  	xe_mmio_probe_tiles(xe);
> >  
> >  	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index 54694f98c91a2..3da83b2332063 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -37,6 +37,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
> >  
> >  struct xe_device *xe_device_create(struct pci_dev *pdev,
> >  				   const struct pci_device_id *ent);
> > +int xe_device_probe_early(struct xe_device *xe);
> >  int xe_device_probe(struct xe_device *xe);
> >  void xe_device_remove(struct xe_device *xe);
> >  void xe_device_shutdown(struct xe_device *xe);
> > @@ -123,6 +124,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
> >  	for ((id__) = 0; (id__) < (xe__)->info.tile_count; (id__)++) \
> >  		for_each_if((tile__) = &(xe__)->tiles[(id__)])
> >  
> > +#define for_each_remote_tile(tile__, xe__, id__) \
> > +	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
> > +		for_each_if((tile__) = &(xe__)->tiles[(id__)])
> > +
> >  /*
> >   * FIXME: This only works for now since multi-tile and standalone media
> >   * happen to be mutually exclusive.  Future platforms may change this...
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index d1b59021c9712..6148c9da4f64e 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -15,10 +15,12 @@
> >  #include "regs/xe_regs.h"
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> > +#include "xe_ggtt.h"
> >  #include "xe_gt.h"
> >  #include "xe_gt_mcr.h"
> >  #include "xe_macros.h"
> >  #include "xe_module.h"
> > +#include "xe_tile.h"
> >  
> >  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
> >  #define TILE_COUNT		REG_GENMASK(15, 8)
> > @@ -376,10 +378,8 @@ static int xe_verify_lmem_ready(struct xe_device *xe)
> >  
> >  int xe_mmio_init(struct xe_device *xe)
> >  {
> > -	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> >  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >  	const int mmio_bar = 0;
> > -	int err;
> >  
> >  	/*
> >  	 * Map the entire BAR.
> > @@ -393,12 +393,16 @@ int xe_mmio_init(struct xe_device *xe)
> >  		return -EIO;
> >  	}
> >  
> > -	err = drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
> > -	if (err)
> > -		return err;
> > +	return drmm_add_action_or_reset(&xe->drm, mmio_fini, xe);
> > +}
> > +
> > +int xe_mmio_root_tile_init(struct xe_device *xe)
> > +{
> > +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > +	int err;
> >  
> >  	/* Setup first tile; other tiles (if present) will be setup later. */
> > -	root_tile->mmio.size = xe->mmio.size;
> > +	root_tile->mmio.size = SZ_16M;
> >  	root_tile->mmio.regs = xe->mmio.regs;
> >  
> >  	err = xe_verify_lmem_ready(xe);
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> > index c054c27f6925d..98de5c13c89ba 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.h
> > +++ b/drivers/gpu/drm/xe/xe_mmio.h
> > @@ -21,6 +21,7 @@ struct xe_device;
> >  #define LMEM_BAR		2
> >  
> >  int xe_mmio_init(struct xe_device *xe);
> > +int xe_mmio_root_tile_init(struct xe_device *xe);
> >  void xe_mmio_probe_tiles(struct xe_device *xe);
> >  
> >  static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index d9a3b20179cc2..889f60fa2e7cf 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -540,10 +540,12 @@ static void handle_gmdid(struct xe_device *xe,
> >   * Initialize device info content that only depends on static driver_data passed to the driver at
> >   * probe time from PCI ID table.
> >   */
> > -static void xe_info_init_early(struct xe_device *xe,
> > -			       const struct xe_device_desc *desc,
> > -			       const struct xe_subplatform_desc *subplatform_desc)
> > +static int xe_info_init_early(struct xe_device *xe,
> > +			      const struct xe_device_desc *desc,
> > +			      const struct xe_subplatform_desc *subplatform_desc)
> >  {
> > +	int err;
> > +
> >  	xe->info.platform = desc->platform;
> >  	xe->info.subplatform = subplatform_desc ?
> >  		subplatform_desc->subplatform : XE_SUBPLATFORM_NONE;
> > @@ -558,6 +560,12 @@ static void xe_info_init_early(struct xe_device *xe,
> >  	xe->info.enable_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> >  				  xe_modparam.enable_display &&
> >  				  desc->has_display;
> > +
> > +	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
> > +	if (err)
> > +		return err;
> 
> why this is inside xe_info_init_early() ?
> can we call it separately, as xe_info_init_early() suggests that "info"
> will touched, while xe_tile_init_early() does much more
> 
> as a bonus you will avoid changing signature of xe_info_init_early()
> from void to int

Before this change, it was called in xe_info_init() for all tiles.
After the change, root tile is initiaized in xe_info_init_early() where
as remote tiles get initialized in xe_info_init().
Both touch things outside of "info".

Note that xe_info_init() could be split further (and perhaps we would be
able to find a better place for root tile xe_tile_init_early then), but
I would prefer to avoid doing it as part of this series.

-Michał

> 
> > +
> > +	return 0;
> >  }
> >  
> >  /*
> > @@ -626,13 +634,15 @@ static int xe_info_init(struct xe_device *xe,
> >  	 */
> >  	xe->info.tile_count = 1 + graphics_desc->max_remote_tiles;
> >  
> > -	for_each_tile(tile, xe, id) {
> > +	for_each_remote_tile(tile, xe, id) {
> >  		int err;
> >  
> >  		err = xe_tile_init_early(tile, xe, id);
> >  		if (err)
> >  			return err;
> > +	}
> >  
> > +	for_each_tile(tile, xe, id) {
> >  		gt = tile->primary_gt;
> >  		gt->info.id = xe->info.gt_count++;
> >  		gt->info.type = XE_GT_TYPE_MAIN;
> > @@ -726,10 +736,16 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  
> >  	pci_set_master(pdev);
> >  
> > -	xe_info_init_early(xe, desc, subplatform_desc);
> > +	err = xe_info_init_early(xe, desc, subplatform_desc);
> > +	if (err)
> > +		return err;
> >  
> >  	xe_sriov_probe_early(xe, desc->has_sriov);
> >  
> > +	err = xe_device_probe_early(xe);
> > +	if (err)
> > +		return err;
> > +
> >  	err = xe_info_init(xe, desc, subplatform_desc);
> >  	if (err)
> >  		return err;
