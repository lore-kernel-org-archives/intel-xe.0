Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859DEC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 15:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A8610E8CA;
	Fri,  1 Dec 2023 15:36:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355DC10E8D5
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Dec 2023 15:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701444973; x=1732980973;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=K/bUh+lsiuSndTI9ltQ44fuaAe3QQVTVdjvpDjOMXaY=;
 b=eXBrPHmgNU1KAznpQnobewwsGW5cZVr+lQO4McKxFhG1zHXX6bhBZpID
 31ooJKbFbpyJL+VuQnhIz82FdwLjS1mG9/BHUhTBIxBtMKSB6TIZ9xQ7J
 g/IFrydFCgb9ReXfOl0Y1Acm0NYYVnF/sb143xXAlYo30gme9M62Qv4mP
 sXax6XFlwZ2tqpr7hoiIq8ggjzDi2CP/0xy0e56ub7zeymn7O6AU+tBvC
 Sf9x9ta4+iPSYQnRYghCwMPoP2Lw33QEL6ZhrS/GLJHkkY+n6UFvKxCrC
 fRbN/slMtZjdvxRkQIp/rFEHA70eY/5lwVBykKCG/fyNfskKlfq3YYmGm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="390678124"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="390678124"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2023 07:36:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="860588342"
X-IronPort-AV: E=Sophos;i="6.04,241,1695711600"; d="scan'208";a="860588342"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Dec 2023 07:36:12 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 07:36:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 1 Dec 2023 07:36:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 1 Dec 2023 07:36:11 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 1 Dec 2023 07:36:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nmh7WOjYyW4RjAPr7Klg5yezCQl7lpJkbwGrMaQ9pq+zTSnLlIh3f2NYzdJjhmSKJPPvBNw3JNu3KZyDLkM1v1L2sZYv27PDDe3GC13V/I4bxk1l4O0J46GUyN4Bz/h0rmK5x+o4G8GA2qA1+2D0m2rOZop3PR0hlAE3IgCZohvWubjelpSkPz1vjFwEWKU7ztCNmR27iQH+HPz6zVx+Z+r/h6YyC9zNIGmzFCQtwYHi2ZpOffasNIo2h5/lwo/VofRQjt0YHmEVyYipE6axY/0heCLknS19FDFXbqLZnvqamX8hbFQXVJVyYNBK/zocaI5LeTmdufshyDvID4O0hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZa2QRv07EX69n1/n6J0c8hq0j/ZZ/sMZ+i8IrkhOfY=;
 b=BUG11mLfKWJeP5tb3zZb627oaJS4Lz+j8TWdBrw36LJxeEEXO58jaCsSwRRYCWonBpb2fYN5j2qk1s3CLVYG4uBkms5hPruekZrMR2+KLVUNe1HUbBGShHNVBp+9P92WmhRQOYtxhYjsufZDObseD9dPMy3QNyJkYI16+3faOsLVVj/0XVm68wwscqQoSgEWu1J9K/czpivRF4Wyx8+S+4fDwHVedT42pKCmRvJGKu0op3F97ewPFZfQsIFJrQ0zRpQbmKn9Vmb++MfwRQnE7GzJYuDruvblN4+XnKS8nN15+cWpAE8lTFd1aFEmctZVPnMbc9WgPv2vO2UEC5HBrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CH0PR11MB8168.namprd11.prod.outlook.com (2603:10b6:610:186::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27; Fri, 1 Dec
 2023 15:36:10 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37%7]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 15:36:09 +0000
Date: Fri, 1 Dec 2023 16:36:03 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZWn9Y4jRy5n1VoEm@fdugast-desk.home>
References: <20231130111423.434744-2-matthew.auld@intel.com>
 <ZWiCFLkrNLNIHE0E@fdugast-desk.home>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZWiCFLkrNLNIHE0E@fdugast-desk.home>
Organization: Intel Corporation
X-ClientProxiedBy: DU6P191CA0004.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::21) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CH0PR11MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: bd27ff93-9745-401d-ee2d-08dbf2833e00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eh5hLCaKtZHnlUfzsEPcQY7bOytIE6yD/viCdYyTLJKxjMOEl0RHFxTT9faTIT0Mj6xx1/19Ls73xKqtpPAZd3AgWdFJfIwI8vHA9C89svmwXdEtR8hYHebgqCLBYdqYEofKe636M0dJQ6x4V+ukkhxLVpc2WYd+6Ks2kh1ZHzKa88RlhCiNzw7cqoXRgV6VjyQgfbpMj3OlQv68Lpx122l91fX1UGXuiaxTEOp798mm+oy44DrvI8cSRBrQQKGlnw95WjBQeuHZ+AA6crCROBUmQDhuX01tydS8brg/DUJiATWDTAdl1gakZZix0AMwk1ivTTwpJtJzUvDU7G8MdVZXFtV6ebdA9cuWvvFnSlIi++XUpyKNWf2ZTqVSknqb1gFnW+am1NWjZu/tj/Xve4s+0WJsWKjZ55o7lZRUFycibaH6WIsBXbLUNxGP4zvy8QdlHN3yW7KHUK1zLdd6xntu53rb5HauTfxbVeKssW8VTDbOuoMaAInEzGds73HULhOB9dJbpkoBcvTqkL+6reVpjqO1f89GCInKQeXHfOg3ziLc7O7YeTNxWfSgd55C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(376002)(39860400002)(136003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(4326008)(66556008)(316002)(6636002)(86362001)(66946007)(66476007)(8676002)(6862004)(8936002)(478600001)(6486002)(44832011)(5660300002)(2906002)(41300700001)(38100700002)(26005)(6506007)(6666004)(9686003)(6512007)(36916002)(83380400001)(82960400001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a213SWlIYUQ0TFZiUG16U1hES2w3cWtqRTltMWRwZXV4dlFERTZGdkNOSlNh?=
 =?utf-8?B?Y0F3VHlHbnBRS2hZQUlpVlRFVlY5NWpNcDJRdzllL2pDWWxtcnQ0Z1UvNnJv?=
 =?utf-8?B?czJuM2Ryb3A1UmpHY1dEYWwvL21HWTMvck8zbDNUQ1JKTE84SFVaSXByelpM?=
 =?utf-8?B?b2FFMGU4cE8wSzBVSjR4eVZhQ0psZXhsc2FyVVQ0U1hDbnBUdWNDT1lBY1NB?=
 =?utf-8?B?MENvTnYzTFpVdWtITkFaQ09oY2JpSE8ycmcwSkppaDY2WXhBZnRGRXdaQXJx?=
 =?utf-8?B?eFVYc2p6OFVFb0VCcXlOUnk0TS9yVVBiQlp3SzlOWTIrbytSSkU3dmJsbG5o?=
 =?utf-8?B?VlIyc0VTb3ZRZEFTMmd5MjRWMHRxdC9OU3h0amJIS3JTUFR0WmJOVU0zOGR5?=
 =?utf-8?B?bndzSHBoQlgrMXQrOVlQWTA1VXJLMTMwKzhnMVBUR2ZtNWpBbSs5dmZXRDNV?=
 =?utf-8?B?MnJmT0Y2L1dqT2s3aWI2L0dMM1l6NmdiYmc5dGt0U0FqaVV2dy9PM0tsUFNx?=
 =?utf-8?B?UmRYbXFDc3VlbHRYUjh3UnRjaGZKYWpRcnZNL0tEcnUyREZtTU9zSG1aM1Bj?=
 =?utf-8?B?S29wTldhTUdvTnJTK1NTQ3ZVc0dJT3ozb1hlbisvU0Zyem42aVY3aktZT0Fl?=
 =?utf-8?B?UnN6WXJ6eFJ4czRBVGpaNWQ0STBGejdXOGFybHVRYkpqdFdUUE1ZZUx3eXla?=
 =?utf-8?B?L2tXTFQ2M1RTSVNQTWRzZFhNY3FjaUduNThEUUNhV204dC9KeUJGS2JFUkIy?=
 =?utf-8?B?THBkbmR2OWRPMWYxVTRnU0lkWmVaVkh2eFdiMnhldnpJekxCSHd2Mnc0M1B6?=
 =?utf-8?B?bWhKR3hpMjZkQ1RXRXhmVjZBcHNRRVhtWHlCL1FwYzAxMHBuL1dvMDA5aHFr?=
 =?utf-8?B?aExYWlUzVFZ0Y2Y5V0pPWERJRnBWVHAvN3RxU29RakQxSUQ0WmMyMjFCMUxy?=
 =?utf-8?B?QWxIaDF5cEJHTVN1c3pvckR0NjBkQkJUZ3ZTcllNbndxZTAxSlVuNHZkaEdO?=
 =?utf-8?B?N0puWWlkaFZqclUrcGdBbjlCR3crVHQ1QXRCTXJDRUo5ZEg4QU1tQ2R4eldV?=
 =?utf-8?B?blZ5UVY5N2RVMDVZckRPcHUxT1ZnMDg4U0YyZHRRVGJmOHBuZnhuTDMxbUVL?=
 =?utf-8?B?WXZaa2ZuZmtSZ0twcWE3eWV3ZFBzRzdzeVpBek03RTlSdkU4NDdaWTRvN3NK?=
 =?utf-8?B?a0hyZ1ZJM1YvaWg4enhId21rdk1WU2lQcnhoWTJNNEkyek8rQjh0aTI4VzNH?=
 =?utf-8?B?cFJFVWxmTjF1WFd4VDhld0xscXBqaTdoQ0tkbFZkSHFrd2Fqd0Z5NVVVR0xW?=
 =?utf-8?B?MGpEaEh4YU5lMFFBWjQyVGo3cExEZi94S1VLNGpDY01ZRmU0ZmNTZEtJVE44?=
 =?utf-8?B?dHhPZW5EdWNxWWpHRkw5elNLVDVlSWY4NUs0a0xjZ1o1R1U5amFOMVRBMnhQ?=
 =?utf-8?B?NG5aYnRpTHJzU3haM2FibW9GbXJpTzdUaGxsUitLTmVrM1N2a0pUbnVCNk1X?=
 =?utf-8?B?N3o1a2NEYUtxcW5XcEJmL2VFNDlmZEhiblhxRkhiTkhhdWlXNENkbkRvZHVw?=
 =?utf-8?B?YjNBaWIybmgxbWRTUlEvcDhtZFo2NzcvSkwvR3hvV091djhnbkJSMFdPYklJ?=
 =?utf-8?B?aDQwRC9tMm9VVEk4ZTYydWhIR3lhaS92SHRHSHc1M1NyOUd5aFEvTm15RXNy?=
 =?utf-8?B?MkFsYjM0SzU5MkFTM1pYcFdWbGdXcWxEVnF3WUc4aCtEeSs1dnJob3J1OGxY?=
 =?utf-8?B?Q3l1SWJWTXpCOTQyR3hPOVlnMzVIc1lIWm5iR0tCNEhwV2o5d1NmY0d4ZTRZ?=
 =?utf-8?B?TXdUQngyanJRQzc5dk92TXRZcTZ6YUZ2UFZBaytGekxyeHB2a0g0dDc5M3Iv?=
 =?utf-8?B?NjZjWFE4RVpmRXRxSnlCZEoxZ2xvc0I5SnI1SS85ME9oZm5VcCtibWVlVFF6?=
 =?utf-8?B?T1dsM1ZnRXpIZnZ6NVNjaGp1WWcxZ0RDOGtYM25DQWk5aEdLaGMrVC9yRHFp?=
 =?utf-8?B?M1pYVGhVWHpnWkd3alBxY1F6U29DTHZXQkxRaTV4NlZyNDhOaXdlREZncU1K?=
 =?utf-8?B?aDBjUzZVeXJqU1ZuLzVaN1pEZVJHN0QyTHdMQlVlVC9YWFIwSitrRTNIYm1z?=
 =?utf-8?B?SFRsS3A0dVkvb0xQRmRMS2lHYVhrd2ZNck1qenRXeWFEc1RTdnlPdEd3ZXJE?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd27ff93-9745-401d-ee2d-08dbf2833e00
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 15:36:09.9120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jSbvuiLs4445QAbNN6TM75BYFekHvKQn6XqGv8W6vsf6bEebDrqwyEM7BrOzgaz3rgynYEjoF7iO/RvKaN6z4V8DSy+TfkEhi1+4luFkS+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8168
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe/uapi: Add support for CPU
 caching mode
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

On Thu, Nov 30, 2023 at 01:37:40PM +0100, Francois Dugast wrote:
> On Thu, Nov 30, 2023 at 11:14:24AM +0000, Matthew Auld wrote:
> > Add back the padding check. It was removed since we originally used the
> > other u16 for the coh_mode, but that was removed and never merged.
> > 
> > Testcase: igt@xe_create@create-invalid-mbz
> > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> 
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>

Actually I think there is a problem:

	error: the comparison will always evaluate as ‘true’ for the address of ‘pad’
	will never be NULL

This currently makes IGT fail as the args checks fails.

Francois

> 
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index d59501ffc22a..7f012f4c2b2d 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1840,7 +1840,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
> >  	u32 handle;
> >  	int err;
> >  
> > -	if (XE_IOCTL_DBG(xe, args->extensions) ||
> > +	if (XE_IOCTL_DBG(xe, args->extensions) || XE_IOCTL_DBG(xe, args->pad) ||
> >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> >  		return -EINVAL;
> >  
> > -- 
> > 2.43.0
> > 
