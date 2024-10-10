Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B75CFC5E7
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 17:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEBA10E0EC;
	Thu, 10 Oct 2024 17:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPR+zlng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9E910E09B
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 17:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728580264; x=1760116264;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=erxKREr7MDthWoH0/0R3qI/0i/bexMjBvConTLVjIyI=;
 b=NPR+zlngLzzWoQguYDpTah/ijHTYyDJF0UY6gQcOJ0I9lYdEzBXS6ePZ
 LNYms2Rwr2qBDWCaw1Dx1ID2044TOcgj1pDlqJ4jE60nO+tWkAsy7sP2E
 FyC/Rs0coOfMjlYCQnyhCt2TgKbeFinWm2I8Sh2q4Tx5A2pJOh/6uesWi
 LTbXa6wQaIVPoRHJz5kVu5qR8No4fCh3f1XoOj7EZnxdvhoo46qxjfKn6
 /3JFdMtMRPPD6sIx0q80keA51CxKZwSEtI2UEBLBrEM65I9tNVVCmPEon
 xtCfI8PJWbyCIZiRCQPC+J/2E3zmNlMeeFCHq+phh1NOK9HZFRdlYQvTH A==;
X-CSE-ConnectionGUID: Re78V9ntTvKzAFBfh7b6kg==
X-CSE-MsgGUID: 9hhwvOdSQcS3F1JAD7t1Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="30828778"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="30828778"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 10:11:03 -0700
X-CSE-ConnectionGUID: aZhC9zwjQ4eSC9HwmPQ7jw==
X-CSE-MsgGUID: WKZT+m/rTDWkw0b0cmDFcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; d="scan'208";a="81456837"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 10:11:03 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 10:11:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 10:11:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 10:11:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrK9jdRIZ2QVy4aq8ZyRJxQkNxPSl0UFEQtF6dg96JuM7z1JIR/XQQpidz5V8j9IecAugHh3/0aiEGzL6q3rUr2R0TLt5qQ3D1PPquTa1yFSfvr3aOtttDaHlEZqeNaXwuZIHeu2rqEqIQcO/AgyauuatVduz5ACUulRstYwQpIr4P/frWbsQ2jJa1rw/l0QKC2jielBJNRx8KU83WhAGNLyDw729maLo9PEj3oFq6MS/q7t00VnkcdxhVIjKuYeUURVfkUMrNLNY3WtjDlNydDIWVSP2fA7QRV+RrbE9Txd534fzFZryxfy/MIeLMJUpFAPJ12ijJZdapXoKEfP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KITg3+u2OYuf/m1Y4C7i4weXhewkdqupYe2rZodimQ4=;
 b=zRFg5/aC7th6cfV6GE4N/6XKJlCYG2a3P5WUXjbHs0kIL+uLwzvqHoKpuRfax7IGe6FiqiA6GdEckGJJdeOeQF71I6HG9wkRQtIShCF1Py8/R7Kxw55/Rf5Gt8XlhxB1H/6YlaZ9XeE79JrFhKLcCXecKFf7P63CKrIJ3yZdjqymvNUE5L0+e1jcuJJMSmlxnjg0cjqkLOz9u2rQp4xl6mXOS3HezAQGzyzmtYohtL4tPQBIw1vQM4kQQPDs+w5vvcOakOpQCRP1kSoPeuSHaFZg+z07ghhcWpIyGfdJI2jUrUDl4R1KElzPjhPDxwg23pNk79bRSRzMAkdAXl4Uhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6729.namprd11.prod.outlook.com (2603:10b6:510:1c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Thu, 10 Oct
 2024 17:10:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 17:10:54 +0000
Date: Thu, 10 Oct 2024 10:10:51 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Szymon Morek <szymon.morek@intel.com>
Subject: Re: [PATCH 1/3] drm/xe/query: Increase timestamp width
Message-ID: <20241010171051.GX5725@mdroper-desk1.amr.corp.intel.com>
References: <20241010034847.389734-1-lucas.demarchi@intel.com>
 <kramaztywikxqhtzc5e3o27w7u4eannpkjocejdgvu5siatgea@6nb5lkrgur3u>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <kramaztywikxqhtzc5e3o27w7u4eannpkjocejdgvu5siatgea@6nb5lkrgur3u>
X-ClientProxiedBy: BYAPR05CA0099.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::40) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 38d519ff-5379-4afc-aac8-08dce94e7ff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wvmcmHxxDzd9Zq99+BpRaqu4B1ntwGv3lMg1rAi0v5kYmFHPPmEPhMS5IypX?=
 =?us-ascii?Q?XPd5S3FjcVl6eqC/kT4EzPGL0CAxCJ2d/p65QODmqV/sQTmMdGdJGPE3+sv6?=
 =?us-ascii?Q?yCicW+orRkQqc6Va+8gXyPqaOPrtoxf6jIh6w402YiG7hokXw1Rt6zxSM4M0?=
 =?us-ascii?Q?jvzC53ONukdW7ifREGCZroTJwDoJ3w/ZylBgfomV/1WWHzP2DGWHasi0XJD1?=
 =?us-ascii?Q?rrJA3OTSHP3F8Qk97fFWvFvV9nlpukSIoliZ+ziPv+LULTF6MOqqJfS9I/Cr?=
 =?us-ascii?Q?gb9srM5BIxv189v194Vjh6e1n1FTqiQuOjr+reGyryEF7+RoWtMMUYiGyo17?=
 =?us-ascii?Q?EgbMbx+z6dZOYcrpK1dXARGdkEfYcI3+DXjxcOsoXEyDNGF7nJIE8ysddXch?=
 =?us-ascii?Q?jbg1PVVRZ8gqVNgbGPj/8XKajGuRTLAIHC7Zp45NaSLYn/HB4Xf9aN+k9fYY?=
 =?us-ascii?Q?IH+66ivnRI8tI9glxaroGR3ioUGM+cJO/DQt1xBu3mK7tWrOsDxaSffqRLNN?=
 =?us-ascii?Q?yUtFej5Up21uk4NZ/Gpq8HPxrRA9ScjpDdEQt72McqPx74/gZ9ntTHteCVDy?=
 =?us-ascii?Q?fDnDcYxO/zzJ9xBfl+enncnec/F0xaTFQmV3eGaZCcwLf4S6Zf5T4T7q+ZKf?=
 =?us-ascii?Q?ivbQE2h9Mqd2ZgV88+7GtYIyN2UffP6Awfxj+xkmGVbUhfc4e7EkxevoyrTu?=
 =?us-ascii?Q?GmxNJsnZxgu8u+aLpv8l3dsSG/suW8d1+P0VwTV00Mjf2aoV1oIOBxSPlwgu?=
 =?us-ascii?Q?94xN97UDFnJh6W8c96ctknj77b7yUesdFRdbC+4wD3NxwP6rcEXAzsPPs0fH?=
 =?us-ascii?Q?ZpbTuzMp0Jnx/0L2IQKCBvZG4FBT4hY05P2UxDZqPW43ebYpUcms2PTLYrGE?=
 =?us-ascii?Q?uBfwkmq9WYodjmuASWQA1q9Kw3CpfexFEHFXFtVjhAOY4f+NOhYiho4hKNi/?=
 =?us-ascii?Q?3SIcpFcXuDH5My6KFwEZnkFsMzTReu6jqgV1J8dxy0Qhx1KjTx3mwAUPexqt?=
 =?us-ascii?Q?hceGEr8s+kvQS3rB5BdWQcCvzFW/B6c4j6uQ9xLR3KStjZ6DA6jtTAy0sTqV?=
 =?us-ascii?Q?2MZ6a15uUR1Oe0DIVnxy2ev28TVKQw9WaeRnusMZuF7qTMNUOZii3QnSQc+5?=
 =?us-ascii?Q?t2MUpUnqihV4QoLRR047QTeiAOSx7o7xQEDyL9f9dV3zYuUJUXFjm3sFgQSr?=
 =?us-ascii?Q?E1rO/4dIUH7NDQFVtpjyHtcYj5VDzWPUlOOXOgnEYe57PsZVQyKYVVPA+RA1?=
 =?us-ascii?Q?3CLXTGzwUAlD9JKgoaN+LOo42gB4S2HoHRc+ilPYYg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NXyXAnUIk9XByncZeOZ1MSa3XOtov6/zGzh2QrSwRs2Fb6j0ee1dq/YjXWRy?=
 =?us-ascii?Q?9uklcNokxXI9rhPyoRGIdPgc7TalG9hTegbo10YfqKRBOTQ2DdNiurCb2wpU?=
 =?us-ascii?Q?hDA+kaBLaKMLyOiikvJ/ZOOOU+jkY8YM2+9Ur86UvpLSGoW2nKiuFZLQm/XO?=
 =?us-ascii?Q?ATn9C6loVufRn0TIWs/CJGoF64+gFdogrRau3dz2yilFK/xHwwpjuGigI1q7?=
 =?us-ascii?Q?vJJn5aK6YJ3Tq5dWfgibmw9azQ/Lpp9Nt4GSkBpUlzord3LdBzGzjjqtYp9y?=
 =?us-ascii?Q?KN6w3J4uwMFxYrkerIXjcnoPsc36bsT9iWYWCu79LU3UE2NZfUzBo+HJ3RCd?=
 =?us-ascii?Q?keMGw0gMhBDAXr+buHpi0RMeRn7CKOmJoCduzf8d7V/uBSE6DrJrVRYVicUK?=
 =?us-ascii?Q?6FWOgjFKLHB82ZsXp77vNEUP79K8bzwzw2Tkoz6dVtJb0MQG4IG9lQh604Wr?=
 =?us-ascii?Q?oCMKjz6dTWDb9+LOffKckpF1C3kA7DqN8v88Fc0H93aIF98H5YuR6LnincGb?=
 =?us-ascii?Q?875kMjHqzYdDOAGckw86GT1+mIT1w98Jyo0gQr+aEil9SMYbMjQ2/+V77NPw?=
 =?us-ascii?Q?TXDws2JdqLH4anzrykq5Cz/gGca2eu4A/oVoRmcwSeRRcE4a/PzY/ovCdd1b?=
 =?us-ascii?Q?y1766iXvS3Hmgn1BR7uIQcG0jKCHb+2sakZRas0PPJauJ2MU77uKTxpfM8qX?=
 =?us-ascii?Q?X6gQO9OGF6oySzk+1HqME3K5WnKQg+O/qxrbn4/AJYuqvSCpBHAo45KeqQig?=
 =?us-ascii?Q?fOLl9HwmEXkYfORMTNwM1nbCo6SuBlcalqhgNiTs8vDafU5Btsla+TUDZgRU?=
 =?us-ascii?Q?12MBtzyNQj0D+G9GHLMI7DL9xi31dUmUJbsnGJj869CovfKLG85+URZPOxUY?=
 =?us-ascii?Q?OCtFXjyEfOckSWPZh9rb4fFxE6pqUlUpBEfE9c3+7QgbrQhEmd3879AR/iUX?=
 =?us-ascii?Q?VuzPmjsy6uAUO11BXe85hVyZR9Ijv2Y/CvnTn6PByndHLFXBI7/o09hTzWyc?=
 =?us-ascii?Q?rhYPm3oPBOPxwIl8jPYUTPbffWqE3BnSCZ04RAczMUboLrzLHIcv8bZ2FXrn?=
 =?us-ascii?Q?Z/L61JTtIJ9G+Q+B4i9KUPxVF/Ph7WiODSsrjBYz78nLTmgmTvRzh+leeEB5?=
 =?us-ascii?Q?SzbJYaROIyJPPfCILmcTGzfSjYUQcpdfAHEqtVY/sgG4o2YZHX4DNW11IxfH?=
 =?us-ascii?Q?oXU+AW+nUEiN5kBtGSNUK/H8+mSf8mHWEk+4hPko6ySHlUbwJiyWTpHOlYOs?=
 =?us-ascii?Q?kz6gYo4XEGRe+fZgNtgZaeHUFgeMpW/18WxN0dJu13bSUtpUve7vDxfNlZkm?=
 =?us-ascii?Q?3oQmTaMuwFNwTbbtPXjMRHEEdwHOBVGjevAQzZwAjY7+TQn22snOS1EYoSAL?=
 =?us-ascii?Q?4NH5+O41tC2HR/T+8EYe9LnK8ZM0geSMythpMrPzEiBZlii38JM4v02T4ANy?=
 =?us-ascii?Q?3L+DITDDAnYfYE5T0jNSiQBmXyFbZ0ghkcWCc4HGmaFWmTTH6mbtqwanneoX?=
 =?us-ascii?Q?02M882COxlReTaB/eZ0X1sXPGdc/PeI4MMfUA4p9vJgCHw/2Si4CaXATCwAV?=
 =?us-ascii?Q?k5FWjV3Ubtm7wIYp6x98AHTVhnb+v5d9gW6OO1C3I5n4ra/Z3ukP0taafk87?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38d519ff-5379-4afc-aac8-08dce94e7ff8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 17:10:54.5034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +sxAvqa2lXLk8Y0sWisLU8s3rJ+zSt4ZtHXSdgEk/3HUujr9xkpGWZBchgE9DXeeINArUpxqEuollEQet9KAir0hjCV0cbBny21H+RKuAlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6729
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

On Wed, Oct 09, 2024 at 11:08:12PM -0500, Lucas De Marchi wrote:
> On Wed, Oct 09, 2024 at 08:48:45PM -0700, Lucas De Marchi wrote:
> > Starting with Xe2 the timestamp is a full 64 bit counter, contrary to
> > the 36 bit that was available before. Although 36 should be sufficient
> > for any reasonable delta calculation (for Xe2, of about 30min), it's
> > surprising to userspace to get sommething truncated. Also if the
> > timestamp being compared to is coming from the GPU and the application
> > is not careful enough to apply the width there, a delta calculation
> > would be wrong.
> > 
> > Extend it to full 64-bits for non-media engines starting with Xe2.
> > 
> > Bspec: 60411
> > Cc: Szymon Morek <szymon.morek@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_query.c | 6 +++++-
> > 1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index 158629971eab3..a1f4cc25bea68 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -164,7 +164,11 @@ query_engine_cycles(struct xe_device *xe,
> > 			  cpu_clock);
> > 
> > 	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > -	resp.width = 36;
> > +
> > +	if (!xe_gt_is_media_type(gt) && GRAPHICS_VER(xe) >= 20)
> 
> I sent this to follow the spec to the letter, but I'm thinking the spec
> is not tagged correctly here.... the counter is the same, replicated to
> all engines. It doesn't make sense to be different in the media gt.

Yeah, when REMOVEDBY() tags are used against a top-level IP family
(top-level Xe2 in this case) rather than a specific release, the bspec
output often gets confused and leaves behind some stray markings like
"XE2_M" that aren't actually true.  I don't think those marks are
actually used so they don't have the proper IP inheritance rules
defined, which is why they still show up where they shouldn't.

tldr:  I think the 64-bit width here should apply to both the primary
and media GT from Xe2 onward.


Matt

> 
> In fact, testing on LNL:
> 
> $ sudo ./build/tools/intel_reg read 0x2358 0x235c 0x1c0358 0x1c035c
> Opened device: /dev/dri/card0
>                                     (0x00002358): 0x52d026c7
>                                     (0x0000235c): 0x00000062
>                                     (0x001c0358): 0x52d027b3
>                                     (0x001c035c): 0x00000062
> 
> So... the upper word returns the same thing for both rcs and vcs and
> it's > 36b.
> 
> +Matt Roper as he understand the spec tagging. Maybe I read it wrong.
> 
> It would be good if we don't have to differentiate the width based on
> gt.
> 
> 
> Lucas De Marchi
> 
> > +		resp.width = 64;
> > +	else
> > +		resp.width = 36;
> > 
> > 	/* Only write to the output fields of user query */
> > 	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
> > -- 
> > 2.46.2
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
