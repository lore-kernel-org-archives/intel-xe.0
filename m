Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47DFEC5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 14:21:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD5311202A;
	Mon, 11 Mar 2024 14:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXxnDpTP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0FA010F50D
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 14:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710166879; x=1741702879;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oJ92kqkJxFIC96MTzFuiPuyi2WBAmi3rRyEKL4aw/0I=;
 b=DXxnDpTPHa6XNUEUyzBRJlSagYzKr9ZsDS7D+2b8yu1lWnzrsl0Zm3M7
 T0W52qW116xYZq5R774EozGJ63KexZC+gX6ApHdDo2gTlYRBPP8JHcQDx
 tCu9s9d0LuEIQj9ni6EuVTekcMYA4p/9f5ouSH36tNEsLB38x5hsTWYnV
 afBBR4xsI80DdpHbPNpcPK88ZKF+ElQ9O4qUVX+0OeXKDCQ9nBLvKbCsa
 F0tIjtpoZOX0PGfmiEFAWa22yObwJdJo3Mac4xOh9T/Sb+WatxR4toqqg
 MxA1wP2PMNWcM2FIfnI8NcchBGkU+FiYnaVNJ1oMqEIcHCq0R0O8f+OX/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="5009174"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="5009174"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 07:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="11097072"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 07:21:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 07:21:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 07:21:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 07:21:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 07:21:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGx98+lvkNFto32j94dCjjofbOqsGEFbcCzfR9qYHmQe7guBIaDPI9ficTy5FegJV7gCw8LZVv6TLVoCq40sdhIwD+3uFnDvR/rcAtP0XcgfbZuQyJE9JsYqunjACp2pVESioqWb2BqwJv1sTuOkwInH+SP9ze52j1kPR9rG+LwDYYblY0YNjX+KMG+viAh07DMrXPy3fJ4pmoFH3IgIIIu+/T9o9Wr/XLGyUBKelQ567zL1cI5S9bwjAuoeD/POC/+cxRwe0FEUwfzxGmF4rm6l70LFcd2R2LQkg31TgHHbzBbz2AJUF0GkgpaJhWrr7Ku0XdnUDc9mFGwyyx0qvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJ92kqkJxFIC96MTzFuiPuyi2WBAmi3rRyEKL4aw/0I=;
 b=L2O4W9eUENe/QP2RYfLIndT0oGUgW6wrFusltCAdKbzt8SkewqwCRf3133zo/gQnAZMJoTdBS3wKKCpLP8sooyWb48Sj39uwm9tvUnqEv+LvE+FppTpc3FSjATGz6khAbsN40TznpLOgY5V0u+6Ek9fgTqZZyzzvBOGl8Ul4UajvgvXQwGRCHUgxS7/6xGb45rweI6tLE6NioKbkU8OxUZocU5d0iNC7bvEjJ4Lk3xv1uirmt5xIzDkrXopCq8kTFKbq+mztzywjFfASdY5lMI72lzgjprz/+T4EtfU6+uJp6k0ID+WSBMZSokDLblAghF1ts+dE7689drmCtrZhbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7679.namprd11.prod.outlook.com (2603:10b6:208:3f1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Mon, 11 Mar
 2024 14:21:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 14:21:14 +0000
Date: Mon, 11 Mar 2024 09:21:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/vf: Remove lmtt->ops null check in
 xe_lmtt_estimate_pt_size
Message-ID: <ffndludmkzu6cl4ievwdhlkzmn3rskirzecwh6bgyxsd4nwxrs@3fz44fq6rwkv>
References: <20240308043651.2010165-1-himal.prasad.ghimiray@intel.com>
 <20240308043651.2010165-3-himal.prasad.ghimiray@intel.com>
 <ZesmInDmDsLY1uPh@intel.com>
 <ad13f0ba-4dbb-4f37-8a1d-879b2cb111cd@intel.com>
 <cdaaae9e-ce38-410c-97dd-b522c645bbca@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <cdaaae9e-ce38-410c-97dd-b522c645bbca@intel.com>
X-ClientProxiedBy: SJ0PR03CA0341.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ada5e07-17b7-42d8-e9ce-08dc41d681fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XrTAf0id9txKPh5ntNtYFs50FFym8+XYoTPdOQl57/QSQh7o3O7clyGzrfqzPKfoOy5FrLO095Rao2BRz99mASWehffN2TyqcudghZrgCa+WuWAK3NG5gm3+Qc4EGjk0uZ5QkTfKaDlKHErKvJ5uBF6sMHVdED2WtAkgp4ggklhGFStxpn6y0lGXvYE340N4bPOB+woRHb5CvINSD7U5dRHbhrdT5UwaGUmKEO53CslE4veKsnQGD8m7QOvSdaZKM3BWBRFVLWOMUmLaNDFS9QJ4eRY9MOylZIkjH1iQNqKZIHotXuk/gs4GdkJHOFap+UMR8Z88SwPCrHssxqxc3ZCZUwyVHiE5irLI/AJlf2e3f2DJHxyPYThtbcy3QwKCmcOBLujkYrb8qKieUVTPOU87ClW1JQWdZz8vQxlU4qWHjPh3NCMiCcURJHE8G3+HHnAWvb/xXsPdeUJ+9euP6P2+ShbGIcmU+6H4tD8ioVY/tof7eIRtq5aCtS+07GhnqVaWDeESh1B+erzPdujPa3J2u8/yZioO6UG88SyyJhEcwUlMEtUlpv26kLiaafISysihjU6tIxvH/mrZoqweejQw/LB2sSBTkbpGW11W2+thKV+F4TyNiWnFPg2/ehSqwuTGTBKMaGnvORXaI7Z2+WOipIN8/mS5F7V6o2EdRH0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WVi93Uw1aCQgTQnKOqQSqUKvmbBmIID4iiZs9dPIhIkOe5vcSwJkkpBGst+s?=
 =?us-ascii?Q?5bxkia/4ulbN8E+MtJkotZUGal/fxQR4VBFhaPYcYD11u7s1R3bGf/XQnGaP?=
 =?us-ascii?Q?iV9Nue8vZ/6+5Kta7VKB3piNvGudAekJVZePRwN9YY0s1ecTDTzwaD+1vQpy?=
 =?us-ascii?Q?e4UMOIGyINWJNaIUMmw3jQ4q6cXZ7sqCXgkmZCwmhPWJuOTGVLlA7WmMP9LS?=
 =?us-ascii?Q?YdBltkI18U7b2AsPGPKQJ3a1SwRHuvD5lJafaAyOj+WxqpqjnlCeuCP0iYsM?=
 =?us-ascii?Q?5QahoysuqMzX++MWb0R++Asjfpol45AEXgRqquJnN6N2wl1GBPIP8tQJgNy9?=
 =?us-ascii?Q?74WXj/zgq7NAAty0zPRu1MBjHVq2Alh/n0ZkIc3G03CA1BvQXTvXafcsgSqp?=
 =?us-ascii?Q?rsVDjPe3j+T6qsTvljWOfNGI4ZHI6hqtVftd8x8j19iV2TXvWDO6oQlGtyS2?=
 =?us-ascii?Q?5RM4p2aUu9d+Jg9SM91SmO6suweRyNOJCpTA+NugfT4UOc1PdiqvpY1taEjD?=
 =?us-ascii?Q?c+9ljUsd8xRL0C2gtYOhUa870o0mkPvDg8CXAjsnPPyBEbavsgSqmk0iw3n3?=
 =?us-ascii?Q?MLaqayg0AeEg7Dcke+h8tPbRc7R3sdIfPixz5C2MVO4SoJIdPMAYMqPrl9Lt?=
 =?us-ascii?Q?mJjBDQ6psWCdVm4cs+h4U4zhAJSv8NohhGryYniIxurBLExDYEV5JWqIPBbb?=
 =?us-ascii?Q?a+zF6LQ5tiPNM9Mjtt3uG6opy6wzFa18CKp75rZ3fIJfKKmzHuJpGgzFOT7T?=
 =?us-ascii?Q?uiAJJUyo6iB5pVhV+qlguR7EEAyknXYfqjmYboayx+rqah8RV/k7FxMvjDZK?=
 =?us-ascii?Q?dOvVnnGZpBThiip1Aushi4o9rkxZboAn/YYXcF5RMdeTq8fgXVDIqDPQr9tw?=
 =?us-ascii?Q?AnfCLR/nywOoNLZPdl5SYqjkFaGfm8+zTDdqYFTE1m9dNfiTiUnpDowOP1io?=
 =?us-ascii?Q?tGSm13oboEzc18Et9Ieac/MPKZji5bfj+VVyHD9Fn6PTD2mH3FtrfZFj7LIL?=
 =?us-ascii?Q?r7q0vcs7H8rJ7R1vPV27JWM5bA+jVTbjiPsCrYQz8yg8Z/UGfvD8nN5oTDG7?=
 =?us-ascii?Q?edYkO0XIzhgkRLblEDmXu7ToWPKo1nuIo9kdP7r/PGOweqJASJUvH9Dd9A2D?=
 =?us-ascii?Q?cMkW/Ab8JOCBR6N1hdvtihTA8FamtB6XJ7deNo4K5y/6NO66sA9TuvvvBk7m?=
 =?us-ascii?Q?v8BJ+/IVuxhnlIcCotcNP+od3DHF/5M77j5v3g5E1V0V9ou75Xq8vBW8W1sY?=
 =?us-ascii?Q?Bn71TLMsAFr9enAh3/xBNFIDOzIt1lG5owbBg0Jd/u9RNv6sirsXq+mN/v9M?=
 =?us-ascii?Q?5Gqh7L4g5AfmJU2f1EADEF5KZFFy7a0fgQt1RukzVk2VFtlXdZamSBVOBPmw?=
 =?us-ascii?Q?HV1NREJrWDZIHYJdasjZH/uDkNKnkj8361IGEGLV5p5XyOMu2XxVCyFLQtCK?=
 =?us-ascii?Q?EeviDQiDIvmBRhqAVU/guuLS1iY4LAt/CgPMn5dQcgPlUEn3bFKVU7egYze0?=
 =?us-ascii?Q?nFYURiGGiyeWbaaOB3t9JfUBJ3lY+GFEMalYVfj50sMqAt63nX4oTOh7Z6sw?=
 =?us-ascii?Q?yoMWPP0l3xMNpJ/FyLtiCLCkw2VGKXWvT/Mjz9KI3BW5GMhJPvkXt0GwxRS4?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ada5e07-17b7-42d8-e9ce-08dc41d681fb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 14:21:14.0611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1nAEXSSMoweKtVogGw0b3uoaVqvKqynu5MnUt9ug7CK3BHDQ3Bdio5y5SF9frLPJyBWwmGyEjGr+McjAcN2oR2635IOpoL/AbjxctGzjjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7679
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

On Mon, Mar 11, 2024 at 02:13:31PM +0100, Michal Wajdeczko wrote:
>>> and/or mark the tool as a false positive?!
>
>I would make another step and just fix the tool to be run against the
>production code, without xe_assert() being enabled, as all our
>xe_asserts() are to some extend "redundant" with the production code,
>and the tool will complain not only against extra/missed NULL checks but
>also against other conditions that will look like 'not-possible' at
>given code snapshot, but the purpose of xe_asserts is to protect
>ourselves against future code updates/changes that current code might
>not be prepared to or it has different assumptions.

and at the same time, we shouldn't rely on having xe_assert() in place
to have the right behavior as it won't always be there. So yes, please
use the config that has xe_assert as a nop.

Lucas De Marchi
