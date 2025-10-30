Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDF8CCF9FC
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 13:49:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CE710E280;
	Thu, 30 Oct 2025 13:49:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PV9lOiwR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F3A10E280
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 13:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761832172; x=1793368172;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tOW5n6csq7zAi/3kU4ql00FzQMEV3XT7KEQbyBk412w=;
 b=PV9lOiwRNfG5xRRqUdYCNuAPbxu2U9ynxP/+fhdBitZK0oXwGzWf6tXt
 zwk4A9/TIf0eKwXp57s5aA5Uc38V98G6sgyr4jMpnwjdWIbEzxi4iz7X2
 9V79qgz8QLKtm/2BB6GyP1zVR+JDCqm/ocV2qdiznPaE73zFq29tjXEQm
 0NA7nysoXhkwyUiOvlwl8XnXBFC6tx++Eu0vjKiHkJsjUirGUhqEetFqH
 gZsqYdAN3WiuXNZEtM7ITxL4U/7nlb7t34NwRrmlgOJfOo2F8BlFZDA6R
 2KMJ49TGkbVClMFLojkOovhIGQDm76slZm0xaWlqhfF1X7jTt4EmCbqMb Q==;
X-CSE-ConnectionGUID: MtYcbKmlQYuDQGk/EfUr7w==
X-CSE-MsgGUID: aDT4ReaKQVS2SDBMwY1Tyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64069925"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="64069925"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 06:49:32 -0700
X-CSE-ConnectionGUID: CP/t92c3TxCsHNrmR6k5VQ==
X-CSE-MsgGUID: 5q1kI85TQCiHgm5rC7Jdpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="190033179"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 06:49:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 06:49:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 06:49:31 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 06:49:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twyKudcBueGLXQar9Jj4wkpk9DcuTo1olHPcdHm8DKWnICdNBFLSjnrbB5G+2xIWT+JsHulfVt8fkV0SvYPqbY0eMULxj7XQR5H9T5qb8IXlc4d3Sv5yPCJlK8RDMRHKsCjuRGgBWH/PITSSX9NCYZpZdfAekaDMpc1wpGAvwJlLFwJ4ShlovPCbkka8Zii0oCnGCnrYerWdlvncC1+1/ktWzNJ8sHO5xR8l+RUE+vC6DVPzsMwFAXcog3C3ftd+OTy86O/dK67T5zTvIJ0GWSboIhBzvCuCtKG3yhkVbTrQdQqSxMsio40svwNfNN9XViR/2m6MTvBjtZpRDCb2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7NhLHyAuxH3QjuDG5psjmmz9vUMu/5V73riND0pkSB0=;
 b=be/RZ86jkAdFv8ovuZdyccasRpq5c5jifpcAIqcewCGaswv+taP15qvHEosYauYHLoNp/kjpSlI05S5CMRpB2QrIitJaj/nMhh+yerYJmLcoXrFK9CqKblCAT6C4ChVx9cXHhS8qWSQwbfoTq7fQV1f/9INEKyEbiUvVOkIjRX4hsEmKZLZZlc9EfwDvM/iH/5JUhx69HO+neyQOZdwWvXXDnKgfeOdfgXYufgaD6hVRXF5cXLeystV6Q5L3wSGT3hh0tnMDVo22uqGTWmARUCF3qCW1bMaakx2T7EpkRkEoKVrlYqEpwaso1JHrg2xlMkg/XMkV+9EgljuB2/+0cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4524.namprd11.prod.outlook.com (2603:10b6:303:2c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 13:49:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 13:49:22 +0000
Date: Thu, 30 Oct 2025 08:49:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 13/17] drm/xe/pf: Allow change PF scheduling priority
 using sysfs
Message-ID: <5gmd4cj4ek3uz5ltczsks2uuabl6cxlyusumkvktgpg4ukkwxh@htjfklwr6hdp>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-14-michal.wajdeczko@intel.com>
 <tyzwd55usmombrh62ep47aqz2avhvlbb5xakhq7eli66qaor3s@k7hpxsa33fwl>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <tyzwd55usmombrh62ep47aqz2avhvlbb5xakhq7eli66qaor3s@k7hpxsa33fwl>
X-ClientProxiedBy: BYAPR06CA0053.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4524:EE_
X-MS-Office365-Filtering-Correlation-Id: d39d8b0d-31e6-46a9-2b04-08de17bb218f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bnNxvoEFteEgg+q4CjvAWbICZQGieZYT1HAHkLZKR8RNu323OtjgTjArqmm9?=
 =?us-ascii?Q?HWwJmJWJDl8a3LYmk3HoByxOwonCl2Bnj/sULRalQSDDEYogulHBjV+2NOrX?=
 =?us-ascii?Q?QqM/g64KVo+DFTA9ShHwX580Mb87JcMeCQdtTrUoGj/UxcSLTnRDP8GiKpwY?=
 =?us-ascii?Q?DyP67dgdkBQVpX8qXzULWvFOtEf5NQeebXL6yBZYHYGWo2tuqTI5IJVI5ytk?=
 =?us-ascii?Q?blA0BX5q3ZNWknSjpzIbb8ndV4ASRHtQKRWzj9egQbNqFj53vXokcv5Vw75E?=
 =?us-ascii?Q?OChogCN7DKMGcGz8CpsdL+mdfMNzVy599I9OUDA0uLDJvBRJlLgVcM6EpHl9?=
 =?us-ascii?Q?ZXtRTcTJLCYLqyQwuuy+DlcQJSWXlGGP7aVbGO56dojkXT0P0GsOnl9JaMkT?=
 =?us-ascii?Q?djPeqLtt+4Cti6T/Kg9N2Sif6C+84oUNVZeG5+wV/wz/MiDDS9uY9DvtEVTS?=
 =?us-ascii?Q?0k0rVA1FmbVa0UfL1jMmy4JxBjOio0os3yEsNjEvVaQRxtTfVJe47JLvN/Bw?=
 =?us-ascii?Q?OrKeJKn11zxd94cS1wPQIawTgp+ZBPjF04odWbx+MMbPOolnbZaJetU3+o6Q?=
 =?us-ascii?Q?oRzDuWGBV+widxYfTxVGaoQDmJAU9MzLk1wiagToMeQht4kVCfpbbaerj+F1?=
 =?us-ascii?Q?pJGwEhSA1wqdI09YRsUnUed3oL5wAtfqbHTpc4SBYfShtmVZ+7T/AbbMc0Yg?=
 =?us-ascii?Q?CoG2k9/Fzr+vcYDgRIIAnXV+cYsewrdH3P65oxhxMLjBFNOAU1L668LvwRBt?=
 =?us-ascii?Q?jdhUF3sQjuYSVrsZztaZrrIcickDm5cISLmC1xWZsHeR3YQbPeF92zfVS351?=
 =?us-ascii?Q?7HE7T3xoR1nm0qZaYcyQ92TKyHxu4IezmnxPfyUFMTGtCPcG2AG5wz3jkK4g?=
 =?us-ascii?Q?4B+09H7Wbi6E0k5Q6gt5PYa1S8Z9kmvji4gDffEL9cxwoZA7VSOaD5losEoG?=
 =?us-ascii?Q?KOTp9UHp6KZ2CBNfQkRBblZiUpSst8wkL35RHgBoxIEv3vfexkBBvj8VdxnJ?=
 =?us-ascii?Q?88QG68v++glq7ro/IC6y67vJxFTRdkcEPIJ7kI/Q2YFDyreA6p9wJi9vKqM9?=
 =?us-ascii?Q?ovj2gVmAOn98cNII106UgOgi1vSpuMBbGvGk3ybb7YxJzAxIK2fDuaN1ammf?=
 =?us-ascii?Q?q7rPZ6UgfiOwr9N1AXT4giJ5bsgGLOhdnPDxwTFmNHXT6QEkF+EiMGFUsn6f?=
 =?us-ascii?Q?RIH/u0uIDmKYbyaHrw2oybYe5Xl8XmydkfUdz71sRgGbfE4XCbp94pDkXQt5?=
 =?us-ascii?Q?yG5wJ7xIRTi3QJgbc9mFp4UpSTgZ/nh42qLi0LvW6bdWj3XACQyE8hWgp+f0?=
 =?us-ascii?Q?dl2qQTWXiSChZjcKuEwijhmow1PK9sKmwAyBKvw/PLUCG8CTB5xOdL92YpB0?=
 =?us-ascii?Q?oVXk55u5A3lMyLxr46fSKoe/orv9dxBwCHAKhfF9LV/xGBzK0VyLK7RKPXLB?=
 =?us-ascii?Q?EyeEFiWD5hC4NbIQGVJIEoI8bTrIvAjB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?napjxHy8XqzezKHM9iKdBmsTMGFWXWj1K3gWYqNLZtwdWfWzQxUwWlAkdsTO?=
 =?us-ascii?Q?eXCfM0rHD+RqB7bA3pZQNLp77p6oC1oBuIyd4D+4VJ1P+OP51fTwqwp88oFm?=
 =?us-ascii?Q?FDpz9b/30jQa+CRS8deDXrqWpO/7a83aKSy6OvzKA6AzXpyHsZ6upxRMOE3W?=
 =?us-ascii?Q?l8xvhzQmoXhY8XxShl6Xx1bIbCUzGBf0f7Hzhfpdy2VWRMcaT0HFeRTp9/jm?=
 =?us-ascii?Q?a6fFCN1Wbe1Qj4Nwn/IYXWSOHXACvbBmXwMjTZ/lhj79LKMoUIP7X2mPBP01?=
 =?us-ascii?Q?w37ALrZVWKs+V298CaA2lU/1pKUiKkkRSNpqd+Afu51eD6XfsM2PfaEAO2tO?=
 =?us-ascii?Q?TlnuP1U8gfEKOW9RisD+NqefAliV/9qssFmkFWRkvD5HNQRn5k5+b0pYyYxN?=
 =?us-ascii?Q?5fNPXmu8C+0KgcBUYC5vLLI9W23PPdQRsX/m2/sDQeE7ZNMqptZYqUyPob0B?=
 =?us-ascii?Q?D89Zq3IN5VDikn9HsExWku5bVQtQhgkIutOVR5WXQx4GyA6nvkcC35HaTdum?=
 =?us-ascii?Q?TIrX9plmsxScIw3/IxKBzflK1Yfc+UuhDenPamTAgm7qYf6Q7jY9Oj/MvjJ2?=
 =?us-ascii?Q?T7sE/1mwgE5ZV2JiErilmzlATAGSekNMzVD7iA8anekQbAn/SK960E624wIs?=
 =?us-ascii?Q?V1XXqJJSxdvkVsi0tTGI9NCYcvTzR5z/p0HVDDd4Puz8eHkL7DSrNFatXm7F?=
 =?us-ascii?Q?A7+oOsKHUgt2Mcfsh5Ft3l4GczoTsm47vQPBpdO50fGR6aN0kgOauAL0lN4M?=
 =?us-ascii?Q?Bs/8wwSvMbwEVsJdcoXadyO0upkbDc9LRKpGwMii1Yv6vCphFWKqAp3k2bQz?=
 =?us-ascii?Q?QpiVnNLstEUM5dVXAvUAZENV20p04bXm5mXHYJhNQR3OImU1OQdfbKDbEMhy?=
 =?us-ascii?Q?1vjfh8GaBirAj4lpMoWhM/mnppFD9iME+wbEb/ZV0a4RJswmtIgI4iQJlLtE?=
 =?us-ascii?Q?71ROv/ViyHCsS3Z6ldSEAPr6DQjJnkvtj2W4oUENBrQHIfwz/7mx4Alm0NYO?=
 =?us-ascii?Q?YwC6mNuLwfJKaogVBSxSv65JxiK9feBTiYMqFeJiJgWDPLnSUfFliZlpcAJR?=
 =?us-ascii?Q?xzzHypgHKdNX0RIZIGncYG00Gd4HVhi61kSyAnVh//jhOjikW85bD9iKq51j?=
 =?us-ascii?Q?pVoqUCV+88qNFVbgG/TzpHbB/u57dghyYv0YGE6woL4+NE0coth4neCnrBj+?=
 =?us-ascii?Q?agGJsPj5OwSy/n1hU2wmAxMNVFxibgSDjGY8Pe7Vc/ji65CFIkp/FcU+fk8j?=
 =?us-ascii?Q?s5OifKEi6dnqB23qNIGLjkoBBmSovKq0PMmBfYmINw5NSacMfkTKqQeHTh1l?=
 =?us-ascii?Q?6SLtZuXVl9e/XcLrg4RGdcVo1AgyaJUL1FCK3K2wzUzHEHzZGSHReTfhGG0R?=
 =?us-ascii?Q?G4I16rfNvOpc680xyvezY4h6QabYXeG5EmTNSih40ILdG7y6bX2OllTlbPYY?=
 =?us-ascii?Q?bsxVl7TSqCgWsTHsfqBbJ1mcprAfW/X+MXnfpIgF+Ge6tnmG9l/fssVB9km+?=
 =?us-ascii?Q?3McffDTdvroAwK87wMcetj1T9plSfxTn2ibcM5MBuyAzfKfOZjyhX+xdYbEi?=
 =?us-ascii?Q?meREa+eizPS+oATvsBOkbQWsjavw+QPzIDd5IWdqnH2ieL6dgDxjxGIf/yIx?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d39d8b0d-31e6-46a9-2b04-08de17bb218f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 13:49:22.3906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /CMhVPkKatjFLoSigCQsX9BAhktLUO0Y5G0nEkLLKG7DdjybMGyGE5bxnEF97LF+mJHS36FD3m5VZ57io+2ea0BGk1mhZqY7kmDA5dZjf+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4524
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

On Thu, Oct 30, 2025 at 08:35:41AM -0500, Lucas De Marchi wrote:
>On Tue, Oct 28, 2025 at 06:58:27PM +0100, Michal Wajdeczko wrote:
>>+static umode_t profile_vf_attr_is_visible(struct kobject *kobj,
>>+					  struct attribute *attr, int index)
>>+{
>>+	struct xe_sriov_kobj *vkobj = to_xe_sriov_kobj(kobj);
>>+
>>+	if (attr == &xe_sriov_vf_attr_sched_priority.attr &&
>>+	    !sched_priority_change_allowed(vkobj->vfid))
>>+		return attr->mode & 0444;
>
>first time I see a attr->mode & 0444 return from is_visible. It's
>usually the mode or 0 to make it invisible, but this looks correct... it
>would make it read-only if read was allowed or invisible if the attr
>didn't have read perm.
>
>with the doc from commit message added to the kernel-doc:
>
>
>	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

doc is in the last patch and the other comment is just a nit.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
