Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A7EC77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 18:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BF110E0B0;
	Thu, 11 May 2023 18:28:36 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B48C10E0B0
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 18:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683829714; x=1715365714;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7Z6GYGWkakoT7+50/I0AskH0sVUspyQRCU3Am+4ok/8=;
 b=jQG7Ukg/SWkb8qN+F7O0IsCmXAfsWd+ewLgruXMVSzqCiK47eANGIXo2
 a9D05bK+xSOKOz9ZDokCjze4P2YMtZQ2YgZs8AUunkTFIeIkM7qn+HR0G
 qKBM/oiu6vvYvFNlRlv1boifn55jXlGo8AfpJwfG4ZwhsNDP4OQClT65k
 sp3AfJnEePV+tybzyQqthkaX+aLCPYBkrgBEwVNJxoRLuxnDk0a/3o1u0
 400L/fqcVyJjbO3cWMm41jvbAmbuMIQWc7iAIJL+6b1mCybC84YSxTY00
 mgcLRdyjyH5ik3JSZgyq8GAp2VYLDHVSSNoOcWnp4kzRtho9/K5w6KqYD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="348076533"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="348076533"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 11:28:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="650323494"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="650323494"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 11 May 2023 11:28:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 11:28:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 11:28:32 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 11:28:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 11:28:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jU0LUukrCmTD3L7hG0GIFik6tFRqgjutFDRUh/mPj9ndrEcy1wJOHAjeWR2hjIedltCCTvEmExNMZ5tDU/5NHkA7rN4gX435J0MSh4YwMrBysWhaOfeELbaW7cGzlB6DvT3wVGI0v4dmL5C9lxtMj5lLm8AAc9302ypafbH/nA7VbNwWQcNtpJGukVYmnQXtqDiuUM5La2z5T49VQ9Cqg9W7F9qkG/zYTcU5woNywhUzxV9Y/p2w+By5evDcmPGQ80AaEoDV5RU8EMz/0oiwRCLM0ZXMiH3zN2ACcOFNKc/zG65XKTAsmVDwtWa+LQbWsoqrPg6HkDfX5klU6B0xCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=om0N8IP+/sh8+V7TBIC9ge4/sS5RltMKOYHpu4AEtSY=;
 b=SMiUwv6wyn+2F5MCu9QJZI7RjvbX69CU1YV6wgTHGT+PC61AdiGgz5oTijSQVNAnJybc/0AtN64dyVeJazaMhqCeGdxIsCigMZCHOYJTcqURM/GGZF3SvS+LdCikFJm0eY5DETOB2aHgupWqtrfsAQC6tp+QiHrtMLUpCdrdRMCC+mptu+yU1bYTCdwLxSAZJc7RHl75pnyzfwVRhmi7sz7ndJ21eCn5TtZrPxWQAKrfZlSzn7qM6yKBuV91/JVeeJxuvwf0D98m3nGORw0vw7kB0ZNTNFG4KvhsBCroqRHxVn3q/SKM3qH0HSHGebFK2qiQQ8v5E0oSTu/VnqJnhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7745.namprd11.prod.outlook.com (2603:10b6:930:90::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Thu, 11 May
 2023 18:28:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 18:28:29 +0000
Date: Thu, 11 May 2023 11:28:27 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <eohth73sr5bffmwhkxomf5edle4hlkhyna4koo4wquyajea2oo@hbzhghjxl5if>
References: <20230510195424.3045127-1-lucas.demarchi@intel.com>
 <20230510195424.3045127-4-lucas.demarchi@intel.com>
 <defdf14f7a039003218c4f32c0375c33131e8164.camel@intel.com>
 <njuthgb5uutcknbsxvvvxfx5636bofmwmfyjq6nbxkpbxai4xp@4vwutipfdpd7>
 <9d04fce692222624580527c6d07ea88460a32ca7.camel@intel.com>
 <oedsuayuo3wtdea6cvmzaoesji25bwbqohgemayj5ocybbzgtn@el2d34rwqfsn>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <oedsuayuo3wtdea6cvmzaoesji25bwbqohgemayj5ocybbzgtn@el2d34rwqfsn>
X-ClientProxiedBy: SJ0PR13CA0107.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: ddd9e004-3e7b-4e26-db8a-08db524d8487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PV8EE8Fcnn5R7UqaqMx57vm+jJl/WeHhTJitZs3BI2rxMi75hvXx3NwJaMHWft+VlpMw88NkFvICZQTUpY2xKHx/Ae26vgGz4GuP+u1T9zHyLQoXFMp/zIqmTtDqd8AsJuXTFNeuz28uauUizK9iIS5Gp1f8I2BakVOS/eqBImoJxCgV2090MW+UIHO/PgQhVvqAj5z/I/hEnMGqKKRthH82/upVKE1TQZ+IgT/fZnFzTJnkOFLUBmpg1eqy8JK86ZkR7HmQjX3rJnFpN95ufi698RQ23Io+8GUpQ6KyQ+kjRIrNXS09th8ewlmbQA7UA79Pr8Z547HBqhdH+oXHVu6ZrLSpdigHLMzzBCMJpIGprxz0Ku9dEWIp3KhOpKIpPa9mQtg+iTTM3IOMHRnqDS7n/RpkOm9/KejXGQcg0s9zLz3miN3eaRzDM1bW9QvphUZsRp99uSdXNU0qtj6LX7zZNrpd8yJfZlBsJLVBkMJvoo4j9D3o0xtp8JWERphrAun0iL3vp9vi4ZJEPwQFaaRWL7nZvgGBgVK5PeavLd0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(136003)(396003)(39860400002)(376002)(346002)(451199021)(82960400001)(86362001)(38100700002)(33716001)(66899021)(8676002)(8936002)(6862004)(966005)(26005)(6506007)(478600001)(5660300002)(186003)(9686003)(6486002)(66556008)(2906002)(83380400001)(316002)(41300700001)(6636002)(66946007)(4326008)(6512007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ROcX7/fXW6GDf1YAHO3N2LfJu6uOIcR3pM6tENuQxnEkai9uTRsrZ63OBDlT?=
 =?us-ascii?Q?wnXLPVUO+SE9HQ7/3HWUwKjsFB5pb81g9ORgsFU4naAxxZCRIOm7MbpnYsTA?=
 =?us-ascii?Q?MTmQtJeP0XgTeWH8hc+QRJrE1jtlmM0zYdkGD/wUANnfi4lzBDJS7xgrn9YK?=
 =?us-ascii?Q?YxXKP/T+zAKg/83c0uiYd9ZLUihKU07ZjZDy04DCxE1MrvSSejv8rhVVnr0l?=
 =?us-ascii?Q?5zWiBNkXRHq2Qqt2gm9EuvlrSGE5RwiJxQKgc88ck5NUwT4P4YuoxbyEPQAQ?=
 =?us-ascii?Q?cLAsGkDO6kIA/0bEQareTV0awMylcAgvWe5mnNwQn0g7JqcY+no8r9Pxdj0f?=
 =?us-ascii?Q?qiVgzwpE5CFX27/O7z1Wx9lhIel6+RKm4r7hU4t/CZoFoRw90hXqFQd8Y91G?=
 =?us-ascii?Q?sbTk/QMsJnd3AE9W/UrG9sgC/QxRNo3vJXxoNfAWG4ZU3Qe7Y9XnDBdx92+E?=
 =?us-ascii?Q?yS3FC0JkjL++bH9oiYJAmfwaKuuKFc2mRnlcHcmEvUJ+Nwy2Gz2y/hQlxV9P?=
 =?us-ascii?Q?E3lzd5A4vy59MKxl/QqqQ0618vdu8E08Kk6Aq4DuTWbQuULTx7Ofv/LHt5Yu?=
 =?us-ascii?Q?qEw/Q6RQJ6tYtaeZKX/osZl0WPcInvh7FLnUuph9rCSOShc1Fz9lGAZZAzf8?=
 =?us-ascii?Q?BJIuzqOKPr2Qz0Y62L9DWcpecxxUybOjm8MHnXO4ss2TJrSTkYsyXUstsGqj?=
 =?us-ascii?Q?3zmwZ25T6tAh0978BG06og5wwGraE7U6ALvLnI63qpOJQUcmB2DirpqV1/0M?=
 =?us-ascii?Q?dJNeq5WjL+UJiGM02mTksOV7/uhfY1KxywC8ElaxHT1kUI0t/rnX84tjBDJG?=
 =?us-ascii?Q?ZVD9r4nMcVTvTSKT2b/ywsLi3mmHOXIyImURRIgLV3MnccDV0KQaLvw+/JGX?=
 =?us-ascii?Q?NPxHQk7TwutOu/GP4gT3WejLbDm8slTo+o7vm8oJ3sU6+XVg3XX29SQRIOhn?=
 =?us-ascii?Q?msTYC7snfr41++fnHP5WM2jVAaajURvOgXBdpo1UF6vylNDiNQt/x4glmjEl?=
 =?us-ascii?Q?LHMlFJDIEUL6NzhQVaLcseQdBmTQ76AbxYfffzF2roxpMbs8yelLi+FU0E7h?=
 =?us-ascii?Q?GTi5NwUoSZjTRWeY3Dn0L8r7ePQagGX/kBdDDQQYlcogc+R8LOWRTFeJbAnU?=
 =?us-ascii?Q?2y78+DEMhikz+bJS0nVRvRdbKxcexI+knqsDnFtCsfk2a3aJgIw24bsdSoYC?=
 =?us-ascii?Q?vvSPecmwVqg2sJBDP1gPRTn5io2pJcle+lUBB0cqVfqN2iB9l3CjjN1f43MX?=
 =?us-ascii?Q?pRd1qnYiCs1p9WexMuV5xbD5DNHZ5iqTjBYT6lRIHopPYrfN7yj970Sp5vQL?=
 =?us-ascii?Q?j5atUZxbGuNeo6UHGYkp3L6QlGbnkunbMLNorDOfC86NHODPsrB8NU7FFRx3?=
 =?us-ascii?Q?naU5flewV312bikv69ewDqPSZQf3hDW0RUjTtKTfRSisKL8C/fHoA6o/PdAQ?=
 =?us-ascii?Q?MkOSb7ojAHxa4jrnb9caveUzppDVAENy7ZDeQ47qSuu4xXb6po6s91jKXssu?=
 =?us-ascii?Q?md7RyCnaOR7TsW5cxWI9FFeDAhNzPxDBgWnLt/gv160elDwk1V19eIP04yjV?=
 =?us-ascii?Q?5e2w8V+A85uiscJY4FmuY8D39RLKTEMta0wMhUUccxBrDeEI0iDoqL1o5LDc?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd9e004-3e7b-4e26-db8a-08db524d8487
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 18:28:29.4351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: woVgFh1lvkFIilmjzfwMIqJKXVjahuKOlGFTMMD4YeVF8Z6pveLqMsP9Nlp3Hz3ZLGGLktFpQTeCmyf+fXtnWCE5kaigT2sCX1lhomK0m+g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7745
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/4] drm/xe/display: Consider has_display to
 enable it
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, May 11, 2023 at 11:02:20AM -0700, Lucas De Marchi wrote:
>On Thu, May 11, 2023 at 05:22:34PM +0000, Jose Souza wrote:
>>On Thu, 2023-05-11 at 10:12 -0700, Lucas De Marchi wrote:
>>>On Thu, May 11, 2023 at 12:47:26PM +0000, Jose Souza wrote:
>>>> On Wed, 2023-05-10 at 12:54 -0700, Lucas De Marchi wrote:
>>>> > Stop the dance of enabling the display-related driver_features to later
>>>> > disable them on display info init if the platform doesn't have display
>>>> > IP. Besides being needless work, it wasn't covering the ATS-M case that
>>>> > is the same platform as DG2, but without display.
>>>>
>>>> Xe should set pipe_mask = 0 and call i915 functions that will handle no display cases.
>>>
>>>in xe, enable_display is the runtime config to be the equivalent of
>>>DRM_XE_DISPLAY=n. It is *not* to meant disabling the display.
>>>
>>>history why this ever came to be was:
>>>
>>>1) display integration back in the day was less than ideal (still is),
>>>    and developers couldn't test things ignoring display
>>
>>Xe CI is now testing display, in my opinion this option to disable display should be removed and display support always built.
>
>maybe. Last time I checked there was a 50% divide on having or not
>having it and afair I was against. I'd not touch that until display
>integration settles and stop moving in the branch.
>
>	95dd4dbb5f89 ("drm/xe: Make compilation of display optional")
>	6a53b00afa0b ("drm/xe: Add big warning for !CONFIG_DRM_XE_DISPLAY path.")
>
>Unfortunately I can't easily map to the MR where that was discussed.
>
>+Maarten
>
>Also, "Xe CI is now testing display" is not a good justification wrt ats-m.
>Besides not not covering all ats-m (see
>https://intel-gfx-ci.01.org/tree/intel-xe/bat-all.html?), it's actually

wrong paste to this link, should had been
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/265

Lucas De Marchi

>running display tests on the AST driver.  See
>https://intel-gfx-ci.01.org/tree/intel-xe/bat-all.html?
>
>>
>>>2) have a way to tell the driver "don't ever touch display IP" for
>>>    bring-up situations.
>>
>>pipe_mask = 0/HAS_DISPLAY() should take care of it.
>>developers could force pipe_mask = 0 for giving platform bring-up.
>
>The hole is deeper than you think. See:
>drivers/gpu/drm/xe/display/ext/intel_device_info.c
>
>In i915, pipe_mask set the device info based on the PCI ID:
>
>	static const struct intel_device_info ats_m_info = {
>		....
>	        NO_DISPLAY,
>	};
>
>	INTEL_ATS_M_IDS(&ats_m_info),
>
>This is how i915 differentiates DG2 from ATS-M. Now look at xe with the
>device info split in 2 places, xe_pci.c and xe_display.c.
>We can't use the PCI ID mapping to know ATS-M is not DG2. We can't use
>the subplatform neither, as they are already part of other subplatforms:
>
>	static const u16 dg2_g10_ids[] = { XE_DG2_G10_IDS(NOP), XE_ATS_M150_IDS(NOP), 0 };
>	static const u16 dg2_g11_ids[] = { XE_DG2_G11_IDS(NOP), XE_ATS_M75_IDS(NOP), 0 };
>
>Changing that for the sake of display basically means having to treat
>them differently throughout the driver, which is worse than simply
>having a `has_display` flag added. When we eventually migrate to disable
>display, the has_display flag in the xe's  device info can still stay
>and how we tell xe_display.c that the platform has or not display (as
>opposed to setting info.enable_display)
>
>
>As I said above, I'm not really against the long term plan of removing
>the kernel config. In that long term plan we'd not have a
>enable_display= module param neither as we'd have already a replacement
>for the global module configuration, allowing it to be done per device.
>But I don't think it should block the fix for ats-m done here.
>
>Lucas De Marchi
>
>>
>>>
>>>For (1) we may turn that into "disable display" now, but not for (2).
>>>
>>>I'll take a look on how much work it would be to migrate to a
>>>disable-display scenario rather than the simple "Fix ats-m" being done
>>>here.
>>>
>>>Lucas De Marchi
>>
