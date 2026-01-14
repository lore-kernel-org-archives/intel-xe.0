Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41425D37E59
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 16:09:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F215B10E585;
	Wed, 14 Jan 2026 16:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i94TcTHP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D69410E585
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 16:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768406967; x=1799942967;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TmUAuel7hIm+c6u183JQfLrb6Ocl/cC19ANZTLCGPOc=;
 b=i94TcTHPoLRCqLs6XoKbTkQk7jdimrdGiJ7dOIv13RQque7sKm+NHV7H
 7Kzk/V4DXv1cs0SDoRSGUKIbTY07+61GeoUkdcK9S0KQYmUyOabqzrioz
 7vUaDMT+Cq2VRcSKNA3PbMz7XhsI6QPhrDcJs3x3Xg9PzjMyxXdtG+4TJ
 kFnWxEJpbq03SCrVEUow9+GHWd3cIK5PoSiSArr42TOGHBV2G/ttoxCcK
 XWnUquR4uaOqtepyhFhQxbEkTkrnwzesZsEYyd88bM2zWlnXJONV0o9vZ
 AYfaxjVqy4Gj1WLntmnU5lyxOH4YCQmTgmz3oViz7TQdk3RJwYnGaOtOd A==;
X-CSE-ConnectionGUID: sdbddwvZR2+4Eo9kk96tOg==
X-CSE-MsgGUID: dVGLsnv8Q5aFBuBqt4J6uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="81073110"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="81073110"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 08:09:26 -0800
X-CSE-ConnectionGUID: zG2aJ1CuR7+tVRRmkaSWfg==
X-CSE-MsgGUID: gwWQN/0tROSMvYAZEpsifw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="227842057"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 08:09:26 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 08:09:25 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 08:09:25 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 08:09:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHfw8K3q7Aq+H7VRjBZU6kvIVML2N2+aA7umtQkFReTZwI0FSZ0mK4HzxusQ/W9O1k8UqJmdhMZRCuiyioYW/SJjHXpXnPY4JrPbU2j/ty2uZr3wnaZ8QWD8akYIt7er6U61m3aRRUxeBmhtWo7GooDcMVZ09WmOvr/Hrw99aT0uBPMsx9YyFIpdXaol3oquEU/MG9Akmg9g8janAG1TyhK8pR6dc28Z09VIqnkNEJ7/BNH8Mztb4pJlh3d/sDXQ2/QBlMtjbRHiBtjvpv+9BY5gWWoWC8/MzGPppSci7OsRyLO9Hmnqd/oTBbZJXmEcXv/4W8sEgdJBFHfschnVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TX5Eota0nJrBLtGg2yqKkoi3zQlmosf8xKs5Zgx3Hio=;
 b=ai104BXj+ntcU0mDBPLAofrFosrO7cU5kC8XvzKNvL63XViRMpcKBBfM5+9b8gY+Cr4hnwreqtJfqRuINqrA0gHxUMDQ/hmcq1mmevvLpP/IkwopgfhVn5JAuvqsfUj86qu6NJGG7ESYdpA3Tlgqy7iGFbyo1pA69Nnr/F/YpL3r4m1MCpbdMtgqNLuF3zdm0Fhc73sHJT5+zBi4CWdLmoiAWs2yv8BRWqZb0qrzOcwriUWND+xWKnqEAXbHlnW38kXLLCDGxf8UFs8/zE26a0Bk9koXY9xsR2fugSipXMN+qYtxNZW8iSG+fMvoDfriIaE7OWWenEYih7vvcqlyGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA3PR11MB8917.namprd11.prod.outlook.com (2603:10b6:208:57d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 16:09:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 14 Jan 2026
 16:09:23 +0000
Date: Wed, 14 Jan 2026 08:09:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 10/11] drm/xe: Add context-based invalidation to GuC
 TLB invalidation backend
Message-ID: <aWe/sZUWl07L+JSR@lstrano-desk.jf.intel.com>
References: <20260112232730.3347414-1-matthew.brost@intel.com>
 <20260112232730.3347414-11-matthew.brost@intel.com>
 <14464929638a4c6d727af6cda9152720dda7c468.camel@intel.com>
 <aWWhQpD6GysgmJYp@lstrano-desk.jf.intel.com>
 <976ce0e45b400122953ede51994d0d2a32782173.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <976ce0e45b400122953ede51994d0d2a32782173.camel@intel.com>
X-ClientProxiedBy: BYAPR11CA0042.namprd11.prod.outlook.com
 (2603:10b6:a03:80::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA3PR11MB8917:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f679e9-ec65-4697-177e-08de53874892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?MbPXdPxOcMBT4sui2pe0MiRXfgHMmN82leUqg//EobMr5rIDpN4nibcH8M?=
 =?iso-8859-1?Q?H8gu29tu+fSMv2w1ODxcG3C1rZwh0AbMoecnRFveFabg+ACpUno65K/1HW?=
 =?iso-8859-1?Q?jdIlf/+kj5LUdnMK2K2YtJCj9/XPT5smqqenkXV/5dGLnt3UDf/ncrie3o?=
 =?iso-8859-1?Q?dy0ffPWoPa2JFDrJdZ8uzlIaTN1L0YvTnM/VAbcRjT1ZuWjHlAENo5vriM?=
 =?iso-8859-1?Q?ZqGNLCA8oq4f+U0K9NlEKycQI+92EscTvVGxYAgEmKhdJ86uyN4BnmUsGQ?=
 =?iso-8859-1?Q?MEA2fd6K5dskkhSuZDV1nxeEVUaUjzhw5iDQcScNOA1mRGBB0/3YxHofIs?=
 =?iso-8859-1?Q?STLvykifyWKjm3ueN5jqkr4PEkjGW1iyJBidJldb9QuCU2FYS7QZTUCgVX?=
 =?iso-8859-1?Q?W8dZ48x0R8uKcJyFfoOz4PSyqFi5ojoJaxNo9S8zfTy62bWawSjXS+59aR?=
 =?iso-8859-1?Q?PSH73NvufrC47uyKg2CvPTtUmHmp04SCToCjYpYrqOezTzFwtRwhXjXC67?=
 =?iso-8859-1?Q?YOGpShHvHh3/plZS3rIcHYKiUV/LR1/lfXC5ANSPPrasaluog+ReKXfhJ1?=
 =?iso-8859-1?Q?WL4x0cjkMh/aFrNZQDGcewdhbokNerf2uZj0XUvMXnlJ2tKj8I6FikFMkJ?=
 =?iso-8859-1?Q?OJRRATAx1+2uRd/EYCPCzwp8vt+h4uLgXxhTzEZO6CCPrFqImWrWRQgd+c?=
 =?iso-8859-1?Q?Uz9rUzvJz7XRHxmqCgbo+W1IpuK5/mAEKLleqLqTQ0JpN57Z4I99zQQxjR?=
 =?iso-8859-1?Q?eI6hKTyjqOS58qn+dhIVLxf9CTNGLpub6z6Ze5j4BQGFCDvkXg0unC8Jv1?=
 =?iso-8859-1?Q?Ng5eYixHBdN+WYO/JVWQflE0MXJ+u5bKidC1yr6FTnJNSiS4oNosvxv6t5?=
 =?iso-8859-1?Q?0F5864bmmRaQimg06MpOJKCVg477YG0pd00GGd8fd/tU5aIksExFy55dGF?=
 =?iso-8859-1?Q?ijSAT9gufwQ4sa/Hnhqv1zZvZHigxHPFA+fSc2/byxTfgjAn0Mu9DR7zte?=
 =?iso-8859-1?Q?k3AtnHIfb94358IMUV5BCxZ1nnp0OOQKUcGp7m7LpX5W/W3eXoJsMBn/qY?=
 =?iso-8859-1?Q?ifI6U2+c/uF0A/dQlgQdQ0WhOIkrNvLb0GlJDbanOjCf2NAnBw7Pua+0zy?=
 =?iso-8859-1?Q?Zf6cibXftaprpUwfzMJXc6N9q2EXUv1GlLiaHmGa+JGSq7TipFqOJ1UIjJ?=
 =?iso-8859-1?Q?PjUBFq5x7Lu9DVZfPvkPYtyE0/hN1mHQt42ajcNLuEEbaTRTmxeOWNqWNc?=
 =?iso-8859-1?Q?0vgyrTQqaaN5JrMd8doqwWcZ15I9BqU+CM92yda3TIltTP0SdJp3dCk8yH?=
 =?iso-8859-1?Q?GsBMIch/se/uszmfVEuD2updtFTvoi6dhuQrKhtMSYDgzT27B2qVlk7SmZ?=
 =?iso-8859-1?Q?gpSbLRzyfDsxQXapCkGpKNUs6XMz6MefVEgqMWruMzxONpy87jIhApXg/6?=
 =?iso-8859-1?Q?4wjqQGWAWW1eZu7Z00UZfufnnAQdxGdFk2kz8NDZ9VsJFGzjxFZk2PYXaA?=
 =?iso-8859-1?Q?iXzHhWfYEZmo0W8al2sV+m2LjBVm0p9DfyL/5rNlWywUwRLgeF8rGrdpT5?=
 =?iso-8859-1?Q?pIpn7Up+ABAyAwvNOgnUSmqsmsexXVcZR58O4/y3LluVc456nzUB1utMuh?=
 =?iso-8859-1?Q?gzANqFJiOntxU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Y1+GKIvUgSEEKkh4J66D4X3NsPFw0O4Fr1nCUIsb3gUAUYNS/K6dcCBPWe?=
 =?iso-8859-1?Q?FMkacZkJrejyTixrh6meimMi9/+igplZvEg6PX+vJP3XOam3CCWvSmqWT9?=
 =?iso-8859-1?Q?hmQWGpnA18dD/n6fALU4621Xnj2ReyBpD9c9qD//uH4D9TkdfbJuNiZE6A?=
 =?iso-8859-1?Q?xVzmuELNklqmtP3mWuD1jw+Aw/I4vQB6TF9G1Y8GFmhiRNJkWprromDCAB?=
 =?iso-8859-1?Q?4fJK5WOnwv9hTS/snxWy/RmHAEQ02KXIOmdJguQ7tF9CRuoGXWQ3aGKiy/?=
 =?iso-8859-1?Q?BVEqe1dENx6GqLeHNaM+dVvi26suiVfYyG7pqfdxwTnXUN5VrjSk9cQwCJ?=
 =?iso-8859-1?Q?6e8eRSkCcsFxBv54BtWhG5/5jO8l1OthBCcYHeelxUlaxYSyEEXhm0M+HP?=
 =?iso-8859-1?Q?t6GFwEtIfEf/jt60rvQ1DRsKJRWhHICVCvx6MK54rmMl/Tq2RoWJwMMBj1?=
 =?iso-8859-1?Q?OKwc98KRVLsPBvBH9qNPDlEPOEAtMPNv68B7jlnOCXxlAHZ6sdzR+6AYWh?=
 =?iso-8859-1?Q?QdMpDuB6u/dlfy4hvBEvLAoa5vDTQH//t327bnl4+iqwmR2953kN5EGh7D?=
 =?iso-8859-1?Q?6XZ0F85L6A0Yzx6w3xqKp/ufhACHb+9N0cbACw60BiA7Lil9QOg4chgLbk?=
 =?iso-8859-1?Q?zcH7qUUeOTwGzZYPLTqAdOYR8lXFASOz+duH1OpqKjpLnpAUT9lY9gGCPs?=
 =?iso-8859-1?Q?jenxDuP3PRaqdeHf2GBjcJLXnQ1+fuRVFTO5/PL6RdpYAIdVzOqSSennyi?=
 =?iso-8859-1?Q?4wrH3pKBBTUY1oXw0a8ppgoaPAEBwgVYkQCZlRTLXzZLAA07wYdsXVeSoU?=
 =?iso-8859-1?Q?p+ZK6QJE2e261QjF/dc8jlN2aOGT37ezUIFXGXnka2b/sL3z1o2dqQ+IQK?=
 =?iso-8859-1?Q?JY/WnRpS03UAlhhdACWGbNoPyHYvupb6+TWiCHMa8DEZE0p0Y3leY4TBFC?=
 =?iso-8859-1?Q?NXYh4sCNgSP4+aHB7EB2oedi7O0LOu4ZaPuQdVGxX27a32A7y0hEGMyLIu?=
 =?iso-8859-1?Q?bmyVDWm29IeTif99U3h5zCO4aM5MT/Ur47xWBvOAaIET+2OP9D6/g2WW9E?=
 =?iso-8859-1?Q?ak57bRMRwSgLmgVsSOMNf3aghCjgo1DTAksV/mUgcBSMtM8Q2WiHGjAMIt?=
 =?iso-8859-1?Q?0Rxw00QcwoIxeiESc/UlPyfSY2XmmffRPlNVZ0Tp/VrIILVMDJ8wcmA45h?=
 =?iso-8859-1?Q?EuhwQCEN2rOb+qiOEyI/Xx4HPccpnQASTAMIYPVfrb+YQwZvuSGP/eJnRC?=
 =?iso-8859-1?Q?higdfB6Mxsj6+Ju9/ivKMhoTPJ93y761sJCwYXyNxh6L/oyJ6Gxl/5AfWY?=
 =?iso-8859-1?Q?8Jorv/KtcnCQJiTeJVDe/X8CLxclG3X+ov1Cs48wbgo3LnLHG3HjjgPUFq?=
 =?iso-8859-1?Q?EWMJ6EhyKHqrD/eDhpC3oxI7L0yINOfft7AMPtztkiy7MQhd0tkeMfUAYB?=
 =?iso-8859-1?Q?qvGILOay+evvxgSxPchIJNSghtudRt82f7z+PIM0Uzohe4x/9LYL0EaQU/?=
 =?iso-8859-1?Q?n8PIKtnJWcg2gmndvuB/FLGv/U/kSc2jYhvR8TKn1TMCCDDAykGC7ATpXM?=
 =?iso-8859-1?Q?ls760t1u3tGvnSwFEWWLU2sphkEeSNymTLr82vpMAGAjZEVkDCg3T7g0Ea?=
 =?iso-8859-1?Q?5s+UZ90PStLIyU2doOs6G8yxzfL/Kug2EDbj0S5WMy3N+d2GsQrLFY4LA0?=
 =?iso-8859-1?Q?jLXsFc3oUu46Vt5rNlIvVMkxxpaFpMHL74wHXJLbSb+LeHaEiZVe3Lzuvz?=
 =?iso-8859-1?Q?xR42bqlNgLA0EEdVL62F/fueeMn8ov+VSFf5Bw45KsKTseB7qnHVHWHzir?=
 =?iso-8859-1?Q?QM0Xro9wTKZDSJxpOYn8tqjqT+nHogU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f679e9-ec65-4697-177e-08de53874892
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 16:09:23.8200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2jqf16t6etcAzRmn8X3NjLOIVBRl9HE8mmVsv9aFH7iMieZjDQR5ut2UD65L6L4URhKDC6na30jp6k+r763iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8917
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

On Tue, Jan 13, 2026 at 03:36:59PM -0700, Summers, Stuart wrote:
> On Mon, 2026-01-12 at 17:34 -0800, Matthew Brost wrote:
> > On Mon, Jan 12, 2026 at 06:28:01PM -0700, Summers, Stuart wrote:
> > > On Mon, 2026-01-12 at 15:27 -0800, Matthew Brost wrote:
> > > > Introduce context-based invalidation support to the GuC TLB
> > > > invalidation
> > > > backend. This is implemented by iterating over each exec queue
> > > > per GT
> > > > within a VM, skipping inactive queues, and issuing a context-
> > > > based
> > > > (GuC
> > > > ID) H2G TLB invalidation. All H2G messages, except the final one,
> > > > are
> > > > sent with an invalid seqno, which the G2H handler drops to ensure
> > > > the
> > > > TLB invalidation fence is only signaled once all H2G messages are
> > > > completed.
> > > > 
> > > > A watermark mechanism is also added to switch between context-
> > > > based
> > > > TLB
> > > > invalidations and full device-wide invalidations, as the return
> > > > on
> > > > investment for context-based invalidation diminishes when many
> > > > exec
> > > > queues are mapped.
> > > > 
> > > > v2:
> > > >  - Fix checkpatch warnings
> > > > v3:
> > > >  - Rebase on PRL
> > > >  - Use ref counting to avoid racing with deregisters
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_device_types.h  |   2 +
> > > >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c | 145
> > > > +++++++++++++++++++++++++-
> > > >  drivers/gpu/drm/xe/xe_pci.c           |   1 +
> > > >  drivers/gpu/drm/xe/xe_pci_types.h     |   1 +
> > > >  4 files changed, 145 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index 8db870aaa382..b51acff4edcd 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -358,6 +358,8 @@ struct xe_device {
> > > >                 u8 has_pre_prod_wa:1;
> > > >                 /** @info.has_pxp: Device has PXP support */
> > > >                 u8 has_pxp:1;
> > > > +               /** @info.has_ctx_tlb_inval: Has context based
> > > > TLB
> > > > invalidations */
> > > > +               u8 has_ctx_tlb_inval:1;
> > > >                 /** @info.has_range_tlb_inval: Has range based
> > > > TLB
> > > > invalidations */
> > > >                 u8 has_range_tlb_inval:1;
> > > >                 /** @info.has_soc_remapper_sysctrl: Has SoC
> > > > remapper
> > > > system controller */
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > index 070d2e2cb7c9..328eced5f692 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > @@ -6,15 +6,19 @@
> > > >  #include "abi/guc_actions_abi.h"
> > > >  
> > > >  #include "xe_device.h"
> > > > +#include "xe_exec_queue.h"
> > > > +#include "xe_exec_queue_types.h"
> > > >  #include "xe_gt_stats.h"
> > > >  #include "xe_gt_types.h"
> > > >  #include "xe_guc.h"
> > > >  #include "xe_guc_ct.h"
> > > > +#include "xe_guc_exec_queue_types.h"
> > > >  #include "xe_guc_tlb_inval.h"
> > > >  #include "xe_force_wake.h"
> > > >  #include "xe_mmio.h"
> > > >  #include "xe_sa.h"
> > > >  #include "xe_tlb_inval.h"
> > > > +#include "xe_vm.h"
> > > >  
> > > >  #include "regs/xe_guc_regs.h"
> > > >  
> > > > @@ -156,10 +160,16 @@ static int send_tlb_inval_ppgtt(struct
> > > > xe_guc
> > > > *guc, u32 seqno, u64 start,
> > > >  {
> > > >  #define MAX_TLB_INVALIDATION_LEN       7
> > > >         struct xe_gt *gt = guc_to_gt(guc);
> > > > +       struct xe_device *xe = guc_to_xe(guc);
> > > >         u32 action[MAX_TLB_INVALIDATION_LEN];
> > > >         u64 length = end - start;
> > > >         int len = 0, err;
> > > >  
> > > > +       xe_gt_assert(gt, (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE
> > > > &&
> > > > +                         !xe->info.has_ctx_tlb_inval) ||
> > > > +                    (type == XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX
> > > > &&
> > > > +                     xe->info.has_ctx_tlb_inval));
> > > > +
> > > >         action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
> > > >         action[len++] = !prl_sa ? seqno :
> > > > TLB_INVALIDATION_SEQNO_INVALID;
> > > >         if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
> > > > @@ -168,9 +178,11 @@ static int send_tlb_inval_ppgtt(struct
> > > > xe_guc
> > > > *guc, u32 seqno, u64 start,
> > > >         } else {
> > > >                 u64 normalize_len =
> > > > normalize_invalidation_range(gt,
> > > > &start,
> > > >                                                                 
> > > > &end);
> > > > +               bool need_flush = !prl_sa &&
> > > > +                       seqno != TLB_INVALIDATION_SEQNO_INVALID;
> > > >  
> > > >                 /* Flush on NULL case, Media is not required to
> > > > modify flush due to no PPC so NOP */
> > > > -               action[len++] = MAKE_INVAL_OP_FLUSH(type,
> > > > !prl_sa);
> > > > +               action[len++] = MAKE_INVAL_OP_FLUSH(type,
> > > > need_flush);
> > > >                 action[len++] = id;
> > > >                 action[len++] = lower_32_bits(start);
> > > >                 action[len++] = upper_32_bits(start);
> > > > @@ -181,8 +193,10 @@ static int send_tlb_inval_ppgtt(struct
> > > > xe_guc
> > > > *guc, u32 seqno, u64 start,
> > > >  #undef MAX_TLB_INVALIDATION_LEN
> > > >  
> > > >         err = send_tlb_inval(guc, action, len);
> > > > -       if (!err && prl_sa)
> > > > +       if (!err && prl_sa) {
> > > > +               xe_gt_assert(gt, seqno !=
> > > > TLB_INVALIDATION_SEQNO_INVALID);
> > > >                 err = send_page_reclaim(guc, seqno,
> > > > xe_sa_bo_gpu_addr(prl_sa));
> > > > +       }
> > > >         return err;
> > > >  }
> > > >  
> > > > @@ -201,6 +215,114 @@ static int send_tlb_inval_asid_ppgtt(struct
> > > > xe_tlb_inval *tlb_inval, u32 seqno,
> > > >                                    
> > > > XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> > > > prl_sa);
> > > >  }
> > > >  
> > > > +static bool queue_mapped_in_guc(struct xe_guc *guc, struct
> > > > xe_exec_queue *q)
> > > > +{
> > > > +       return q->gt == guc_to_gt(guc);
> > > > +}
> > > > +
> > > > +static int send_tlb_inval_ctx_ppgtt(struct xe_tlb_inval
> > > > *tlb_inval,
> > > > u32 seqno,
> > > > +                                   u64 start, u64 end, u32 asid,
> > > > +                                   struct drm_suballoc *prl_sa)
> > > > +{
> > > > +       struct xe_guc *guc = tlb_inval->private;
> > > > +       struct xe_device *xe = guc_to_xe(guc);
> > > > +       struct xe_exec_queue *q, *next, *last_q = NULL;
> > > > +       struct xe_vm *vm;
> > > > +       LIST_HEAD(tlb_inval_list);
> > > > +       int err = 0;
> > > > +
> > > > +       lockdep_assert_held(&tlb_inval->seqno_lock);
> > > > +
> > > > +       if (xe->info.force_execlist)
> > > > +               return -ECANCELED;
> > > > +
> > > > +       vm = xe_device_asid_to_vm(xe, asid);
> > > > +       if (IS_ERR(vm))
> > > > +               return PTR_ERR(vm);
> > > > +
> > > > +       down_read(&vm->exec_queues.lock);
> > > > +
> > > > +       /*
> > > > +        * XXX: Randomly picking a threshold for now. This will
> > > > need
> > > > to be
> > > > +        * tuned based on expected UMD queue counts and
> > > > performance
> > > > profiling.
> > > > +        */
> > > > +#define EXEC_QUEUE_COUNT_FULL_THRESHOLD        8
> > > > +       if (vm->exec_queues.count[guc_to_gt(guc)->info.id] >=
> > > > +           EXEC_QUEUE_COUNT_FULL_THRESHOLD) {
> > > > +               u32 action[] = {
> > > > +                       XE_GUC_ACTION_TLB_INVALIDATION,
> > > > +                       seqno,
> > > > +                       MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> > > > +               };
> > > > +
> > > > +               err = send_tlb_inval(guc, action,
> > > > ARRAY_SIZE(action));
> > > > +               goto err_unlock;
> > > > +       }
> > > > +#undef EXEC_QUEUE_COUNT_FULL_THRESHOLD
> > > > +
> > > > +       /*
> > > > +        * Move exec queues to a temporary list to issue
> > > > invalidations. The exec
> > > > +        * queue must be mapped in the current GuC, active, and a
> > > > reference must
> > > > +        * be taken to prevent concurrent deregistrations.
> > > > +        */
> > > > +       list_for_each_entry_safe(q, next, &vm->exec_queues.list,
> > > > +                                vm_exec_queue_link)
> > > 
> > > Nitpick: I'd prefer braces around the the if here so we aren't
> > > nesting
> > > the multi-line condition within this list_for_each loop.
> > > 
> > 
> > Sure. CI and local testing is showing this loop explodes too. I'm
> > reasing two GTs are modifying the list at the same time as I'm just
> > using a read lock here. I think vm->exec_queues.list needs to be per
> > GT
> > actually or just use a mutex to protect the list.
> > 
> > > > +               if (queue_mapped_in_guc(guc, q) && q->ops-
> > > > >active(q)
> > > > &&
> > > > +                   xe_exec_queue_get_unless_zero(q)) {
> > > > +                       last_q = q;
> > > > +                       list_move_tail(&q->vm_exec_queue_link,
> > > > &tlb_inval_list);
> > > > +               }
> > > > +
> > > > +       if (!last_q) {
> > > > +               /*
> > > > +                * We can't break fence ordering for TLB
> > > > invalidation
> > > > jobs, if
> > > > +                * TLB invalidations are inflight issue a dummy
> > > > invalidation to
> > > > +                * maintain ordering. Nor can we move safely the
> > > > seqno_recv when
> > > > +                * returning -ECANCELED if TLB invalidations are
> > > > in
> > > > flight. Use
> > > > +                * GGTT invalidation as dummy invalidation given
> > > > ASID
> > > > +                * invalidations are unsupported here.
> > > > +                */
> > > > +               if (xe_tlb_inval_idle(tlb_inval))
> > > > +                       err = -ECANCELED;
> > > > +               else
> > > > +                       err = send_tlb_inval_ggtt(tlb_inval,
> > > > seqno);
> > > 
> > > Can you give a little more context on this line actually? So this
> > > is
> > > going to send down a 0x3 type invalidation to GuC (TLB_INVAL_GUC).
> > > GuC
> > > is still doing an invalidation to hardware when we write this. Is
> > > that
> > > the expectation with this?
> > > 
> > 
> > Yes, I think I explain this in the comment above. We are issuing a
> > dummy
> > invalidation to maintain ordering when required, this would be GuC
> > TLBs.
> > Not ideal but we can't break dma-fencing ordering and this case so be
> > exceedingly rare.
> 
> Yeah the reasoning is clear to me. It just wasn't clear what would
> happen with this GuC invalidation. Looking through the GuC source, I
> see this is sending with Granularity of 0x1. This is "All mappings
> within ASID and VF" according to bspec. We aren't actually passing an
> ASID here and it looks like GuC isn't programming anything into that
> field in the descriptor. So we'd have to get unlucky with a 0 (I
> believe - can't find where they're clearing this at a glance) ASID
> which seems unlikely.
> 
> So from the hardware side, there will be a lookup and failure to find
> the ASID and the transaction should be dropped.
> 
> I think on current hardware this is ok and the invalidation still
> completes at the GuC level (GuC receives the ack from hardware) and we
> shouldn't get an invalidation timeout in the KMD. But there's always a
> chance this could change in the future.
> 
> Can you add a comment here indicating this? Basically something like:
> Expectation is that hardware will drop this request since GuC submits
> an ASID based request without an ASID.

This is a GuC GGTT TLB invalidation - not a full PPGTT or PASID
invalidation. For example when we create or destroy a GGTT mapping, this
is the type of invalidation we issue there.

I picked GuC GGTT invalidation as I figure this was less costly than a
full PPGTT invalidation but that is just a guess. Are ASID based
invalidations available on platforms that want context based
invalidations - my guess is no and maybe even confirmed that at one
point by looking at GuC source.

I already have comment above indicating this is a GGTT based
invalidation.

Matt

> 
> Thanks,
> Stuart
> 
> > 
> > > > +               goto err_unlock;
> > > > +       }
> > > > +
> > > > +       list_for_each_entry_safe(q, next, &tlb_inval_list,
> > > > vm_exec_queue_link) {
> > > > +               struct drm_suballoc *__prl_sa = NULL;
> > > > +               int __seqno = TLB_INVALIDATION_SEQNO_INVALID;
> > > > +               u32 type = XE_GUC_TLB_INVAL_PAGE_SELECTIVE_CTX;
> > > > +
> > > > +               xe_assert(xe, q->vm == vm);
> > > > +
> > > > +               if (err)
> > > > +                       goto unref;
> > > > +
> > > > +               if (last_q == q) {
> > > > +                       __prl_sa = prl_sa;
> > > > +                       __seqno = seqno;
> > > > +               }
> > > > +
> > > > +               err = send_tlb_inval_ppgtt(guc, __seqno, start,
> > > > end,
> > > > +                                          q->guc->id, type,
> > > > __prl_sa);
> > > > +
> > > > +unref:
> > > > +               /*
> > > > +                * Must always return exec queue to original list
> > > > /
> > > > drop
> > > > +                * reference
> > > > +                */
> > > > +               xe_exec_queue_put(q);
> > > > +               list_move_tail(&q->vm_exec_queue_link, &vm-
> > > > > exec_queues.list);
> > > 
> > > Will get back on this one... need to spend a little more time and
> > > do
> > > some testing.
> > > 
> > 
> > I probably should flip the put for clarity but this is in fact safe
> > as
> > queue's memory can't disapear if vm->exec_queues.lock is held.
> > 
> > Matt
> > 
> > > Thanks,
> > > Stuart
> > > 
> > > > +       }
> > > > +
> > > > +err_unlock:
> > > > +       up_read(&vm->exec_queues.lock);
> > > > +       xe_vm_put(vm);
> > > > +
> > > > +       return err;
> > > > +}
> > > > +
> > > >  static bool tlb_inval_initialized(struct xe_tlb_inval
> > > > *tlb_inval)
> > > >  {
> > > >         struct xe_guc *guc = tlb_inval->private;
> > > > @@ -228,7 +350,7 @@ static long tlb_inval_timeout_delay(struct
> > > > xe_tlb_inval *tlb_inval)
> > > >         return hw_tlb_timeout + 2 * delay;
> > > >  }
> > > >  
> > > > -static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
> > > > +static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
> > > >         .all = send_tlb_inval_all,
> > > >         .ggtt = send_tlb_inval_ggtt,
> > > >         .ppgtt = send_tlb_inval_asid_ppgtt,
> > > > @@ -237,6 +359,15 @@ static const struct xe_tlb_inval_ops
> > > > guc_tlb_inval_ops = {
> > > >         .timeout_delay = tlb_inval_timeout_delay,
> > > >  };
> > > >  
> > > > +static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops = {
> > > > +       .ggtt = send_tlb_inval_ggtt,
> > > > +       .all = send_tlb_inval_all,
> > > > +       .ppgtt = send_tlb_inval_ctx_ppgtt,
> > > > +       .initialized = tlb_inval_initialized,
> > > > +       .flush = tlb_inval_flush,
> > > > +       .timeout_delay = tlb_inval_timeout_delay,
> > > > +};
> > > > +
> > > >  /**
> > > >   * xe_guc_tlb_inval_init_early() - Init GuC TLB invalidation
> > > > early
> > > >   * @guc: GuC object
> > > > @@ -248,8 +379,14 @@ static const struct xe_tlb_inval_ops
> > > > guc_tlb_inval_ops = {
> > > >  void xe_guc_tlb_inval_init_early(struct xe_guc *guc,
> > > >                                  struct xe_tlb_inval *tlb_inval)
> > > >  {
> > > > +       struct xe_device *xe = guc_to_xe(guc);
> > > > +
> > > >         tlb_inval->private = guc;
> > > > -       tlb_inval->ops = &guc_tlb_inval_ops;
> > > > +
> > > > +       if (xe->info.has_ctx_tlb_inval)
> > > > +               tlb_inval->ops = &guc_tlb_inval_ctx_ops;
> > > > +       else
> > > > +               tlb_inval->ops = &guc_tlb_inval_asid_ops;
> > > >  }
> > > >  
> > > >  /**
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > > > b/drivers/gpu/drm/xe/xe_pci.c
> > > > index 91e0553a8163..6ea1199f703e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > @@ -889,6 +889,7 @@ static int xe_info_init(struct xe_device *xe,
> > > >                 xe->info.has_device_atomics_on_smem = 1;
> > > >  
> > > >         xe->info.has_range_tlb_inval = graphics_desc-
> > > > > has_range_tlb_inval;
> > > > +       xe->info.has_ctx_tlb_inval = graphics_desc-
> > > > > has_ctx_tlb_inval;
> > > >         xe->info.has_usm = graphics_desc->has_usm;
> > > >         xe->info.has_64bit_timestamp = graphics_desc-
> > > > > has_64bit_timestamp;
> > > >  
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h
> > > > b/drivers/gpu/drm/xe/xe_pci_types.h
> > > > index 5f20f56571d1..000b54cbcd0e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > > > @@ -71,6 +71,7 @@ struct xe_graphics_desc {
> > > >         u8 has_atomic_enable_pte_bit:1;
> > > >         u8 has_indirect_ring_state:1;
> > > >         u8 has_range_tlb_inval:1;
> > > > +       u8 has_ctx_tlb_inval:1;
> > > >         u8 has_usm:1;
> > > >         u8 has_64bit_timestamp:1;
> > > >  };
> > > 
> 
