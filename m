Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7654C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 20:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F0CB10E1B3;
	Wed, 15 Nov 2023 20:05:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14F510E1B3
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Nov 2023 20:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700078714; x=1731614714;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e6iBbDJJAU/vCVCofCOFU08xQDuRjYPly7Jf3s/IwNE=;
 b=cgrfR6I0Z96RSj85yUowLbUtDgfmKNigHVbzLwM+RMv+VhF7Pb7EO4oM
 Ip9KjvVJqvfs4plffZga+fC/2D/NqsN5pv3ZsVd6GOohRWcpp2Hz2UDbA
 bzAeOHx/l1b7z5tXvDFUYsjkOukR40YC221kirVd4g2Hrw/KXWaODlMzz
 bPPqXEw5e4KtDUG4g+fwvhAU1p+XAODlWy7agtMivNLXq1//S20GRqqMP
 3oKWeH6wMkQ9hy6+5bCB6DHJcaKttdkSoHBkGk0QjJQOSLkLLVEAG5tuy
 LHMte5hSsoB0cboS1H8BqzYhQZhKfDZniYH3hUK45l+3af8yzad8aFN3B w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="477167766"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="477167766"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 12:04:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="768696366"
X-IronPort-AV: E=Sophos;i="6.03,306,1694761200"; d="scan'208";a="768696366"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2023 12:04:56 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 15 Nov 2023 12:04:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 15 Nov 2023 12:04:51 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 15 Nov 2023 12:04:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JktSLfoSh4HwprfQVWYTFvNj6O+Yz3zt8vyJtXObY1DlBS8FYd96tsKxRfhDrNBrHUQjmcL7c/uxbXWaO27tHSYwtPhlMxWjDIG2XSNIIYCZDsJiRd170R8uFVcIox8nHSzciQ9IJ5OE/Yma87gatFLAwUmdw+RBB0407GzhU9zfXrevAyTk25iBJq0iKjiBejlyt5L9Eeooo4cfc1XO/zgUWgm+EfYg+9EgnQqwX1K8KSP5yGZMJKtAQP1VPWc+2uVaUf6bHBUyN1l+KPM1+T2FkUa2WKU0xey99hUombJlUn71qDlzk0ZkUarCRvG/yyM7wwZQOyRuiykGTsepIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MU58Wx+eI7GXvQPDtiuqh/lmlSJeHNgg5V2+RHiN8c=;
 b=C/3M9GSeHf4tNGxtJdMljGDiJIrwn05XePhbPhlbsuogDxqNawy9Flx/RonMpkm21soD1IeSsgPzKpQF9Dp7z6l89hy7R+weInCF2gErvAMsXzUs7uPt8SPz/DaMzGu0LbywUTjJEiWjTOt9EtVdV4kRnklczeTaMM1xZqZ7ynJUcLpnKgtRKiAnRLs4wracOvMXbbjfywgPRgq5sXgpwuZpHTP7uk1f/G2Clu816zkWcBSKRzwAZcPAZDOxTbgUA7SN0beHWMzTy6+CrNd7gKSZ2smjLaODmwiK3N5lBBMMVCYwUKEgcJEPad/tbvQMS/GTy4+O5C4kba/F9YEWAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7337.namprd11.prod.outlook.com (2603:10b6:930:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 20:04:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fab8:8ece:c8fe:fc7c%4]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 20:04:41 +0000
Date: Wed, 15 Nov 2023 14:04:37 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <us7s43n2woxnrfbuyo5x43nxflj3ajf7yamvznk4di3awh75zq@zyjf4wnucgrn>
References: <20231114220922.88268-1-gustavo.sousa@intel.com>
 <y2icpwmp4huod7wsfg3ln4e7bxm2ezgiutgqqcvwcfpqxzruvp@jzrwflkzsx2h>
 <170007111735.1634.7618023957528021915@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <170007111735.1634.7618023957528021915@gjsousa-mobl2>
X-ClientProxiedBy: MW4PR03CA0313.namprd03.prod.outlook.com
 (2603:10b6:303:dd::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7337:EE_
X-MS-Office365-Filtering-Correlation-Id: b1edf173-3b6e-4dbb-76c8-08dbe6161a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rUBwzUssUwYQ7qWW94MGZmtc2FWrWXYIAq+AyUJ4PQjFDhWypbV9UBOzMOHDhqujuLMyLZw8n06UnQPyi2e3se1KnbmBmmr+aQXbP3hqxRDvpYN11h6dyHFWlX5MQPfYV2n9+vEXNzy2XWTOWVSWC0Ul/8UuIheb3eEQy7gJQBlcyQ9fmelTiQ0nU/gqOfd1Q8lVC12y05OW90TgD8jrkb5Vpn39nMm+ioaBScAc3J/mia0oKI9YcBkY6XLnvP14QUAWyDDzOJu+xpNnfdYxdxUU9sZCxsxH4wOGKXguQ6OpnQgaYZhLGsH4V55Qn+kKKPqyo6QTaTlK4EBDyqMzhgPKCCzsy9/kDP4/z4J5vXjrQcbQUbESzGTB4TN7gRkcjBqRV4hfkdwNSMvbMNHPw8AqBHCIyVaRxd739NCEX2+Mx7qoXo07wfb8DQNYjGnb/LvlNRBRHP8nG2dozga7exMUP8OLCJThrF6rxqmeXKYJeKf2L37c+KQk3+Z+igIk6gYkjs+R0Oc228Bbbuq/6aBEH23zIiOrErmftWrra+YRfhcPE9QhhpH3NfKfn5OLwgS49FWp2FTON2QqqK2Ou0+ke4Bg+TLR4cIGBZuQ7j1+iRVnWjD5aqJsB2sBoazK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(136003)(376002)(366004)(39860400002)(396003)(230173577357003)(230273577357003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(86362001)(316002)(33716001)(66946007)(66556008)(6636002)(66476007)(8676002)(6862004)(4326008)(8936002)(83380400001)(26005)(4001150100001)(2906002)(6666004)(41300700001)(6512007)(107886003)(9686003)(5660300002)(6506007)(82960400001)(6486002)(478600001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5g9JvT0qAZzpL5yKbUxLV2bnqm9p/h3MTNHAucytz0c/jLZke4G3BtzaIl3R?=
 =?us-ascii?Q?sE2q9+chpsZOF0k62VXGxvYfgJlx7O/7mQDLLvKlqPIOMTF7DMUexAkiKcgj?=
 =?us-ascii?Q?b4TYaf0652g0XLuIXWYFiViX0dbkOtQvQNiujtvL+6qzl7Io4thTS5nnmNqC?=
 =?us-ascii?Q?5s2ljAQTBWmRRv8CGPMP/jYk5fwaTNk+S8WVc/HG1mLosmf2zN+ot1cMazGA?=
 =?us-ascii?Q?nDqsrMWZ76VYlScGWTmMye5NLgKWOBmt/lQ3lz4dPL6J+TQXJ5gPoP/9Z0LX?=
 =?us-ascii?Q?ICP2dbIbGoDXMHrzSq+lKZoZu18cKuhzh12a2jx5PnqKY4ZYgEE8GhAsw5vG?=
 =?us-ascii?Q?/z2Os+Rlo3RGJn1rPdX6XK1NE3lMjqIRp2hnepgZKNRzHDUDZRTDfd6q/UMt?=
 =?us-ascii?Q?6u/BApfOjDjUwkPWzsR5RjcPU2iVebu2pVRBm1Q62OdHY35ryk9yz6TxKyb+?=
 =?us-ascii?Q?pFX/pGv4Jwior8Sb7LC9TH/BTwOdPWP15YURYgkBs3x74lrpeK01v/C1nkBM?=
 =?us-ascii?Q?xLaeoRfx5PqyyvmAigAqENWLim4oOkeJA0hTpjEExs/VudODJKlb7DVZC6E6?=
 =?us-ascii?Q?Is19m8Z56f01zAIdisa1yczjE7G3ouUN5Dx7MJtum6XVyPATFQ/8d01+XWfl?=
 =?us-ascii?Q?31OfCTFkmcqjtL3LtEdFJrJI+9507Jjl7EJn7+EmfSXDU+MiuKc7o9+FX978?=
 =?us-ascii?Q?qqQ90nDNl8I2x98FQiTZHK/KA/e/DP8EbJiX1GpEb7jDo0Q/FxHLvZyfhbA4?=
 =?us-ascii?Q?tVVl12oAYIzw6Ex0PO6lkm9FqlvSPhJ2WpfCsYt4oi+2aJEZei6wVEwsoTVB?=
 =?us-ascii?Q?KDIwvWCZDX6tFWgznfw/47s9TJ8iRLlEfHovrpqEFoG1b3AomXZDC0HPyltz?=
 =?us-ascii?Q?RXIPfeHL8BA1D1pEVbHFoSBDR0+P4lIeDfEPtw8rA/NyJyynPbLlwUcjp2l8?=
 =?us-ascii?Q?9w28+MenkDT1TWatNaPmrg7aa/FiawszfE7DyDCLkJDAwemdsUKziVcYV5He?=
 =?us-ascii?Q?iybY7j8EqIpFDTAJig7CS8k9tqgRrwXTEjNp5IqLM7mzHL2vPwMQM183F8vQ?=
 =?us-ascii?Q?yjFuE6DTNW91pTMv3/XSILpRMD53ORdNHC105o4PuyV0lKiB5jhtXyMp0Zyi?=
 =?us-ascii?Q?xAhA/2DWl+wJuCwBoURtlnANmbUz+MhMynYMrTp3F5Ik7Eq7Zr8zFkD3DCqJ?=
 =?us-ascii?Q?ZhZ2SAJDW4x1ZtEC9rjilJiW11SOVxll2UYw9eqwx85HQ8ts0WrdDccHhwpX?=
 =?us-ascii?Q?D8z/lK9fePjl+3xrVoewPWkAnyDY+VylvSYm3GnB7L4VthIVgYLDFLAPshP8?=
 =?us-ascii?Q?f+yKOMTAZpG7MC8gFXYcTJyn0A9tqh3p/T1EwAIxd7LF2xRSyRqlbAXOCQ0p?=
 =?us-ascii?Q?qPrOKTtIMTcL4HStOHu5xOZccy8cJpP2LiVp2NIj3VEq57SJe/121o38Pxlz?=
 =?us-ascii?Q?kUJFIGLve6OwVf/z6uP244fGL/WSKGDIG5mQIevGjsPLZK0fOl0X7CxDgtub?=
 =?us-ascii?Q?a6bkKnky0XT4wv9tspTULD7/EI45HvH/OsxBBdAoEkdT5fxRYCNW+lTWeFbw?=
 =?us-ascii?Q?RopVsIEOOSObxgWE8dziSAj/bEB8M0CdA4r5tFAMHUEGL/SyTeSx179loBaY?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1edf173-3b6e-4dbb-76c8-08dbe6161a50
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 20:04:41.0523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Di8/0Ki4lDjTPzjjxAoqGGOgQwHlSqcbb7cX70euB0w3xQfSyttE/0rym6EXVgO4D9LRsRm3fgKy96OIZQ2DnUH8pTFY6RB/5e/7VW8HtUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7337
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

On Wed, Nov 15, 2023 at 02:58:37PM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2023-11-15 13:51:41-03:00)
>>On Tue, Nov 14, 2023 at 07:09:22PM -0300, Gustavo Sousa wrote:
>>>With the current implementation, a preemption or other kind of interrupt
>>>might happen between xe_mmio_read32() and ktime_get_raw(). Such an
>>>interruption (specially in the case of preemption) might be long enough
>>>to cause a timeout without giving a chance of a new check on the
>>>register value on a next iteration, which would have happened otherwise.
>>>
>>>This issue causes some sporadic timeouts in some code paths. As an
>>>example, we were experiencing some rare timeouts when waiting for PLL
>>>unlock for C10/C20 PHYs (see intel_cx0pll_disable()). After debugging,
>>>we found out that the PLL unlock was happening within the expected time
>>>period (20us), which suggested a bug in xe_mmio_wait32().
>>>
>>>To fix the issue, ensure that we call ktime_get_raw() to get the current
>>>time before we check the register value. This allows for a last check
>>>after a timeout and covers the case where the it is caused by some
>>>preemption/interrupt.
>>>
>>>This change was tested with the aforementioned PLL unlocking code path.
>>>Experiments showed that, before this change, we observed reported
>>>timeouts in 54 of 5000 runs; and, after this change, no timeouts were
>>>reported in 5000 runs.
>>
>>good find :)
>>
>>>
>>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>---
>>> drivers/gpu/drm/xe/xe_mmio.h | 11 ++++++++++-
>>> 1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>>>index ae09f777d711..4d0e816a81ac 100644
>>>--- a/drivers/gpu/drm/xe/xe_mmio.h
>>>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>>>@@ -98,13 +98,22 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
>>>         u32 read;
>>>
>>>         for (;;) {
>>>+                cur = ktime_get_raw();
>>>+
>>>+                /*
>>>+                 * Keep the compiler from re-ordering calls to ktime_get_raw()
>>>+                 * and xe_mmio_read32(): reading the current time after reading
>>>+                 * register has the potential for "fake timeouts" due to
>>>+                 * preemption/interrupts in between the two.
>>>+                 */
>>>+                barrier();
>>
>>we are only protecting here against the compiler reordering this. I
>>don't think it will due to the external call to ktime_get_raw(). Do you
>>get any failures if you remove the barrier?
>
>Makes sense.
>
>I put the barrier here to be sure that the compiler doesn't surprise us, but I
>haven't tested without it. Maybe it is not really necessary indeed...
>
>>
>>Anyway, we probably don't need a full barrier and just using
>>WRITE_ONCE() for both would be more appropriate.
>>
>>I wonder if we could do this logic better and have a header / wait /
>>tail approach. In both header and tail we read the mmio and don't
>>care if timeout occurred.
>
>Yeah. I was thinking about a something similar, but ended up sending this way to
>have a single place doing the register read.
>
>The difference from your suggestion is that is that I was thinking about
>adding an extra read once out of the loop in case ret is still non-zero.
>Basically something like below (the patch below would be a substitute for this
>one):
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index ae09f777d711..2b65d8387cd1 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -118,6 +118,12 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
> 		wait <<= 1;
> 	}
>
>+	if (ret != 0) {
>+		read = xe_mmio_read32(gt, reg);
>+		if ((read & mask) == val)
>+			ret = 0;
>+	}


yeah, I prefer this no barrier version. Small tweak on that maybe

diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index ae09f777d711..bb8f079e3cb6 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -93,16 +93,13 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
  {
  	ktime_t cur = ktime_get_raw();
  	const ktime_t end = ktime_add_us(cur, timeout_us);
-	int ret = -ETIMEDOUT;
  	s64 wait = 10;
  	u32 read;
  
  	for (;;) {
  		read = xe_mmio_read32(gt, reg);
-		if ((read & mask) == val) {
-			ret = 0;
-			break;
-		}
+		if ((read & mask) == val)
+			goto done;
  
  		cur = ktime_get_raw();
  		if (!ktime_before(cur, end))
@@ -118,10 +115,17 @@ static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
  		wait <<= 1;
  	}
  
+	read = xe_mmio_read32(gt, reg);
+	if ((read & mask) == val)
+		goto done;
+
+	return -ETIMEDOUT;
+
+done:
  	if (out_val)
  		*out_val = read;
  
-	return ret;
+	return 0;
  }
  
  int xe_mmio_ioctl(struct drm_device *dev, void *data,
  int xe_mmio_ioctl(struct drm_device *dev, void *data,


.... it doesn't remove the double call to ktime_get_raw() at the
beginning on the fast path, but makes this shorter.

Lucas De Marchi
