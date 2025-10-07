Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFD3CCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 20:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A79D10E1AF;
	Tue,  7 Oct 2025 20:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTwIrd6N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D4710E1AF
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 20:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759870110; x=1791406110;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BcOvvlk+jJhBucRBuWJdQ8kCNjYoZcdev4WG6P2mBao=;
 b=CTwIrd6NiJoUZz3/wsjUfKX/zwonFncDRUhz/xXs2l0+9EImtKWwevpF
 64gUpmGFLCPhQJeRaN/r86UJaXZN/hN/1wMAb1GQpEpDBeNpLkISpXbmu
 LPD9sc6LQgPMDhLHVe65F7H5I66ewohZCGHmXQ1MzIfwrBHGFpM6ftLuu
 c+aEpef9M7AOF4pCezOp2vxbEs1jhpY9WGurNL6pnT7WGW01ADbkIn8jJ
 pZzioGTT0YT6wLIZWPCQf3yBQfvpFyhd92rONgjhynXqnNkswZrQvn20x
 9OACAiPG8pTVUelYt9ru68oHvRL0cr67GipYTHHwZtqvWAJtq9IKtGHyT w==;
X-CSE-ConnectionGUID: u8HjK41qR26Olzjx1QqOEg==
X-CSE-MsgGUID: TbaNoNpNT4Cd2eO7FRJGAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="73406846"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="73406846"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:30 -0700
X-CSE-ConnectionGUID: NR1LBd6gTCyjmdLWFzL5ZQ==
X-CSE-MsgGUID: ZCaIB15VTf2ZmzH7nb9OOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="179382098"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 13:48:30 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 13:48:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 13:48:29 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.31) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 13:48:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KI4LNLJw95W8F6UDdYgcIIzj0lNs7S7wigIh3WFODIRZJRUBAQMusGnrV7QxnX4m9l7bOmzmV/vwwat7EuosP+nd2ksATtQKUaFEUii9T2ecDF53zR3EImQj5Rm7DeKyc8S3kzJdH4EDfcjH1vDSpE0gKNop16V04CbU4qa1gd9NZxKwvckktVNMUlHHdVRJkS1zsF8Jc220HCE5U/xflZXGd1WAK1zTP5ifxh6+vWYgXH+Rk10VNGR/ytfp6CqdDr8FXsqGuCpRnEySMROOW3k1htaLVJmAuQhwdV7V6+rQOQljmb3d+0PG3HA9M/cs0gIa64sIfQCHLBQQ8lVlrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zJh3PTHkeFoGNU1fxv7Xe4bkmiT9TgvlMAv7wPy9Mo=;
 b=lzw5FWj/po4u2iyBckuTC6Y7fRbWHOd9zsiKjN6xAI8KG+rB9bLsG/HAoZYRrgx5UhqGogPmun5p2ioxVLxf84Eg3O+YfFOM74dB0+3lUJ6CmS248KEDBKosccEOMqbSUMi3USKhmzNHvdvM5ZnUvzMQBB83/c0KF4enzwWfAhB7He9gFZqV9VzRdAh7pj9DuwCxOw2JIZUO9Pk4wiOA3SqIZIf6ELz28Pv/DLKSDHI8FM6hGyLv47QMOcqupsfKZyHZoI8tywmzE7tygedE92hN7u6t56IE5w9JOjRpJQZaxbBFbLc9Oo6MVqVsa1qgD+uoitNAoltwSy3Tv5XhMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB8042.namprd11.prod.outlook.com (2603:10b6:806:2ed::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 20:48:23 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 20:48:22 +0000
Date: Tue, 7 Oct 2025 15:48:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Add max_vfs configfs attribute to control PF
 mode
Message-ID: <gvmdbjt7oxbuzrwtn4sdon4rswsycphc55kjsdpdats6nnoxad@h76gd7nkwhsw>
References: <20251002232648.203370-1-michal.wajdeczko@intel.com>
 <aOA2n4npjuprZ1hD@intel.com>
 <a148cc9f-b20e-4c93-9977-83d6ba12d379@intel.com>
 <aOQfcQ8YhgvkB3Yc@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aOQfcQ8YhgvkB3Yc@intel.com>
X-ClientProxiedBy: BYAPR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::44) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: ca9f49e4-02ea-4dd2-7cda-08de05e2da48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kILSMkO6E7jj8X82pyOobLYc4t5kje9bMUNcCyQORTpahL9vs5AzytF3TTbv?=
 =?us-ascii?Q?t0nDBDP+zUiP7ieGATLoRYnOQqW3BbmHtyXjd4oNBCtFvqZp1PhNlB4PJ+wS?=
 =?us-ascii?Q?80R/wXglV86ZeRGKo7i5oJ8tKhHKMt4Foz01gVOVNiVHovfgubOIBshTcVcX?=
 =?us-ascii?Q?H+wGosWD+4e81gcLXVXHrFDkOLRRNBhp33YSprPk/B2tRuaqpA1XdZf9QbK1?=
 =?us-ascii?Q?7SROmNxsrPJsz6FZFzzbnFrV1tTTU3DpmLHbJNNI36r7sgiC3RXxEUPZ1TZA?=
 =?us-ascii?Q?bRUxY07SIqFXHFp+F/VFvpJqpHheXM2CacjQO/vnlu5nSjn08zRrLCLlSsgq?=
 =?us-ascii?Q?T0+ZDxCUaUwaJaldAZVAdpRwrxBPGkulMtPmboFwkrKlmemjF5kCLsPawxsH?=
 =?us-ascii?Q?IkjUfcICgdCJXd9Dpi9o3tDYe3Qi52rbOTCGS23DruqdTjt6Zp/jZTxFc0yI?=
 =?us-ascii?Q?MzdUy11Y4xAhymqnUcFMCR7w+mCgtpYuBuYXZfZeFkP6vdknHVkcxm9JJwJP?=
 =?us-ascii?Q?IJ+OVHQ/6RqwjAjXJfaXxuxIqGr6dEQFwcCdm0PZffCG8E/QISR5RN2+F2Es?=
 =?us-ascii?Q?dWJg7nrNZx75z7KU1tZw3+9XcK378dZUyadJm4XL3LK4V9oOFahWa3hAoavd?=
 =?us-ascii?Q?ikQU0NdUPjWdJKSerGSLlJqgxjioTDdpij2QmXVEHfdi4SZJpLjTpzk0Oftk?=
 =?us-ascii?Q?n6oDGsefYm8wa0j7rdbEv/O8Jm7FWF2NqxdhUPA0mD1VFxUmRfSz7rUaMxFg?=
 =?us-ascii?Q?GLLmsA8np0JPFj+2LHUl69c6WEbWBOe2Sl39eavt3vbinbyPc768Jn5CTq/m?=
 =?us-ascii?Q?6uTfQaBlVURvb3yxo+xNOzjPJXG55P7l3K8ts1m2glcbfKqWWErSTtImvZtj?=
 =?us-ascii?Q?dAlz6CPRdstJmg7iQKlEJ0nmfMYn5DFqM2ypz+LXlD62pxYp1NzC4FIG5Ld1?=
 =?us-ascii?Q?2TQ5pE/TSXMkpYTfFNMCG1U6PPuzwLYl6NV9KR5j8nwYoXJSRVFIHpaProJM?=
 =?us-ascii?Q?q4RCii/ndmcLQ2aal59m1Two1LR3YNN2JF+3ao8RYfBwtZKnFfb1i/S7zbWV?=
 =?us-ascii?Q?Z4hA4Zi8ipK834AGQcUEznbHH6bI5oWEAFlds5JXsjQmYm528iKmiqfrMKHF?=
 =?us-ascii?Q?jVZL4zkqPdC5CM1BbQ452YO46TrctyoyFCAtHOqwMzI0/WF0lyyG1++jj1/f?=
 =?us-ascii?Q?sSQAERrZHYBCriCZfNd/SgCx0NblrIc/RdaxGFDelh1jxxXFSe8lu4f9Fmpm?=
 =?us-ascii?Q?ZuPEcS06G4k+p04GvTZuZ2CaotekfAcFi/OqSsTSUezfx5LkKgjAEKBIJ7qS?=
 =?us-ascii?Q?FFRz8hK8mG1Stj/FWlh+8kaEciIJe+6cogMmlNNFczANg3F+f6B83Har8pFr?=
 =?us-ascii?Q?Txzx0FaOaGQFJwOw5UIKwUF+YvKm0bMJpKuMG1a6Gb4hhH5A562c4HpDjLk0?=
 =?us-ascii?Q?//o++UFjLMBVgrwPJ2bWUVAO65JcF0SZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EXaJWAmYPLAnP0FW77yLfwyxAzEAWlPavda9Uktk5mdvMZaI1pfEXDp3wFE+?=
 =?us-ascii?Q?6WhtY6egfVmEa8BiOczaVvQkumamet6ls/yyvrwrw7Xz7qOPaqB4jG8wiOCd?=
 =?us-ascii?Q?NDDJOZB75OyMbAR6RM6cKnFgQtx0wbFM23sP+rPshP7pr/LhbRn/O7Yue7HI?=
 =?us-ascii?Q?Ky56pDB7ILLrACB+GjzfKUX4u6emrQZxzQ/8/H2rE2+J5tUJhO1Cyc2X+pLY?=
 =?us-ascii?Q?U4+5wzQo/i+lMjfS3bYS9qyFfvb165h4uzBFCgVuhFbXblbtam5s1zAKtV/a?=
 =?us-ascii?Q?mxyZxKvzr/Whi6T4H9HBiW6gWiGWlbchOjy6TX0888xv14EPBVflG+64h8wI?=
 =?us-ascii?Q?HRLbbkVu0a7HMnyag4cfQ5l0G2326K6zHzEHubfwrvyewTzZQpByGj4pZ4jD?=
 =?us-ascii?Q?dvLkBebpDVs7+akHl/xlRNaPMdn4ueBuvAm6+xF0fM+6L/cNCjkTIHzQSfxe?=
 =?us-ascii?Q?cFCEpmGjLS1JVLE/H/jHtuUw0qD4D1qkpRVC8+nZ6tzLNEGmjgCndz4ow12Z?=
 =?us-ascii?Q?s4OFFR4nMhqKMXtqRsm0y7IKRO6oF/LoG2hr/p55EBJoyS73C7CIcXM7OKWC?=
 =?us-ascii?Q?kj7VFipvIuoScs9KOWGbB7sDHDrRlFr20D1QHgV7BW3QQCGOSl/M2iFdn3mQ?=
 =?us-ascii?Q?kWBL+qTutTF6+ym2hXOd6mrt/0ha0ZdUch/hkpITPyjsKqbYdeVtCumUsS5W?=
 =?us-ascii?Q?hM99PLDDNoRAaDkp7YPCRcpaRN04FXqHz2DCv7Tl0m2b4hbdzGBw0INgD33M?=
 =?us-ascii?Q?j02BMOp1FGCnGElBqKY5GiMnaiW2TkqmZJtEqJKbiiOGVKaUp8z2Vh4tvHbo?=
 =?us-ascii?Q?q8DVYEq3CULYC75IaIQzi7+nL+AGrUF/eBVpI4cSh6FPmt/Jp7R6C5iQ6STP?=
 =?us-ascii?Q?CSg2aKXGtuMFakJnmWnR+eKVIURBpi7OPpNubjI0FGBbfKSOXAL2p/4d9KlK?=
 =?us-ascii?Q?E/Pm8fH6QDVTJZ4F8KnuPWPXhfQmk+Fc8/pQnbd3VCpA9j1rLq7r2UCGveN9?=
 =?us-ascii?Q?1s8pxG8H5Q75owLD9dUpmB3f7bbE2HEmkpNiEGkw8NQnE7UO5DkFg4amHfV5?=
 =?us-ascii?Q?qHhfDCtLs/uyIW3lB4qy7ilej8qD/dQjhs00Ve1dl6gM22KSHstHVPBfAw5g?=
 =?us-ascii?Q?YKpRBCRQhFMHj39Z7rxsTVxEHC47iBJWsNuAXY5xqQBNVsToXYQUfTFYipQQ?=
 =?us-ascii?Q?fY6TFkoWpDhuB6+5Z47CMBlQzLVxCRonqeatonMALaMzPpGK1ZllRWA7pKkP?=
 =?us-ascii?Q?jFGTM2kCxYtESf+PuwBkUFnxnslTJLSzIhEQ/khXFEgx20XIcaj7NLxKfoZS?=
 =?us-ascii?Q?8vfb4DfhxH9BW4sDVkZkopmg2yjtrPkUQs7Zn7wTP3jKqfDx67FbieBfvWHR?=
 =?us-ascii?Q?G00SzotYG4QHlGxAQSo5DRGTGWhx+ccOqZskPMxzYkvYYPNhffWN1UYmg9TR?=
 =?us-ascii?Q?otYCMtwLScrSsRNEUMb63O/kFbn0tXrinfP6/AscHAbB1JViYkJs8S76mjzA?=
 =?us-ascii?Q?jVj6uVntuZ3AODFyKWsa2jlnPiD2netdiwysVALdc7SFhHkxliGTGFhnxpdV?=
 =?us-ascii?Q?JlGAKy/BMByEDiD7fyYo7G8FDWjEqhdIweF9AQtJjCnZWJEjYf37X3gURP91?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9f49e4-02ea-4dd2-7cda-08de05e2da48
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 20:48:21.8690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dU76Gd0Shrc3st1BGlTTr0Ei4/Z8tqOpa39xPnz6eV1se9QAf3OvFwE5yp78lYaWmBcQMuETxFJaHgLG+Pohazop8Lo56SjBQruVoWLv648=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8042
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

On Mon, Oct 06, 2025 at 03:58:41PM -0400, Rodrigo Vivi wrote:
>On Fri, Oct 03, 2025 at 11:06:21PM +0200, Michal Wajdeczko wrote:
>>
>>
>> On 10/3/2025 10:48 PM, Rodrigo Vivi wrote:
>> > On Fri, Oct 03, 2025 at 01:26:48AM +0200, Michal Wajdeczko wrote:
>> >> In addition to existing max_vfs modparam, add max_vfs configfs
>> >> attribute to allow PF configuration on the per-device level.
>> >> Default config value is still based on the modparam value.
>> >>
>> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> >> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> >> ---
>> >>  drivers/gpu/drm/xe/xe_configfs.c | 139 +++++++++++++++++++++++++++++++
>> >>  drivers/gpu/drm/xe/xe_configfs.h |   4 +
>> >>  drivers/gpu/drm/xe/xe_sriov_pf.c |   3 +
>> >>  3 files changed, 146 insertions(+)
>> >>
>> >> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> >> index 139663423185..464a79c2a903 100644
>> >> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> >> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> >> @@ -18,6 +18,7 @@
>> >>  #include "xe_hw_engine_types.h"
>> >>  #include "xe_module.h"
>> >>  #include "xe_pci_types.h"
>> >> +#include "xe_sriov_types.h"
>> >>
>> >>  /**
>> >>   * DOC: Xe Configfs
>> >> @@ -169,6 +170,32 @@
>> >>   * Currently this is implemented only for post and mid context restore and
>> >>   * these attributes can only be set before binding to the device.
>> >>   *
>> >> + * Max SR-IOV Virtual Functions
>> >> + * ----------------------------
>> >> + *
>> >> + * This config allows to limit number of the Virtual Functions (VFs) that can
>> >> + * be managed by the Physical Function (PF) driver, where value 0 disables the
>> >> + * PF mode (no VFs).
>> >> + *
>> >> + * The default max_vfs config value is taken from the max_vfs modparam.
>> >> + *
>> >> + * How to enable PF with support with unlimited (up to HW limit) number of VFs::
>> >> + *
>> >> + *	# echo unlimited > /sys/kernel/config/xe/0000:00:02.0/sriov/max_vfs
>> >> + *	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind
>> >> + *
>> >> + * How to enable PF with support up to 3 VFs::
>> >> + *
>> >> + *	# echo 3 > /sys/kernel/config/xe/0000:00:02.0/sriov/max_vfs
>> >> + *	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind
>> >> + *
>> >> + * How to disable PF mode and always run as native::
>> >> + *
>> >> + *	# echo 0 > /sys/kernel/config/xe/0000:00:02.0/sriov/max_vfs
>> >> + *	# echo 0000:00:02.0 > /sys/bus/pci/drivers/xe/bind
>> >> + *
>> >> + * This setting only takes effect when probing the device.
>> >> + *
>> >>   * Remove devices
>> >>   * ==============
>> >>   *
>> >> @@ -185,6 +212,7 @@ struct wa_bb {
>> >>
>> >>  struct xe_config_group_device {
>> >>  	struct config_group group;
>> >> +	struct config_group sriov;
>> >>
>> >>  	struct xe_config_device {
>> >>  		u64 engines_allowed;
>> >> @@ -192,23 +220,34 @@ struct xe_config_group_device {
>> >>  		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
>> >>  		bool survivability_mode;
>> >>  		bool enable_psmi;
>> >> +		struct {
>> >> +			unsigned int max_vfs;
>> >> +		} sriov;
>> >>  	} config;
>> >>
>> >>  	/* protects attributes */
>> >>  	struct mutex lock;
>> >>  	/* matching descriptor */
>> >>  	const struct xe_device_desc *desc;
>> >> +	/* tentative SR-IOV mode */
>> >> +	enum xe_sriov_mode mode;
>> >>  };
>> >>
>> >>  static const struct xe_config_device device_defaults = {
>> >>  	.engines_allowed = U64_MAX,
>> >>  	.survivability_mode = false,
>> >>  	.enable_psmi = false,
>> >> +	.sriov = {
>> >> +		.max_vfs = UINT_MAX,
>> >> +	},
>> >>  };
>> >>
>> >>  static void set_device_defaults(struct xe_config_device *config)
>> >>  {
>> >>  	*config = device_defaults;
>> >> +#ifdef CONFIG_PCI_IOV
>> >> +	config->sriov.max_vfs = xe_modparam.max_vfs;
>> >> +#endif
>> >>  }
>> >>
>> >>  struct engine_info {
>> >> @@ -721,6 +760,68 @@ static const struct config_item_type xe_config_device_type = {
>> >>  	.ct_owner	= THIS_MODULE,
>> >>  };
>> >>
>> >> +static ssize_t sriov_max_vfs_show(struct config_item *item, char *page)
>> >> +{
>> >> +	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
>> >> +
>> >> +	guard(mutex)(&dev->lock);
>> >> +
>> >> +	if (dev->config.sriov.max_vfs == UINT_MAX)
>> >> +		return sprintf(page, "%s\n", "unlimited");
>> >> +	else
>> >> +		return sprintf(page, "%u\n", dev->config.sriov.max_vfs);
>> >> +}
>> >> +
>> >> +static ssize_t sriov_max_vfs_store(struct config_item *item, const char *page, size_t len)
>> >> +{
>> >> +	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
>> >> +	unsigned int max_vfs;
>> >> +	int ret;
>> >> +
>> >> +	guard(mutex)(&dev->lock);
>> >> +
>> >> +	if (is_bound(dev))
>> >> +		return -EBUSY;
>> >> +
>> >> +	ret = kstrtouint(page, 0, &max_vfs);
>> >> +	if (ret) {
>> >> +		if (!sysfs_streq(page, "unlimited"))
>> >> +			return ret;
>> >> +		max_vfs = UINT_MAX;
>> >> +	}
>> >> +
>> >> +	dev->config.sriov.max_vfs = max_vfs;
>> >> +	return len;
>> >> +}
>> >> +
>> >> +CONFIGFS_ATTR(sriov_, max_vfs);
>> >> +
>> >> +static struct configfs_attribute *xe_config_sriov_attrs[] = {
>> >> +	&sriov_attr_max_vfs,
>> >> +	NULL,
>> >> +};
>> >> +
>> >> +static bool xe_config_sriov_is_visible(struct config_item *item,
>> >> +				       struct configfs_attribute *attr, int n)
>> >> +{
>> >> +	struct xe_config_group_device *dev = to_xe_config_group_device(item->ci_parent);
>> >> +
>> >> +	if (attr == &sriov_attr_max_vfs && dev->mode != XE_SRIOV_MODE_PF)
>> >> +		return false;
>> >> +
>> >> +	return true;
>> >> +}
>> >> +
>> >> +static struct configfs_group_operations xe_config_sriov_group_ops = {
>> >> +	.is_visible	= xe_config_sriov_is_visible,
>> >> +};
>> >> +
>> >> +static const struct config_item_type xe_config_sriov_type = {
>> >> +	.ct_owner	= THIS_MODULE,
>> >> +	.ct_group_ops	= &xe_config_sriov_group_ops,
>> >> +	.ct_attrs	= xe_config_sriov_attrs,
>> >> +};
>> >> +
>> >>  static const struct xe_device_desc *xe_match_desc(struct pci_dev *pdev)
>> >>  {
>> >>  	struct device_driver *driver = driver_find("xe", &pci_bus_type);
>> >> @@ -746,6 +847,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>> >>  	unsigned int domain, bus, slot, function;
>> >>  	struct xe_config_group_device *dev;
>> >>  	const struct xe_device_desc *match;
>> >> +	enum xe_sriov_mode mode;
>> >>  	struct pci_dev *pdev;
>> >>  	char canonical[16];
>> >>  	int vfnumber = 0;
>> >> @@ -762,6 +864,9 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>> >>  		return ERR_PTR(-EINVAL);
>> >>
>> >>  	pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, function));
>> >> +	mode = pdev ? dev_is_pf(&pdev->dev) ?
>> >> +		XE_SRIOV_MODE_PF : XE_SRIOV_MODE_NONE : XE_SRIOV_MODE_VF;
>> >> +
>> >>  	if (!pdev && function)
>> >>  		pdev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, 0));
>> >>  	if (!pdev && slot)
>> >> @@ -796,9 +901,15 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>> >>  		return ERR_PTR(-ENOMEM);
>> >>
>> >>  	dev->desc = match;
>> >> +	dev->mode = match->has_sriov ? mode : XE_SRIOV_MODE_NONE;
>> >> +
>> >>  	set_device_defaults(&dev->config);
>> >>
>> >>  	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>> >> +	if (dev->mode != XE_SRIOV_MODE_NONE) {
>> >> +		config_group_init_type_name(&dev->sriov, "sriov", &xe_config_sriov_type);
>> >> +		configfs_add_default_group(&dev->sriov, &dev->group);
>> >> +	}
>> >>
>> >>  	mutex_init(&dev->lock);
>> >>
>> >> @@ -988,6 +1099,34 @@ u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
>> >>  	return len;
>> >>  }
>> >>
>> >> +#ifdef CONFIG_PCI_IOV
>> >> +/**
>> >> + * xe_configfs_get_max_vfs() - Get number of VFs that could be managed
>> >> + * @pdev: the &pci_dev device
>> >> + *
>> >> + * Find the configfs group that belongs to the PCI device and return maximum
>> >> + * number of Virtual Functions (VFs) that could be managed by this device.
>> >> + * If configfs group is not present, use value of max_vfs module parameter.
>> >> + *
>> >> + * Return: maximum number of VFs that could be managed.
>> >> + */
>> >> +unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
>> >> +{
>> >> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>> >> +	unsigned int max_vfs;
>> >> +
>> >> +	if (!dev)
>> >> +		return xe_modparam.max_vfs;
>> >> +
>> >> +	scoped_guard(mutex, &dev->lock)
>> >> +		max_vfs = dev->config.sriov.max_vfs;
>> >> +
>> >> +	config_group_put(&dev->group);
>> >> +
>> >> +	return max_vfs;
>> >> +}
>> >> +#endif
>> >> +
>> >>  int __init xe_configfs_init(void)
>> >>  {
>> >>  	int ret;
>> >> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>> >> index c61e0e47ed94..16a1f578e4fe 100644
>> >> --- a/drivers/gpu/drm/xe/xe_configfs.h
>> >> +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> >> @@ -23,6 +23,9 @@ u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_clas
>> >>  				       const u32 **cs);
>> >>  u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
>> >>  					const u32 **cs);
>> >> +#ifdef CONFIG_PCI_IOV
>> >> +unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
>> >> +#endif
>> >>  #else
>> >>  static inline int xe_configfs_init(void) { return 0; }
>> >>  static inline void xe_configfs_exit(void) { }
>> >> @@ -34,6 +37,7 @@ static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum
>> >>  						     const u32 **cs) { return 0; }
>> >>  static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
>> >>  						      const u32 **cs) { return 0; }
>> >> +static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev) { return UINT_MAX; }
>> >>  #endif
>> >>
>> >>  #endif
>> >> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
>> >> index 4698348c010a..428b1b62cf48 100644
>> >> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
>> >> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
>> >> @@ -8,6 +8,7 @@
>> >>  #include <drm/drm_managed.h>
>> >>
>> >>  #include "xe_assert.h"
>> >> +#include "xe_configfs.h"
>> >>  #include "xe_device.h"
>> >>  #include "xe_gt_sriov_pf.h"
>> >>  #include "xe_module.h"
>> >> @@ -19,6 +20,8 @@
>> >>
>> >>  static unsigned int wanted_max_vfs(struct xe_device *xe)
>> >>  {
>> >> +	if (IS_ENABLED(CONFIG_CONFIGFS_FS))
>> >> +		return xe_configfs_get_max_vfs(to_pci_dev(xe->drm.dev));
>> >>  	return xe_modparam.max_vfs;
>> >
>> > I like the idea of the configfs, but this here is strange.
>> > shouldn't be better to simply remove the modparam?
>>
>> well, I just wasn't sure what will be our approach here, since all our
>> current configfs entries were just new options, never existed before as
>> modparams, while this max_vfs is the only new one config that previously
>> was defined as modparam, that some users may still rely on.

I think going forward the modparam may be useful to signify things the
module implements, that shouldn't be different from one device to
another. In future we maybe could replace max_vfs with sriov and default
it to 1.

We can do that later though. Let's keep the max_vfs for now as it's an
easy way to enable/disable the feature if passing =0 or =-1.

>>
>> so my approach was to use modparam value as initial default configfs value
>> for all devices, or immediate fallback if configfs is not available
>
>I had missunderstood the flow here. Thanks for the patience and all the
>offline explanations.
>
>>
>> just need a clear statement
>
>Well, I'm afraid we don't have a clear one-rule fits all.
>
>In this case here, as you pointed offline, if we have desktop case like
>igfx, admin might prefer to set on boot and not depend on unbind for
>setting the configfs.

I don't think we should document the unbind as the expected way to
handle things. It should rather be by separating the module load from
module bind phases.

>
>>
>> note that there are few other modparams that should be promoted to
>> configfs (like guc/huc firmwares) and I assume the same rule will apply
>
>while on this case perhaps it is something that we want as a police for
>the module and all devices, not a per device in the system.
>
>So, let's move with this patch as is and we handle and evolve case by
>case as needed and as it makes sense individually.
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Agreed,

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
>>
>> >
>> >>  }
>> >>
>> >> --
>> >> 2.47.1
>> >>
>>
