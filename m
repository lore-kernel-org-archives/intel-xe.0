Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C6AC3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 20:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1753A10E0BD;
	Mon, 19 Aug 2024 20:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QLQZkCqO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592F210E0BD
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 20:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724100464; x=1755636464;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y9UDD2k/WCj03R8u5cYJFgfa+QEMqvJQ7p+I/1WoRDo=;
 b=QLQZkCqOZ1a9NnbGRnqtUJdfB8h68asASekB0M3t72EQ6X4+ZKLCYi0L
 3QF6bnvSTF+mw0fgR/F0Ivq5LmTNTvPDzkFxbqA0PkAh+hgfb332d59Oq
 8IibINSJreveD+KNY4xBFPMqMctghygg3noXCFxU4Mq5ShR1Va8A6cHrW
 wV36wUN/AESlE2ThYwHQFZzStdTUy5N7SDSptvFMHEkLn4sb8Mng2rank
 q8pjCiwUsiOWd56PKs0QX3VxyX9FtQc7oul8WlGvRijrDD6eUtAnLfRH7
 ztD4YTnNHjCqVcWHzOBLly3Q43yuAzBuNl/b5ZnuHraRLxfQd/uNoCXpD w==;
X-CSE-ConnectionGUID: UxqivOtDRFiSsMsh6cXcOA==
X-CSE-MsgGUID: LPeK/Vo6QTudUqR+l8LdJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="21913483"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="21913483"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 13:47:42 -0700
X-CSE-ConnectionGUID: E60sawg5Qh6x6+bAuSV+Fw==
X-CSE-MsgGUID: Z2q11v44RZi0dVC7KSJSrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="65176943"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 13:47:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 13:47:41 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 13:47:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 13:47:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 13:47:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kR7z+Gn/JJ0Bt6bI8770EwEMRaEbLnEjZNdU/0Y24lwvAO7hk/cwLgd3nU0l66P13v/2EUa+I+PNMWuJEMIeOZpenVC9Mdevh3fNUUS/YRrbipH0HuKaG1X4Hv8Sh7BxjJklKv1gdQS2BdJxjHo2TRKIpqUV+0LAzHMymSKivuWrzYrwn8jabVIPe3kNaLcmpSRCf2YsSMXFGmDU7/ETdkDd5a9PgwAs/v7LBQIMSTXcL8/tfob5XU1dxxZfxs4ropxrKtfHDgGzYgGj81d+o2AumsY9+3PmtPK6SqkAtdP2+sAzrbbPM4W6In8WbOJh4YZMYxLD8YejRAndkObNTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9UDD2k/WCj03R8u5cYJFgfa+QEMqvJQ7p+I/1WoRDo=;
 b=XtZSOQPUUepL+LzoLONNsidhfWsOw+v+evmKKaU1d7i9xoRIt9VJvv0LxU3veEjlc4Mc28DEGYFazaBY6lztt3ETXWE7vMeacJ0wXe5l4IE+zKHr4OHj2R7mfjjf+NUzPcujf9yA5U0k3oeEiPRGH/yotx01zYHDSZz5D3SU94MydT33I13H0SGfIs4NkUeQTJnHmWTenbEwmTcgbnZoF1cVKituEbtbDkYdkmcQsgkM8R9D0xkqkHK3y2iVWAxh3eQ7y/A+BvJDQ8WIk6d870GndXrf59xG/Fm3E5rpu1EZ8MoywgNLSxW/vcAksMQuHPpiHg2TPvDeXAovv6BSog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Mon, 19 Aug 2024 20:47:33 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 20:47:33 +0000
Date: Mon, 19 Aug 2024 15:47:31 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 01/12] drm/xe/pf: Add function to sanitize VF resources
Message-ID: <4simowxl6oki4wr6aefawflhy4giewp3lx2kzaqo7dagjr6ud4@v3svwun32twc>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240809165159.662-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR04CA0387.namprd04.prod.outlook.com
 (2603:10b6:303:81::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: 9730ce0a-4da6-46be-9655-08dcc090267d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lerkJuJ1jD6Zz5tJSVQxJs+jJZVFP9FTX10E2zlbRuq1/202k+K/XzNIiak2?=
 =?us-ascii?Q?3TIExoOJsVMn5n+qiIFdKP6MJ6FmcYFCAW2Jzj3NbQK8StU6AQLxQpIaNoZT?=
 =?us-ascii?Q?U/wqO8xc6aFbnYy2UKBJlsJfojFQcUSBV+xOhVQKbFLKe8BwrXhEH6Pw2X6M?=
 =?us-ascii?Q?bEKarYsTtaCz/89gQv5OG9FkiSLuui5afcrA7Jr7zPtnTNdgfmXh0UVgin9a?=
 =?us-ascii?Q?hY6Bym0Hl5BlrpVEU1DN4YQ46iyqf1JpYEknxDSoRekaT7UPxZ4Y0K7If3IZ?=
 =?us-ascii?Q?NFvnXHZUF0jy0gvxXHWmjWduRY5t75rgJr3QOt3zlONiE5O4PNrQJ3UzxaDO?=
 =?us-ascii?Q?T+nNePGH1vL8V/mgGwcvgZqo7xYYP38WameJX+Hq9LzlsZdUjYvaZU5d5jCK?=
 =?us-ascii?Q?adPq/HhI+Fy+oaYPJFGb2IIql2uIZixEgRAdoLU/JsRgRhT8seMCDGff+bZQ?=
 =?us-ascii?Q?Rpg59y+X2YFXuLutu0MNCd6cGweHOogCiQXPrKdavWL3c3Dl6NIIW9NMZUru?=
 =?us-ascii?Q?88iXBvsF5KhTEmfettUFgW0spJJybTg7VaXC9mdL40/h+IYT17ssnIkT/pHF?=
 =?us-ascii?Q?mxxdBQhLrwt/OKVUltxa21jSbj5BAUFQVVg4pyrtI2TYkCsm6c2RsrTFXRh3?=
 =?us-ascii?Q?ek/KB38SwfD3xYxJBX4tQetfUIiztUVYdNG4zOdhMkbX3W/6fdUaIsB+M8PX?=
 =?us-ascii?Q?G5D0jxr4xSdOwQPotTf+8QfaqkNRtXxiCwPaYC5lnwEZYQxk/HmnRyoDWhdM?=
 =?us-ascii?Q?npfI30CpuCcR17mtH+MjHib5gXUae8asQbLOn2TNUL6rXhkOvODiH3WF3p+4?=
 =?us-ascii?Q?FadeSjO9imP3K9UB9xF8b9I1r4KM2Lfe9MpQbp+IoeEkMNeqM2SRUTGRashb?=
 =?us-ascii?Q?+cbm9KNHggWYKJ+y8KoJlmfMZpj2EuFG9XpYICBSl/JWy2I8XHSQVVsAAPsM?=
 =?us-ascii?Q?Y9btjm1Uam0is3aaZKMH2c3LFRHBj9JuNTTsaJr2Mp0AUBnKgf+764sIMa9l?=
 =?us-ascii?Q?5dnVWYZsvTzQa5P3JMRLb+JeNtC8NIvOn5ri3BeN2lUBXIX6NEyUPfdIO/Vt?=
 =?us-ascii?Q?p0MdkS62mOhoZfXPh/w+EgwRfj/NQAKKvVfvXbpw5rCUrxhD1yeewYDhrW55?=
 =?us-ascii?Q?qfdON31yQTWiRFo+xrlRNCrTsehEtdwVn7Ud90m+c7177WqjI+IurrmEkSrG?=
 =?us-ascii?Q?kmBAbItoQmo0QthzNRGTtoN0Y0bj5nOlomTU0OaJxmNIx/nM+Onclgh/8nt2?=
 =?us-ascii?Q?vkxACvHllInkHZVBg+1f2K/dD1n6UnMYdV9MRJ2sneVrPVkmfYu4KHIy1uWq?=
 =?us-ascii?Q?pBYY7N6opDO6NgzKshykddFHjMup0ryiC/dX6NIcqCTr8w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d1BChHwSv4C7GqE1c576U9mfz132BS4Q0hQgcwxTpDXYj5llb2mvsM8TM3Yp?=
 =?us-ascii?Q?eDqlG3dz96kkHXd0MS96PP5PusctvfRaxXqv024qthhoSFspeziSfnf84CAS?=
 =?us-ascii?Q?FzovQDq/aVWUXmK1ntQFEvNS6Iu0v+7WIK+cPEpk23k5ThNqal3w+zOri9Sb?=
 =?us-ascii?Q?QVdkFidVtImObVYMWwdGwvDKmJPxjOR3ABGK++13VYdFur+Fs+nZE+vlOiU7?=
 =?us-ascii?Q?0y1JGUkc0V0y6up3OKpEx0ooMaS2/3e7EXFxeO5/kujsZ+R0TfAkPaUPTpng?=
 =?us-ascii?Q?hHpGktL85ERSuvLVv32gxURn8JmzXv/WFNyWdLHTGgLdkxV94pA1HcD9aI74?=
 =?us-ascii?Q?eilAGZhAuyQbryx/uz0m/Kg6hr9bsj3fmyLAYB2MLx0/76ZvTlloruyHDokQ?=
 =?us-ascii?Q?ZgowRSRCwJEnocWDJokdeYzYiGN6JXiQm+xs9APawdfRnWWt/dB3+Ojs5XOj?=
 =?us-ascii?Q?DN4ktzpflC0WqT6IQQTb+lU1qTXBiiHFxQLTOcKxu16JQHNexWnIXt2N/pLD?=
 =?us-ascii?Q?wRSh+K+TglrfIEA2ksDXuOqsKvH7x0ZC5d77HYVHc2174u4rw9Ec2/XkFkrM?=
 =?us-ascii?Q?8uk0DH7JPxL+Rbqr3HpdTzyefTQX5qpQLOfPMeVJ7TAsewzVHZD+RJEMp2Hw?=
 =?us-ascii?Q?sZI9dVTeHenNn1qFqD+Fb5IO5hSHDgUezNmLBAy8aNUCK0WCNPKBctT8YMxB?=
 =?us-ascii?Q?OmnQcOQhNsecOYYL0QL8VF75ueorfQJ4J/gEMK5LMWVxxm5GG6Pk9+6pSinG?=
 =?us-ascii?Q?99V4W2ZIcCTS4N9Q6yCwANr8mm7AkfEYPc3CaijgFcQzzmvQ/8g1wUzMRizh?=
 =?us-ascii?Q?kbI0Rn9lP0VI8XuJaG5dZnG0j0WhUVkl13ACAsZMpPAPYSt2G0vSF5RDn6kA?=
 =?us-ascii?Q?2yaT5Vp1BxQOridisv7DLt71mNQMrAIdfgXKbOqHv+nAn3wXLotU3RBahQYv?=
 =?us-ascii?Q?wgWRCy7479p6O3pgeBmDJuZmfSsyRK3627F9THEV9lU+uR48DJxFY+Fnb5gz?=
 =?us-ascii?Q?Bwkyp94njwUaaxvz3qwDgernOH0M940EystQ02fonf9zuOcZ/EVTZwDcO6vK?=
 =?us-ascii?Q?tUi9m1V1ia7KkNU32FlDi8FYLkqiKlD0qJaL8JnU1YfH4GfIvIDSX3iY5DBc?=
 =?us-ascii?Q?QtZSyG+B3YEOlLPl3p14wPHpZrCQu9EqWOkzTni2EbJWMTxRGjoenzVyNnYq?=
 =?us-ascii?Q?Q5UV0exmQO7GZwvr4iJkjHpRCSG3tbGH+K2Tog/sFl1ofU79MZG91qk72cwn?=
 =?us-ascii?Q?RHCmI/XvyDpfqfOTz09AxTtSnq9s542EC/DUympHvSVDNntliqZlpKHIGMwT?=
 =?us-ascii?Q?w4K1ffhB3s6/tMA2ioGSx+9yWRhtnpX/v9kqP4JcXjm84BNKrXNZ2NSWN3tu?=
 =?us-ascii?Q?r/31nHUtoQoHorLdbVxLVTjHg/Wczzpkf1iFDAR+5nztt3b8Lb4CQ6k5DUYI?=
 =?us-ascii?Q?UNQbrrntZ6um7u/QRpizbXOAQ+AxrRTtDWiZJX/Ub0hd18AKpJ3dmRyjo+Ko?=
 =?us-ascii?Q?mGJVo8yTXQ0Q3izHcB2fdw4gI6uoml3e3EvTqikTbOfn5IS1xve3DnXLAGDm?=
 =?us-ascii?Q?OYwS4X0MMSaYJxvH1z7MYWABciCRCIMBzNp015p9+g+l5HLLKzoj33B1shwJ?=
 =?us-ascii?Q?HA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9730ce0a-4da6-46be-9655-08dcc090267d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:47:33.4481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VmdQc5bjCWyd7yAYadgZWH8KlwoZrHiYuegCxYv9/+cZlf6Is4xctqVfUKK1r/kUJ1ZvydlbT4dTt8gT9UPNgUwiU/HmBE9yuOsnfxU0ZwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6399
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

On Fri, Aug 09, 2024 at 06:51:48PM GMT, Michal Wajdeczko wrote:
>+static int pf_sanitize_lmem(struct xe_tile *tile, struct xe_bo *bo, long timeout)

it took a while to make xe use "vram"... now we are back with lmem in
several places :(

Lucas De Marchi
