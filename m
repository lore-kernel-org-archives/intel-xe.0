Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEBFCCD194
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 17:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E42710E892;
	Wed, 15 Oct 2025 17:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emTHmN88";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0431710E892
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 17:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760548375; x=1792084375;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fXDIn5LJTuTnHKhBMcLjHddQYqpopg1YyZq/hLPWrRU=;
 b=emTHmN88e+0cIx0W8dB6j0Bjoz2jPJPhNUsx12qAEkTs+qdUzdQQioTB
 fGahtPhrpbNHJNlkr6jyK38MxM/hq0EkKVK0Ph8pKPUMMH9QBeHuZKIz1
 2tq49Oz5BfWnRMhxDAqp38h758L+jJ7zqaLbrzybdevLmJtdtY0sxDyC2
 C/lT+cIWeGrSGEC1few6dkdhpFOcPtEhflW6V7LPg1q3KqNOgVcHWejgE
 VacLoiXoTfgHbVDnbT5aASG1B9uHGia+pJXmzS+PErRPRBt6DnfCmNCW6
 4GqQtPF8NCHZeZLt+KOAoAVcyL9lxM0Ci6E9dH2i1JrEJ2R1IGjVoowfG w==;
X-CSE-ConnectionGUID: swzo6xh7TTGgknfIECf8kw==
X-CSE-MsgGUID: s7jz6PRTRiCt8SdpX1F8kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62630965"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="62630965"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 10:12:54 -0700
X-CSE-ConnectionGUID: 1VyHOQLnTimQ8tqojMESpQ==
X-CSE-MsgGUID: q//nKkPrR5qmJjUGgPVlpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="187514107"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 10:12:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 10:12:52 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 10:12:52 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 10:12:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MJc4WF7NKrCi9JynXfUkAySbsnUoVf/LG2u04PDzs+aijcuPtyYI7Aybx9i7VdhfijfmBAYXxlOSP5zp/NkyCitA30/O3MJJ5EiY6B4M/iUg8HB9cwgEgxBikZh296DTLr35YP7iQRj0dQxzOBnlzuNF0Vgq4Sra8JKOSmdkumOWcLzBhRSBQC4DSPaR86CCgN0E5ZHaJjdgkzgM2Y4tZ+UH80bfKV0HP9+2kgU6nGzbpzEXGjQUrtQeP5KeP+uC9TH+1F1wYC+PqjqgCV5QcodUvEUOZII6ETgoEisX2voAe/Xjt5fQ84XcDNQZeWR7pb7n296hO9vw5V+hHAPJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpMy3ghY6IQey5+/PZN4Fpo9D2bXm0G4dp7u0vgH2is=;
 b=i7uba5Tcrb0+Momc3BhxFMjJ4FXUtOJccDJZLTsMiPLFbzhRIOwyRQQUfWDTgLyQca0pNPmIizTbpAQrnYF/8uiMryUhn7/m5nZgiPu2fLj1LsjKFxvl9NVXenkRPVza0YGebMUHrkN5IgZEXU8YMvS4RHOpl+IRctVvv2J5ErYw+/IXs35YnF8p+z/kYOSd/11ypEYVaX1Tntd+LjVqbiZwx1UICIe76wh+RF7AnzqgEm6mI/t8cnwghDI2/vLmTm8Ma8PQ3ruo0BAZFYJqyGrF2W5f+XOzLF49+0NV7u8QpGS8CWK7M8Wq3lLBXfr+PJ89KGWx46ButcFCOG9sdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB7920.namprd11.prod.outlook.com (2603:10b6:208:3fc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 17:12:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 17:12:45 +0000
Date: Wed, 15 Oct 2025 10:12:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, S A Muqthyar Ahmed
 <syed.abdul.muqthyar.ahmed@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 20/23] drm/xe/xe3p_xpc: Add support for compute walker
 for non-MSIx
Message-ID: <20251015171242.GD5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-20-bfb74f038215@intel.com>
 <20251014180705.GY5409@mdroper-desk1.amr.corp.intel.com>
 <ogshbvnk2ynz37otydx6l4e6ul6zc5n3h3rz43ajsrl5uuwqtl@hzul63lasfok>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ogshbvnk2ynz37otydx6l4e6ul6zc5n3h3rz43ajsrl5uuwqtl@hzul63lasfok>
X-ClientProxiedBy: SJ0PR03CA0165.namprd03.prod.outlook.com
 (2603:10b6:a03:338::20) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB7920:EE_
X-MS-Office365-Filtering-Correlation-Id: a5476380-40bb-426e-eff0-08de0c0e0edb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9pDne+X/cBnICfuk440A/TyIM6jxzAWA5lIVFJaMPG9v1f7yFe2vG9G9Gj7O?=
 =?us-ascii?Q?Yf+6AJlRHhlwdkIY1TLVIxLQGJHSNvxb+sgh7f7iW5XbsrIS1/cQqzk+r30R?=
 =?us-ascii?Q?/f+JFHl9QXMQQchttgxMENHqX0viLJY1sjtX1/P4NFiikQuBm5wkyrPcT8Np?=
 =?us-ascii?Q?rGrzOdCOaBFQ3pif80QjLD+inV9XuWqZ7/0I7bYhOz52k3cTm+4Ci4Z0gEDY?=
 =?us-ascii?Q?ox9AGzV7t6X4g4vKlrZWB+zNkNZYkOkIUb0T6+UWfylkY2YACDkMMP51fZ+w?=
 =?us-ascii?Q?Rr4BQKeibbRsfgmSbEUZRm/xVwMBAiMus3gtxxh3VlbmbP+V8qVlKgGsBbzu?=
 =?us-ascii?Q?pKOyyczRXmCqyEbYwfPvgt5r+hr7GZ1EpAySffy9hz1Q/+aG5lmHDbdvihmR?=
 =?us-ascii?Q?T2YpC48/UqIzuI09lZTzELv9PV3iWsi+rHdv0ocueam2mum6YaBpaXSy+v8N?=
 =?us-ascii?Q?EKCjamp/hnn3uJn5TKfsc2Uin5rMHSdN8fmkDrM0pw+haHDK72cS8/QcKRxs?=
 =?us-ascii?Q?z+oLMLxBTN3BUN4Dg5eDNzwJSMmwDE1f47KLhg2V22BN+SqdilxX0fnYmsYE?=
 =?us-ascii?Q?NmvWbSYz8l1O3mDPF/hBvBO3clc25ArL9nwXG+10GkM3XNY7AA4YmE9FdnIg?=
 =?us-ascii?Q?411DWcjxMSoI8jnzudTKGVwRCRGhBvfvCOn9A0Ycn2o65QfVVKbckxA86MQX?=
 =?us-ascii?Q?OERWar3rLNrjB4gBVb4NNWI1QMm4vDIUS/wrbFQjLz7D9+Jt+ZGahhK5KJov?=
 =?us-ascii?Q?6aOexCJ9CFizNMK3n6QMGF9n8+WKeCctVBNgXBgSv5aeTfzNcFaqhvyzPaLh?=
 =?us-ascii?Q?goXT3z9QMSD+dDdX0l0Jpv8OHL2MZ8xV8BjmuXWceH9tmeqOkxT6ReAy49Kg?=
 =?us-ascii?Q?IieMW7fIUf9CZiq7t1XUTJ3ocJDIbt64HDs4+V2p8ux0C9txmynOLmTrVnfO?=
 =?us-ascii?Q?Lq26eDpZ9u3YjBDNnauyhZ4zHrZ92y6qv28eDyRJqREeO6us+y+xgm9fD2Lh?=
 =?us-ascii?Q?SQnExM5Nj7AGYSy59nJwBqdYZiFSKAcngTzL4TREEI7U4osUIUlO9MN/qkEX?=
 =?us-ascii?Q?JmX6W/xJFyykaAUyAOjxWnCJicCg8P45PrCwS57668X6UzBIa8qY9g4pPfxv?=
 =?us-ascii?Q?OJLD1DkbhN1c2otufTZQeVVl4G9SjB76ezoPvtqI/CnqXjXNug4CVz1iIN9+?=
 =?us-ascii?Q?CwuBdAP0u6luf/shKkTGYai32TekUEHhNsmioBFP/dBx2ytKHQDS8vLclyJ8?=
 =?us-ascii?Q?wEzBJ1Ga8/69w346gUisz3ax9cx7q0pSPaDJtp8WxWgGAbOGL1caJcsVu+vh?=
 =?us-ascii?Q?4v5n3ZXUdSRzqC72HOgi97KNfKvfqtcwoqSTexpUg5CMzYoYSHkVwnbVST3L?=
 =?us-ascii?Q?a2lo8XwXw2HXpJFJEs82k5JrIhNXQ7aM3Pa6FR6rWArwHUsJ6Ji7e+g16s/M?=
 =?us-ascii?Q?RwRdRtqPa3Ct51oV8wwuM6sra/BCrukj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rvIYKMdjlnDgA6VmAishj1FjB9Plby9BGlAUhEz/zxdNFJB9uRVNYolH0VtC?=
 =?us-ascii?Q?2vTZ1Ffw6TWnzJJU/iG0/jvZwIvt2J4zSiqkK1djt/vM9b3tOWThOTDp9yAG?=
 =?us-ascii?Q?W1yDKDMLBDqRC5hvaAqh47HJgHq08HzITmVWRilCsfHmUc7LHSegAPS0V6W9?=
 =?us-ascii?Q?VC+wNrLzIQ1Gv0BxBfUYnsT7JIUZZcyegtwHRJ1elPW5Rk/0L1JJIL38iybl?=
 =?us-ascii?Q?j0fKy2qnbs45KJrHw0zsJCrtVQrrp1Mjk4i/SxSnBzN9K3zgcFyeR9dCDPG6?=
 =?us-ascii?Q?2UB2Vs367gzhOL6SgC/v1tIdKo2W8t/QRKCaVoynTW0jquKkHZ+bNIHAMst7?=
 =?us-ascii?Q?tI/Oz4esXn4O+UALfkHkvBYdVrrGelABZ0Yiw4NCUpF1hdCSghTre38aFBfH?=
 =?us-ascii?Q?zDFTPHpWMeXldUBbL45Dl6T1gpXeP2czf6T6Voe0n7OyT6cGIJezJ2EamO8s?=
 =?us-ascii?Q?tQ3jzRMskwUL2Wa9SB6I6mLNpOafAsBZBFkreW5hAfpR0e5zVxQk8VOMPRee?=
 =?us-ascii?Q?ybktgeYkzNKmgYNbkE7VKwa8B1eT8iHZSTbEn5zv2DOspH9fFf+VRdHmxXVV?=
 =?us-ascii?Q?9L3VSzwGpaCHH54wtHlkScTUZDhRbeAvIof9Lp8IObPOzuYSJX9L8rykarSc?=
 =?us-ascii?Q?M8erZ2PEHQT82uRCH70E+DDhWZgKW0W7WWGPqECB9R78gFV+i6eJ9D3aG/TJ?=
 =?us-ascii?Q?bpsxr+Rjnz3pnV42RgBu6Y59lrsRinwEyHmxnkKs/EtyS/xEYUxtkzkOh6dd?=
 =?us-ascii?Q?Iqrx4g3NfwwrM0Ld4SjRCflHj8aRlF3xkeHTnVcAMMycK/vYdO5pbfNFimha?=
 =?us-ascii?Q?JJGVVs4/t2v/TUL0Qj3NScvnqaZ4PoAMN5pFk1WzZ6H3F36IPcYNlifyTEI5?=
 =?us-ascii?Q?NA0VL5OW4XZSPobG55q4k2JpBDmlgNzEOAQOEJ2RG50HJrulNa+ZN9fTUW1A?=
 =?us-ascii?Q?UUnC6NG1I0dw4i6CTz62a4RycWigt8L384GZhMcaVwwQpsRyiTwlv3lWee1Y?=
 =?us-ascii?Q?Obl+U6Jg8UYiYrVoM3T7+9e0uOZSvYyV71heW/MiW9+eOsnjfSonuc4a44Oz?=
 =?us-ascii?Q?idgivNN+79PurejMue/xHfeo6YOgvsnuIHmm5f+dKglnZl/bBndGGLK0Z0Gf?=
 =?us-ascii?Q?SFhV7JFNeAeRRvfp/+dRRTJESxzy4R/FWzMXogkH5Z+x60u2ukPTOmXM+R7k?=
 =?us-ascii?Q?KPWrZOYk2aNK7kCs9yRA+xw7ebb65ycB0cERNcj3kgi05UzAbb8XCVVrSFRA?=
 =?us-ascii?Q?dSJKYQWiBTAbNkDAIIsD/1yLmkX3TVAw9TPN7HlWFkABkjRi1gISe6n5BcMh?=
 =?us-ascii?Q?lmwWutkghxxkxcoLN713BKluWAYmgdPblLXjPQTH+br4XVit+Q6lQvz7HiB4?=
 =?us-ascii?Q?qnv+jA6nPQtPr5s1B6serukyC9ib08HM9UX5xh6hChMaRHVqu9u2feqBz8PM?=
 =?us-ascii?Q?7nP1AnpDXpEcLk0Z7jlBY8EDHYCT3UkqTzK0Htcawtj6SiDgNnW+TrUWMZfS?=
 =?us-ascii?Q?JTmO7y+DXrc7/NUybC5mqMfIQ9SB45TzOqBBKytDhkmczAePXrEjVlQ8gi3q?=
 =?us-ascii?Q?b5YLka4+MHrbYxWrkfhVh13mf3sEnt5v9zAt67gKVtAPXUVpfYJY7tZ5YyAG?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5476380-40bb-426e-eff0-08de0c0e0edb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 17:12:45.2934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeejffOzBUUYEjjy8s7LnQ/GQLzvMufRdP3aNbxf4bcIBpuMweyhCA1JLEx4A1vHnMhwkWUC0mS8x631IPmaXiaTuXc2OhYPXFsg/B1r47I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7920
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

On Wed, Oct 15, 2025 at 12:07:47PM -0500, Lucas De Marchi wrote:
> On Tue, Oct 14, 2025 at 11:07:05AM -0700, Matt Roper wrote:
> > On Mon, Oct 13, 2025 at 08:24:52PM -0700, Lucas De Marchi wrote:
> > > From: S A Muqthyar Ahmed <syed.abdul.muqthyar.ahmed@intel.com>
> > > 
> > > Current implementation of compute walker has dependency on GPU/SW Stack
> > > which requires SW/UMD to wait for event from KMD to indicate
> > > PIPE_CONTROL interrup was done. This created latency on SW stack.
> > > 
> > > This feature adds support to generate completion interrupt from GPGPU
> > > walker which does not support MSIx and avoid software using Pipe control
> > > drain/idle latency.
> > > 
> > > Suggested-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Signed-off-by: S A Muqthyar Ahmed <syed.abdul.muqthyar.ahmed@intel.com>
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_irq_regs.h | 1 +
> > >  drivers/gpu/drm/xe/xe_irq.c           | 4 ++++
> > >  2 files changed, 5 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> > > index 7c2a3a1401424..9c46b5fb81412 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
> > > @@ -82,6 +82,7 @@
> > >  #define   GSC_ER_COMPLETE			REG_BIT(5)
> > >  #define   GT_RENDER_PIPECTL_NOTIFY_INTERRUPT	REG_BIT(4)
> > >  #define   GT_CS_MASTER_ERROR_INTERRUPT		REG_BIT(3)
> > > +#define   GT_COMPUTE_WALKER_INTERRUPT		REG_BIT(2)
> > >  #define   GT_RENDER_USER_INTERRUPT		REG_BIT(0)
> > > 
> > >  /* irqs for OTHER_KCR_INSTANCE */
> > > diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> > > index af519414a4297..e01b158895342 100644
> > > --- a/drivers/gpu/drm/xe/xe_irq.c
> > > +++ b/drivers/gpu/drm/xe/xe_irq.c
> > > @@ -150,6 +150,10 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
> > >  	if (xe_device_uc_enabled(xe)) {
> > >  		irqs = GT_RENDER_USER_INTERRUPT |
> > >  			GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
> > > +
> > > +		/* Enable Compute Walker Interrupt for non-MSIX platforms */
> > > +		if (GRAPHICS_VERx100(xe) >= 3511 && !xe_device_has_msix(xe))
> > > +			irqs |= GT_COMPUTE_WALKER_INTERRUPT;
> > 
> > This bit only exists in the compute engine interrupt vector (bspec
> > 62346) and render engine interrupt vector (bspec 62353).  It does not
> > exist in the blitter (62345), vcs (62354), vecs (62355), or gsc (63341),
> > which makes sense because none of those engines can run compute walkers.
> > Should we be making sure we only try to unmask and enable this interrupt
> > on supported engine types?
> 
> right... but then we also have similar issues about being lazy with
> other bits as well. Checking the other interrupt vector structures, bit
> 2 is not defined for them.
> 
> I'm leaning towards we are being lazy in the programming here and this
> is not currently a problem. Then we can refactor this on top to stop
> being lazy and make the intention of the code clearer (e.g. I don't
> really like that use of smask/dmask because engines are bundled together
> in a single register).

My main worry here is that since different engines do explicitly have
different interrupt vectors, there's more potential for a future
platform to use this "unused" bit for a completely different type of
interrupt on blitter, media, etc.  That would be easy for us to overlook
during early platform bringup.

It's less likely that the enable/mask bits for an engine (for example,
BCS6) would get repurposed on a platform that doesn't have that engine,
because the engine still has reserved register ranges and such in the
architecture, even for individual platforms that don't use it.


Matt

> 
> Lucas De Marchi
> 
> > 
> > 
> > Matt
> > 
> > >  	} else {
> > >  		irqs = GT_RENDER_USER_INTERRUPT |
> > >  		       GT_CS_MASTER_ERROR_INTERRUPT |
> > > 
> > > --
> > > 2.51.0
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
