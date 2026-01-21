Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77D9C44500
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 21:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7437810E062;
	Wed, 21 Jan 2026 21:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdAsJ1KJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27FB410E062
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 21:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769030616; x=1800566616;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2+9TESBSsvYpyTjgORmtgagugoADijhxRKZ3Vl0+R3o=;
 b=YdAsJ1KJwuhRdu1Ima60WHP1k3fN18ngq/7o147SJjfd6s6uFl4dgmuk
 CuLKiy4rHf/ePjr/R1E2T5Hhojz+cRzUy14J5BApyThaeTtWnfOr0dbZC
 axA4c6PZPA+qHyeWdBV+MSlhINF+xtG/KDdcw7j3YGMWfE8vtpP6E/vIm
 KYUZFiIzkAUEZCl2bJYGxV0ZqQC/aOuNWACbt3lth2gRG0K1ABKpS/hu1
 yHtB5X53Cea+BO71kxDOCJ9uZ4DLA1d4X4i8E1npaFkvfF3VdxygdDUd3
 mQrwoZxcmPeY35b+F45KpGKEnxQK9uwwCkCVpjkJGukna5Kop01AmHpWi w==;
X-CSE-ConnectionGUID: Fpx2/ScYQ9egNrfFt0aznw==
X-CSE-MsgGUID: uqdOGLpxTSScuQJGNlGd8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="72858078"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="72858078"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 13:23:36 -0800
X-CSE-ConnectionGUID: DVYR16ftS7+NDIdD+OPjNw==
X-CSE-MsgGUID: IOoG6B2aSZyKnO/i4CKvRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="210711365"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 13:23:36 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 13:23:35 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 13:23:34 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 13:23:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKl0BSNyJJxk42S9M1yCqUrhy2oeOSAli2eYjtYXsTkb8dHhsbYpro4bhzqtursOr7PVpY88/BMBWl0DFyq08vC8SVjqlwrtwO1MwNhUTbEkCKcavla9C7B9rWaF1S0vW9XiYvCErvjW3nYgwtSg+JuFe6JapVLodqmRYmU/lSQB/+bH8Qmc+nz12tp+niqSVw48Qff51PoX99ixwKPXBtX7b4C8YI5Eoiijzn9Bsqne6PGdGUvMxBEXyp9IndcqN+af9dEIW0F5iHiO7jVxFHTy69Xj6fg14Wl6YhqQ1f26mZJaMhXMWtWwXB4s/rF0k847IlJrUYLsWJwUQYVECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1+1drR9BhvM8DOU4vBPmAitSMn1xKoDRiadiUsAXfc=;
 b=RPh6IOBRIBtlOuN1Qu+6AICO0qnfS+f1WGmhCE5G7Xyw8yaVpDB7TpoimVtV1eimyRY8oL3i9BuPr9DS7wY1Fl1rEfOEPqMatrCtNSvbH+bRtk4MMxktVnYiKx99RdGOkmI3zUZ8HkPBkdANCTHyD6cOxWSw/vs+a84x9352XGzS48jeRr5uIPeRINj5ocTIP395dgf30CGr5EVGXLf8ovBrSewjiShQ7XvKZ1IJlKQy/KST2IzRZoam2sWbr0yIEkYdJ0T3oRVGFhcqGGjZiEva4fNG/MpxpNiiBc/1ZvIK4s4ma0vFKb5qGFnkjoSp3R9DNLbKwi3Q2ozpeCh8Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by MN2PR11MB4551.namprd11.prod.outlook.com (2603:10b6:208:269::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 21:23:32 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 21:23:32 +0000
Date: Wed, 21 Jan 2026 13:23:28 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 06/17] drm/xe/multi_queue: Add exec_queue set_property
 ioctl support
Message-ID: <aXFD0FTW0xml_213@nvishwa1-desk>
References: <20251211010249.1647839-19-niranjana.vishwanathapura@intel.com>
 <20251211010249.1647839-25-niranjana.vishwanathapura@intel.com>
 <dc27df4f5351345d6925db872390f3b290909fb5.camel@linux.intel.com>
 <aW_uP9eTH76NHPKZ@nvishwa1-desk>
 <aW//pmK8UIGNxfps@lstrano-desk.jf.intel.com>
 <3dec7093055835678d24e9031b71e18c73b543fd.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3dec7093055835678d24e9031b71e18c73b543fd.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::12) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|MN2PR11MB4551:EE_
X-MS-Office365-Filtering-Correlation-Id: 09023688-718f-4eac-f3e6-08de593353de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?/nyIn7TBNWSKzo7EjPcnB9cRaQ5ypBVcSaG8gryZlNRXHm4DX/CKnesKDw?=
 =?iso-8859-1?Q?utCht8xwEpw7SSNV8o9TevupUx1Kt57U0KgOYR7+0ec4YQA43Uu3XY3FYR?=
 =?iso-8859-1?Q?Wz1dnLvJ0ArvdDpMUKtZlNqtIGmyhWEoB033+7aRzk4OP/gead8FtDq7Pd?=
 =?iso-8859-1?Q?kHsWZHJfpePziSE6Nxg0Ghj0kWutepaB1E0xZM8GwkYPdJUMq5QtD5hx/d?=
 =?iso-8859-1?Q?7olNu909RwA5Q9OV09xpObaaPoiBSLhbG/YxR+yxi1UBjtXDkmEh8Dquxz?=
 =?iso-8859-1?Q?JAhymrymjU0veRXDH2kUZyN8TD8qG0lfk+Q3E0a0PVILgftnYDz0yJ5U8W?=
 =?iso-8859-1?Q?BLo8WuA/PoNArX4NSeYllSKzqmpyVLpqwtTCymrpBhDFQIJJstS6m7p3gG?=
 =?iso-8859-1?Q?HkKSLhWEFl/JlM7XCyCpAo2QHzUolWaAiRDCcG9bBMA4KhL+qjGdLHL3L1?=
 =?iso-8859-1?Q?sRHypuyHk1EEPgcINBqqsjqTnao60eRV8NTwjS8Np2caRcczV0m8uS4eKE?=
 =?iso-8859-1?Q?6EU+hX4TItF2V4u8YzoQR3d2kwUljdmpnf9+MKLFa3ivIDqI1SN7ox/eg8?=
 =?iso-8859-1?Q?oJvSvANRtJhYn0hiBNRH2e/G99P0CgevD63WWhuUZya2MD3/6FwoZRxj01?=
 =?iso-8859-1?Q?U1JDi9JDN1Ivgf45WQ3kf03tCBVtCIFdCbNTaX77j76EL4Q85/Ts3cikoe?=
 =?iso-8859-1?Q?CQCRljjOf74FSg8CJMaPKacbOWVuVnu2Uce3oB7QDW9Gucn4VYcG61tn5/?=
 =?iso-8859-1?Q?qfSj5VSr+OF33kWmX6OEPr17W8IoO1Lcgmykke/eACVrCj3OiTh1YATKr+?=
 =?iso-8859-1?Q?0MZ75z4/6akBRcZwBYhVhVobFOPmQXMEFpQiCtj8aSrbeqzdaB7mo6BIKs?=
 =?iso-8859-1?Q?2Ycg+nZVLXCbsDzTqzhyMCRTcc4nXZwB8PlWo/AzMhrArad2l+o7IhbP7i?=
 =?iso-8859-1?Q?4paQB6ZrDeV5cPTEY+HDntdT+XJplNnisnZqHyBKSm9DwgmBa/Zc7Yxp33?=
 =?iso-8859-1?Q?1SV8qB6B4FB1lH3/XRbVCFMeeo/xQc/g88YEiq4EkOVdY+NZGT4yOtQXvj?=
 =?iso-8859-1?Q?SPImEtmUMTdOz9eocv4YcEczylrQzLpespC9D6BgnO0LfJT6qW/oiBVvTK?=
 =?iso-8859-1?Q?ftbYgi1UPvD+g9vsBT6BjEBhgi8DHUlmK0XhUwrnXul92g3zC3lBCCjs4Q?=
 =?iso-8859-1?Q?VjXXmkMMncSRQE3O4gIjhZyNn/CI4sOc1DYq/V/f6PcypNVd+BoiIuVV4e?=
 =?iso-8859-1?Q?nYXIXMAnERUBmc3UQLG/klijhd++ps2fQHAwWkk/up165A7BATAwNkZ1ww?=
 =?iso-8859-1?Q?sl2Owe79tN6vC53e1EYDx/r0NIWMYrGelsRRoH//37uy/5+3tp0vUn8IIw?=
 =?iso-8859-1?Q?xz66KrUM2jEqPWlxpp/++15vFZzVSO0ZqHAr13Tfx8RT4TOPVt5/AS+3OC?=
 =?iso-8859-1?Q?VhndBawllFBhTteYdxzz2ls7XknX9iWqwmK8uQ1sU1V0fT33pMWFDhcsvr?=
 =?iso-8859-1?Q?61pOqeBYZ9XIjyl9sk9D8OQxypIRKM7bf7XSmTCGEc0/XOUfEd9Q/caPx1?=
 =?iso-8859-1?Q?2Jq403Zy9f3z02kcV2PzOcj74nhA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WpxTeR041OBbHtITV89Rxd3fJI6yNHhDdm6IgDotAAqesgjO2gkrRp6CVJ?=
 =?iso-8859-1?Q?IKmAod9p3sQxuZ1gzXJQl8ji7QrgqK9akNDJAKV0SH8+10NLV54Fuy95QH?=
 =?iso-8859-1?Q?hv5nRGl5ax2YdECvRaeVeFvqtFyuDIsDKA5WKIEfziEePhVLQ/89UvyQtf?=
 =?iso-8859-1?Q?csBAMnVWRXxXZl5nWTP7gpUL5bdoFqAVMqRTGN3WlxUi43yirtJDmQzvy5?=
 =?iso-8859-1?Q?buDg1pCaY4kCNM7csg64PiZqwoRNJVAVqQv29A7YjkyXP3vmxNjfwvuP+9?=
 =?iso-8859-1?Q?lRVGMc2AYBwzqnHxAH+PG/NGCxWnswh4SuxcaVtUz8d+6ur4t1wV52WZ1m?=
 =?iso-8859-1?Q?1GwYG7VicSuTP3f8MJ5t/fK1ANnQKfyZNq9CHlXWv0Vhi9S3c0PwKGu3t/?=
 =?iso-8859-1?Q?BVKR7ggwVUAhYOUIbPiMMjzk34BUNrhkkW5tgqHd5XJdLb8uTDr7wCSI4C?=
 =?iso-8859-1?Q?0t32pYXqZcQLnM8QEtlOBu3LgN3aa788VKLnpkwKAGFdQuelvXTnJw/DHX?=
 =?iso-8859-1?Q?nkK5YmdKCZmdYOgNq5W8SUBdwRkDaESI9q+985E5g88Q2n5vVdeHx6muJT?=
 =?iso-8859-1?Q?bkm2yi0xdg9IZYKNve2eYO7fjsvf1TSwF9/YLyXVdGCceVeOUz/A/i8mlR?=
 =?iso-8859-1?Q?n62Cpi3/Ys5aYMNSeRRUsgGIWUytZS9C3rHG1PBIKB77tYvSVSWzDY7O7z?=
 =?iso-8859-1?Q?kykYnYU9drF3MFwWYUidK0qpekCm1R5rVDfGqfIeh/u2W3PEnfOmqJS7Gf?=
 =?iso-8859-1?Q?gXlfokh44OmMdP1LchOOzszdHIyi4f6iNmW7Y0J6/4cwkpfu5IpOox1e+b?=
 =?iso-8859-1?Q?9/uMhtWjs8BzuJxcEu+tnPvrZIpGrJRw+F0wv3t4C4PgBDaElVGBhYYUAP?=
 =?iso-8859-1?Q?Zg3zTvMprLn7hTCNEoP8VTTq8Kzcz1w5HAfyi57rimeTwxcj1hGPrDfAL0?=
 =?iso-8859-1?Q?Zy9R/k3p5DZpIo4kIJq5lk6wejElTnPWUR/XFxlQH+De4PC3OOEm8i1deJ?=
 =?iso-8859-1?Q?ctvgH3gPUYjD+kk30nWyEFKHmkfGZ5iI5ymf19ANJmF3/CAYlIhHcERhCJ?=
 =?iso-8859-1?Q?m5IwNPej7ScJQpA2iNifTbDMJO+szuK5+w/iq8ewtwzWqs6Koaw3nm7rD8?=
 =?iso-8859-1?Q?G1uwsY0+spBS3d0dUI35BR+VfoPm0DEatGKrvqTw9Fyb+mUZN+gYeMlnUG?=
 =?iso-8859-1?Q?+JHSGzsfE8tDCrGKTjl3jtXUkyeB78D3ecR+FpkCozkp82EwvlZTui7YJa?=
 =?iso-8859-1?Q?XQZrNsOabV1IVeibm5cXJnfUhtGINSoArvQBeUS/r2mfoVPAiQeZC04PbI?=
 =?iso-8859-1?Q?ZY4FxaOiVua3SnIw0lIDtcGHvF0ITaC//CXSq13UP/uxu+6W74sIZQJROy?=
 =?iso-8859-1?Q?7irl/ERFiC4cNpAqnYTBxCpfuIofv0FPE+OYpe8jy8e33b1YKMIVjPDI8f?=
 =?iso-8859-1?Q?CHVMjJHohgFcd0nhzrOR6GrRoHpY7sQbzjwxXSKqgWoBTFs/hDEDcUQyh3?=
 =?iso-8859-1?Q?vQY539CYV23ARCgZGlG2tgM27eOk9GGN69+Tk/+44Z9IFTKm0RDotN+lso?=
 =?iso-8859-1?Q?Ika97s5+ZQPYtytucjej+gDKFUg31yqNepsxGApri3jdjvakuMVj+MyEQY?=
 =?iso-8859-1?Q?FVl01NS63rKKDs5hqKIUNwbh7lepWpdJ/uxNe+6ksWbJatPYEDh94aCQDT?=
 =?iso-8859-1?Q?PrVng0bY7pgxd7GQFLEb8p3CaYxYaCQYexAAW+TDbt88V6sm+cBLgcjRCV?=
 =?iso-8859-1?Q?uPKlajIyc2T/kijYODHtJFIP8SjgSh3lboMEFgNQ2Bo7pvMl0zo53Ud/qD?=
 =?iso-8859-1?Q?aiXy3Cfh7G/kYb1wHUAM0oombtI3vfY8agmwjw56pKpKBjo1lnBl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09023688-718f-4eac-f3e6-08de593353de
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 21:23:32.1240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sU1/+wMCU75YpA7Gku6S4S84XqeDfYbwB4CHUMc+IVUs+rFQ7TVwJYsG+SqP9ow8TS8pgulqg/1PN9TM3NUSaH3qvIj7CtoCAsLoJc8VBNJSUJvRR/97UqeKFr92fOsk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4551
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

On Wed, Jan 21, 2026 at 04:29:34PM +0100, Thomas Hellström wrote:
>On Tue, 2026-01-20 at 14:20 -0800, Matthew Brost wrote:
>> On Tue, Jan 20, 2026 at 01:06:07PM -0800, Niranjana Vishwanathapura
>> wrote:
>> > On Mon, Jan 19, 2026 at 05:57:29PM +0100, Thomas Hellström wrote:
>> > > Hi,
>> > >
>> > > On Wed, 2025-12-10 at 17:02 -0800, Niranjana Vishwanathapura
>> > > wrote:
>> > > > This patch adds support for exec_queue set_property ioctl.
>> > > > It is derived from the original work which is part of
>> > > > https://patchwork.freedesktop.org/series/112188/
>> > > >
>> > > > Currently only
>> > > > DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY
>> > > > property can be dynamically set.
>> > > >
>> > > > v2: Check for and update kernel-doc which property this ioctl
>> > > >     supports (Matt Brost)
>> > > >
>> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > > > Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
>> > > > Signed-off-by: Niranjana Vishwanathapura
>> > > > <niranjana.vishwanathapura@intel.com>
>> > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> > >
>> > > Two questions on this patch:
>> > >
>> > > 1) I don't see any locking to protect the exec-queue / lrc state.
>> > > Perhaps I missed it, but couldn't this blow up if someone runs
>> > > two
>> > > set_property ioctls in parallel on the same exec-queue? Looks
>> > > like at
>> > > least the set_priority is doing non-atomic RMW assignments?
>> > >
>>
>> I don't think we'd blow up. At worst q->multi_queue.priority would
>> race
>> between a set in guc_exec_queue_set_priority (parallel across queues)
>> and read of that value in
>> __guc_exec_queue_process_msg_set_sched_props
>> (serialize across queues). Eventually we'd stablize on the most
>> recently
>> set value in __guc_exec_queue_process_msg_set_sched_props.
>>
>> >
>> > Hmm...I think only checking and setting of 'q-
>> > >multi_queue.priority'
>> > in guc_exec_queue_set_multi_queue_priority() is a potential issue
>> > (as the rest is handled by message handling queue and guc ct
>> > backend).
>> > I think we can fix it with a simple spicklock in this function.
>> >
>>
>> Hmm, I'm not sure what a lock here buys us as if two user threads try
>> to
>> set q->multi_queue.priority we'd never really knows who should win
>> the
>> race of saying of setting.
>>
>> > > 2) Do we really need this to be mutable? In i915 assuming that
>> > > lrc /
>> > > context configuration could change created horrendous locking
>> > > constructs that were later fixed by making it immutable at first
>> > > command sumbission. I don't exactly remember the details but do
>> > > we need
>> > > to change properties after first submission? If not I suggest
>> > > blocking
>> > > that.
>>
>> I don't think this is overly complicated here given the actual queue
>> interaction with the GuC is serialized by the DRM scheduler.
>>
>> My thinking is this patch is probably fine as is, albiet a little
>> harmlessly racey.
>
>I think even if it's possible to reason that this is harmless in its
>current form, state that can be modified by my multiple threads
>simultaneously must really be protected by locks.
>
>Otherwise the code will be fragile: Any future updates where the author
>doesn't realize the state is not properly protected might break it.
>
>Also any person trying to familiarize himself with the code and noting
>that the data is not protected from racing will have to dig down and
>verify that each and every concurrent access is actually ok taking the
>lack of barriers and hardware reordering into account.
>
>So please, let's adhere to "data with concurrent accesses must be
>protected unless immutable".
>

Hi Thomas, Matt,

I have posted a patch to fix the issue.
https://patchwork.freedesktop.org/series/160447/

Can you take a look?

Thanks,
Niranjana

>Thanks,
>Thomas
>
>
>
>>
>> Matt
>>
>> >
>> > Yah, ability to dynamically change multi-queue priority is a
>> > requirement
>> > from the Compute UMD team.
>> >
>> > Niranjana
>> >
>> > >
>> > > Thanks,
>> > > Thomas
>> > >
>> > >
>> > >
>> > >
>> > > > ---
>> > > >  drivers/gpu/drm/xe/xe_device.c     |  2 ++
>> > > >  drivers/gpu/drm/xe/xe_exec_queue.c | 35
>> > > > ++++++++++++++++++++++++++++++
>> > > >  drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>> > > >  include/uapi/drm/xe_drm.h          | 26 ++++++++++++++++++++++
>> > > >  4 files changed, 65 insertions(+)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c
>> > > > b/drivers/gpu/drm/xe/xe_device.c
>> > > > index 1197f914ef77..7a498c8db7b1 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_device.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
>> > > > @@ -207,6 +207,8 @@ static const struct drm_ioctl_desc
>> > > > xe_ioctls[] =
>> > > > {
>> > > >  	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl,
>> > > > DRM_RENDER_ALLOW),
>> > > >  	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_MEM_RANGE_ATTRS,
>> > > > xe_vm_query_vmas_attrs_ioctl,
>> > > >  			  DRM_RENDER_ALLOW),
>> > > > +	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY,
>> > > > xe_exec_queue_set_property_ioctl,
>> > > > +			  DRM_RENDER_ALLOW),
>> > > >  };
>> > > >  
>> > > >  static long xe_drm_ioctl(struct file *file, unsigned int cmd,
>> > > > unsigned long arg)
>> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > > b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > > index d0082eb45a4a..d738a9fea1e1 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> > > > @@ -790,6 +790,41 @@ static const xe_exec_queue_set_property_fn
>> > > > exec_queue_set_property_funcs[] = {
>> > > >  							exec_q
>> > > > ueue_s
>> > > > et_multi_queue_priority,
>> > > >  };
>> > > >  
>> > > > +int xe_exec_queue_set_property_ioctl(struct drm_device *dev,
>> > > > void
>> > > > *data,
>> > > > +				     struct drm_file *file)
>> > > > +{
>> > > > +	struct xe_device *xe = to_xe_device(dev);
>> > > > +	struct xe_file *xef = to_xe_file(file);
>> > > > +	struct drm_xe_exec_queue_set_property *args = data;
>> > > > +	struct xe_exec_queue *q;
>> > > > +	int ret;
>> > > > +	u32 idx;
>> > > > +
>> > > > +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args-
>> > > > > reserved[1]))
>> > > > +		return -EINVAL;
>> > > > +
>> > > > +	if (XE_IOCTL_DBG(xe, args->property !=
>> > > > +			
>> > > > DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
>> > > > +		return -EINVAL;
>> > > > +
>> > > > +	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
>> > > > +	if (XE_IOCTL_DBG(xe, !q))
>> > > > +		return -ENOENT;
>> > > > +
>> > > > +	idx = array_index_nospec(args->property,
>> > > > +				
>> > > > ARRAY_SIZE(exec_queue_set_property_funcs));
>> > > > +	ret = exec_queue_set_property_funcs[idx](xe, q, args-
>> > > > > value);
>> > > > +	if (XE_IOCTL_DBG(xe, ret))
>> > > > +		goto err_post_lookup;
>> > > > +
>> > > > +	xe_exec_queue_put(q);
>> > > > +	return 0;
>> > > > +
>> > > > + err_post_lookup:
>> > > > +	xe_exec_queue_put(q);
>> > > > +	return ret;
>> > > > +}
>> > > > +
>> > > >  static int exec_queue_user_ext_check(struct xe_exec_queue *q,
>> > > > u64
>> > > > properties)
>> > > >  {
>> > > >  	u64 secondary_queue_valid_props =
>> > > > BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP) |
>> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h
>> > > > b/drivers/gpu/drm/xe/xe_exec_queue.h
>> > > > index e6daa40003f2..ffcc1feb879e 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> > > > @@ -125,6 +125,8 @@ int xe_exec_queue_destroy_ioctl(struct
>> > > > drm_device
>> > > > *dev, void *data,
>> > > >  				struct drm_file *file);
>> > > >  int xe_exec_queue_get_property_ioctl(struct drm_device *dev,
>> > > > void
>> > > > *data,
>> > > >  				     struct drm_file *file);
>> > > > +int xe_exec_queue_set_property_ioctl(struct drm_device *dev,
>> > > > void
>> > > > *data,
>> > > > +				     struct drm_file *file);
>> > > >  enum xe_exec_queue_priority
>> > > > xe_exec_queue_device_get_max_priority(struct xe_device *xe);
>> > > >  
>> > > >  void xe_exec_queue_last_fence_put(struct xe_exec_queue *e,
>> > > > struct
>> > > > xe_vm *vm);
>> > > > diff --git a/include/uapi/drm/xe_drm.h
>> > > > b/include/uapi/drm/xe_drm.h
>> > > > index fd79d78de2e9..705081bf0d81 100644
>> > > > --- a/include/uapi/drm/xe_drm.h
>> > > > +++ b/include/uapi/drm/xe_drm.h
>> > > > @@ -106,6 +106,7 @@ extern "C" {
>> > > >  #define DRM_XE_OBSERVATION		0x0b
>> > > >  #define DRM_XE_MADVISE			0x0c
>> > > >  #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
>> > > > +#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
>> > > >  
>> > > >  /* Must be kept compact -- no holes */
>> > > >  
>> > > > @@ -123,6 +124,7 @@ extern "C" {
>> > > >  #define
>> > > > DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BA
>> > > > SE + DRM_XE_OBSERVATION,structdrm_xe_observation_param)
>> > > >  #define
>> > > > DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BA
>> > > > SE + DRM_XE_MADVISE, structdrm_xe_madvise)
>> > > >  #define
>> > > > DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_B
>> > > > ASE +
>> > > > DRM_XE_VM_QUERY_MEM_RANGE_ATTRS,structdrm_xe_vm_query_mem_range
>> > > > _attr)
>> > > > +#define
>> > > > DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BA
>> > > > SE +
>> > > > DRM_XE_EXEC_QUEUE_SET_PROPERTY,structdrm_xe_exec_queue_set_prop
>> > > > erty)
>> > > >  
>> > > >  /**
>> > > >   * DOC: Xe IOCTL Extensions
>> > > > @@ -2315,6 +2317,30 @@ struct drm_xe_vm_query_mem_range_attr {
>> > > >  
>> > > >  };
>> > > >  
>> > > > +/**
>> > > > + * struct drm_xe_exec_queue_set_property - exec queue set
>> > > > property
>> > > > + *
>> > > > + * Sets execution queue properties dynamically.
>> > > > + * Currently only
>> > > > %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY
>> > > > + * property can be dynamically set.
>> > > > + */
>> > > > +struct drm_xe_exec_queue_set_property {
>> > > > +	/** @extensions: Pointer to the first extension
>> > > > struct, if
>> > > > any */
>> > > > +	__u64 extensions;
>> > > > +
>> > > > +	/** @exec_queue_id: Exec queue ID */
>> > > > +	__u32 exec_queue_id;
>> > > > +
>> > > > +	/** @property: property to set */
>> > > > +	__u32 property;
>> > > > +
>> > > > +	/** @value: property value */
>> > > > +	__u64 value;
>> > > > +
>> > > > +	/** @reserved: Reserved */
>> > > > +	__u64 reserved[2];
>> > > > +};
>> > > > +
>> > > >  #if defined(__cplusplus)
>> > > >  }
>> > > >  #endif
>> > >
