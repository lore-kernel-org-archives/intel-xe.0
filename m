Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DDFC2BB3F
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 16:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19D310E0F1;
	Wed, 15 Nov 2023 16:51:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C7410E0F1
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 16:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700067110; x=1731603110;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=izzV+MzAYGmi/3QH2yqc6YDZkSW2WVfZq6xoiqmTkQ0=;
 b=CCMzvwJ954sS9PD+eWpdTUWH3jKta2/rLM7WSGgmVTbaJ1MCiqICsqsQ
 tYDiqeV6/bIvCLGVJ/CaEVUBk8MmuwuC+6WzXQG0LzanQbuex3HR8ns0k
 xPj1Hel141WNBkPAqfiKHLIFv/ND4FNtDWwIexpAk9DkzHPPpaiAL5iOk
 9NEcNdzsi93rm1dCI8f1OpDgYzrH9Z6pneA4wQUtPnBF8no/ZsFrjsJ3x
 bqsdUgvLZ4PnKmX9LAZrUOMTh5bLTO+8/WenBECTRhLDUUxnguFulLhEO
 Q7ibWhef+ZtkBlFbBuZ3CwYn8iSkzT/wZyw6mdtRhXO1fFfPcoYRp5n+7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="455200530"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="455200530"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 08:51:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="882445795"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; d="scan'208";a="882445795"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 08:51:48 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 08:51:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 08:51:47 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 08:51:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlzQBe0YZqiFEdPJa3eYp0T+S7+6EhupxdrmyIPzpeNizBPJYOwtGYnWlmOIXEw9cC/4mCR424r3dTKLcLkUF+WvAlgOKUoCOoMt+oEH3wV+Ut62RT+6+P6UpZfZ4HPJsx0F7yMyyOQXAKN+/W5lw98IF4W9VIHIpFbh0v9Dy6AyXkTZItFvAVEgbP5ARohc9m6wAbw2akzodT6MaClvK+oYukieEozBlDfsy2KIBm9ARwG8geEZn2HkF4F4LgyBX9N8C4bY4RJfphPSaoZnZKcHFvIXuXdIuzQ83GWqs36ak9i+IBe6wcj3OtnN0EtCCRHanvuOEVVRm1J3PClcjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irsIl3augrpXisdS+oGVULv0tvqlYAafB6j/Bi5GHus=;
 b=VTFgGhuOpPWBWuUDQuIAvfZx8OCyYlgw39q6Hyg0FBNIkWrbGM13GtbEvdHYCwzzXOCBPRwEXoU1srSu+/wwKDVLfb8oWcIynrQfBOTwig+QyhWBUh5/nHl6V071zIE06e6hKRFP7jaq1bN4/u5ROPOOWxw2mYIefhYLyb0GBy0VWPzmltiS7fPVnPU8hcpaC2RxlXMmZ+MbpJaQWwPWle2udVXkb56ouaG6cV5LXZYMBUDHh1lEahAb19l/f/uOpAHA80E/yUHrQFax2eQWSoMrUIKgottnckGMVCdE/Q8fgWnw6dJFJx/y8dnFivXVbByoZLHioYO0ker0CmUkNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6443.namprd11.prod.outlook.com (2603:10b6:208:3a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Wed, 15 Nov
 2023 16:51:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 16:51:45 +0000
Date: Wed, 15 Nov 2023 10:51:41 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <y2icpwmp4huod7wsfg3ln4e7bxm2ezgiutgqqcvwcfpqxzruvp@jzrwflkzsx2h>
References: <20231114220922.88268-1-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231114220922.88268-1-gustavo.sousa@intel.com>
X-ClientProxiedBy: MW4PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:303:b5::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b29f55d-6809-4428-16bb-08dbe5fb2689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SszRKCMMWI139WtKZbVeMYwUtxb9AN01s4okptgQzK7jOnsI0e3kaYsk6xZpqBjTOxRF1+hyawI879GpQcGIHY29MQwwAnnM1ed96lk+gkbWu1K2rdGMfhPuBYFngU+P8rAircr/eaumFzG6Yeu+78W6ivOjUNfIJWVYCTy3KG3H9E7EOt7r7nP7shyQ4y4tv1Wvxlwhnyq87/wNjfEQu8hCawhTRDxpLhJohD+XtWuou0eQol1L3oG9gMoly4IhUDuaDsV9DDJyK8EOLeEBRk73vNvGBg4ElrBVdnCev2CZG/NyHfwMtmlA4nsMD+jS3HBq2DgpSWqllNoFWJjo9LS8iF2/kw4mck5LUm1Inx9U4hBD4RM/hinjsvACsjBkBCAfBXUHpuhXOXfKz4D5pOBRNJu9t4L6RCoakDeynjIzpOsmrrJ9A9OJoQCkxZxI7qTR37KVb1O2j43f6eDR/DVDZ2a0L/1eq7giJfWQMmrKqI7mjyfpU0Gb5dpyZvXUUiqHe9ZY+fWZkw3Ryl8iG+Asj4TgtWDt7U6MjnKTyBrPTDI8PtmVDYmIfd5m+LCU1lOJc+Fc+gHixM2yuGNNOVFfTOT/QAJh1HRYNiuqhbSqk+WXsTsf4QdiOjnHUMb9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(136003)(376002)(39860400002)(346002)(230173577357003)(230273577357003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(2906002)(6512007)(33716001)(6506007)(9686003)(83380400001)(26005)(41300700001)(6862004)(8676002)(8936002)(4326008)(5660300002)(6666004)(478600001)(316002)(107886003)(6486002)(66946007)(66556008)(66476007)(6636002)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nwfH0qH/UiQEZ9zC2JbbMAXYURP9RDsQtq8JjLNvKjy7go6Y1ZWEuXwSj0mY?=
 =?us-ascii?Q?NPt78TWu9TkvcA5HEG02Kuslm9C8xOsiRV8/edt61+ZSf0Ef1JtiIN3e3Px1?=
 =?us-ascii?Q?mKAeYx/E0g3G8xiKSpJNRIAu32kmSWkigJi1Hg/vmoElhPkkl2f/MQApfEtL?=
 =?us-ascii?Q?NumZCcHe59mYYag2rvL++V7yRDd0iGS251xzEXHAoN2ULK8rtG3DXNJhnR23?=
 =?us-ascii?Q?4xrFbmgwy6kwR5DZjx3oRNCkRNQe3AWL0gsaEG05w7r1NRwZgG/gAC4EClo0?=
 =?us-ascii?Q?MQnx7RB4AqGloJJyVHSqTfkD2VVv70AZW6PsGZ2Wag2W86SuiKFQGEzV+2tp?=
 =?us-ascii?Q?Iz6ta5cbjv+QY1yO8qs7ieQdz8XEp1PgwpYd5QAMzMfSy5sLCCB2TMhU7MyX?=
 =?us-ascii?Q?1Dm5Gq/lzga3+yxDmS1Gz20NoUC+yv48u2nyyQnmjrRFHIXnh5RuP7S9GSJu?=
 =?us-ascii?Q?0XMHYWcaJLmrdgDKyK3vf6DdY7xKVjtMeTXmhSDgyBqpW0gGrKPBwLczQsVW?=
 =?us-ascii?Q?zcPDhqr7n1yWnVNCsAq1u3WkfRFgohcGzu5xyoof/T5BS1+tJj+BKQh4AiLd?=
 =?us-ascii?Q?Kzo+7BIQ5liELRGAS7nJFk0ViLHvREWfjIGUCtqDCWkJ643ur05RtR6HB+xq?=
 =?us-ascii?Q?nvakYEdCk1cVkyGFjc3rcanYNaGFXOqGIIM2bFctxa49y0aTDG+jMpK30iYw?=
 =?us-ascii?Q?UDiBCMrmeZAV+DM7MjjGMlgB8J8JiRsKB/iZjQXkTOtxAqbWUMhfaVfBM8J7?=
 =?us-ascii?Q?w07ndEKverdblCaK3F70KGgpPD8avZKGd/W2sq3eJU2k4aLtbRYJ93914Uuz?=
 =?us-ascii?Q?45Ry0bQdpMxGYFcGolx72MeoDk7MSK90dc6n+TBFgn03xP8d9pYuwnmbal0z?=
 =?us-ascii?Q?ejPO65hrjTaTS8eJbhfN/d07jpCOaVUone//dlDXIAUpkloOnQiaaX6PGZml?=
 =?us-ascii?Q?0lLzQ2HIu62W8L1fVXhl5dTUpWxUXHB4xmogaPCcL0ClUw7j1FlTWFxtn1rO?=
 =?us-ascii?Q?WS0mjKZMtIFiUIoYlKH2+X5desydBgm9Fs2XzApfde2Bluezm7G6FcJlmbyf?=
 =?us-ascii?Q?gfP4lq8kA1f4yJtsTZU6AGrrVqKiTzSFxEphissePkusRvJVceAy6Vz56S13?=
 =?us-ascii?Q?4SENA/VQxFLaP54r0hVd3md1P0MLbVjcdZxmuQx5TO2Sb8kgzgUJlmKqqSeH?=
 =?us-ascii?Q?lUbzDiYGNFMVhqaG7BVsB6L0DbW+Q1dGBY0Mf+iT9rsjcWtjxc+YvqBxadsL?=
 =?us-ascii?Q?O6vPuLl+C1yvFswsBIj8P9dSICVhic719hCVPbOWCNiVQUeetQUQJsK595uE?=
 =?us-ascii?Q?/yngDwBzsgbZ3vy6GUYDkX+ej7beqYiPafc8134OyXxKe8QF9ar/93wnCjtM?=
 =?us-ascii?Q?a5ijs7TQ8lKbX2OjXwKu5E0z5WG8uk5Nj8nkw8UsWzbaLUS1v0kWuKf3yVvz?=
 =?us-ascii?Q?Te33YThsuislYFcMYVIJS3NF63crNILR30yPMis0+zO9oT8YoBJM/7EVnH0I?=
 =?us-ascii?Q?Pf0sA2pF4e+50EUMHKTBXGUuV0pzxibuJLBT14fJ7BVB9xCOB8krvwVip3tE?=
 =?us-ascii?Q?iGHAK1leNwxdeqEd3BCKZF5shSgzdDzGf+Et0Kpt82uJF+sWFg8zYTVsYiGN?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b29f55d-6809-4428-16bb-08dbe5fb2689
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 16:51:45.1712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9KJmLE4kPY8mDRQaZ5IrArP70IWouWs9RPSRb9wJleu4run+fro8Q6AlMF3ymz1qkQh2OvLLnbcMpg2n1mvO3vOerwktv5L0M/tUn6BUeMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6443
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/mmio: Make xe_mmio_wait32() aware of
 interrupts
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 07:09:22PM -0300, Gustavo Sousa wrote:
>With the current implementation, a preemption or other kind of interrupt
>might happen between xe_mmio_read32() and ktime_get_raw(). Such an
>interruption (specially in the case of preemption) might be long enough
>to cause a timeout without giving a chance of a new check on the
>register value on a next iteration, which would have happened otherwise.
>
>This issue causes some sporadic timeouts in some code paths. As an
>example, we were experiencing some rare timeouts when waiting for PLL
>unlock for C10/C20 PHYs (see intel_cx0pll_disable()). After debugging,
>we found out that the PLL unlock was happening within the expected time
>period (20us), which suggested a bug in xe_mmio_wait32().
>
>To fix the issue, ensure that we call ktime_get_raw() to get the current
>time before we check the register value. This allows for a last check
>after a timeout and covers the case where the it is caused by some
>preemption/interrupt.
>
>This change was tested with the aforementioned PLL unlocking code path.
>Experiments showed that, before this change, we observed reported
>timeouts in 54 of 5000 runs; and, after this change, no timeouts were
>reported in 5000 runs.

good find :)

>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>---
> drivers/gpu/drm/xe/xe_mmio.h | 11 ++++++++++-
> 1 file changed, 10 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index ae09f777d711..4d0e816a81ac 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -98,13 +98,22 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
> 	u32 read;
>
> 	for (;;) {
>+		cur = ktime_get_raw();
>+
>+		/*
>+		 * Keep the compiler from re-ordering calls to ktime_get_raw()
>+		 * and xe_mmio_read32(): reading the current time after reading
>+		 * register has the potential for "fake timeouts" due to
>+		 * preemption/interrupts in between the two.
>+		 */
>+		barrier();

we are only protecting here against the compiler reordering this. I
don't think it will due to the external call to ktime_get_raw(). Do you
get any failures if you remove the barrier?

Anyway, we probably don't need a full barrier and just using
WRITE_ONCE() for both would be more appropriate.

I wonder if we could do this logic better and have a header / wait /
tail approach. In both header and tail we read the mmio and don't
care if timeout occurred.

+Rodrigo, shouldn't we move this to a .c? IMO it's very big for a
inline.

Lucas De Marchi

>+
> 		read = xe_mmio_read32(gt, reg);
> 		if ((read & mask) == val) {
> 			ret = 0;
> 			break;
> 		}
>
>-		cur = ktime_get_raw();
> 		if (!ktime_before(cur, end))
> 			break;
>
>-- 
>2.42.0
>
