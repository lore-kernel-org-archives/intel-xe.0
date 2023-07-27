Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8479FC001E0
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jul 2023 14:42:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4870910E594;
	Thu, 27 Jul 2023 14:42:30 +0000 (UTC)
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBA210E597
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jul 2023 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690468948; x=1722004948;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZAqymrpgeLfAKstcfn7Jydkk6sTjHU+f8OD2v3ylU5U=;
 b=dw44uFZBFaFQmqJwcN4D/GlMotyqIrWIaj0o91se4MEcxhmqdrLYAgeh
 X8JcI0kfBKptIgoGawh725fh+nqVnHyBtOWwUOIYsYCXDfdFPk18d5tyJ
 Y4ggTomHLofkO/ojMGPQQN7vQvrQVjAsQc6rXB3D4FEk89aZOwxMciMzj
 XeYQISVb7ynH2daIWPdrIv841sQs9rJ31MNT5Li6mCTxPW+MkfJaUS6e/
 GU7d5Nk1IoxADVy4w98IiHLB5WxWw5pglDU3Cu2FAXhkAUzE8XkRO5kfm
 jDXNC3SwvY13wHFxW1jgXaXwP1zMw5dWug+Mo8Rq3K4xdkxlUidKfydt9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="368344307"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="368344307"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:42:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="973586480"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="973586480"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jul 2023 07:42:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 07:42:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 27 Jul 2023 07:42:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 27 Jul 2023 07:42:27 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 27 Jul 2023 07:42:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OMuPTLeeyrqF/fpRAP/bSW4AryZmV+viA6ypqCn1+WmfJXqolL2LHKn4q+Mko/jqCMXMQAOPvNs3Doz2XMiYiNYdYO8MsUfsHfwUhsM2FY+tCOlmcT9F8XjO1pAciwq6w+gf+6NtvQYBDuHFzrHXzE/7ciuUJ0hbWqp/c84I6fbQ9LjIrUdKNTaWKCemzETDPYZCwnltv2WZf27rdPAwOtqCWZJ5kLUEqOJjtG/S0PF7AA5b6VfEUTKQOxzgaKbbi5B/q4PbRYUvhhzG07LsC0sDMrC5KNtXuDIqr9pNr+pPsct3GfeB5Y2X7266JWAlmqKctKbpbKY7GQvdW7iEcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ZH1xlkAYvaeC/WVx4tE2H7gxeMuzvWUGEbjsKbMPEc=;
 b=RXWwPxZo2XCnp/vzgEWyliAJmLCAbltp4DV0h31lr47EZZld0q18ZWRboJ4/+VRx4lP8UAPUbzpxGBOw6/KCepx6BoSkoPfVmebTSg5/YwX4CilEt/Nm8R7KwBheWsQjJHzTZ8TbNYI3UeUEOWPg8R2zW3hbn8C+v6p2xe0nm932d4tYElaUtDEl/L4Sbz1DRWqGLNcnPGW2sYCb/BDb/whooe7Ah1qufrCozoskj4dLBCc0/I0Uh4bxn7w0W2MLcXS1yfIZ+e2fZeYZVvMA1M8qbyqtqnEoXJRM5/0GHk+2XRvJe5D2a9Js248HqzrU3z2TUnNO9lwW//PXYzwbLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB7112.namprd11.prod.outlook.com (2603:10b6:806:2b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 27 Jul
 2023 14:42:25 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::df9e:93d2:70c8:bf83]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::df9e:93d2:70c8:bf83%4]) with mapi id 15.20.6609.030; Thu, 27 Jul 2023
 14:42:24 +0000
Date: Thu, 27 Jul 2023 16:42:17 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZMKCScFQBN83KJZq@fdugast-desk.home>
References: <20230727132630.7-1-francois.dugast@intel.com>
 <20230727132630.7-4-francois.dugast@intel.com>
 <ZMJ5P0Bn8O8T39of@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZMJ5P0Bn8O8T39of@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::21) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB7112:EE_
X-MS-Office365-Filtering-Correlation-Id: a235b908-0c01-462a-ffba-08db8eafb127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nKHHMJHCRpxwqc5TrbGVS2+2j59NE/DxT34/+nP8Fh6TAF8O+/qEehSssCvY4uoYXvpSEKG5NX2ZS8KF6IPD6/p2HvLfBklBF2Qz6s9nzrXvnleUKX8ENrYKNe2ouUQzrAlwDq+oRtbPg1QmwzElwnwZnsnklGsFLJsGY+dxL6w8hmamqp892Iz7X+4Q7TT74IsU+otRpq5g5f1Yc/Zvi/wTI8rkGkXdcbwV5nVUjFYZX7YlWH2Q2mFgMiKe/KqkqohmQPRjpNvsiR8oZ6htEClx6rKQGj7yS5D7tyckaDqI52QKwcIYWQUaJj3MpxwfcmNoqhDUtLr897uJxn16N1HfCztAgCQ6SMDa8/bNzZ7GOIdFX8403uEvPRyqKpw5CjIhruN+uRFkeenTpnd8si2un0Bm6S4h3jLWKkVkrJ3/PWlytsG/2h2FtW5VDg/yydlVE8d2/37g5q+9mEOl8cinOI9yN/5U+wj2X+PYQuZbgVgdOYOePszEbxU8stVIOs9/3XEi8oRnx3ZbA2SUd4Tf2PAfOv+mhgzf4cv3lVT/TG5xWSdbH1oJE5p3y+Ys
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199021)(15650500001)(8676002)(8936002)(44832011)(6862004)(5660300002)(6636002)(41300700001)(4326008)(316002)(2906002)(66946007)(66556008)(66476007)(6512007)(26005)(9686003)(36916002)(186003)(478600001)(6506007)(6486002)(86362001)(36756003)(6666004)(83380400001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aT2JtQSA4HDSe7QVAZ9QEGh+abKLET9FMiZeeOtAfPSKRMnNthWu9iMW/PjX?=
 =?us-ascii?Q?J+WX8dmUkMABcYwILLZjLxfXbGBE26kjzWVNZls1bElb5mZ3D9xkYP5aPnTt?=
 =?us-ascii?Q?MOz1dUR2XX+e9aFPW+VYruX/w0A00LMxvPKzblmFW96z0eFCSWLz8KgeZqfj?=
 =?us-ascii?Q?32y2CuWZF1EtqksyyIBZEKOzYFxaloHjNxtYnPJRsdZmDceJK7/nKhAODMD9?=
 =?us-ascii?Q?qiG7rgIuaI9wU1GEq79lQJwYc/LP+79PzictxKe+PFQHi2jN9sP4MoCqj8e4?=
 =?us-ascii?Q?tTNWTRq8SgxZf0KYcGYPW9p7Ce+CzObbpwG7Pyp1KpxfGRGAGV/w60AHUnaG?=
 =?us-ascii?Q?3IjratUHXP+dCGyALMVfHKg1OJYdNiuJK7E9STc8uPXdO6i0jQF1eCKfPMg5?=
 =?us-ascii?Q?NN0cqaYVjO7Sv/Ioxngs5C9dsks4HU2eSZdARr3Z3bmqVBCIYFJ8xxc0+8j+?=
 =?us-ascii?Q?b1cFLfpinx5EYc/enzhf4VsouNyP88mYgsgwdc5QCJY9yxzVpHyQHQN/zRx+?=
 =?us-ascii?Q?f1uW1yCQUUHxtP1c6OSY02gWadSii6cpnp49hQO2d28w8P0O6AIqVeSxGlYn?=
 =?us-ascii?Q?Tg1sM692kRRTDBUgq0veID5SfoidTuMGU4X/1Q3Lu1Yw49AvYxe5i5Gr69Pf?=
 =?us-ascii?Q?55MfebW/th15vlgbFck6hohdND4STrxRoKrMZI7hP1d5cCXJ6FkSh2ce0E6+?=
 =?us-ascii?Q?hs+jPZYPc4semOtnJ+deVXmNxKk235WJkeGbRZqOl3GQpQd6QG92XYKPb1bI?=
 =?us-ascii?Q?Y0cC9LGy6LjXGRaDJM8HG9WZNBxudcXgaFfY+1AnSWDKTiiJhY5GRZDw43IK?=
 =?us-ascii?Q?efT88JQ7lRD9nSfN+FllZUSGxLGP40KlH3eILpPELZ9/xy25QPrCqI0YmatG?=
 =?us-ascii?Q?GIxmQP0CkF8qsb2YL9fNT+zalBKv7LsAjJ5n7tP6gI8rlF7iQ/aqoDLXM28C?=
 =?us-ascii?Q?VrLPHdRTjS1Ub+cg3JDOV7eFoI03xzbBCR8pL/vlQpGd7isTDLgWe4H9IBjT?=
 =?us-ascii?Q?Z2ssBIGYORHtF2QttmX3sF7T6iAhqt4h2iBNj//w4pemBUSZlhCC1lLow8Mi?=
 =?us-ascii?Q?Xdk27eEYxnJBVqKKOQwh5fWwt4OdSmRAYLrVmdC4WE+ath15hR7myuIoT9sI?=
 =?us-ascii?Q?yEofTLrB38J/RNZNfoW/Dr8vT3qTYpEOqA7W2C2dDWCe8QPKFXyHYrG4Zbxs?=
 =?us-ascii?Q?2NWmiHtRqpPcVXAMgP3gFNZpn559GYj+b+giFXPrYo0ZnXnOTfBDtPEN1a7C?=
 =?us-ascii?Q?6RCSM//n6y0F4PKR620nn7QHJPZ3yDVDaD+C0/kLNYxv4xsctUhKW3J/zhgT?=
 =?us-ascii?Q?Cl7mQEWFwSjKeB2KWb0lNpmTUhQCNamulAkFFleCxc7Le31FQTXyZt02NK8d?=
 =?us-ascii?Q?YRkazXKW7nyXTj71lLZfL6eb4xR/JecWJZIuShcSIJxf0TBWeeOsLxZH9/Yi?=
 =?us-ascii?Q?VBmjsxQYcET8dfnINRxtRVp4NbRnx1LGkIqf1uIxvvYu03aDATlOKG0h1zS7?=
 =?us-ascii?Q?SPJJSWnPZfMnhTq4GvL5A026tYMe7Lg7IPFxkC4xQx2Ub/bZBids66o4iG5Y?=
 =?us-ascii?Q?PwysBj1HkeGOVJLpSOahS2sW+mL8ay2/ZqbJyH4yPEkIzzcMbDNQso4zECZ0?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a235b908-0c01-462a-ffba-08db8eafb127
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 14:42:24.7075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIueqqIlNaHRrOuRWkyRXEbVUvGBXJ0mG5D8k2CMeARqUPbBjQj8RqYZWBAQ2o+24EcvfxVemq/KbGkhllExpsjz2xPixdL5WPjwXOZuZlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7112
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/3] drm/xe/macro: Display XE_WARN_ON
 messages only in debug mode
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

On Thu, Jul 27, 2023 at 10:03:43AM -0400, Rodrigo Vivi wrote:
> On Thu, Jul 27, 2023 at 01:26:30PM +0000, Francois Dugast wrote:
> > Make printing of XE_WARN_ON messages depend on Xe debug flag
> > CONFIG_DRM_XE_DEBUG, so that those messages are not printed in production
> > environments.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_macros.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_macros.h b/drivers/gpu/drm/xe/xe_macros.h
> > index daf56c846d03..6ce86cf9605c 100644
> > --- a/drivers/gpu/drm/xe/xe_macros.h
> > +++ b/drivers/gpu/drm/xe/xe_macros.h
> > @@ -8,7 +8,14 @@
> >  
> >  #include <linux/bug.h>
> >  
> > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> >  #define XE_WARN_ON WARN_ON
> > +#else
> > +#define XE_WARN_ON(condition) ({					\
> > +	int __ret_warn_on = !!(condition);				\
> > +	unlikely(__ret_warn_on);					\
> > +})
> > +#endif
> 
> What about getting rid of XE_WARN_ON all together and replacing with
> regular WARN_ON or drm_warn when we need the stack info or drm_{err,dbg,info}
> on other cases?
> 
> I'm afraid that if we add this condition here now we will pave or way to
> have a driver full of xe-isms instead of aligning with other regular drivers.

Yes I agree and will send a new series. As mentioned in the cover letter, using
drm_* goes a bit further so for now I suggest just getting rid of XE_WARN_ON.

> 
> 
> >  
> >  #define XE_IOCTL_DBG(xe, cond) \
> >  	((cond) && (drm_dbg(&(xe)->drm, \
> > -- 
> > 2.34.1
> > 
