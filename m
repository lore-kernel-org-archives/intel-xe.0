Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8203CCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 03:41:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8CF10E24F;
	Wed, 15 Oct 2025 03:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L4qXfsTR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3167010E24F
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 03:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760499695; x=1792035695;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Rvk19ipqDCONJbvlBSHAU1SzuXm2jD7kTm5BUQjY1sk=;
 b=L4qXfsTRB6k9S+lMRR61+gB7JIoBGhHiMrJuWaa9hf8rfz1MnKZFV1sy
 CTHeMGul9YYR+bSqTlhqYdQQK4BUDyPjZwf+2cTupJcTZdaE0rOz7T5O/
 67q8qQvYuc8X/LiTgconxYo6SInCsrcfUoPEi++pf1P3XL16AT8pS9dqw
 Rc6jEsHdybNgKjER7CPq/rAWTpeiOEy77DcahaAKFb+RoPW4T1zBnoec8
 WHvLhSDQJQTMhkbznRBrStw7A2H1orS8iabRce95iEGSnwZMa7PFw/dSI
 SLWZzrQbyUwrAO9pwvkPRhmSmO4gDrW0itZe7VtwZfZWOztRRE4UGxkp3 w==;
X-CSE-ConnectionGUID: xeIuAxq4SOWZGrCpTObitg==
X-CSE-MsgGUID: 5wx+KX17QCG4aTNoa6iyEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="74116590"
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="74116590"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 20:41:34 -0700
X-CSE-ConnectionGUID: jYp5CQ51Qri1Qbp/VFpHyQ==
X-CSE-MsgGUID: ZRjVUcEdRmK72IP8KB6+zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="205753908"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 20:41:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 20:41:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 20:41:34 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.30)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 20:41:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBTiNEF2ANg+1dtSMmw3xN42oS8508Y4G4j7QK6WOyKgypvgX3nY3R4fXtRaSij1dvciSsYUKeD/k/mb10BXK8wwOzdz6UucyBiVKeL5B4uM/JTHuOGdYMJLSXEJzcc3Co8wwlDbVFMHJEwxVXUI5D2YGY1dDey00qOCIBzw59Sy5myKVDAZaNMmXny2gz2fqNz9mC9n2IQeZV6IQC+DRnvFKIcGW+9SEr08ChUM+eGlAwbnw9i4h3PSt9n9a0JRq45kbBLXcFR6bECBCGrh5w/in0nUeSSDFXgwQ8d3vU3OjUjWbxwVODsW/yzwBd3K7chWBGZXvg05BX6u42/0CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gz2BtFzgs72btLfYCUyFD8YbUTpzSOLNZqyho5/w9mU=;
 b=b4Wlui/eSjIqzkCRfYZ+dp7JfJChXnZRu8LV4xq+vLcBBxRoT3GPIdNaSrtx+6NtUX7MG4mnzevbSauM8AQFLn1r2QMrreBfHuK1It6RU5+DPZTKx0mjaw7lHq3gtxUF41+ohyyuYX4m/qlXyLN4zvTvatl3dxRKdcuURUiQFNoSaNsUUJfoXOVDYS/a7c4iVOaJrZymBp9m3CgYfTm3awRaz+akwZvsUP184iQ6YjH8VNLAiVJwIqg0K7FCfnfUm7HNEOk5xK1YkYgEbIEDirUTjQKdw71Uci4sT61VkFh87RMBCTl2Lqu6C7y4Ilq4Xy0LJD4Gt5Gcfvcuok72ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6328.namprd11.prod.outlook.com (2603:10b6:8:cc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Wed, 15 Oct 2025 03:41:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 03:41:31 +0000
Date: Tue, 14 Oct 2025 22:41:29 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Shekhar Chauhan <shekhar.chauhan@intel.com>,
 <intel-xe@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 05/23] drm/xe/xe3p_lpm: Stop reading the CTC_MODE register
Message-ID: <77ur4jy56xcjokgp7eko7eckv4y5gfacuqlzgksafo4dmwufxt@ashhsxth75vx>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-5-bfb74f038215@intel.com>
 <7b5ed9f9-3b0b-4d6b-b2bf-a3abd209e4d4@intel.com>
 <20251014165211.GR5409@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251014165211.GR5409@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: f803da9d-695d-4fa9-9ee6-08de0b9cbade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W5OL+jGC4Mhp19m5Kwb5MERQJm5oYN4mwzR43u7WLPuWC01kT2Hkr3s/hAQV?=
 =?us-ascii?Q?B8GWjIZGCilF37rSnLaiBOpe6AjFHSpHyE1jOFX9n2eFiiUiMzGONkIua3sL?=
 =?us-ascii?Q?zxXeT7Qupz+rfUE5Za2+FV1E0loEKaWc4TJszooVoomygA6HKxJ5Nmyowztm?=
 =?us-ascii?Q?eGq35+nalCE1bGz3p1fraUUQ5y9MPOxQO5tGZ38+rgPKeStrCySIbWJsVxEr?=
 =?us-ascii?Q?Rl789T0ZpvfxSAOT/L75/tPsVq8bgBsgLCTrLyzZ4UbLUZ8eFVzTKER2b1Ty?=
 =?us-ascii?Q?SdvjbRVNUOvi5dKK9bPzwgnmN9/eQSkqe9Bdy6UHonIJkG3pCmx/q9adwgao?=
 =?us-ascii?Q?Aa0IEn1SWD4nV3E7A+bYH2Hy0nng3ngl6gcb0pBbEGnK3G5fXdc5/PLHZcL6?=
 =?us-ascii?Q?LJXpU4w33zdL873h8SO0wbbMuRvZ6EpMDJgQ3hVNnexevG0mklCUA85TtC0s?=
 =?us-ascii?Q?8L0vovga9xJ7jR+tA9C0xk2CABF2rbuSR81g9oMyGPRo2klthOjYH8j03p0+?=
 =?us-ascii?Q?jplDbJpiQNC7LDmpYQPQHKZhuT9Qfg46dM0diirD40//m29vNlcuoLs9lHDV?=
 =?us-ascii?Q?YYdQOqTkgGNVaVNpJF8a3uwFGbSAp7MM0zM9QvH1p56mObu73ymEzBa4dqAY?=
 =?us-ascii?Q?AA6f9eg3wvDm+Nzt0CIUmep/YmrE0wzUlDt40Czvr51424gP4jYEIMEY03J0?=
 =?us-ascii?Q?Bn+STpU4xYOu7WRCnXHW5q2NMKdFfFeViqMkieusx9J0Whst1MPq+s8cwl72?=
 =?us-ascii?Q?SfMWWI+9j8fo2Up39wiMboT7PEgrh/a4k3jib6DGRU8O+qxwIO2iCCRzBOSs?=
 =?us-ascii?Q?tj59scTELulD0sGYv5z5eGCyGtwlVbmSb6MQMb0v1Knom3AjD2iadUnghV7u?=
 =?us-ascii?Q?+ti85XWPKi/6WZFMDi30uWbW/xbPdXl0V2CKaUWyjoVXiLxki3tfonEfNhsJ?=
 =?us-ascii?Q?dtXntXyJepOSNCewfOduQtmAYWiRnoZ7oBDx90L6R/Wp/U9gvNCRUaJxm9eT?=
 =?us-ascii?Q?srGQGWkaGpJbUlzAxEUZegfvKmRKgBuSvxbebt4POGnOjjEy8C2OqPIHdgJT?=
 =?us-ascii?Q?rOq7uC9h3tQ2uIKLBUAUxz9+170+tpld9LgwORRimgVbeL3yx+Gbh6Irz114?=
 =?us-ascii?Q?djIj/6GpBmmOK0GeCV7/XLBwfXQ9QoitantQfANRGFXpWJ/xE2Fy6ZE7U69A?=
 =?us-ascii?Q?jxyZl+3k8Xdvhu9zxCOHEIVDbW7q1OtQSyK2M1jKa8/LznB77fPcgEqqvE/r?=
 =?us-ascii?Q?CU7Om1+1bDyRIsSYHbLGSRf9N2S9kjG8OKJLz7WhgQxV+IojiXKxZ0Mdj9XI?=
 =?us-ascii?Q?o8A22UbPfwkXEl7zZLfCxWrgnoh+rdulNU3BQTRdFyc1DgaKkCQB+GgDFg3Y?=
 =?us-ascii?Q?a18ljFfUvGJ5Y6+rmrLmAwbDsTQ9Gset0kX3D1+0Bwty22+iWf2qlZzeSe7/?=
 =?us-ascii?Q?feNf2Opnph6U+reEZnMclefsb6FvT9MR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lXIhjxXIdJKJRV32EzSgbdUF+1n35bLz4qwHofx6M3swfBuIDXxEC4SkHMnv?=
 =?us-ascii?Q?myVjuyEZuQcZBhwKIztvhDT0Plo/AFZPeZSJdVOxWKsQQuE66Jvr9CDmfjOD?=
 =?us-ascii?Q?jQJarS8/DG36bFwZSkDZJoFwJPGAx+Wg7d2q3utnfqXstU/M6sO976xekLgD?=
 =?us-ascii?Q?LSSMCsdAe4+gJbQM6dl95C+qbUwChtBwYTIHIsjyYkvmti5V6wfwBLsTngJz?=
 =?us-ascii?Q?s1h2BhxhmOKQmlJYz0OYwzmh+XRCTSmr0i2eiIlV1bv/WeOhUxaioo39o4TK?=
 =?us-ascii?Q?247+rLFgnz4Ia2TIK3Be0CGDcgNxyVFzgZU8gKkT81LJr6Fdduze7/AvAYS5?=
 =?us-ascii?Q?CBUYm385jSLtwqNvNPGoPUz+ElJrD9l8g30yyHkatyE+r49Z0W0QqPX5VeTp?=
 =?us-ascii?Q?mONiCyY+0oQiTFCyyS7Hh0m0pOhYTxiyAViAMmyrjM1d3epiE73QRf+5Um+5?=
 =?us-ascii?Q?ggeFlCJPVCFvI+PzZgnxzH0FrOXyl9k+R+PMFhY/VpG3trncKZeKJFopejCx?=
 =?us-ascii?Q?qGuXECfueb0mTYhtrErbBcWV305kYzP5eakwdWFHd7lYCNhfzSUj3wdFIkZv?=
 =?us-ascii?Q?pvoBWD975TwvUvlC3OBf4PE9zbV9ThGaCNOYspeB3P3LeZnIoUDQEZgpoD1K?=
 =?us-ascii?Q?ptUj9wcQZTzPDmlDd152aLnJrqS1CVP3JYdSOszN/yWzL32QDk58dBONQOLO?=
 =?us-ascii?Q?cz43nOKSsAgLMqukkUK5OPKW2j70vo9609ctvjuAmssBlfNHkLBYxfK25p3O?=
 =?us-ascii?Q?ZfRu9iDwKkxPEjjUjs/T9UOYFKTiiuQ9KiA3ykevKFWnMDLcRJLDbMXp9HhP?=
 =?us-ascii?Q?v8yNAvtx4/szQsGIruyuZoDOnsJrZkd3Z51tNHgh8YC0mwYah8sie1ESFaTA?=
 =?us-ascii?Q?pwyEPB69F0+uYCGhLHeysKWfNivmODAQzZiTyYdR1mhM0aTRgO/Y3LQVDQOD?=
 =?us-ascii?Q?Bfg2LvI9R/pPlbrV2XcOj7YPoWGKpJoGOzKlkpiMCTgrQRSbbln+uyZoq6q5?=
 =?us-ascii?Q?b7qXpUxeqHm5Soe1Lwh8ZKGn9H0fL6nFe0NqcnDakhjQOEU/QDSrZdSfJW4K?=
 =?us-ascii?Q?+Q8Gu96joJ8fmVwEkegs0iYaBic+7TF/gDXJCDxYyzx0hmoTUc1zTgIWJNs4?=
 =?us-ascii?Q?7cAhRYsT3TdpLHEXVkh9BWBZvG5cpVOR6F+hWQWBI52omOUjgiWaMSJMxI/A?=
 =?us-ascii?Q?KrGDAYRpCSBfYvDwOGrr8wJZscuqgRbuKJ8X0nZ3MtIt6vZAK/yUihZwxBt7?=
 =?us-ascii?Q?UMVLne8trDtsQ6TG37rN0x/7j5wP3gadPOGmwj76sTmQZXAYt3hegmNX7m8P?=
 =?us-ascii?Q?vWdpeJExFpP8wz6E2EQN6EHpXpnKQ5uKCpcIgraPjdtJSdeAkOApR+lu8610?=
 =?us-ascii?Q?j3y9CwR+A89foItSJteIhgUJPUMf/pdLOKau3ibKw+qSAp+cFlsgoyB2HHAy?=
 =?us-ascii?Q?NKp32QoHWNBCRLyMvI/E9/RF+qnCLLO1mm3Yz4T9+TyXIr6eX0w/qDPhiml+?=
 =?us-ascii?Q?mmYA6zCIDIEV5agitJ57FTCdfZq/x0IOjl0kjqzPS0vYgiqTyEz9VFGa2OYP?=
 =?us-ascii?Q?1tNPVVsV6k5yGwR+KQEpAvAZTy3jS/707rMSCc5/CnhxJ4sLoQa6uDCmvMOp?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f803da9d-695d-4fa9-9ee6-08de0b9cbade
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 03:41:31.2721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBmP0PBdnY6m7+KFD8U5wIYw1uuzMNJwnMVgraKuqpg959qLpAYF+gpIV/g1GC5QEUWR/GoMsgnYk6PKKANLG9SIn+b8weDNFSFLTa1M9Wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6328
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

On Tue, Oct 14, 2025 at 09:52:11AM -0700, Matt Roper wrote:
>On Tue, Oct 14, 2025 at 05:28:48PM +0530, Shekhar Chauhan wrote:
>>
>> On 10/14/2025 8:54, Lucas De Marchi wrote:
>> > From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> >
>> > CTC_MODE register is removed by Xe3p.  Stop reading that register on
>> > Xe3p and later platforms.
>> >
>> > Bspec: 62395
>>
>> Again, maybe I'm referencing the Bspec in a wrong way, but I do see this
>> register existing for IP 35. Maybe a possible tagging issue in the Bspec?
>> Can someone comment here, if I'm missing something.
>
>So looking a bit closer based on your comment, I think maybe this should
>actually be a GRAPHICS_VER() test rather than a GT_VER() test.  It gets
>a bit confusing since the bspec website still tries to print stuff out
>in a platform-based manner, which makes it hard to follow exactly which
>IP versions and GTs are actually relevant.  In this case the first
>REMOVEDBY() tag listed is what documents the removal of the CTC_MODE
>register, but it appears that tag only applies to primary GT; the media
>GT is not included by the change referenced.  And then if you look
>through the jumble of platform names that come after that, it does
>indeed appear that media is still listed as having the register, but the
>primary GT no longer appears in the list for platforms with Xe3p IP.
>
>So maybe this is another case where we should be using GRAPHICS_VER
>instead of GT_VER.  I'm not sure it really matters too much though since
>we don't actually use the register for anything, except to complain
>about a condition we expect to never show up.

maybe at this point we should just drop the entire thing?
It's not supported for xe2/xe3, it's dropped for xe3p. It's supported
for unofficially supported platforms, but we don't really know what to
do in that case.

So I think it'd be safe to just drop the entire function and now worry
about what is the exact gt version. Thoughts?

Lucas De Marchi

>
>
>Matt
>
>>
>> -shekhar
>>
>> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > ---
>> >   drivers/gpu/drm/xe/xe_gt_clock.c | 4 ++++
>> >   1 file changed, 4 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
>> > index 4f011d1573c65..26052710be8a7 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt_clock.c
>> > +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
>> > @@ -57,6 +57,10 @@ static void read_crystal_clock(struct xe_gt *gt, u32 rpm_config_reg, u32 *freq,
>> >   static void check_ctc_mode(struct xe_gt *gt)
>> >   {
>> > +	/* CTC_MODE register is removed by Xe3p */
>> > +	if (GT_VER(gt) >= 35)
>> > +		return;
>> > +
>> >   	/*
>> >   	 * CTC_MODE[0] = 1 is definitely not supported for Xe2 and later
>> >   	 * platforms.  In theory it could be a valid setting for pre-Xe2
>> >
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
