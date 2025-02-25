Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56200C021BB
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 23:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F382A10E81E;
	Tue, 25 Feb 2025 23:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="btHdBkfu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1420010E81B
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 23:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740526036; x=1772062036;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=brSm5GzL3v6YqodTIEgXuDUQQFDUg9qvNgwo1+A98Gs=;
 b=btHdBkfuS77KV63t97eOv7PzrlQ2+14XcA5bb2J+nX4p4yk/44nz1e1+
 tV6lQ3ZexsrF/LQ21Q2vtFPPlPV9A8ioiWJS4yoQTJGhNYsWIj/2Ljy9z
 pVlaKij6FIQ+qF1XLDjm9WqUzU12PPBd4+Xq4dnDo32MAC2IBZTfRb7Gw
 pdOk+Uba0mZ/Fi/wYeuSJrKFjberPGSMcDJfkDpHCqxOXtEtv6uRP9ZMI
 ElWA3WeuIAX/3LaHFr7+sn1yQx0bnzgXp4pzJ2C31bQCJmwcwHFRJc+ov
 X83UWikpiBOmWO9VezjbWIkh9FEnfrEH/u8Z5eSikkDd8hnDspj1V4nWH A==;
X-CSE-ConnectionGUID: VdiqSfkERnSoxTQnQ1wpdA==
X-CSE-MsgGUID: F0pxPzZ8R3aWWEEY5MMp/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="41061573"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="41061573"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 15:27:15 -0800
X-CSE-ConnectionGUID: qvkmwo7KSCeFk+G3pDFLbw==
X-CSE-MsgGUID: XcLvJ3a2TAudGQjHEBYJUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120644995"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 15:27:15 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 15:27:14 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 15:27:14 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 15:27:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alrJGf0nrHM3xXSzfkjhZiffKRyGId8o4rEvg+AO4FglZasayukI+fPtl6GgJvVkbeVN0Bq7NBShls3bV0NnqF17lC8pn6FU92vYIjKgqZuctxPS7cc41gjdiboaK6CmzOZpF0gEe9vMurSREWO5AUIP+xmwFaBATFdmH2ei0SlmuHRWc4TcP+NrJ2L9Q+ftEDdKtlayViuocL3Vr8EtdOT37rz8jHr7WuBaaYRhqABHhjcftxB8uOGmkmERcv5tL39MqWcJtwwh/Gk0DKsjG7KY5ybhH+jqOLgir5Ut/EOg/H8KsVgVuCpwgxjuTVmeZoMwSRG1qPLx7WJ/JHsfWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSH52gS97GVKKtDq091WdPUSAD1Zy4TSys5cUjzLG6o=;
 b=xr7lrOO26jWc0JRCue+RqGXlb32+mST6PBsDq2DUAp/bhS1chTlA83EaCa1p/f6yM1FkKkEqRv8dfRgd5gUKtBMOEE0ZOT/gJkWknOh8eT46luf90zYlfjdYuFv9IZd+MO0rHAnr2cNjdiuR/RjAsPBZHjQwCU5v4/E4rYJFwNn647B33YUagL7JJtaHXTPKwr8U1sbPWyJxUzcCZYY5idYqtA/ZrLTnia8G4VhuiiPo9UwMyx43vwA+72RtS177i0EJ/sfIFMR7bGbvoNTEbSYmgMZ+b46EVhh51IfYOtznjWEQA0RGlYV7ladJtfTo7S4kRnEX6QTEW7gyasng6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Tue, 25 Feb
 2025 23:27:11 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 23:27:11 +0000
Date: Tue, 25 Feb 2025 17:27:08 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH] drm/xe: Eliminate usage of TIMESTAMP_OVERRIDE
Message-ID: <f75y5lqrd4e56m3xhbvnj3g7pe7fwbojwqbfq6evyy6ntnjrgd@xnapr3kw5cf5>
References: <20250225224908.1671554-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250225224908.1671554-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:303:b9::8) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW3PR11MB4633:EE_
X-MS-Office365-Filtering-Correlation-Id: d9b672b9-e509-4d24-5dcc-08dd55f3edfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9KuU11VIMMhI0Bn1hskTo/HPqLYSv5Rd1HhS98qJrhn+g3PvlZKQzwO6gjON?=
 =?us-ascii?Q?DJF4TvgaRtcIqml10yxGwWaiuKzDPCrmf1VZFn5Iupq58ehE80LM+/mTsowj?=
 =?us-ascii?Q?io/0RqAVbPha3SuTowNHMzkt2IN14CTEFmzPracxMp5MJcnch1uu5b4HXwaq?=
 =?us-ascii?Q?NiyT3kMN04Q7oMHBi0pQ77PzD5Z+b/ep7ayxKuWmOAFp3UewBP9rrjbPyFGC?=
 =?us-ascii?Q?ocwxMjAng3bKU+r4VvnONLWk9n5vlAYMAi5s5/OeR8xyTGoaXzChvuVJNjD6?=
 =?us-ascii?Q?GeCjEVe1Ihpb0VQ0uq6ToLuAqIuh0UPIhx2wv0jBGrEa9IIWnmGKn1iM/fVC?=
 =?us-ascii?Q?F3rnNW/Eh6of0iX7ssx0vFpF+Gz9/sY9wvJ1YcGTczXk9EfUbQSrLphCGuXz?=
 =?us-ascii?Q?d2i/fj0j/ciexs5jokIkHXw2vO7nUPOqe+DdsjDJcyt2w+oh0M7GGJw5MUv4?=
 =?us-ascii?Q?5PdkkJU9nTfFmQrckgRRfXiv5Zf+6BKAx1WnlptrGhfFlEaYwoJJOkTVE9gw?=
 =?us-ascii?Q?VupXNxsOhMDL0FvmwpmuIh+eSpANuYasb4rDlK+Ske4w4oad0Cb+KMieM3AM?=
 =?us-ascii?Q?HDstBCps8zqgTKa0Keay/3sCt3BuKEeRSqj/nSlMtYSytMxf7p9USXRU8jJY?=
 =?us-ascii?Q?01TbGK8gN4vN3kfj4f3gRZumLsoipXYeCO/nb334txATUfmmYabL8rrtDj+q?=
 =?us-ascii?Q?DU39uWbO5yafgoVrUi4JMvFqKNDac6XXfgSJHIrI3xzaoYPx5Subi2VfnUqO?=
 =?us-ascii?Q?6bZNGnK3RNROf3rZolIfhhd1qFQwLFdLVyKFv6ouUaggd2fLklKhBbIECbtm?=
 =?us-ascii?Q?TbxPEX6+BrRmqM55uZTcrJvy5b35zGRPiIRlqBwE+pCfJWtZg8Yx/P563oxR?=
 =?us-ascii?Q?5zbPgKQYVBtXqpqU3o0PmJjyRugpYYZQIn/Z3RtfmMcgD96C7ze47502w5oa?=
 =?us-ascii?Q?yZU/43CHPfLcE6lR5oNfU3yaJFSHMIVcBMm+QCQHICwtCzBZHGY9NdiUOWSq?=
 =?us-ascii?Q?3OTBcKB/Ywhx/u47MqXnwal6/5mZaHJZnb9hdyTbfY72Nz9v7o9UH/5hR6kz?=
 =?us-ascii?Q?JX62tfuBr3zl3asH/hCq9gjt6PNkoEOH12MMTsYboz0G2drsBA6XjKs6FhpL?=
 =?us-ascii?Q?ExQyu3+qlS59wiSt1Hvixw/R4T1Bvcq3fjUlRy0yMwNWybcWXe2Hwe1kPluy?=
 =?us-ascii?Q?LfHmMfutv4TLLaaKe6NiHg9DcTiOE4IPE+4vZF6I9fgqvGHjyU7F25peSHf6?=
 =?us-ascii?Q?YfjJwJjajtZdmKZMCAsC77yVRmkV1Q/RQSR5l2LM18E+l0LQaX7PkHsv31gI?=
 =?us-ascii?Q?3LcN3uAR4pIBiH/b0xEfmmNI03dwOjyZK2n56rwgaz2q6HrTLoSAqNs6yXVd?=
 =?us-ascii?Q?di3zIZsCYFuhfwy5tk8pwwopEsOV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?imK/cLVx6XUeaoVHGmwm24mkA11fssEJgbr3uGPssy0R+Mjbqm1bRxNkCNjm?=
 =?us-ascii?Q?ncdisR5RV6l65JbADAYlhKff42JIzxxVc+Yrlq5kSy4FTrthD0I/XF4wC91U?=
 =?us-ascii?Q?sHmwmkjK+pxTuGQYn2U0x/NyyQ8aZMGk5cimnR3EEAt57+5s6Dho2vo8TBHh?=
 =?us-ascii?Q?6KShL13JeUESVIKAlbCFQ7jWzuGOC8sfpUN1K+hQKskeltbzNi58oZbGFQoV?=
 =?us-ascii?Q?OQt8b9dmDrKfrURLyEOWq7nk3J+SpIuDbr0nGHZr1wz8vC5N26uBFCHK1iRR?=
 =?us-ascii?Q?ZEzAReHZRygVxm9SaXGT7L/l0IYm7NEdRXxYTRpBmJhv/5WldKvB3zHOGbsj?=
 =?us-ascii?Q?vaicQAfP+pHVUNrzYIBmxW7lq2AOM2IwqCbU326y0OpbnbsOuojybhR4XWzL?=
 =?us-ascii?Q?p24q25Lyv9GeMCzYEjvMWmmNzkB0APISBh1QykWHVfAPOGHN1y0kXqtVtT67?=
 =?us-ascii?Q?FscXOboYL9DtaDZJ9L5JOCwbkqRW0QGuVOobeJoxnjoZmm5waP1JJLmnTqy+?=
 =?us-ascii?Q?bAu/N8t112bCJX7mRDHwawiSN6ymC6aI0WCDjy1qnq96m4O1Ca8ve/fCqc6T?=
 =?us-ascii?Q?5moc8ebwrKR3/LtJunxfK3bQUiWhiO29Wy+Rq6yxB/iyUkZ2898Y+ChMRmd2?=
 =?us-ascii?Q?rCQOg3+lyyg9XyJGtk8jbhZYVJzxB5gsjou/J8EpebjYMwcjDiRwWxiSP6xD?=
 =?us-ascii?Q?GKSux2gWSbgUOz42umk/75I5WmvxFSN44jyd0yGdnzQtyBjCBKXjdiZ3F9o6?=
 =?us-ascii?Q?bp5PkENjXgQM+RqYQ7eGT+dbGdcxVye4tOGvzNU5Z88VnUp+pd4yNi2b2vVN?=
 =?us-ascii?Q?zsNTaNAKJ9LXpzkL2//lMfmiQqT7TZEZ4ScYD/oBjqjr3Lpdjs9ZNt+iC2Xz?=
 =?us-ascii?Q?TTXrI+KitAQs2HY9ud9CYmXZp8gvi3ImdQOPILvOPUAxTnDOlyFI4ILnN+nb?=
 =?us-ascii?Q?/C8GouImhALz9zJravTzW66lpG8s5lHxSr7gI8BIbyn/Dn2bUalJWA0eE2eN?=
 =?us-ascii?Q?o/N7Q4JFUpGox7UQt/UO7J9/FYXu5JBTIbn1JuG1p532PXJn8epApvI9u3ni?=
 =?us-ascii?Q?vydwVD7JYwWur8vq39pgtv8c0IGNvJbE4awXNRDTuB+iIvkCqORQs22+pjiP?=
 =?us-ascii?Q?bmReaqGojwoRCxbQrwJ8Wp4CbN6wbXI8sBWZMk1ZFiH5dyMJv71VSTSPXTGx?=
 =?us-ascii?Q?8S4h3A+RAXOZsfdl4D7Rqacffqw495XFedQu+29h1Upe7XWvicYpsM4DnP2Z?=
 =?us-ascii?Q?TCOOU+hw1Q+d+N41L9XE1kiolskPot8uQvpNQbK4av76gRv+EZuYQmzc/FV5?=
 =?us-ascii?Q?068zLBVMy81KZlQ8Z6ymXudKnOjHifIelVoePoClRGwK8wkHNpKoLZpQ2xAF?=
 =?us-ascii?Q?AloAFjlnz6vRFwYErse0RVhOJMNWRxnOqvJEM70bWKKVP6OBRhNiVQ3Xxht9?=
 =?us-ascii?Q?p90BXGZ9ocUV5hs35bo1K7d7fUEF0gfpduzU9o2LZcSWiJ0bblVaeNpzuqhs?=
 =?us-ascii?Q?YQq3cIU0+kQDHX6ClJXD6CMTRI1HqYmebNZG7Yg3cGyzqMBj3KcaoPTm02Kp?=
 =?us-ascii?Q?p2BOrlPZf+VE/d67Om9ZcwivjHRXqqw9VSmYK3nTixX/c7erIO9GzYLpoivn?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b672b9-e509-4d24-5dcc-08dd55f3edfb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 23:27:11.6988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnDI/fCQnqcd4JQE25RKfW/sbu+a4eW6OQVDfnuzejDhwOV1ACWGWPSVezrojNna7dCH+B7HCVdxnn5beGHJI4AxSOLcU2pRfyLEutZV5fU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4633
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

On Tue, Feb 25, 2025 at 02:49:09PM -0800, Matt Roper wrote:
>Recent discussions with the hardware architects have revealed that
>the TIMESTAMP_OVERRIDE register is never expected to hold a valid/useful
>value on production hardware.  That register would only get used by
>hardware workarounds (although there are none that use it today) or
>during early internal hardware testing.
>
>Due to lack of documentation it's not clear exactly what the driver
>should be doing if CTC_MODE[0] is set (or even whether that's a setting
>that would ever be encountered on real hardware), but it's definitely
>not what Xe and i915 have been doing.  So drop the incorrect code trying
>to use TIMESTAMP_REGISTER.  If the driver does encounter CTC_MODE[0] in
>the wild, we'll print a warning and just continue trying to use the
>crystal clock frequency since that's probably less incorrect than what
>we're doing today.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
