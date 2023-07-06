Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5D9EB64DD
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 14:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 642D910E41B;
	Thu,  6 Jul 2023 14:52:51 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6460D10E41B
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688655169; x=1720191169;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LTWk6bFzpYEq+LXadANeTiczbv6APRH72YU4fZdMz0M=;
 b=Ijvrj+60t8iWveoZ4AyBhZmYvQO/XA3nMvW2dLf2ol2KySg2P+7/Au1P
 ujhjHndtE8PfN/OiQ5qR5MDBrogbJp9CG1y8b9dSZhYULWvm2hf/fuxo7
 ykkQcJeGHv7NyYh3Tns9Mv0LIUzRX4/Ufng7r2G54/KACJo6UATrgVk2s
 D511Udk12vbvJZppQNv879du9RUXkNk9zDdnSSKsujMfEEe2tVrK5oEWS
 em4VgxuQuiYd4K1bqEGpfSGP8GBkcu1WB6v6MBqcGWXHz9ypGCCiSybjP
 LD4EuIBfClj41JbwLGRyVb2AEWbIgi7BNi9689klZweQVGm4UYrAhaLgR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="427300734"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="427300734"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 07:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="809662859"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="809662859"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Jul 2023 07:51:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 07:51:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 6 Jul 2023 07:51:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 6 Jul 2023 07:51:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyUd9SdqCyUJhpC9AEwAMPtiIZi4oxKxhyWd3x3vjTn28SnbGrjV8nOXnagpowYUPrU4yNlbu002scZOiBexNsAt7DZm2b0lA0/9JbfQhhoGeTKB+PjkAGAodD9LjScgBYj6Ngh2DGVNovhgGVA2UbtOTkrF2upM1n7eXAaM9m68nqRfbqd3c7hgP/IYQkbu5La69uDLfcN2k0u0PvqZMn0hbMm46tJCT1sV5xjLy5ammB9A/3U3HMRZY16VTqD24iTD+0zlA/stbojd6vFhqbTuH3IoctEQwzpzAtzDSKVDzM5T2p4EUr5F2ByXjeSa19t1usLoPc1bOyRYryJhow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EATFBb+UDD7ddMRG2KJLoym7KxOes9FPdCdQ6QDkEME=;
 b=H38i/u4fcDtx7zPtpdL22eqwcvFG/Rd3VoVlss57oOVA6UCLGv71QEHqP6JIGM7MDTnhI+PYTh5/rQI5yerhiYajfoEIobtWyUW7CFVvf+0uOFyqxiT9OVeEan2GfP1WDX7k46b3dvswbQkXyygP1LzsMUsynPRR1N4Oy7l31+ZTBePqRYmM3rZq1cuZFyMJxK3boxU88tOI4jYEjgdo78QjIyFBqA1shNDB23+npyDUItCiZR03p7gYYRDk6BOZVD8DfNek7fUrNxBZg3BLJQuNz+ZV1q0LFpq5uvH/maGky+412ntZkab9TMNje3ysU9XgwYrgAy6FwG5yz8xCEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6303.namprd11.prod.outlook.com (2603:10b6:208:3c1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 14:51:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::c65d:c846:f197:3ca5%4]) with mapi id 15.20.6565.019; Thu, 6 Jul 2023
 14:51:22 +0000
Date: Thu, 6 Jul 2023 14:50:43 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZKbUww8p+c9r4D4e@DUT025-TGLU.fm.intel.com>
References: <20230705160602.237213-9-matthew.auld@intel.com>
 <20230705160602.237213-10-matthew.auld@intel.com>
 <ZKY6SHpACikaNmET@DUT025-TGLU.fm.intel.com>
 <bedd83b9-3e30-ee31-a61b-4e28fc38a9cc@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bedd83b9-3e30-ee31-a61b-4e28fc38a9cc@intel.com>
X-ClientProxiedBy: SJ0PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6303:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b4402dc-b59b-44fb-a3b1-08db7e3076eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Yy/zjgMvD5oLOLjtCysq8DRpCKAS9eX7DymiNuOSxG2CqYazrwW+4ZWMCgGSie/dfSea+AbFKRzzllwmO3YS5PfIl18e/yrFAPnrnaV4PwpU6CX5oRAwU6GBayPnPRNINUcCY8zEuPO/mPxWwQRjydLh6Ha8PHH2YM4m8HVW4dIiqjCf2kHDIW7dzDxi3o1RdK5CQpK9+2Phi1oZk7lLbWmyEpA9dcJ8KdDoSXQGCQgdLC+/XTvQWYZ1Lf85rQrXAbbf1UortZCtKHLY6WYYBaFT1UIjGoIWPrzhaVwWhcGvg8IXDr0eF389bqJ6X/Izb4R7zQUiA0nhK/J8JYwlnvPqAltiWtqZQr6redT28XnQ7SjuDvTSvKJrp/4BfgLy2wYYbunsGv+ix5oVRp75BPyk5Pg0CdO6+2rWRQeBAsl0eywnePkwNYV4/u8pj8Z1J6H7+mvZ9BzY3oLX5WLfWi2voZ67rvUbvAcsIITNlTu3q+6gccnc35FWhcNr26MbFcQecgEarwnufLQkfQ0OLYzKAueVcfTkjq52CLtekeCMVyin5sLAtB6xjlSNFyCcPOq1tsK0cxzeq5Fwntwid5squyY6dIhLFMT1rCLmiU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(6486002)(6666004)(478600001)(83380400001)(86362001)(2906002)(66946007)(6506007)(26005)(53546011)(186003)(107886003)(6512007)(82960400001)(38100700002)(316002)(66556008)(4326008)(66476007)(41300700001)(6636002)(6862004)(8676002)(5660300002)(8936002)(44832011)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mVlJMVjDfUj9FwECP2iyHlvquLghhb+Y7NTkp5B6UhPgkBry46owWVJDez?=
 =?iso-8859-1?Q?+ObinPLgHc0010Q54RGFKxfyLbpooSLSO2mKNrZeDtZYrV65u4djz+cgNp?=
 =?iso-8859-1?Q?bfh6G4XV0g2s5YTFpp9gfvzu655dwpstf/6MbANeVAAyOztggDJQ6hEBFQ?=
 =?iso-8859-1?Q?M4CXFS58eSvSXrbCy/JORsecv7fPTBI6e689hw58haiVBfW98Nsy8HqhOO?=
 =?iso-8859-1?Q?WocOh1HGVtwWmXk++ArQNThFLQTF8ndNHzrFKjhPz8rEHLoermsFNmHJMP?=
 =?iso-8859-1?Q?tpDYDA3FCFwC9oiYbxtufdRGZwNcrI0ySr2nZZ82Uvm2ZNKI4P9oMqpcwl?=
 =?iso-8859-1?Q?Ch/aSfSca9O3dy0uefMU44lrZ78SRhk/GWtcTvaBzHGnwNG9GozV6mAkjo?=
 =?iso-8859-1?Q?YuxoVVMr7/MWTgSAJPdc8yAtq28qJE15Xblw/szlq10MD4ywT0esx2Jc7K?=
 =?iso-8859-1?Q?4TMWrg7tF1hJzJmaNoKIe20cKPG6Se6IXP30DV0CsLw3ntF1SR9VWYxQxA?=
 =?iso-8859-1?Q?tw4tO4JpEF1Uq2yMhj3JxFAelxvMk//YSLgHUB9+DEJxxNg9zPF3jRvfA0?=
 =?iso-8859-1?Q?zFRU8q0GJZJLl51GrZNblUrB4OMJ9AHdMUpf0AFhEnWz302OPprN4OpFfJ?=
 =?iso-8859-1?Q?Y0FYKvIAFY7FlIoar+VirgQsMUO/OJzDtV7y98q6IgNQJo7r70SqS4rQUh?=
 =?iso-8859-1?Q?Y3HQ3axk2/cD1GuESqcSF+pZiKLL0mr1ZndpgfEf6NALUzcCh7Y0a2hZF9?=
 =?iso-8859-1?Q?DlKsgKTWjA9OlKdwja1/skL6aSf9JS+Y465KqUihKm2s/AWAf98ct4UL47?=
 =?iso-8859-1?Q?Mn7oC1Ob0+kCNv5seihYH5ipNviOuWAFGj31wbiqe9GbXEWtfzTcYBn0/O?=
 =?iso-8859-1?Q?8tjq7ONMbpIMuuChInpmeYUJoocz9Jr0OJiHLiNDKH/eMr/8OiZRAVxQvg?=
 =?iso-8859-1?Q?I/dLwlvbl8SbQcRz3glq0cetmin5qBmODrXv1Kw58pA77mZ1beno2w4YEI?=
 =?iso-8859-1?Q?Pjx78YMfGtHd++W+8AYOBZOQ8MnIda0qnrfyKK/DkVI5ea/IBqyX4v1UoN?=
 =?iso-8859-1?Q?2GIj3ePi7jhhsvidLFmJOqbqLbLZYDd9LuC8XwH9U6BEmFZiuIn5aGEUk7?=
 =?iso-8859-1?Q?Y5Z4QOlkB57r1LwM3iT+0H0bi181OhuQP3E8etvpXyDLhzFDhMK630hFaz?=
 =?iso-8859-1?Q?nGeUT5FmlRqWY4E7BlW0OEy30MIEOJ1NpTOkTAKDn2sorBCxT1ma/rADpT?=
 =?iso-8859-1?Q?bMc4XIhCwYiutZIvssvPaOPV6jupAyZ0wP2SjKWasKnGmXlPc3VTP6zh+R?=
 =?iso-8859-1?Q?GW5ZwIj0Gbw6+t/OtRHWbJsL/Z7YA+/hIfFb4yY1xuqekVQRIVEkE2v5ve?=
 =?iso-8859-1?Q?pXzfB781S3tVNvhNu5u6UeUgzS5eHG1IXRUl4S9EmHRk9Xb46w87IDoEJ9?=
 =?iso-8859-1?Q?+xPALutavZZRIL3EVMBWkYLuSc7BfGBRsTqjuRL/kmi9RngbnRsBoQdJCD?=
 =?iso-8859-1?Q?YOAB0WlzcCvxHwQNhkpD/ytbSDn8b6M8cHQXvkypjA9i97wObpfkh6jDEg?=
 =?iso-8859-1?Q?ihVAUje2g8Ow/gf8y1GhhY9/mS8qu/wvRqY4S8S4gwqAKUTV3q5M7lxKR9?=
 =?iso-8859-1?Q?QLXboRDAOjyAULY0TiUbTfUJcBDtHnLGkZl54ToltvJYX0mO6TsN/mWA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4402dc-b59b-44fb-a3b1-08db7e3076eb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 14:51:22.3533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ITyt/2SZY7ulXgp2rKj9M+NmOJl4QhIKq6t+0hrIXBStyjMu4nwxGXJCl45joLrjwgq0jVQjg+mA8IKkDLhEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6303
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 1/7] drm/xe: hold mem_access.ref for CT
 fast-path
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

On Thu, Jul 06, 2023 at 09:29:09AM +0100, Matthew Auld wrote:
> On 06/07/2023 04:51, Matthew Brost wrote:
> > On Wed, Jul 05, 2023 at 05:06:04PM +0100, Matthew Auld wrote:
> > > Just checking xe_device_mem_access_ongoing() is not enough, we also need
> > > to hold the reference otherwise the ref can transition from 1 -> 0 as we
> > > enter g2h_read(), leading to warnings. While we can't do a full rpm sync
> > > in the IRQ, we can keep the device awake if the ref is non-zero.
> > > Introduce a new helper for this and set it to work in for the CT
> > > fast-path.
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: José Roberto de Souza <jose.souza@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_device.c | 5 +++++
> > >   drivers/gpu/drm/xe/xe_device.h | 1 +
> > >   drivers/gpu/drm/xe/xe_guc_ct.c | 5 ++++-
> > >   3 files changed, 10 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > index 07ae208af809..94b0089b0dee 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -412,6 +412,11 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
> > >   		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
> > >   }
> > > +bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe)
> > > +{
> > > +	return atomic_inc_not_zero(&xe->mem_access.ref);
> > > +}
> > > +
> > >   void xe_device_mem_access_get(struct xe_device *xe)
> > >   {
> > >   	bool resumed = xe_pm_runtime_resume_if_suspended(xe);
> > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > index 779f71d066e6..8e01bbadb149 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > @@ -138,6 +138,7 @@ static inline struct xe_force_wake * gt_to_fw(struct xe_gt *gt)
> > >   }
> > >   void xe_device_mem_access_get(struct xe_device *xe);
> > > +bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
> > >   void xe_device_mem_access_put(struct xe_device *xe);
> > >   static inline bool xe_device_mem_access_ongoing(struct xe_device *xe)
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index 22bc9ce846db..b7aecc480098 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -1038,7 +1038,8 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
> > >   	struct xe_device *xe = ct_to_xe(ct);
> > >   	int len;
> > > -	if (!xe_device_in_fault_mode(xe) || !xe_device_mem_access_ongoing(xe))
> > > +	if (!xe_device_in_fault_mode(xe) ||
> > > +	    !xe_device_mem_access_get_if_ongoing(xe))
> > >   		return;
> > >   	spin_lock(&ct->fast_lock);
> > > @@ -1048,6 +1049,8 @@ void xe_guc_ct_fast_path(struct xe_guc_ct *ct)
> > >   			g2h_fast_path(ct, ct->fast_msg, len);
> > >   	} while (len > 0);
> > >   	spin_unlock(&ct->fast_lock);
> > > +
> > > +	xe_device_mem_access_put(xe);
> > 
> > Can't this sleep if would go from 1->0, i.e. can't xe_pm_runtime_put sleep?
> 
> Thanks for the review. The rpm put() in xe_device_mem_access_put() always
> uses RPM_ASYNC underneath, and that is always safe to use from atomic
> context. The kernel-doc for __pm_runtime_suspend() says:
> 
> "This routine may be called in atomic context if the RPM_ASYNC flag is set"
> 
> It only really queues the work to run our rpm suspend callback, and never
> runs it directly if using RPM_ASYNC.
> 

Thanks the explaination, with that:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> > 
> > Matt
> > 
> > >   }
> > >   /* Returns less than zero on error, 0 on done, 1 on more available */
> > > -- 
> > > 2.41.0
> > > 
