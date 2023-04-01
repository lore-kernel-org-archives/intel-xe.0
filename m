Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8701C76196
	for <intel-xe@archiver.kernel.org>; Sat,  1 Apr 2023 00:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D71C10E0B8;
	Sat,  1 Apr 2023 00:37:54 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BB910E0B8
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Apr 2023 00:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680309472; x=1711845472;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E9cr85VfNkq36eT18X1ykIKOi9wBUXs+oSQ/3+v+oLU=;
 b=YujWTw9lipt+yC00SXP+QCUJWNpVzOLm6kywJBB77C4iX8i+mNVAPt28
 N3H+MyLh4RiMHEpgQ4rGJO7lkiPeC/MUjdfWqzq76tnvuyo3pWf3H2tyT
 WrO9Cdoqv/DfHXkWWlb9+B5W4BWMAN4IZy6hnUuNX/E7ccAT4CLIDsKHE
 XEpKQMY5to21hCYBGs7KklMSF0SbaQ8LOEvfpyCjSQ/GTY3WHL6Yw99PV
 UFqGwNYp+vlpi+C4URiq+Nr2/qTMXLR6Dj91WC/CH8gq1Afx52OXfBvg8
 jc2aewP4m81QxB+4VHuB9ZbiwTyK9r6/yc+I1yAQKzG8CkMxI0m9cSiy5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="321245028"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="321245028"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 17:37:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="717900801"
X-IronPort-AV: E=Sophos;i="5.98,308,1673942400"; d="scan'208";a="717900801"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 31 Mar 2023 17:37:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 17:37:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 17:37:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 17:37:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebmZebYIYLDiR9N1OS1YMgivmhCcYbynrJI0AKjL2kIG1ChZ0RMhJ2KqUScuXxuZyZFdLlepZj7cXHTgut/kXaWBNupf7Avn9cniD438H0sC6sbXTfGN4+HRdbND94yOm3SfkAF7Xa1VxX4QrIvPa6Ca8Td730ZoUsFNeR5gJYav/HX1yUMURtiks+iY27kJKo/m3QUSqZ3pSagM2Ihk6ZSNAwpYgxogSZF8nkCoLpiF6tioerEB17nwHiy6GqxAHWuEJbfFJc4//lmnSfZGwrc96a8jbd2Hvr/JjXWTWEr6esu6GmZkQoXVUkj0Sq/qcy09USBVCS3RQOSeO4sr+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/AcQmuWXWNI9YG6HFr9jtTEVBnyM2N0EUeO4Is9RiI=;
 b=XjKIrYvUb+7+yTUHMVsb1/To3mWbtzeQxu6BsyRK6vfJY7oheJQSyWJ0YiGFohhRGXILn+QIRnJxvgpnecjGgVbrL2fFii0Q2o/OrvWS4DcIb2DNBoa/Gbxnd2nUAqQYxXMJprZEO7bq9+ciT8L2dlQlpLJiMNEeYPIFYcXs3NL+4gnGU/GZZUGDcLAO1C8QBfpxQ1LqhR5PJUJ0EG2KF4AvKNSUxi2EHuXcuQ4wXfQREs2gPVrFbATPUvFrHNaLybqUO/vNjrb6iGEADA3JE4L9tNwd6g4rpOIXKYLfjUIwI1JWFJGbWmnaHSsjA3CgbivL/MOBHMg7A43jrGFiOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB8174.namprd11.prod.outlook.com (2603:10b6:208:450::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.24; Sat, 1 Apr
 2023 00:37:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Sat, 1 Apr 2023
 00:37:48 +0000
Date: Fri, 31 Mar 2023 17:37:46 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230401003746.w6xawxlfqfh24wnf@ldmartin-desk2.lan>
References: <20230401002106.588656-1-matthew.d.roper@intel.com>
 <20230401002106.588656-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230401002106.588656-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0273.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: d0fe6c2d-04b6-4db7-9cae-08db3249516e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Fyp6qP/TXkhmUu5G33bb2yjFtNR+P9/17eOrHi/akX3YuwZAuUThBwS8+oPqRe65sY8L76YUtMj5Eog407p42bF5ykKAnbX0BEqYfKuRy7JR9Ylq54o09HMCYaMHIEEhKpwmKO/Og2+vGYrV4ZCFbNetXZln6ltFfBazj6obcXBvvDB2GSwSbppbLGV5jHOzBGx9oCf2o7VVcSM4iv7izeJX0P9vNCuCPiezAHi6r7DqwAP8XvF1z4EWah6bR1W0MUAx7u90KM0Mk8RkW/VkFLJ/qlT9jVkLeeXoT5h9ylPemAH8Y1Xt1o4z9rG71GAcw8fuDNZde/e0Cn1+hG2oClE3mRe+GOqOxN37xK0fO7WOsFV/PGtgaeFsR/TOA6i+CE0B2rGGoDFdLkTub+yqsbTWAcVUd7126StPkNI7mymfWuoJGaMebJy0esPE8nGolad5pUUq6sEo4Kdlc0/sU6Xoo8fR5/ofzPjtY8GR7Ktgv3iLNtLxkPsu77knU+1FFdHTMTZrtiOz0Uoax1f2v9YmyYI1EpDvcVEg1TtxWA0Q3PukrY8zGL1b0UNfc547LuMvjcmurHV+zkCmpJnd9OPXeIDPgeLooiqNVglh70=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199021)(4744005)(4326008)(38100700002)(2906002)(478600001)(8676002)(66946007)(6862004)(5660300002)(66476007)(316002)(66556008)(83380400001)(82960400001)(41300700001)(8936002)(6636002)(6486002)(86362001)(9686003)(1076003)(6512007)(26005)(6506007)(186003)(36756003)(37363002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0yZPyw1YrNm0jjL8LTlBIjLcCoK1F6uwOY1yzkgjKYUFytFMf9IihuF5K9Og?=
 =?us-ascii?Q?llbP4ep/o6rOsgvrassqkdR8F80LyDZl1gwd8TQzGq6HM7267OVlAp9urbKS?=
 =?us-ascii?Q?rboOBjMDr3phqr4oOn0usgY/xnGbrC8VbEH+hmZGzOnbdijy2pHwtBCCkhYx?=
 =?us-ascii?Q?FsdZeTSo8wAFjiJ4YaVlDORr2M07PnkGnRke/dbJZ6mxoiJbL/JIO3zzo+6Q?=
 =?us-ascii?Q?D0NtPvPTOsJCAkyesTzpLKJjjqQ253HcQZQuVZ5e8DYkLm0GPdJnmBlSioRM?=
 =?us-ascii?Q?v4K1R2AhGE9vDB9Zt5UVvZGdsf1GlDQiVh0e8TXuvNxUg2U5Y4UgdBRQK8dA?=
 =?us-ascii?Q?33L0N2CmFJ5oHQTON6qXOg1WyCG5d0RZJdYwoHRefILqEIE554/SpIg8ppyy?=
 =?us-ascii?Q?+AP+mQQ6GwuBsZ6Avv7B6AdFPAqe/x1XDXXg+sraWMTenb8fOx+UiQqXSiv1?=
 =?us-ascii?Q?pmY/P22RGjot+518gIwYPFME/ZkHhKwSp6qvOk94mgk3Q0vo55lz/r+lZG0c?=
 =?us-ascii?Q?rd1S8urv8ONYBSTutZbTqzT2DlijGhIBXdTO14ilnhQvg+BeteE6QmKFxfM0?=
 =?us-ascii?Q?qbNMDsx8ycBCoTY+K4ldrPDZGeObpfDwlKwXBiHZg6vOEZGaSeo94hweIM8r?=
 =?us-ascii?Q?TL3hNJZcsHBwlSnxOzsn5GEG5qyXsGYDd8HeTVCg/y2HqQv4JNwX5QAKvNOY?=
 =?us-ascii?Q?UYNXtVeFoWlh/zoWJawhkB3R8m0GTZ83DZr6Gxku/sr8QLcs8hg05RAinnHn?=
 =?us-ascii?Q?2Y24icCtWbZ5obX8YqHjZylF6aeleCsPj9YKlLzAxuxban/P6Wqgdh+l3qlP?=
 =?us-ascii?Q?Yw+toXsKk+xJd4Jit4wLiLETWQ2tzmJVWlYMb+IK4m7MCoaMa8VrYJnYfF+U?=
 =?us-ascii?Q?ak5tsq2BMQx+AhVs4jXpzhnZ0q5T1miXeBD+X6xmTdxBVfMq9P37sv/ZCo6o?=
 =?us-ascii?Q?GZBveU0QO1AIa5XAAXXNlt9hxZ+hacinss16GUsy1JJaMWRCCsT6NEzqKb0B?=
 =?us-ascii?Q?XqrbhJyafgxEHwNjegsaVuf8fA6Fp3+9gP6SmyA/BkgF+260Rh2gHpew01tY?=
 =?us-ascii?Q?jYumgYE00KXalH3WclfLSgbPVrzw+Y+7Ujv8+3kUkBNwDnoJchglFBWErgWX?=
 =?us-ascii?Q?udNGt6bil8vFx0m/UsPX1J9FuDCHNRLo4/EO+ExJ7JasyTLPad2fCZquHm74?=
 =?us-ascii?Q?4fNwaLp7xtHHS87fjdxuRH+RBVQXWGZY/mrJKajlKJYh8nkn2GHEJcBKtdgR?=
 =?us-ascii?Q?u2xBgB4JJxtQltG/7b3LsoP9TzMShDNiLxEx1AjDFSERgq9QCrYUPyHrqaEf?=
 =?us-ascii?Q?zmaAF9Co3RgHMfYNTVNnIXUnmqqai1vVRTxqz+oOdVa3stZRvrYxWXlAkCMs?=
 =?us-ascii?Q?+9sHX5c18lWbiD6owSaKu+h4aA0/XiXu9XQTm2j+IuNtJxNSgoutSsr1N6RM?=
 =?us-ascii?Q?GqZzJlXWb48wenSqYaYl/0KtFjcCvT/kmXP1x3AJiEAcDlGyP8szHhBXrYj3?=
 =?us-ascii?Q?rsO+nHsdRHDHgsYgJDOru52DzWDHEtPTG3cuDBjaNxOEjOemzm+2sKjOCNBe?=
 =?us-ascii?Q?dkY5Hj5KI0SaN9djFwt9FReoaceMbqFl/yj/CDz8jNdfHA/w9jfwLs6ZXxCk?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0fe6c2d-04b6-4db7-9cae-08db3249516e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2023 00:37:48.5913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/im8+GCM67qg6Wvj81aT8LoGqSwo30MOhDDJLEWXs5PP3jkfhxvI98LOy06DVCJh2PPLbMdSkKBEAEIVioCV6IRUmdRCR4XIaGwggvKyY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8174
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/8] drm/xe/irq: Add helpers to find
 ISR/IIR/IMR/IER registers
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

On Fri, Mar 31, 2023 at 05:21:00PM -0700, Matt Roper wrote:
>For cases where IRQ_INIT and IRQ_RESET are used, the relevant interrupt
>registers are always consecutive and ordered ISR, IMR, IIR, IER.  Adding
>helpers to look these up from a base offset will let us eliminate some
>of the CPP pasting and simplify other upcoming patches.
>
>v2:
> - s/_REGS/_OFFSET/ for consistency.  (Lucas)
> - Move IMR/IIR/IER helpers into xe_irq.c; they aren't needed anywhere
>   else.  (Lucas)
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
