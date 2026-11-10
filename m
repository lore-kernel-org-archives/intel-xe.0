Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BFB606A202
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 16:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K2d0dtng
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E60610E035;
	Tue, 10 Nov 2026 16:42:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA4110E035
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 16:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794328924; x=1825864924;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yUIZH2euVIwSoP5PedK0INugctoy3LMw8PCtnCu0kF4=;
 b=K2d0dtngB2Kp98pqzCX7ecwhiHzMJ6uInClBFvd89hai769WkAbQZbWc
 D6uReT9EIMBC4GAsRxANPcG50UBVh1M3i5DRotb3XOVgHfI0uPdRoG1T8
 ZI2EfvJrpbXh8FY+VwtfW7pqYh5mQgW+yyOyAf+qvqsY64zBx3jSuGKb7
 +HBNdkhipVBtTlI8UidNI118yHMMnwctZ94OwpKFp0K06+qXzQOABybMQ
 DgLbbIP8IvrYFQ+W5UcxzEvv5iWhn5ISxGA3FOhmuFM2wGqmFvaqLHYQL
 PhGeDT9ufobNtPnfh0jeWvHwPiWnquH+2msdoe2fp+fhTshf2hTZ1pQ3x g==;
X-CSE-ConnectionGUID: RbLkbxveTnO4BIBs/+zcFg==
X-CSE-MsgGUID: SHlJ70l+RwiF+SAXh8Z0FA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2957519"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2957519"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 08:42:03 -0800
X-CSE-ConnectionGUID: ENGtEhx8SDGWybEZQOM52Q==
X-CSE-MsgGUID: hR6WWmbwQ7GjP4zXxcDM3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8200344"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 08:42:03 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 08:42:03 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 08:42:03 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.57)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 08:42:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggH53Et7NFai6a4xHR2ArfssXXvBPLReQ0EBoebryvpxiLSKGoZoIJ9Cn6fFNt/nPZ/S7ODXuNeCefuLf5jORSYZL21SF/UjM1RCvp9yZ8WOS08s4TWeOQ1gq74jtMiv7/2X+yVLL1bZGgGTHbb5Z3I9veF9/t0s00KD+qro8LdYgJMRl3HzLBBhZqjQXl78hOl79WvoV4Dqr/3QMZI8/MFoEsFKe0KfFR5aCyDSnzezfQjkXpHJ5bOu4JDmt25wH+mlh7BzmqK7U0ibyHxptIfdEZVhS4EAp4XqE79BXlpjkVAPhz5AptGc2SbBbSYQyGZSbqvTtqqPmqTS83usgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CcxLZovhxkNmceTeYe4cS03G60UW97dZKRCAh4NFnE=;
 b=rmG8Iirik5luuSBkDrKDVKAHpc+nX5LwPnxrWXphRVDDWu2hvt6pWOLUVXnx+YBtl4RJwX9vP9fnBS5qAxJ1EQAtRIZ2TtK78bjndG43ZDpA/3kS3AHtSk7mbErWrgY4D/tI99Dp1ChlJHVuqXJOPSvkNIARQpo1tT0bMF+HEHBBjqjgPYJqX12m4BWg9X8AmcwwlrdLD5YFnrvVwmjsR+2Tixfv0pI0lrR9d2jcisX0yrDMrIuIiK0lQGBG1iKzwGNeuPFEmOS7/ram4+d8II6BVoslXccK85isBv7cSWBSxcNPA3ZNPo7gO+F2cKYZyBXrGBwmQNZen9PwRQdISw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by CH3PR11MB8383.namprd11.prod.outlook.com (2603:10b6:610:171::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 16:41:53 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 16:41:53 +0000
Date: Tue, 10 Nov 2026 11:41:48 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
Subject: Re: [RFC] drm/xe/ras: Report one SIGID per device memory error
Message-ID: <avNJTNWehTuBaFVL@intel.com>
References: <20261109161733.3769906-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261109161733.3769906-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0201.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::26) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|CH3PR11MB8383:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a86d485-d2c4-4312-8f6c-08df3f498643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|6133799003|10067099003|261021121427099003|56012099006|261009223027099003|11063799006|261022105027099003|261028144727099003|261102123227099003|261022075727099003|261022113327099003|261026140227099003|261021123027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: 2pFVX1RshQDd2pIlnizi5W21bBEvrsxUo28nyEQyVPE6J+SmL2NqrPl0D3zCkQtmX7GE1KJrjCtu4UCeRCd8F7yfe5p9VFLFfwQR2SezLiWUqGrnL4KNaKAgeKNuTQ1rjE7C2dewFHQdlDh8oEGGWX0duL7OC60/zTo6+U/LtUP8KYGQfH8SNSJRXoP6DJm8fD4SqGev0eGR7MQW8xyqhBotw6C4+BBaXKk433HNvo3TS+oLi79kRj3asuxfwQRvKuIRK7+cofGH8beckBDhyWCxBFOalkjbXLvrV96pPpZ6eamJdQ+Y8UT0/JaBPbIl1EPuvFNavA3/JBPHnxLp69kr6u8xCyCa+wZoO7ij4ViNS7yLf25bJQkri/EQDSGVxEAWBJqLKT1A47q5/Bzv7zApHKYFWKnY/rZqn2sg/MIkJ55VS/J86S/E/tvVB1bG9FSESB1fIFBdTk05fjKGJ6V82hvDCUFwum1R0BlXopDLs2x8knXdhwaTYDye22qjD9JJSkRmUo8OhCHnI215ka1vQZD8J/h4lIwC0gWNMztAt1v279f6adWAbeTL9w28QOD7kpgIJBnh57KLKGWHpIY63ZkeXstnt3l+ccG+CoLt2Tadop7HxyV++hYU4Re0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(10067099003)(261021121427099003)(56012099006)(261009223027099003)(11063799006)(261022105027099003)(261028144727099003)(261102123227099003)(261022075727099003)(261022113327099003)(261026140227099003)(261021123027099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6n8CumXyhaMJrZ0sYuo8qOXycvR68N/oR4tYRuwhoNSIxbKEGFPQhG8++vD7?=
 =?us-ascii?Q?EP4wm4VSpl96wF0+Zc10lU3asUcE7cxJGUNTDgUKnAUlbhs9luO8oVXmIZ/8?=
 =?us-ascii?Q?5cN1X/L2H4Aa80Hq7EIooGFb6E/T+Sf68s8maV0i7M05LDZdqFuSB5jUk/+N?=
 =?us-ascii?Q?7Mt13xe+Sey1csFYoNg56LDIFEWEOQBAgRLrno6kXNYv9/hTft/uV0ByqqLD?=
 =?us-ascii?Q?woKDcA6zG7Vyniw27uVt9jdy62T3G6Mum0BFkTOkRMFDqYdZDYqqW64qFfAz?=
 =?us-ascii?Q?ONgIO1HvdE3DkFziS7HirW00rWSYO4EEbp3/obeSv3//5Sh75HwOdj7AjSS9?=
 =?us-ascii?Q?galFTuAroSKhC4Jcw6AEhiIV3Qx8VgQOf3MdWxnnWzkpLVyr6Eo7yg/al+pO?=
 =?us-ascii?Q?2zoaPHRPtfeqKd7fRBUcryndp1X9yLfAEp0Dl4Wi7uirsfNmfnD8d7wcPEaZ?=
 =?us-ascii?Q?jkSQWHatlZ1w0F9KFjNHYIonbeL0HxWtGpb+CkH5slaja8KaM06Mzc9GuLhk?=
 =?us-ascii?Q?3U5RrEJeuLPVYX5qHwqhWlYYC4lfUs4elhCQEHRLPhPGgsBZUzsU7A+Rz/Ke?=
 =?us-ascii?Q?9yimYHM5BlEKRhWzcI7umr+0ZxVIyYA2RLE0TskCxH6m6ca+7p4r0je9zMjO?=
 =?us-ascii?Q?lXw/Nxo66AQ2iKreEpyjfKjyRI3TV0c0mRuxWRP5E6BMgk88n9IazlLflAGg?=
 =?us-ascii?Q?SMPlaxlmAh8gqHHqAmSm8YMNGJTViUU64oWcPLqw3zG9DwKXep7H0+qjw7EN?=
 =?us-ascii?Q?S9AibuW6im/COySQIyPvH+7JkiU7v79Uxdf/ZC6hE9fjyPGb8KzXBgmXF8lT?=
 =?us-ascii?Q?RgTQsBHAenSbjUjNGfFwPPC4XbQ09BjBO8pKFzNRV+fyN8ALnGisvHDbypmT?=
 =?us-ascii?Q?nJtPjg+HIv/cvI2qO5yk5Nj4gFPRyqXpYmP2ziyQRwvWc11prYepoSIjxZ3i?=
 =?us-ascii?Q?79u2CSrAaVTjItbrWXvp8w5JkvkDB6E1lpNRifLSCBAXMe1BZK+1UUGxY7UP?=
 =?us-ascii?Q?//3jL4gVHDKi+Tvf0B6nW8kTSEXcaZs4Szn11DDn7shioVknhMtpG8t9bUJQ?=
 =?us-ascii?Q?3gYoCBejVOUbtewWSylZKrbSiI/d1kFsZaHFxWs20bYduzWoNULYfD3f8ivo?=
 =?us-ascii?Q?qy2eF++H2B6aOpFtraTqR+gd/ydIXCR2kNkEK/QBfUcc+TjvLVucmOlbaQ5R?=
 =?us-ascii?Q?eXUWhmUt4vFG7c3z9ruVWMhfwAhWFm55Tymz/Ch/wcqqFMWjg0VdH0k0GqgP?=
 =?us-ascii?Q?InuNhLyFf3xjgHeZ5wdmQT+MJ+NBSHSgvsRoVVWv4YNhnX0TxoDy9MjJFJMk?=
 =?us-ascii?Q?uedb8QfNF9bNNIyeOsHhQIgkAELOqznl+4tNOickndEfQYKUyhfbSoUu0lW3?=
 =?us-ascii?Q?ab0acZP5HC41aLKEbFYNUOya7KSm6mHZaCmIlQxAe8l6Vpm3RyjWHCtj2/z/?=
 =?us-ascii?Q?T1x3rsAB2lKnYb4ryBDsKs2EPB+86IYo4lHqGC4YotevhtLzGR0kMFDMknmd?=
 =?us-ascii?Q?uEMrj4l7w9oM2rQ6oelsZK7mACusAA8zMshQpr0gaKbaVi0mQfTqqf8r1I7e?=
 =?us-ascii?Q?MyOdxs6mO6ZZRCmoIoI6EjuEPCT9Rgozns+s9cWXgebRqysbTfV2FxkdV1s+?=
 =?us-ascii?Q?YVC71b4EmiBuwwvAPs1vt9C7BpIgBSeYLVWlfY/H7WPPJjuEdHF3saHJ2RgU?=
 =?us-ascii?Q?kO1E/3AyKkOqSL9Xx98KdM5q5NYtD+j2/usHz2I57F2LJngTp/rdXLcYxxV5?=
 =?us-ascii?Q?1wnFPNZa9A=3D=3D?=
X-Exchange-RoutingPolicyChecked: qrJ7JXRPAlZpojE3vY52zg4FOx97H5Jr7rngAKWC6i48ggiPgN0Vf+h99vJsP36CimQRQe5ZrODt2Aa/1AAPDGNBh/A27K5btGOxmivKzrru+4EtYvJ1chDG5holP9PPIl7CJcu9U7UqeRIb6e5FJ1431kfsOaNvx4Ja+ND0t5XBK+x9bEQn0PW2+WpDvCD04CUIbuPY9pHginSMHWFnV+LJabBdWnblSIfzp4zuHMjXXr3j6mUnI7RHolqGN+n2Xz1mTrV8kJRMlilpVLqaQHwdy2Ggd+2DOvxNU24s/WW3maEKS5mXd5mQgNKONvHeIqQKVMpXBTqgMrUYo0XaxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a86d485-d2c4-4312-8f6c-08df3f498643
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 16:41:53.1194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SfDz+eskUDjGj1Rrv/0sRhS3jAoR+XGyuV9A5yt9aYmUjz+X/eLufGtfUbenwLk7DZ0fo7/ScoFnjxOiD+J71A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8383
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 11:17:34AM -0500, Rodrigo Vivi wrote:
> handle_page_offline() logged each step as SIGID 202 RECOVERABLE, so a
> single double-bit ECC error produced several 202 lines whose severity
> disagreed with the CPER record emitted by handle_device_memory_errors().
> 
> Log those steps without a SIGID and leave the caller's 202 with CPER as
> the only report. Firmware failures keep SIGID 105.
> 
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> 
> AI generated and untested.
> 
> Aiming to solve the discussion:
> https://lore.kernel.org/intel-xe/520a56ea-40a6-47bd-84a0-be5cf604e5e7@intel.com/#r
> 
> I agree with Badal that we should reduce the noise in the mempage-offline
> that is only bringing multiple entries of the same and then emmit only a single
> SIGID and a single CPER for it.

Please ignore this and let's focus on a real one that has the same goal:
https://lore.kernel.org/intel-xe/20261104090701.1748619-2-riana.tauro@intel.com

Sorry for the duplication and the noise. I just noticed this other one just
now in my inbox.

> 
>  drivers/gpu/drm/xe/xe_ras.c | 32 +++++++++++++-------------------
>  1 file changed, 13 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 2c01c183d02b..5b13daf972ba 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -269,11 +269,9 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
>  	request.action = action;
>  
>  	if (action == XE_RAS_PAGE_ACTION_OFFLINE)
> -		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to offline page 0x%llx\n",
> -			   page_address);
> +		xe_dbg(xe, "Requesting firmware to offline page 0x%llx\n", page_address);
>  	else
> -		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to remove page 0x%llx from queue\n",
> -			   page_address);
> +		xe_dbg(xe, "Requesting firmware to remove page 0x%llx from queue\n", page_address);
>  
>  	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
>  				  &request, sizeof(request), &response, sizeof(response));
> @@ -326,7 +324,7 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
>  	/* User policy set to disable page offlining */
>  	if (xe_ras_get_disable_vram_page_offline(xe)) {
>  		action = XE_RAS_PAGE_ACTION_REMOVE;
> -		xe_log_err(xe, DEVICE_MEMORY, -EOPNOTSUPP, "User policy set to disable page offlining\n");
> +		xe_info(xe, "User policy set to disable page offlining\n");
>  		goto notify;
>  	}
>  
> @@ -346,14 +344,12 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
>  	switch (ret) {
>  	case 0:
>  		action = XE_RAS_PAGE_ACTION_REMOVE;
> -		xe_log_err(xe, DEVICE_MEMORY, ret,
> -			   "Poison detected at physical address 0x%llx, page soft-offlined\n",
> -			   page_address);
> +		xe_info(xe, "Poison detected at physical address 0x%llx, page soft-offlined\n",
> +			page_address);
>  		break;
>  	case -EIO:
> -		xe_log_err(xe, DEVICE_MEMORY, ret,
> -			   "Poison detected at physical address 0x%llx, page belongs to critical BO and cannot be soft-offlined\n",
> -			   page_address);
> +		xe_err(xe, "Poison detected at physical address 0x%llx, page belongs to critical BO and cannot be soft-offlined\n",
> +		       page_address);
>  		return ret;
>  	case -EEXIST:
>  		if (xa_load(&state->offlined_pages, page_address >> XE_PTE_SHIFT))
> @@ -361,18 +357,16 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
>  		else
>  			action = XE_RAS_PAGE_ACTION_OFFLINE;
>  
> -		xe_log_err(xe, DEVICE_MEMORY, ret,
> -			   "Double-bit ECC error detected at physical address 0x%llx, page soft-offlined\n",
> -			   page_address);
> +		xe_info(xe, "Double-bit ECC error detected at physical address 0x%llx, page soft-offlined\n",
> +			page_address);
>  		break;
>  	case -ENOMEM:
> -		xe_log_err(xe, DEVICE_MEMORY, ret,
> -			   "Poison detected at physical address 0x%llx, failed to soft-offline\n",
> -			   page_address);
> +		xe_err(xe, "Poison detected at physical address 0x%llx, failed to soft-offline\n",
> +		       page_address);
>  		return ret;
>  	default:
> -		xe_log_err(xe, DEVICE_MEMORY, ret, "Failed to handle address fault at physical address 0x%llx\n",
> -			   page_address);
> +		xe_err(xe, "Failed to handle address fault at physical address 0x%llx: %d\n",
> +		       page_address, ret);
>  		return 0;
>  	}
>  
> -- 
> 2.55.0
> 
