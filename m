Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF33C47DB3
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 18:40:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF50B10E8B6;
	Thu, 18 Jan 2024 18:40:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A786110E8B6
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jan 2024 18:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705603208; x=1737139208;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s6fml8bC7lywEnLvUz2Xrwq49PdIKekHHKMmZSEieeM=;
 b=ODXdW3FhjgV/F8icSxARvleVXZ7yeoCG0B4hg9BwwJVTPHzPQvZfkRv+
 /MRo3HpHeTgYwaXaVbVrSFY+hV1foGJgLGwHzsmd+ETX3e8UtbT0mlL7L
 kWzx2Iu0tFVlhmE7Qh7YGIS2Enplew9HURbdYF2WOuAjZj2Pd5n1TLL2y
 YAuM83JYcZG6gkJDo5JTuuqBHD+EcEOCEguN5IOgmp6WokgmgZn0KvEwX
 fNnLKW2jrp5v21kwNAVd5Rup9RCeYvulHn+TMx1mYMM4RkR8XnPVEvjyD
 7UUJEoRMvfBCgOgKGFPT+24/49SyWrISOb0ZpJs/FRI+Aissle5TA28oN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7629239"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7629239"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 10:40:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="482465"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 10:40:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 10:40:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 10:40:06 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 10:39:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h/WR/bkByk4xI+qrbNC98VdxyMZP4usxC0LWL7bRWm3OKCUKpxwhj5i4YOzaVyx3mFx0zNFztHYAa/R2Qah5bjuKGAsOXaXKkarN8IUrv6VD4SohlazfJxYHR9zBLv6N1yMnK+8yVg98VjEE5eBe3FyhTHFupMRO86NvZ5Z9ro3GH76tpFocBAiGrqVCyAWdX1MfV5yspCcIkHrvMkMmf8Ore7c5IMykCtjMoa7b5oPBijcSuVJFfJduXozSFHU++qXSAVrbdVfCWp7VNOFa9abQLAXByxYXR7m6R67p/6iv+1UpJqfulmlKDa9dlBdD2XODywq7pWLSfz0M6syzCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+y8/VmnHrdSifk+vsiRBRrZH1LeHK7J+1Bd6/ZNcrFk=;
 b=Dj+tHcLeDyEAd5zd2c6ErWmMu24lFHNc84bbFWVCz38S97zkJdoZy/EOXlIqMHDl1cETQaxi1goTHfz8iIKYKvlAgi4O+Wn42J7716lobLXN2C/ZK0RvQRuioIJMrKRkob+u2Q191SneMrwZzUAAVF2Ffo5Sr6IetP6sSx341xVzetywVLBJX1Zv1O6NznJeyN+5xEMLr5yyxdAwYxbgWr61BCDxAhzw4lbpCrsGcf/VOGaq2Dud7GSNC5ClLzF6DKP+o2Yq0IaGmtDWiTy68+PKTiqzZkYOAT5f8bU8n7Ekb4Qhqyg4RYiU944agMpz+rlLHplNqVJ86rdgR1EcvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7339.namprd11.prod.outlook.com (2603:10b6:930:9f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 18:39:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 18:39:55 +0000
Date: Thu, 18 Jan 2024 18:38:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/guc: Add kernel-doc for xe_guc_ct_send_recv()
Message-ID: <ZalwFtTe+5fb7H3A@DUT025-TGLU.fm.intel.com>
References: <20240112102554.761-1-michal.wajdeczko@intel.com>
 <20240112102554.761-2-michal.wajdeczko@intel.com>
 <ZaHHZNtB4ZEvMWJi@DUT025-TGLU.fm.intel.com>
 <932f978f-0016-4393-93c0-aac32007e3f5@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <932f978f-0016-4393-93c0-aac32007e3f5@intel.com>
X-ClientProxiedBy: BYAPR07CA0103.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::44) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: 70ab1933-1e73-435d-12ed-08dc1854ddcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1y56gbcCwx2HjrzbmXLWi+MwWJb30pL34fmPaUBGg8hbmypu5fgiGgdyWgzgq3rC3k+wmgUrIqz/rfeWeFD3Y3JE4281p4bXp5CEIq6PXzVjTz1e8nOu26paoJk05lLD4FlC84RzGS6Dd6bYqFuDpKp7EUSBzi0pIotHw8APE7DN9zDBlmjyfx76qRCBC/eJcySKWC2hEJpMBi237GDpHe+fJcBE75ml618bwgoyNLGweaL6KZloQ2OXqwbSTd4YOOOqVlrzGcR338voijjFF0/r98vuRJpSgiFyboQJAMo+98Kz3eltD4SBzTGHzj5J65xXNGaX93JfvrVGaZf0BTZjAIfM5DfL6vXRz7lRunVJ0hHHbdKZWdn71VdFitZLY7b6XSmelxUiu74uoB28Pdd27KzT6xMG8YJvnRlVvgth/MDo6myZkL0dW+kS7YWsqo3xSKUWqOLtwOVPX8AdI/U3sKOSieN3TKvhtQRlxbZXPKFBoeYDvvkmD5SpZu4ADJmeKjM4NJq4p4bR8jnd82s+kEWrmnGBP0K0RtI3Uq03tQzp4/6uWB8sKF18w/Vl5CmWtyJKdzxVyBFFgpm8Nb+C42q2PxMwbe2vaDA7niE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(366004)(376002)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(66899024)(41300700001)(26005)(6512007)(83380400001)(86362001)(82960400001)(8936002)(8676002)(5660300002)(44832011)(6862004)(4326008)(53546011)(6506007)(38100700002)(66476007)(66556008)(66946007)(6636002)(316002)(2906002)(6666004)(966005)(6486002)(478600001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jx891LrgR1AkNbbm2X7TdfqEVN4CjJwQAxaPvbyGC/OTK7gOMsulEO3q8eDm?=
 =?us-ascii?Q?9AluGNvv5PO1BNH0zoNnMbQNhPVP010PQnvt91ApLHqbzy9O2jQlfhzuqbEg?=
 =?us-ascii?Q?VdZlVxQHCI1kgvvgatyAj1cA0UYnM7Td+yd5tuGnn21YxG/GwxfZJN5sE2xl?=
 =?us-ascii?Q?6MffzSaTmFp9k1qd2I47eIhI6m/jE1GkpO/+Y8grZ7X4aVJEEBEvInIW1heu?=
 =?us-ascii?Q?G27ef/8TJavOEFa2Mp0wCd/zC9cRRSvhyuMoNN9rMVIKrh2cXccqJn9duhMq?=
 =?us-ascii?Q?1rVNqCsP+Y9Co3OyeNU13yGL7FzgTE15fP8NGm+d7I3piYYcaKykTeOS59wB?=
 =?us-ascii?Q?Iv+0BsaSEavXlGVAdQKi9bVivC8mosTtTVNij/gZEC3QwM8gsplnTAFB+qqu?=
 =?us-ascii?Q?op9HyIoYI+PIF+vURgFilxjdTzkpO8d3x6NjmueDuq9XXtk7GCT9qMDiH/mw?=
 =?us-ascii?Q?Y3+HW7xRO1U028qTSYAzHEDuPF3zAsotY6lb0eVcNrZaLIJ1FAL4MGfKa1dr?=
 =?us-ascii?Q?AXq2sXKB8aACC20uuR5ymq1TUHMatdduAOmI4EIkIGWFLrzOUsrGFkoLDk3A?=
 =?us-ascii?Q?JRwHs+fbGWJA30K2ykQk9D1g+zbAvURowRxhqE/1BR2SO0sRBi4RsGZfBZnj?=
 =?us-ascii?Q?ucxdDorBadlOL3LfD8Xt6FNQJujeuvl6q9qS+W6znBEzma0CTr6lATuHNQrk?=
 =?us-ascii?Q?Q4GmTLKyWf/owX8WGXjX2Yc3FRnygwa25P9vvc/xTGcCgKd21JFExwJu5oxN?=
 =?us-ascii?Q?P38KmtEBoWQG4ByVKeQEzYKfn7iL16Ok7LZvRSUvCM4nQpVbSt58syhbxvUP?=
 =?us-ascii?Q?nAH0VJX+Lne67evztg6GL1tXeUXS9pXyrcRLvYbHZ4Lnr5kz2Bduc71eeEO/?=
 =?us-ascii?Q?shwn21GKgMeWscokoMowQD8uMW36H3qhFkaQrA/lPEPA9qYY3FqFJo0uLQg6?=
 =?us-ascii?Q?a8jy/UgC2s/KA1ylXj20CPSf8Z8KsoIr2aBVo0PPqpyU7qezoQwP8GdzOKJQ?=
 =?us-ascii?Q?tfkjC/S/7f2IDvrg32dbjZUwQDvb4YBa6XpFuMPRwB+UG79ydkjy1N8nAEij?=
 =?us-ascii?Q?HXYErBk2MwGhPeipO5kTm8ZoffNBBUxsNxMzug3lHs21bHDuVnTHvKn61lvL?=
 =?us-ascii?Q?SuAB0Oohow1HZLacgCDwxDXrV84diEnqJhM3xS2aO6ifbLwuFcrgewOZDx7y?=
 =?us-ascii?Q?+YYcocu7toN+8hPfVli7EpY1AsOMgvKFFJox7ySIQEXq1dGcfmSxbJNih9bb?=
 =?us-ascii?Q?d+ah0UGF386Zy/q39HG8SbktLmK+TFvS+HfBCvNLGi3n4eaCUJD+Z+H1dYlD?=
 =?us-ascii?Q?6jD91Wt6CWDatSzBD2+lLIVFaQUdmRtWDfJGFoO5ewMzRKr8PhD5/L4M84Uk?=
 =?us-ascii?Q?gu2ycjMGMkHC0ceTWjW3dV6Q6vCv24YQgatpq9AJRr8cX5eWsWnC9M5/Qz4T?=
 =?us-ascii?Q?kSxadUi6XRBpWaeO1BXVnRpLVbb5c8Wu4+llW04TMew7BpIuq3/vzljf7M29?=
 =?us-ascii?Q?goUf5g9LeoPwqbSKBzCWkXpxiIU8mOFTGGFQXL2CggbLFCZ/rOYHL0jtmncM?=
 =?us-ascii?Q?L3Nu62CNKqHCXE0juURlQ9+Hh45fQkm7PvRiyaeNZ76b7s/9MiT4iz+Pmi9h?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ab1933-1e73-435d-12ed-08dc1854ddcd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 18:39:55.8625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8pN+nmdZuk1CJsMaJEtzbD9WI5HC8Tr/M1o7fFm1/QxfNzltzdjTOoSv1HrEqTv+WuIkL8QR+eryAcV+i/pyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7339
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Jan 13, 2024 at 02:01:05PM +0100, Michal Wajdeczko wrote:
> 
> 
> On 13.01.2024 00:12, Matthew Brost wrote:
> > On Fri, Jan 12, 2024 at 11:25:54AM +0100, Michal Wajdeczko wrote:
> >> The communication with the GuC firmware is crucial for the driver
> >> but unfortunately it has limited documentation.  Add initial
> > 
> > The first sentence doesn't seem necessary.
> 
> can drop while pushing
> 

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> > 
> >> documentation for recently updated xe_guc_ct_send_recv().
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Cc: Matthew Brost <matthew.brost@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_guc_ct.c | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> >> index 4ae1a0cd9537..ee5d99456aeb 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> >> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> >> @@ -785,6 +785,24 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >>  	return ret > 0 ? response_buffer ? g2h_fence.response_len : g2h_fence.response_data : ret;
> >>  }
> >>  
> >> +/**
> >> + * xe_guc_ct_send_recv - Send and receive HXG to the GuC
> >> + * @ct: the &xe_guc_ct
> >> + * @action: the dword array with `HXG Request`_ message (can't be NULL)
> > 
> > What's the deal with the _ trailing everwhere? Is this kernel doc link thing?
> 
> yes, see [1]
> 
> [1]
> https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#hyperlink-references
> 
> 
> > 
> > Matt
> > 
> >> + * @len: length of the `HXG Request`_ message (in dwords, can't be 0)
> >> + * @response_buffer: placeholder for the `HXG Response`_ message (can be NULL)
> >> + *
> >> + * Send a `HXG Request`_ message to the GuC over CT communication channel and
> >> + * blocks until GuC replies with a `HXG Response`_ message.
> >> + *
> >> + * For non-blocking communication with GuC use xe_guc_ct_send().
> >> + *
> >> + * Note: The size of &response_buffer must be at least GUC_CTB_MAX_DWORDS_.
> >> + *
> >> + * Return: response length (in dwords) if &response_buffer was not NULL, or
> >> + *         DATA0 from `HXG Response`_ if &response_buffer was NULL, or
> >> + *         a negative error code on failure.
> >> + */
> >>  int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >>  			u32 *response_buffer)
> >>  {
> >> -- 
> >> 2.25.1
> >>
