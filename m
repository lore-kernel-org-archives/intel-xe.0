Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38E0C3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 20:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7216C10ECBB;
	Fri, 19 Jul 2024 20:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6PptH66";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5BF10ECBB
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 20:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721421530; x=1752957530;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=9V1NR+ZBwNcM5dsmto/NbaQ1qraYGifZMbtVito+hcg=;
 b=g6PptH66u/B1wb46CuekZ/U9H0CvMzoN//Bos3AyW2gsHv5s3NC08Akr
 vKdevCFFtEovY2SKbhYIRxFOZCZuo0QLrsOmSAer+HkDs8TYB8OWLW40k
 gRkv1erY+m2zE2nQx1Ya/ZWdNk3WBLTuywl0MT+H1j5vnrHNRN6hvemKu
 +wfP0vDYvQnlF6Ios5g8ebZwkJAsU7ocuWxdsekxEoJxHmBB7osRl7R3h
 gbN7rHlupCmsWALln3JXFWyEATO1OB0+rBWGNPOhWuo8Nj+jvQn7UUi6m
 P3SVTFr4mypG11+0Bc8eq+zyPHcMSmYrFpGeyqWIbHBm9O9/3w+J/asMd w==;
X-CSE-ConnectionGUID: XXarOvIRQP+qXn2LbiOljQ==
X-CSE-MsgGUID: 2oXGOvatTk6K0mdKcuuZIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="30444834"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="30444834"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 13:38:50 -0700
X-CSE-ConnectionGUID: s7v92FGpQ0m+lac0xuB7nw==
X-CSE-MsgGUID: QNuP6sp8THu/4Wv0n7HImQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="50910002"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 13:38:48 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 13:38:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 13:38:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 13:38:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ru7kSBQ65R002m8vS6toSJLXLJkHaFEJf8zYKtbGUW0q6RDfGKu+8qjDlZVxdnJqSflw+RKuvpJ5ISauYFiUT6R4SU/tB5SH6pQnObNXXUF86Urdko4GWL7edgwU/G6xFBjhBdwnghZ3YFJjdbvXAkgKYe5FEy+vC3TEDTwgTk0xufvP+EhCqCmf7/M3wqJK7DaYnfiCTYSQSUSV8PgrTY1prLTPxKDy79nLO376MdhD6KHO/mUrnnxKDUp7zz1gKT8Gx7g6B/tEs5HwzAhel8gVcjN3Az7HvyeS4MZJtlXNYS2wyt7HDO0oTM1lD3IUvophKmGvkayxzdaujE40Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81INjLRyaOgQOLlLGnKTJGqc5kCGCLg3jch+v/gHMUA=;
 b=iunnYnswGGGD2RY9FoHs9K4sV9/4QBvEBf8UliB9xMLfAkSNNPeZ3MkrIlaI5SJJQXu2QM3/IqLioFpp1kpB79orck+S8pw5S034IMZ+zHu5RiUkLmkK1BUJCLCAIYkYZKLIzdSznITfSV4oCUEktqkYW+Zj6GJnUG2BudGI9yZO9+k/LVzk7ajapcf1Nfrp2BGSODVc/zsVetrijOYPkTRDU4xY1O4E828FaUlQpyMlMK6XN15Yv5X2QUm51O+vSgirQ/XArbL2/phK0ogdPAaLr2JdB3tCFuYUrTvW+Hjg94oTX+FkYIRhWdVP+0KiBfUPEPOadOF0C6fOXcj3SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5796.namprd11.prod.outlook.com (2603:10b6:510:13b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 19 Jul
 2024 20:38:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 20:38:45 +0000
Date: Fri, 19 Jul 2024 15:38:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe: Fix warning on unreachable statement
Message-ID: <k2ed3oop3nh4up3gr4az34aeyf4e2vr3532tjhbbqfg2lb6wko@6rr6wqr4u52n>
References: <20240719191534.3845469-1-lucas.demarchi@intel.com>
 <ZprFmUmx4vK1v0HT@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZprFmUmx4vK1v0HT@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR03CA0113.namprd03.prod.outlook.com
 (2603:10b6:303:b7::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: 6771e0b9-e1bd-4b40-8a43-08dca832c92c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OAZ243xFlfJofsvVy8Zy2nkUaCzqDbMDinrzWuE73Tr6PrgPiDUXNT7iaaDK?=
 =?us-ascii?Q?byZf8PdyJ3Kz+s6r85jKKwMGDiW+YCqlY7xIdhUa4634c1KW91yp2y0SB5zz?=
 =?us-ascii?Q?Zg+2TtovYKFW1GKTo3d3lDtKk3YkfixtgjTtGa1wYvsSM0zmfgp/0wy+5Xgs?=
 =?us-ascii?Q?E4cfgvqsX4vZTrFg7e1Fc1OVg0i417mLM612aezbZHJkOYonSc7j/XJytZVS?=
 =?us-ascii?Q?s9PL2jQubu8j3OdKg5BYQeib7TDVrnpu+cBl3sTMLTeW193ce18cbiEGcDFD?=
 =?us-ascii?Q?d+CMI3184rzfjnom5vZN0eKz6KcaHRvfoTDADx+PxnW0d6vNU9AClutC1Rvv?=
 =?us-ascii?Q?EiNrw4JYqakReOWtKV7OaSfcGYw4lYKY9sJsV5Q7s8ahT2imPoNfvDW+Ug4x?=
 =?us-ascii?Q?Erj5sHrI47VueSvEpGaxy4KzLi4gz3x6jBouKRq2bvPhkVaNMIpmg3vkSXDt?=
 =?us-ascii?Q?RwlcQ4TC8vdXX0DuzGLj1An0oJRiwSHj0s6CvqmSFQbtNfJKN3cQWXuYm+Vb?=
 =?us-ascii?Q?FqwSFI2z7Qm25/kAj/jztZ1ujukDh3PrzWoW23BpQI/ia8JRHFwx0dzTODNE?=
 =?us-ascii?Q?a2Gi0wAkmO6clpMjqfIrAuKP+Mf8cKC78xjFbuQ2BKE6TEs+pj7Tx5tSBYm9?=
 =?us-ascii?Q?XVNaFXad5tD2iWSY2uTXXXAdKAXzjy7+w92zm0tCeXPblVmxXkKpqsB4LToi?=
 =?us-ascii?Q?EOKWYRKMwzc/u2RT8H8DIZBwIeguzW3wW06UWKCZ0eDdWynaiY9eePBVkYt0?=
 =?us-ascii?Q?OXZxxsmBwgcRQnUfNGLTSEYMN1uWE1TdigMx0TdgkwYtZ/tcEoQ2NlnMe/HQ?=
 =?us-ascii?Q?3PipWSTWdqZEZ7CDRYxK+pgCDgJuUQYDI72vnQNjOkDqzs+evBwF6fVKn/hj?=
 =?us-ascii?Q?CZPf1p2vfxVTDG3p/rpl812po8segZSMdPDjsABjLXvJOjrkA4iaSJOVGI4V?=
 =?us-ascii?Q?tjHrzHEBpjBF0lQk2oP9NmoZPZ2ps3eXZ+0NSLKRcqmZZUpbaTgc+KgxYs5O?=
 =?us-ascii?Q?WExeQmYf3Sa2c4ozZ8ZcYYKApAgaQmEXLoX0el5pd4rkl8gmWn2BQEqXLUeW?=
 =?us-ascii?Q?q+28NXJAeUXCX3/dsgEmTKju7mNqR3vRYLxio5M/OM8+SHcZ0Pd4i3/UTXUN?=
 =?us-ascii?Q?ZEdChRtHRT2jxLo7/ZOB/0ycirg+NwOKB1srh3kuNlyKyvFX3J2TkzW0uclq?=
 =?us-ascii?Q?cSaVLmPbsgfPqhvCK3DLSEV6ksJ9dhFcMLTGDq5KQKFejg6Uq0qo3Va1HDG+?=
 =?us-ascii?Q?CuwKJcNx8a6vWqcHxp1WNEucRGrKPx7HhiB9aliwEjdOwZPpX0wFLnELMOZH?=
 =?us-ascii?Q?d51vAnnx6yaag5m3iku4C8vOSRvL8QXTad8Bz9Kf90hCyg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?REgb/6Etqo9KWQsLWqnAWyxQKzAAqu2JsJIEpO+xjBSSdDw+p/0BVbyigBfT?=
 =?us-ascii?Q?Npp126GtsPs5RgtWbPTy/A6EgLALXb2GhOk+DLQ7MiK+niItDSxDNHj0UMJC?=
 =?us-ascii?Q?/LStiePvvVoaoiltekavnayH4ZTqoPCzlJW6/wpg/PF9Zd+BoTr1bd6RG620?=
 =?us-ascii?Q?hiC79Je//7EL1A/dT8ghUp+AT4qq2ZX85vfLxkFoszo/UPTRNxQYV+j9V8ci?=
 =?us-ascii?Q?F75DIuTyEib6OMqVnhten2X77pf6d4IF3smniHPLAcJnGtN5A5AGFgF0IXML?=
 =?us-ascii?Q?xT3BHjr1AU3/Egxq831m/oXfcvORxUH+Y3kvoPXueyDA7tYKp/rsj2is6qtA?=
 =?us-ascii?Q?03msPUiVrzAZBUnq5fg2jM/ShNRB8p5dsIKndD6Di2j43MeLFBEjyGjla3yU?=
 =?us-ascii?Q?LoP4ozwwDlujSuVDy2OEZkGDQa8StARWvucjZyP8ZMjXDcJQje2nnVqvJuki?=
 =?us-ascii?Q?nyxDjxssvNiG6f68fb0HP0fNtXai8wUxE7It96GipFlnPAREQ7FfLhonT8Bg?=
 =?us-ascii?Q?4wMNoGEa/kNy75qbfMAEKqz2bMx/qTsodp06m0/+TSJBefOaRGEY5cGcWwU/?=
 =?us-ascii?Q?sijJGCGIG4P4jJuhvFeTRjBipS36ITXAaqhKllLCmmLuN+gN/O8XIH6PTnF8?=
 =?us-ascii?Q?0l8gIfnv8CZjW1QG6o3kf1NwVtQy2uNXIeGoccNUlE3l3gP33AgOHEFn+T2W?=
 =?us-ascii?Q?xeZTu+0W8cVowyVc5DDfK3LZDFaNYMUw+t5/hVcFROrUmzgiiyeEXU0kWJeu?=
 =?us-ascii?Q?kKqaROZwmBDyQv0vm2oBbx/QrcIJ9fJgxvWhOa+/CVqZfMoGdx7VuqMihsRY?=
 =?us-ascii?Q?M9n0wDqC4icX1bKwSO266K8X6I3jxw/BM5KKgwBonxApjCw48oH70Lcu9mwD?=
 =?us-ascii?Q?GYvXlA/jebhXfyDlm46VPSXN/gbQH71qLKJ43ilduS4V6AYx/y2LArsH8M20?=
 =?us-ascii?Q?O10rOhGG/MzZmJNic6KMjFWtsMKr9o4UDWx05xxdjq7Oyz8NG7Gg+fTbiIO0?=
 =?us-ascii?Q?hbGT2FeGDoeYwZm0FyCro2IiCdXyv4ssXQMxNvm5Yzv8IoMjIUG47fh9cg18?=
 =?us-ascii?Q?S2sRZi2DKgWIGh5HBZvvzl3ZDE1jVC1jAjAPeS5CeFlJzIp8joCyQuqT/JxC?=
 =?us-ascii?Q?tVEm1NKA70Op+TeDvDr4Q5/vaq2NH4Uaxc0mg0jvq/tLSOlsa5UFSvo9x8n4?=
 =?us-ascii?Q?GfRrYQ4QRYb1LoiGlRZgHZfWLexxKO7Ksv9PZteKCKxvxOl9bkBPVKxNjQN3?=
 =?us-ascii?Q?r9O6EET8InOKyyscjmEti7MWcdPIG4uY6MB8+X7azHUfhAsuIr0WK5aTV5IQ?=
 =?us-ascii?Q?cWnYeg+Vnyo9qlyiOs7nwring5dGBPxywDYIM1XJOwC0J11bi6hOGgbGyHgz?=
 =?us-ascii?Q?DOV88jQFgfjbIFuZ7FqBD9iaNOJcePd/2/72Ib/mCo66leFptnB1zyDTnRVl?=
 =?us-ascii?Q?Zq+rWuCUiWU5WM4cTItpGbpqSwM2brh1LoUGGXfz8xTozGS8Il9MaHFFdU1a?=
 =?us-ascii?Q?5WMOFkPRsqO62z79ZKrQn3FdG9m3gTG8Qw/nKPsgCnzZkes+HPvUA/VpBKfU?=
 =?us-ascii?Q?rBuVBfmdZIig0l8YcA2DVG42kUN48Ae6caPYIkW24QJhUHCA/kkp5I86NFvm?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6771e0b9-e1bd-4b40-8a43-08dca832c92c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 20:38:45.8245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RC/irwVdgn9Me0yjPmrBnaHYBc7OCjJRXpOiWQ6KGiR2DprgyD2X0HACNgTMDGClsZ/8MpIVC1QFKajKgw3alGR3aQS7Kfz5TS/QzatP8+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5796
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

On Fri, Jul 19, 2024 at 07:59:21PM GMT, Matthew Brost wrote:
>On Fri, Jul 19, 2024 at 12:15:34PM -0700, Lucas De Marchi wrote:
>> eu_type_to_str() relies on -Wswitch to warn (and -Werror) to make sure
>> it handles all enum values. However it's perfectly legal to pass an int
>> to that function so in the end that function may happen to return
>> nothing. A smart compiler could notice eu_type is never assigned to
>> anything other than those values.
>>
>> Trying to reproduce this issue, none of gcc-9, gcc-10 and gcc-13
>> triggered for me, but this was reported in a different system with
>> gcc-10:
>>
>> 	drivers/gpu/drm/xe/xe.o: warning: objtool: xe_gt_topology_dump() falls through to next function xe_gt_topology_init()
>>
>> Since that is not really possible, just take the simple approach and
>> return NULL.
>>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_topology.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>> index 5a1559edf3e9..0662f71c6ede 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> @@ -233,7 +233,7 @@ static const char *eu_type_to_str(enum xe_gt_eu_type eu_type)
>>  		return "simd8";
>
>Typically elsewhere in the KMD issue done this:
>
>        default:
>                drm_warn(&xe->drm, "NOT POSSIBLE");
>
>Never really agreed on approach but this is used in a lot of places.

which defeats the purpose of -Wswitch (enabled by default on
semi-recent compilers with -Wall). We'd have to start using -Wswitch-enum
to get a build warning with default case. Kernel has -Wswitch-enums
for tools in tools/scripts/Makefile.include, but even then some tools opt
out ... it's often too strict and I don't see we enabling it for kernel
any time soon..

It seems entirely bogus to trade the buil time warning to a runtime one.
And if we have it in build-time, then I don't see why we need one in
runtime. In this case.

>
>Should we do this here?

I don't think so. Some other cases may have a good reason to do a
switch() in something that is not an enum, then resort to default for
that. But when we are handling all the values for an enum var, I think
this pattern is better than using a default case.

Lucas De Marchi

>
>Matt
>
>>  	}
>>
>> -	unreachable();
>> +	return NULL;
>>  }
>>
>>  void
>> --
>> 2.43.0
>>
