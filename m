Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4159FC83029
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 16:48:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F3610E4A3;
	Mon, 30 Jun 2025 16:48:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XGB7jq6+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B731910E235
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 16:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751302131; x=1782838131;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TC3Uq8SdA4hUqRYkpUsl6E+pCKht8rfYIMOgzThR3tI=;
 b=XGB7jq6+22LiwVoQmVzRMGsGCXlEs6kLgEIL14+SCQ6szf3Emiu/AdOt
 lA8abxxqIBID1IrV5ZvmoFIEv4vcjl5wz1WLkMA3gRCnZyZ1rPKroE9+P
 36iAHn8/B5/BZI+/InmNiD0YKhSy8emPZZRwXRXC0x6YBsbyhQbb8Se+1
 XXgzKoUmZrEEYFNjyje1aE950rjSWL1XE5dtJJLjGWJ1jdhqukS/ztA1j
 a9TrC3SfzT+5coPhbfBcl3+K/YbP6XGAbrHK7cN/191E3O4tAedRPmWal
 uGxXCQJ/txcKpWsjNb496uVlzMILPBdu/DJd+9UNNZBiAO9bfvkurnTPW g==;
X-CSE-ConnectionGUID: sglbyslsSPujamdA1vIGNg==
X-CSE-MsgGUID: ZI392a+WQB6xmZSCT6LqLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53659289"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="53659289"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:48:50 -0700
X-CSE-ConnectionGUID: AaW2O00oR02yC7DbFl3ocA==
X-CSE-MsgGUID: MDmRZOW4T5u1N+hloWpdjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="153591623"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 09:48:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 09:48:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 09:48:49 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 09:48:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjFL/ILc/gaDSSlJeXkb8GNy7SzmB1gMtsUbGfm1lztQqLuilIlTEzHGH579IrT46W2g0Nmo8+nwRcSTl6Grn9iym8eGZvhLokoETK7vfBzUqHmlmYIxbtxE6NTEt2AEBYhKjtrLY0vLu5WixP4fN09I76dQm2iVVrprzKtsCrfNyVFYjmITSSvdK6w9AKg4Q+miTRe7iPwyKzyuleXwfXmZGMLoy1TEPsELQEDV598BKN2To22HGm/14Si4xseEqepdHo2VbEsyTRPpOHQd7vSVa6CyLzipBFveOoSr63l+rJRUlHIaLkm3zx4bIwe92ueF2UND6/PayB/WGGFkIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgRHyky52cDm1R/e1teh05eyivCsvxP+pal/NF6nw4E=;
 b=Wr5rVdX4Y0veHyN5gLsQODLn7cjwkqytxAiEChOBeyPuiXUHsPLHUDYmIJtalA55ARCoXwrDQuQwPFtGt4qI/SDpO735NQ2aMMftmw96eGJGBD3BBSQ2nupxjeZGRtnlOg68b8UhamaiD89FZD/IGbdDZSlTF40d+JwQUm/yQRQAEmwslpuU5Ipo7/fdcM94VlleqUHxHsxJ2gB1BHKyv+GYb/I8uuQQm34rd8lVQ9t0ksH8PlonARPw4/VTofGJobYKwvCI6HHbaH7zK9UKoGuGZaWE7et2fyRO91FZA1OGpmYYk6lr7iTF17XTZbgINY7B779y/r3OwlJYEpEDAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CH0PR11MB5236.namprd11.prod.outlook.com (2603:10b6:610:e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Mon, 30 Jun
 2025 16:48:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8880.030; Mon, 30 Jun 2025
 16:48:13 +0000
Date: Mon, 30 Jun 2025 09:48:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/5] drm/xe: Assign GT IDs properly on multi-tile +
 multi-GT platforms
Message-ID: <20250630164811.GA1204996@mdroper-desk1.amr.corp.intel.com>
References: <20250617020906.1719276-7-matthew.d.roper@intel.com>
 <20250617020906.1719276-11-matthew.d.roper@intel.com>
 <f8f7f468-7fd2-4b81-9cdd-323d13dfb414@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8f7f468-7fd2-4b81-9cdd-323d13dfb414@intel.com>
X-ClientProxiedBy: SJ0PR03CA0088.namprd03.prod.outlook.com
 (2603:10b6:a03:331::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CH0PR11MB5236:EE_
X-MS-Office365-Filtering-Correlation-Id: d5190d12-3052-44ac-34d4-08ddb7f5e778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?tr2TdBQ4PqWUVNxPnoSRMN1tZW66Tx50kdYzstd2uVy2kklzydQZu18c+x?=
 =?iso-8859-1?Q?X1b6iAVGJ9ZH4ofmJFAwe8Pqtqev0lb3h6qX82CruTKH3gwoWdYavRBUL+?=
 =?iso-8859-1?Q?uVgHA/l09Ak+tiS2M6ZSdhm7b/w3nILvKsQrn0ktTj+VoETeHFXrM7tM4u?=
 =?iso-8859-1?Q?un1kO/OubOivHIiP/pDgAR2Z0bzvWngOnCW9BRTtgnZ2ZC14NBTVszBe4g?=
 =?iso-8859-1?Q?NqspCNtFRvduOYQJNBaNwUjPh8dWxjGbVcJ4a69U11HtZ+faJLr4igsNWv?=
 =?iso-8859-1?Q?k9iJGSWkwst7O3hIhGTNiy7IhIHoABinKRFquYjS0Ksp8vSIua6kHVgfhA?=
 =?iso-8859-1?Q?g/nRXSAFFcjjCxFDTGeO7IPsbbrO+4rv7tBPoFnuMrK12Oygx7Gi+NyDVB?=
 =?iso-8859-1?Q?ArvAgC0gc2Z1fFkdJIhkZG6+w2ZOyIIkGXPSUdyEkSDxNf4TGJasEi7Xbw?=
 =?iso-8859-1?Q?/WfEBwjXgOk4mSV0Fe1P+1HwQhQBNj8R/TzswHVdeT62QWDdCJltXI8Hsw?=
 =?iso-8859-1?Q?QxABzlv9rm1K4dnPcrPmtCmK66l+IYAqajhS32zG7psvmkZXUX0aoFqOPZ?=
 =?iso-8859-1?Q?SwGu+J7KocuypYNWMQkAtGGg3itakrUixBKuSN6ykm1sy8FcuTHZ/t9rql?=
 =?iso-8859-1?Q?pUbI5PletH78jRyHV7d4mAXDHLVfGSkk4MW7oy8sVundtvZqfR3YYEMPiB?=
 =?iso-8859-1?Q?IQbo156s8cr8Tuu3DrD5CxIMzbksIXfn/HNNgizciLZPhX4NCN6N5ZH+ND?=
 =?iso-8859-1?Q?/cuxnDAP63r3SPnz3E3tPHDr1S/zTCGTWrXtmxw8gddhxz/ZhzpcauVERW?=
 =?iso-8859-1?Q?Mg87Zq1KWUtbE4gJrOhNRTdfCwxzGGlCplbcHm9A/9gPl6bxu1QoBbgHNu?=
 =?iso-8859-1?Q?LdtRhr9s/GMMGJfv+swFxXKAIQNr8IBMI4Jgx82Bei5Bqn5gCSR02ceY2Y?=
 =?iso-8859-1?Q?OvmXRjz84PMYoOfcRSi2ALjC0PFZn83p2fl5RMrBpZ5lkH85Ej+xWlBcqu?=
 =?iso-8859-1?Q?IeMg0o3qNl9VPmJTBVyLKiRuniPfVjJoUDefVQjeyqCo7zAUaRLwLDHtTJ?=
 =?iso-8859-1?Q?29sOSHdsx9Mcg2vUi8FYGKsSyl2AlKB0IcU1V0e3HbcivzbGTmd1UK2LzS?=
 =?iso-8859-1?Q?dGAPzOKg5r1JPCEj2WUDAe3hiOO6lWyUGNOM6QQpjDj6OyI0GswSZ556qg?=
 =?iso-8859-1?Q?4UkQR9epZ6TCgCwyGDI1g9d7UkWC0xL/tHHx8isnO7spurswpwS5wX/ArG?=
 =?iso-8859-1?Q?ClqS70hSQB4KWYpkIMTd384Th/UmkjflW8/QDdyxi5aMQhW0tt/e6lbRvk?=
 =?iso-8859-1?Q?bKRv7PQENhDrxTvK0AHF4iNwfL6xSwEkdFu1pprZP+cu6MPeh7eWG4E/RX?=
 =?iso-8859-1?Q?FsXg9HuPOiRZ0W281/doujxo0VX/nMtgnzyygQsDN3lrYnvWIoZQrKl7OO?=
 =?iso-8859-1?Q?Jr/62xGNUfYIJMhk/0xPeX0YOm3BtqCWqMAnUUWALxF8Rqe4KQtftntYji?=
 =?iso-8859-1?Q?o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IjSzgzAycMbFccCDbr4qlZJZ/G0XqZySXBXdn9d7XxjADM3oI6BgA3gPlK?=
 =?iso-8859-1?Q?cM8lHpvo9/zBHRXbkSwH/hsocmj7HNgA9mQZAv/dLaug32HNLiHZQn/+5K?=
 =?iso-8859-1?Q?VB60TTJYwHTdMkz/ialuFdwHvQm1cCXag/d43C4hdOLr9R7meEbUZ0HWHq?=
 =?iso-8859-1?Q?rlWKFbI7AR1NejBfNz/94Jm8B1iwJKr6vkmKtbp8mbDE877bcUEgcI4hzz?=
 =?iso-8859-1?Q?c09UiDsCtZg8NOLLE0bWd3Ib7y7V28rS9uqtb/vQB945BJCNv0AjKRugzm?=
 =?iso-8859-1?Q?0oV/oxaTania8Ue0WNoal5V9WVqkW6U39O0yKA8VDQm1vxkJgPw7K82i17?=
 =?iso-8859-1?Q?4gw5siCiQ/cOYW6JCqv2pXIM0WoLIwzqwaXKYq15Dd9AaKlD5uwiRrPKp3?=
 =?iso-8859-1?Q?4ZzmngzOprpZcjhn5IEMckEdQYzZIlzxtlbC3R2NHNJSlnhMrk+fDta4dn?=
 =?iso-8859-1?Q?3zWoiv+mWOwZFcujOPmY80ETpIMuskFgiPEiJbPaZ7rpVRkmG2QK4KZQtR?=
 =?iso-8859-1?Q?QDHf1pjCiwjxmWJLDR+/uCW/WUlOdj4WTZcHTcxjnx4KhjJ6+lzIURYCZy?=
 =?iso-8859-1?Q?UOUb71YOd83Gr9sd8dIoeyQBw7uEp1aer3U0a8eFfHIe3ebCli3h51FTJW?=
 =?iso-8859-1?Q?77AXWxY41U00ONL1eyzgDdPx7/bxkyzaPXBU+oECePMWqYV/IBDwJldRTF?=
 =?iso-8859-1?Q?s9ILugu9/GjhpoBWGGJUM6qlJcsnm51luoz0kQFueccZzPXh8qyHjVLUlo?=
 =?iso-8859-1?Q?2+XQZ27pLdxzjoc7K2cUKBp0oJJhe0x//UxeNhg4vwBq0/ll0LIt/GuS9z?=
 =?iso-8859-1?Q?ypp7iAhQA4Ibu6uZBPM92PMoqeYlXNwkm/Q0x9tHTODodHe/vD3KmUEYBd?=
 =?iso-8859-1?Q?htLORjc+xQGTJ1uGT7IUBfetdmT7DD4x23N/Y5en5rYbwXTlnugbGEfqje?=
 =?iso-8859-1?Q?nBURtXX3oURKFDS+yrT2pDIaJ8Ut3lN0ITE6ShrRILXPYdPKVrPSsBNCg9?=
 =?iso-8859-1?Q?fd8OzJUvDDCYzwmh8n2xnu+X8XZwYbR4npyNP8/RLbbDWKp9Hev3ipdoJU?=
 =?iso-8859-1?Q?CH4IRWNvG3aES7OpApIwk/Sc+0AkGDnmfYM/6tiT2gz9hcCQX7zcPwy0Ka?=
 =?iso-8859-1?Q?kpNCL9OlOSX3ZoluZOywzkt9ncWhxhV9Y2gu9D7336eEN3eJx4voc7B7oa?=
 =?iso-8859-1?Q?PZR0vKh5xybN8Bnv8yshteQ4UHQRNoUYZa0YT8ikcx+ETAo/zAZwnTuZQM?=
 =?iso-8859-1?Q?iLM0KySeNRf2qwVizzCu74KWF3MuLkm0No/d7zf/rZWAiKYL0JVu3Chg8h?=
 =?iso-8859-1?Q?ACuDdilvYhh7XkMyjXV3297CnUQWy/yhmj3i26xixdy312Sb5u7b02M+7S?=
 =?iso-8859-1?Q?m1dOqkigQ2h/se8Jj2NKl/pm2J0HOV2YvzFm+WqzF9M6sL71jt5GRyt5/O?=
 =?iso-8859-1?Q?z7ZTy93B4gSoFRUPnA34ibeiNAwaK7Ii0dopdLdcDYUKHlSwkYTJ/ERw/P?=
 =?iso-8859-1?Q?oWebBW+oA44/xxZbUtkfOdDrGLNGP4SUdgaWkRAmBUMAr9hABlt24YPiSS?=
 =?iso-8859-1?Q?AsI7z34Kdj2/tWfaMLb9xp2KHZxp7jwXue4vNTFVusumiketQvvlppYn6y?=
 =?iso-8859-1?Q?5ZD2nyp/LhND3DFxwEXD/atJuw+wOY5brqiCnWJJlKlaXih9ReJEEGVA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5190d12-3052-44ac-34d4-08ddb7f5e778
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 16:48:13.6306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OwPquclDSzI/1cxaSXm/uEIQbL1Pmklx0R6SKsnSsLxN9LS/3vA58kL87LXEC0LSZ0udyICug4orCpP8zmHpL8K2UM8MxOGPY8zET84pWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5236
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

On Wed, Jun 25, 2025 at 05:11:27PM +0530, Vodapalli, Ravi Kumar wrote:
> 
> 
> On 6/17/2025 7:39 AM, Matt Roper wrote:
> > Although "multi-tile" and "multiple GTs per tile" are mutually-exclusive
> > characteristics on all of our platforms today, this may not always be
> > true.  Assign GT IDs according to xe->info.max_gt_per_tile in a way that
> > should work even if future platforms have different configurations.
> > 
> > This patch should not change the behavior of current platforms; it only
> > future-proofs for potential future designs.
> > 
> > Signed-off-by: Matt Roper<matthew.d.roper@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_mmio.c |  8 --------
> >   drivers/gpu/drm/xe/xe_pci.c  | 14 ++++----------
> >   2 files changed, 4 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > index 7357458bc0d2..b65d888ee8e4 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -82,14 +82,6 @@ static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmio_size)
> >   			drm_info(&xe->drm, "tile_count: %d, reduced_tile_count %d\n",
> >   				 xe->info.tile_count, tile_count);
> >   			xe->info.tile_count = tile_count;
> > -
> > -			/*
> > -			 * FIXME: Needs some work for standalone media, but
> > -			 * should be impossible with multi-tile for now:
> > -			 * multi-tile platform with standalone media doesn't
> > -			 * exist
> > -			 */
> > -			xe->info.gt_count = xe->info.tile_count;
> >   		}
> >   	}
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index a4885f64c2c4..b29252abbf3e 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -687,10 +687,11 @@ static int xe_info_init(struct xe_device *xe,
> >   	 */
> >   	for_each_tile(tile, xe, id) {
> >   		gt = tile->primary_gt;
> > -		gt->info.id = xe->info.gt_count++;
> >   		gt->info.type = XE_GT_TYPE_MAIN;
> > +		gt->info.id = tile->id * xe->info.max_gt_per_tile;
> why gt->info.id is equal to tile->id * xe->info.max_gt_per_tile then the
> resultant number exceeds max_gt_per_tile , i dont know whether we can assign
> gt->info.id as equal to tile->id

Yes, this is correct.  Supposed a future platform has four types of GTs:
primary, media, foo, and bar.  That platform would have max_gt_per_tile
set to 4.  Also supposed that the same future platform has three tiles.
In this example, the overall possible GT IDs in the system would be
assigned as:

   0:  tile 0 primary 
   1:  tile 0 media
   2:  tile 0 foo
   3:  tile 0 bar
   4:  tile 1 primary 
   5:  tile 1 media
   6:  tile 1 foo
   7:  tile 1 bar
   8:  tile 2 primary 
   9:  tile 2 media
  10:  tile 2 foo
  11:  tile 2 bar

So the GT ID for a specific tile's GTs are:

  primary:  tile ID * max_gt_per_tile + 0
  media:    tile ID * max_gt_per_tile + 1
  foo:      tile ID * max_gt_per_tile + 2
  bar:      tile ID * max_gt_per_tile + 3


Some of these GTs may or may not exist depending on fusing or other
platform details; userspace uses the GT query ioctl to discover the
available GTs.  It might see something from the query interface like:

  (GT0 primary, GT1 media, GT3 bar, GT4 primary, GT6 foo, GT8 primary)

meaning there are 6 usable GTs in the system, and the IDs "skip" some
numbers for cases where a GT does not exist.


Matt


> >   		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
> >   		gt->info.engine_mask = graphics_desc->hw_engine_mask;
> > +		xe->info.gt_count++;
> >   		if (MEDIA_VER(xe) < 13 && media_desc)
> >   			gt->info.engine_mask |= media_desc->hw_engine_mask;
> > @@ -708,17 +709,10 @@ static int xe_info_init(struct xe_device *xe,
> >   		gt = tile->media_gt;
> >   		gt->info.type = XE_GT_TYPE_MEDIA;
> > +		gt->info.id = tile->id * xe->info.max_gt_per_tile + 1;
> >   		gt->info.has_indirect_ring_state = media_desc->has_indirect_ring_state;
> >   		gt->info.engine_mask = media_desc->hw_engine_mask;
> > -
> > -		/*
> > -		 * FIXME: At the moment multi-tile and standalone media are
> > -		 * mutually exclusive on current platforms.  We'll need to
> > -		 * come up with a better way to number GTs if we ever wind
> > -		 * up with platforms that support both together.
> > -		 */
> > -		drm_WARN_ON(&xe->drm, id != 0);
> > -		gt->info.id = xe->info.gt_count++;
> > +		xe->info.gt_count++;
> >   	}
> >   	return 0;

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
