Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1FBC25B76
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 02:56:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E1410E540;
	Thu,  6 Jun 2024 02:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNokjoRt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3594210E845
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 02:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717642578; x=1749178578;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=uA2lwrTRCwmrYJQSK9XnpWjL1dlIPaS2B16caH9hWJg=;
 b=bNokjoRt7LFcJilqmcgJq0Wgd3QaV3KePcIMXrNTvcLCBCS1xWtCWRto
 IWy5pRfmygQmSMao70EdZ26N6Tcaiqb691avT7AoddyTKK2TOzR1JhUH3
 7jR8sfgPZkZTDefjcni3x8BlECCmygmqZKQuOh79p9hdNmDzto84P+yak
 3gYTiZnse3yZHZUWc62nfSSgNkzhGny+bAujoOEQvEciUJG79vXmjU58L
 E6ZHbMo6FG/YjT5b3F54I1+xWSKvUgpetdweuqZy3v+J4l9ETPH3UzmIE
 0ZHhMc/ieK6m3zyqoBVZgLSnootThSTnnc8GPGxwRwuI+kXZqSnYqeoPB A==;
X-CSE-ConnectionGUID: tnKFGvJqSa2PXKBuUlanxw==
X-CSE-MsgGUID: 4F5p0OBuSPGweL7CGVkuCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="24919938"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="24919938"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 19:56:17 -0700
X-CSE-ConnectionGUID: GLgRjl7GSH+jdCNd2B2jPQ==
X-CSE-MsgGUID: knFtthJiS+mj/0AbH+bBEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="38462545"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 19:56:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 19:56:16 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 19:56:16 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 19:56:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e90mNEQghLacQBUcb7Sc1TYN7ysOSiH3G9IxWgqaztSL2xwGpAzP0Ew3gT9x9Xal8dl9i5K35pV+ZqVEXP33n7WVxsB/2E6WPJMAjTCaCO6+93zaB9ESoLFr6Awb8l03Hh2V095kMD/s4CENqiVdiBTAhfooV4O2gf96sF9ukqOY8LlnhgOui7oZk/GF2EOBTlrPD4aSBETNGWzYCb8hduMBpMrkmEhY2wc6ISVDNcZ+XSWtFsHOuNS8LmKOvbCrq2WpQVSNsOws8xZWLn0+PMOj0QNw6JYjTVlIz5DO07kzsgQAS9aUO0MmqPwBwlf7ObywXDJCl2mTaX8eP/sVSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TLo46J5MQWqTnY4zCrVRQlVOkHVD+mEwrJ9N0BfSi8=;
 b=oQRIJi4yPbWOlyDK+msVopFObepx24PbFb5nj2E3FNZJJaNPEA8i/P2/BgBIKq1a5i+rK0q374zey72p9cJgdnrnubYSMHNN/4vLflMy7VuHpbC3gsHkpq8kqHsBS6k04Ubc5wV949XWNy9cCctfBzV9m6itxpwPmLFJoamtapmM1AKJQzO+K2mAeLeHD/XMT6VHmtk6i7wwGfO7VLnJnqVpNht/b/rOaCt5FiMOdoN2BpEcTDUTvlJCHsehlFMt66oz44UAkiYGgW/O2+lMt30jmkfPVoEKS5VS2EwL1TbBKXOmhzbAsVr+6HC5VdCK9gSg5WEk7L+byhq8JFgTVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by BY1PR11MB8127.namprd11.prod.outlook.com (2603:10b6:a03:531::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Thu, 6 Jun
 2024 02:56:14 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7633.018; Thu, 6 Jun 2024
 02:56:14 +0000
Date: Thu, 6 Jun 2024 02:55:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Do not dereference NULL job->fence in trace points
Message-ID: <ZmElG5XGOt82S/6m@DUT025-TGLU.fm.intel.com>
References: <20240605055041.2082074-1-matthew.brost@intel.com>
 <ngmanv6726qo7ggl7w7eb2ifhox3mjvfcug74ljassq224hv6a@edjwmgcr7rmv>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ngmanv6726qo7ggl7w7eb2ifhox3mjvfcug74ljassq224hv6a@edjwmgcr7rmv>
X-ClientProxiedBy: BYAPR07CA0007.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::20) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|BY1PR11MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: 34bdf6c9-70a8-420d-3207-08dc85d43ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?He1fJJo/1bwIfk0/A+MXw3GJI4suw3xnorUXb0ITo8niJpsY1rIRNu5mpN?=
 =?iso-8859-1?Q?FEwob0LsNkLvTwK/M/ivipIQ/cMkdXZmNjCr7J5HaLZimqlpdwjJC20ZKu?=
 =?iso-8859-1?Q?JMWpwjhvHKtTx1wfAd/7j1yag93LJlR+42eSk+ICEX+mw6Sy7JG1t8tsji?=
 =?iso-8859-1?Q?aQ5AoiWOhhtGvAHE34pBwenmg1NAXP8M5NV5SuSP5RW0yZo45eRk7PQL/Q?=
 =?iso-8859-1?Q?FUum0jvdgGLcb4kyAkGrYeASkj5eFv3rLy81m7sbyiGm8cAKweyIJDIEq0?=
 =?iso-8859-1?Q?2PhCujjyrbEpovJDK7DcBIXCf2U/4x+exsbT0XRaf6f7jnnmnJ5ql/4n3t?=
 =?iso-8859-1?Q?dpNlGjCTF2Z1BvBs5Rd8PDlAAqiFJkzReprDR4eVZs/Bp8YSxr6ahKIY53?=
 =?iso-8859-1?Q?iRwGsxgU/uaG+QRdfotVcR1G2ieXCeR5uH1e7dpzFGQZSKC3SOTYz0+FXi?=
 =?iso-8859-1?Q?Ci1NoPeR3XubeSsNNp7q4oe4fnKK06xFOXOFfXf/jb7X4Av+uo+H+w/hhi?=
 =?iso-8859-1?Q?htYO1SLgqXa7X9xt79dadE+KVkLj8hpM7zoqEbUto03ZY6BFkY00LK6Tm8?=
 =?iso-8859-1?Q?HoPmG4HNa001XAMA2CFowDvGwnZZdN6nfpOaBwPnwRib6jQSXPTpSRjr+V?=
 =?iso-8859-1?Q?LKEiaOi1d2f1Hd8El0+hkydKcnbkDYDFf/HXfAQUrK7sD3JiDqxEAI9OkP?=
 =?iso-8859-1?Q?+6fkrhRWr1z0jQ2JayVyO5BehnEpD1q98y4lmWBXK4hzaez/+MLAbHH95g?=
 =?iso-8859-1?Q?rZR9w/ByMsJuORUZk/6We05iVJb9Ju8Cded2T5s0JCY8cm2m5H8mthwqCC?=
 =?iso-8859-1?Q?aduYObATpYrSdRaRfP5iwm+ZFihfbArJ0dh6niP/zqEynNHlhmQ0ln/t15?=
 =?iso-8859-1?Q?+iYxrdw/HTtsml5ZwkVU35LrdA+R0GShp7KuoeSQRS+s86v0OLzRtsAJaQ?=
 =?iso-8859-1?Q?h+ZT7iiQFVXUE1J9xTqyKeFTb84QDcce1mdjVHdZjSx6X2r8kY3D9oHNcZ?=
 =?iso-8859-1?Q?JxrnFCwDylQ40Xi0wZxFlcF4nr9zQpumfWn6grZzWMsDWiF3migu/fw9CW?=
 =?iso-8859-1?Q?KgGIqAxqRQZ/8czHpwnaWuLyKK5f4EAfCNH+3+jrCRblZmux+UF1SbaGNz?=
 =?iso-8859-1?Q?bcQ2m1zAZqIxXmJLR8APZTtL4410WM5GLFE4DpDqKKwAou54rkKhpg6WJJ?=
 =?iso-8859-1?Q?P8dQHGqJA3X+POfG4kKWdlv+ZNexnwITRIsLzSKVNYeQj4sQoiP4y0m4LK?=
 =?iso-8859-1?Q?VO0Kiytfv886ygAUUgoVSD34N6A8gLsHdEw0cceGmBdfK3Yq4iElJ10oV/?=
 =?iso-8859-1?Q?hYF8ReGSWk6a+07yPdwIk6Gp2iWaV6U8IxUvtr3znlTeeGwMHR6AZivGdq?=
 =?iso-8859-1?Q?BushgXQVmC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HnsFX9XemaQcE/n3KZrt89D7V+zaP2QQeR8Epdq1u70C7YbLs+sgMASzZL?=
 =?iso-8859-1?Q?A0LWCvXabU6KtEdjIUiBPBBfCfp3kfLc3R60PKF++OsHCqO3bNktNyX6zV?=
 =?iso-8859-1?Q?S73PFauwv0IEeTYIO6HATXMaN49KJVgZMlFDYAH7crAV7jo6XjNO/+dK0q?=
 =?iso-8859-1?Q?nLm1l030U+RjqWc9m6Ga4YxZsFRbBt3TCHX4QUV1dTh59g8edxDC+N1rYS?=
 =?iso-8859-1?Q?zZ4UO41Qh/NOy/cP7Ij3AZmyYFa6z4cKHilmE/N2sb2Fdc/yXwT6fIoetr?=
 =?iso-8859-1?Q?1q1bcsWk7s6/A/LVZcc3PLvi+sjV2iMTzZXox+59w35oWN/5UGAccF9ybx?=
 =?iso-8859-1?Q?3FgRaPBm+QreGNjGetjZSKxJ/1oSxo9kdSY4UjXT73/gRWmMhqynb44Hej?=
 =?iso-8859-1?Q?LuCVqmKX8BaSx3SMN3tyxJpwMK3SG6z1DTYYlEjYzEENLamsea9TlzdlLW?=
 =?iso-8859-1?Q?1XoVeHCuFK1g8fEsdQyuSrmAmfOVTBmXpuX2aHi1ChxwG3YVw16ioCMG9Q?=
 =?iso-8859-1?Q?3y8RUeURZ9dH0lzULCAxvfQWRYigr8u8N4Z4u/nGs2JSXIcQuWhRUeZZFm?=
 =?iso-8859-1?Q?USb1QLOWadjemC0dhAczkqsrDq5Tgwiw75jGFqlP4tsrtYbdGMnBbeLeOg?=
 =?iso-8859-1?Q?Bl241PLsqTryDH6a3p7f0l9545pgzn2QTNwMcrSCIoFRBP4S152JyIFoKO?=
 =?iso-8859-1?Q?WoN46qUNXEZSgqCeKlxoRPf72nbB6RCRvF+JxAC6taoOWakIdmOPa1PwLE?=
 =?iso-8859-1?Q?ado3SOZ9Pakv9k9BivlSDa2PzfHkvpp52UdOBFCa4ytpxEUE1Pbp2Te0Rd?=
 =?iso-8859-1?Q?l8MQ8Ml7n51BQgplJ9GB0tnrWLoiz0/9EUYWgi/YS17su8ANqBGmNnmurB?=
 =?iso-8859-1?Q?RbK4eLFLDcchryN7hdYTWM2dgBvjpdoGa3i2CDLzgmhIt6mWgBDfemzYwb?=
 =?iso-8859-1?Q?RtTW9gt1vkBd8yAPtAWtTOJqd9AwLPHQEam2W+JAwtaswBBTMYjPdn0oUq?=
 =?iso-8859-1?Q?bPmxuMilhR9ngVPzKgsikcQd2xZkhBGMuSxUofFEeTgfHWZNj1d4jHZYzD?=
 =?iso-8859-1?Q?1nADhHf/qBvlw1jMfC0C0HHQLUAK+LdW6hVy7N+A2ZKpSWzA3f1/WArg3Q?=
 =?iso-8859-1?Q?taP8o56SV3kMST02Ip5OjcUfSPuDdM7tG7x3At/H5lsa5PNNri/wea+ED7?=
 =?iso-8859-1?Q?mD75KqrnKUPotjAMybRb9vy8LoJXI7vP+Rzx5YYKuyVZFQpKKfLREMpjZq?=
 =?iso-8859-1?Q?oDOptEJYt5C6MbkaKBFfGQUVENz9OrKIiVjLrU1xGd6D3BadxGwGMn5ayI?=
 =?iso-8859-1?Q?a/D2MhgOBgsswIAsN0tfZ4Ws25akaJHjrG+eweRKkzlH5pUnZOAHfhT1n8?=
 =?iso-8859-1?Q?wKHkdyEwWJIXbdsbv/9jKVyHcOBGzMnCW2YsdKtbTlR3chaDm6NB9Apy+5?=
 =?iso-8859-1?Q?lKdR2f/jJBqTFkqQnnsxvj24Da464wCNqm3Q/ngKfpNkW9JwzmxxDhGDGp?=
 =?iso-8859-1?Q?kgRH6pCcxq0G5EKGIupkm3l6aXN6GZ9JxpsasUbmdonVrcMT5Qpte3ZokD?=
 =?iso-8859-1?Q?47/SptOWx7KeH1iuJy8925R/E1mfUkiO0aksp0ZtsATvWI1sF5ZkQimTgD?=
 =?iso-8859-1?Q?m5gAsdJZ8hHfDKOGSId1imOzbxKLvZt/jd/OJpICZiSGS/r8A9DRgOrg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34bdf6c9-70a8-420d-3207-08dc85d43ad8
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 02:56:14.7415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6bGQDXLg3Z6itFTI1DaO9XK+HzVo5nWZq6qAHSs/S8Zwb+YZkTh2eaux/9+dbcfKMe+SmIFOeIsLeprIJrC05A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8127
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

On Wed, Jun 05, 2024 at 06:13:42PM -0500, Lucas De Marchi wrote:
> On Tue, Jun 04, 2024 at 10:50:41PM GMT, Matthew Brost wrote:
> > job->fence is not assigned until xe_sched_job_arm(), check for
> > job->fence in xe_sched_job_seqno() so any usage of this function (trace
> > points) do not result in NULL ptr dereference. Also check job->fence
> > before assigning error in job trace points.
> > 
> > Fixes: 0ac7a2c745e8 drm/xe: ("Don't initialize fences at xe_sched_job_create()")
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_sched_job.h | 2 +-
> > drivers/gpu/drm/xe/xe_trace.h     | 2 +-
> > 2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.h b/drivers/gpu/drm/xe/xe_sched_job.h
> > index 002c3b5c0a5c..f362e28455db 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> > @@ -70,7 +70,7 @@ to_xe_sched_job(struct drm_sched_job *drm)
> > 
> > static inline u32 xe_sched_job_seqno(struct xe_sched_job *job)
> > {
> > -	return job->fence->seqno;
> > +	return job->fence ? job->fence->seqno : 0;
> > }
> > 
> > static inline u32 xe_sched_job_lrc_seqno(struct xe_sched_job *job)
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index 450f407c66e8..e4cba64474e6 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -270,7 +270,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> > 			   __entry->guc_state =
> > 			   atomic_read(&job->q->guc->state);
> > 			   __entry->flags = job->q->flags;
> > -			   __entry->error = job->fence->error;
> > +			   __entry->error = job->fence ? job->fence->error : 0;
> 
> we already include xe_sched_job.h in this file and even call
> xe_sched_job_lrc_seqno() a few lines above this. Why can't we call the
> function you just fixed? With that changed,

We do call that function above, it just is not in the diff.

We don't have a helper to go from job -> job->fence->error hence the
open coding here. I could add a helper if you like.

Matt

> 
> 	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> 
> Lucas De Marchi
> 
> > 			   __entry->fence = job->fence;
> > 			   __entry->batch_addr = (u64)job->ptrs[0].batch_addr;
> > 			   ),
> > -- 
> > 2.34.1
> > 
