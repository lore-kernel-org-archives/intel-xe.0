Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016DFCA0EEB
	for <intel-xe@archiver.kernel.org>; Tue, 12 Sep 2023 14:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4BF310E41B;
	Tue, 12 Sep 2023 14:34:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07CC10E41B
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Sep 2023 14:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694529252; x=1726065252;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+GFskzXK9X6SpnB0Gg2Med2gl8kspeLOPjFEhV+E/tU=;
 b=B25NSS2BKrzmR7KjHQp2SDmYu65aX1XYIg9pMbNSiiIConro7fz5/NeB
 CVbWsH5KtBoO2eZexhj8Q9RAvgNoMTfZcYpI0s92LzEuTcZyLWYGGMoZ1
 PUf6Snvob/DHKWmI6lgefMbUsT/oQztH0+2FhAbEht2L6eXxBeZb1FqBZ
 E0XH/S9jego/8xWOY6w2yp774dGvIPZ+ooSMsXf5LURdlrF9BgzW2hnar
 07UKsYpS9275uqrDh6byXbBr+xdze5IXBQXxzM+ifpg5zwq7uv2Jj/KvM
 167O9o3KPyWG+DE0t889lijrksI0WrRZshUOTrcaWrcwiXfUshzkKNxs2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="444824841"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="444824841"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 07:33:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="917447237"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="917447237"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2023 07:33:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 12 Sep 2023 07:33:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 12 Sep 2023 07:33:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 12 Sep 2023 07:33:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNqRKIt3kBqNiYqcOt9CYo/yRqCP4WEUUxfS6SBVhaCV1UiJdYU44yt1Fo3Vw+kjUb7Ex7OmABF+9HuzVsTMbf49WXsHl4rebUB7O1dX/jPRA3Ql4AjgxoUPdxXn9j3jh9BgWDqy6Q84gcKYynMqyhLTHZhUdhML/qhVgtolIUkxehTkrH7z31WyaVtZJ3070xomfZcIkg+mGhqabeby0qjqfDFViuGKHJwv1f8LhZJFVFZWbM6e/8nwtBWCxe0BKzAAjRQx0P0ru7HuydGGli8CdMo0g3Dyf2lyWyPfSvvmUOUwCb2MBWMwyi9bGw4uCTC4r9IStU1RYfvZ1sJn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qn/hjKD1WP7ykhPzCk11b13SZ64TIw8/o945L7LHSQg=;
 b=TPhdo8yfOs0vuteaTtWvLC0Vy53ZPtW05eVAGURPAFXliS3UtGZBox35aSA4fWNxqWbmLs2xNu8We0HzpD3IFXydyGvTDgRD7C7NbTEoLKeaDjmaIo15n7ZTPJnEr8SNtlMCzYomSQrj2DPmjlsd0T/K/HMzvDV96uiVa2MbpdYg2JkV2ZcC9TkoZWqdU1HAU6j8ce0nvKXJaRXTF5gHIPs0IpguwMRZEv0l2yNp3uvWF7kMGSGyfUK3y3ewkz8nLnP5up85U5rwTwkJRVf7TpfJGqLkS3T87rg7dWKDaFSvcvKRNZ9AIVfyzwWKeQzADO9E9ysf0ItF6Afi1jsj4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6189.namprd11.prod.outlook.com (2603:10b6:8:ae::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Tue, 12 Sep
 2023 14:33:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6745.034; Tue, 12 Sep 2023
 14:33:56 +0000
Date: Tue, 12 Sep 2023 10:33:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Message-ID: <ZQB20IN6ngi94/Oh@intel.com>
References: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
 <20230901121545.361436-2-sujaritha.sundaresan@intel.com>
 <ZPJK5iahuG41pvcF@intel.com>
 <42c5b687-7827-9ca3-abc5-66d094e726e6@intel.com>
 <27a95bc6-59de-42ec-5633-3b82cc09aedd@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27a95bc6-59de-42ec-5633-3b82cc09aedd@intel.com>
X-ClientProxiedBy: MW4PR04CA0216.namprd04.prod.outlook.com
 (2603:10b6:303:87::11) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: d510a920-2c06-4f6f-9064-08dbb39d4ba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KhqNIHD1sa/3gvX4Ay4Vl1nY7B/EpU3KuEtmG8lhyXGRFlQajxVps6CiIafawRf3L+/Z+VusWFUGOQ6VZ2285BrCWVjvtW5I59t9hIT/hqgQUklyvvIdc8cKt0uquTcpiKxfQnFcqvTVM7wNcHD5PivgZxYDKTaK5AbkdgDxnBl1ODMoceIOmQBduDx80+f+Olib4BhQv5SQjQGHD3JSVNuy9o5awoELbMVESUjD6QxfBlgLWkhTxj4MbeE/iHAE/TGSVmQ3cHAq1jy2+agfaNswxRmITWLbw7akg16VP18fgFqiXRi9/gVGFMflbHUezPmQWF/IKWFH/hikFjlB5vat3b0iiZ/UNFWa+ipk9weUDZvUr1A59ezJech8fNWYg4oYuKqHK5kff3d43ayEchfDlnfKW+rzzZ7jpdKqOyNHwmIYk0BI52wr7IS1NZeddkjrMNzHzRUd8QsAHpoip0GJMLOIU6AsgRrBT0FzxgbQIue0hkSoA8Vavwm7JwJoU8YRb3zZTFPpns4CP81xU/GNf5ujeacqsht+tlnyakoFHp+43mNUUDZ5jfmc9J3T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199024)(186009)(1800799009)(82960400001)(6506007)(6486002)(6666004)(478600001)(53546011)(2616005)(41300700001)(6636002)(66946007)(8676002)(37006003)(5660300002)(4326008)(38100700002)(66476007)(316002)(8936002)(6862004)(66556008)(26005)(83380400001)(6512007)(86362001)(44832011)(2906002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DpMQhsNZFwSAi4e09oykjGYBAnQYFB1EmbaywUVLQuBNNWrJbkuomUCJP8?=
 =?iso-8859-1?Q?b1XVR5TppL+1nKWEAc+4SqecraTF2EToR+ypRQhgoKryaPeKWwsI3Pfop9?=
 =?iso-8859-1?Q?keqPEYviRJIsaf7eW8i7MnPOliSdUR5OFTQS7aiP32HeZ3c+pFDXPLL9LG?=
 =?iso-8859-1?Q?P01+OuHioe5vZ6WG8KSctbxyV0X7J2/XWg3tEJlHAdyHEN+D7BUSkGHziU?=
 =?iso-8859-1?Q?PEXuw0VU5jt9jSp1c1qzduBDZG2FBBwX7PJPk/CWqsL515mpX6geED/sOA?=
 =?iso-8859-1?Q?h1vFNILvEP1PO1lvdPukMb2urXUl2QC9zJLcZuXTOxV7OY/RFveF6JxrzH?=
 =?iso-8859-1?Q?qoFF7T3ALSWuSfMqXtW3ClJH5xDxqTJPv4PIiXnm0STfGDMHelrhDX+YPx?=
 =?iso-8859-1?Q?e69m6jUsGlj0KXRRemZh65Z97pwAyDyLpWf7CGQaMWPKBFRBhU/ljhzq2t?=
 =?iso-8859-1?Q?F8bACGYvDy7FLZY25cFrkvX2p+PegglO/Zt3kqYFkmK+E6gLpBIyykxkm0?=
 =?iso-8859-1?Q?iQbmsA4nA6la2zjjOnZjCBc9UuP2EijJX6TD5rpHNop25KC0Iu3qUMQNm5?=
 =?iso-8859-1?Q?1MMzcv4GM4QvrfDTV/ItSEq0Yk0R2ji23Flnr6gh/5VpvgXoiS/CpBxisI?=
 =?iso-8859-1?Q?ZutyAPAd2ylCe2XJIzLELaJ0JnZxjaX15HsIeauMuzhtbjoXrSuiIjYtJ1?=
 =?iso-8859-1?Q?8nfqgY3PtWfx6UW88S2UNnRprHHT5HYryyQ+m9v1R0anr6lLi+vaqrOPmg?=
 =?iso-8859-1?Q?t53vIJVu/nHoKMqMTG8vt7XyWSe1xLVbXBRcQ9ecupqNGBan7SJ1G0Fo2m?=
 =?iso-8859-1?Q?Fs7qh79h7vwVLjHuOaDo7uT+sEP1Mdo+mzlqeCA1ayymT2UlOzOagXILXs?=
 =?iso-8859-1?Q?cuCQvhVKVIU+rOUQO/dMWB/hzbuSu7yluCwzgBi+tAXmbknXR/ZHHBZAhL?=
 =?iso-8859-1?Q?mzJ7NzrzR6vk+vdW+dI+nEP7qtHtbGsJhkx9JlkywyCMPRRs371VrXPLFw?=
 =?iso-8859-1?Q?Xyj5IeSOM2o6j5UzidwrzCkIXKq46EPmvo1X/R9Gv6FfDsfLvNKtBRuWJa?=
 =?iso-8859-1?Q?ysdXn6l+DDtBxF/FiEDOPkkGcUlwRTOyBNEf9aQRkWiLSazpN3ptwbgHDU?=
 =?iso-8859-1?Q?t/p3lLW2jn03gZgqllQgTFxv9z8r0okhfYszq5EmbfUuP7xHXLbolvD8Hn?=
 =?iso-8859-1?Q?cAWnZYiugFJS0kxLMBg4m+Nyg4tDg0UnwiNMgDl88QjGzHkWe5pyuWRmzk?=
 =?iso-8859-1?Q?/d/IJ6zQ/4+n2lb7u/hwnd3VUiNTH+9tmgHbpXxsKmANhYwumfdhIFFii9?=
 =?iso-8859-1?Q?0adc7r1vwbn/w0srVoaS5jORI4MBjNoQVVw44FOuPzybZH1IMCs4PbsGo6?=
 =?iso-8859-1?Q?lst346aQ2mavo8s/wcnwJhQPZFQSYWkPP8R8AQmpaa8VOTv/OkccSrSbhV?=
 =?iso-8859-1?Q?ro3iuu6GV5UYJ+PmOiuu/T3XBY+bl0QwpSz58jmWR6A1476BQSM8GWey3z?=
 =?iso-8859-1?Q?ZUW0Txj44VpG8Fy6aUV/HoYTIWolIZxZJ0mjQjxizxuYyQ1vl83818h4LF?=
 =?iso-8859-1?Q?9Ob6TdoXQWjX2+eTolnyYDGGd31miIRS677tQtDAptXoLUrMnOMd4wDbu4?=
 =?iso-8859-1?Q?mDtFEBPsmY6YIv61dpXZyOJuZ9s6c97OfL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d510a920-2c06-4f6f-9064-08dbb39d4ba3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2023 14:33:56.6753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 034dSm0pGlOH9U5vH9ZCAQb3iOGCX6qKUkoBdPxtpKgBtrk5h26gH+M8WZglNg1j8XBLYfteZOcqHXAfE0fGXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6189
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Add a couple of pcode helpers
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

On Tue, Sep 12, 2023 at 10:38:50AM +0530, Sundaresan, Sujaritha wrote:
> 
> On 9/3/2023 7:00 PM, Sundaresan, Sujaritha wrote:
> > 
> > On 9/2/2023 2:04 AM, Rodrigo Vivi wrote:
> > > On Fri, Sep 01, 2023 at 05:45:43PM +0530, Sujaritha Sundaresan wrote:
> > > > Some pcode commands take additional sub-commands and parameters. Add a
> > > > couple of helpers to help formatting these commands to improve code
> > > > readability.
> > > > 
> > > > Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_pcode.c | 28 ++++++++++++++++++++++++++++
> > > >   drivers/gpu/drm/xe/xe_pcode.h |  3 +++
> > > >   2 files changed, 31 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pcode.c
> > > > b/drivers/gpu/drm/xe/xe_pcode.c
> > > > index 7f1bf2297f51..e45169f47500 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pcode.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pcode.c
> > > > @@ -104,6 +104,34 @@ int xe_pcode_read(struct xe_gt *gt, u32
> > > > mbox, u32 *val, u32 *val1)
> > > >       return err;
> > > >   }
> > > a doc would be required...
> > > 
> > > > +int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32
> > > > p2, u32 *val)
> > > a better name would be nice....
> > > 
> > > > +{
> > > > +    u32 mbox;
> > > > +    int err;
> > > > +
> > > > +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
> > > > +        | REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
> > > > +        | REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
> > > > +
> > > > +    err = xe_pcode_read(gt, mbox, val, NULL);
> > > but why not simply modifying the existent one to accept 2 params?
> > > 
> > > int xe_pcode_read(struct xe_gt *gt, u32 mbox_param1, u32 mbox_param2,
> > >                u32 *val, u32 *val1)
> > > 
> > > and the equivalent write...
> > > 
> > > oh, and while doing that, could you please add the missing documentation
> > > to these 2 functions?
> > > 
> > > Thanks,
> > > Rodrigo.
> > 
> > Sure that would work. Will add the docs as well.
> > 
> > Thanks,
> > 
> > Suja
> 
> Hi Rodrigo,
> 
> Another question,
> 
> I can change the existing pcode_read function, but would it be better to
> have a separate new write equivalent ?

I wonder if we should do s/xe_pcode_write_timeout(/xe_pcode_write(

where timeout is still an argument but it can be null.
And then we merge with your options here and make a single write fn.

> 
> > 
> > > 
> > > > +
> > > > +    return err;
> > > > +}
> > > > +
> > > > +int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32
> > > > p2, u32 val)
> > > > +{
> > > > +    u32 mbox;
> > > > +    int err;
> > > > +
> > > > +    mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
> > > > +        | REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
> > > > +        | REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
> > > > +
> > > > +    err = xe_pcode_write(gt, mbox, val);
> > > > +
> > > > +    return err;
> > > > +}
> > > > +
> > > >   static int xe_pcode_try_request(struct xe_gt *gt, u32 mbox,
> > > >                   u32 request, u32 reply_mask, u32 reply,
> > > >                   u32 *status, bool atomic, int timeout_us)
> > > > diff --git a/drivers/gpu/drm/xe/xe_pcode.h
> > > > b/drivers/gpu/drm/xe/xe_pcode.h
> > > > index 3b4aa8c1a3ba..8d4103afd7e0 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pcode.h
> > > > +++ b/drivers/gpu/drm/xe/xe_pcode.h
> > > > @@ -19,6 +19,9 @@ int xe_pcode_write_timeout(struct xe_gt *gt,
> > > > u32 mbox, u32 val,
> > > >   #define xe_pcode_write(gt, mbox, val) \
> > > >       xe_pcode_write_timeout(gt, mbox, val, 1)
> > > >   +int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32
> > > > p2, u32 *val);
> > > > +int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32
> > > > p2, u32 val);
> > > > +
> > > >   int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
> > > >                u32 reply_mask, u32 reply, int timeout_ms);
> > > >   --
> > > > 2.25.1
> > > > 
