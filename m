Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 277AACCA471
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 00:20:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CB210E0F6;
	Tue,  7 Oct 2025 00:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E2XvxODc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C7A10E0F6
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 00:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759796416; x=1791332416;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=06GkeSfAWWfJQEOdtQWOs5nvBr5iSeNUtp+tFYlTC2k=;
 b=E2XvxODcdSw6Y3i44balD9fmYa2mID06WY89Fj84x/vBI82dCMO+idQX
 +oXhF41Oxp3imqPNgve+s1AywbYtnCEh12kwR8kGpw/LdBw8ukmuWWxv8
 ZjWSDpjZ50nRNot5aZCoeCUGL0WzqvDKiSoxHNZq0rFxnOJg4HHr20ksp
 QxxUpp9TgHWpgEqxAFADK5e4Ps7ESp2xwAujbs8r7zTmSVF4q/evnl7n3
 BlVrtsIP0dS4UUByKX5O7Rv7MP24uRpJbfjh6VneJt0G5wDbnuACzURju
 8MAsFisWUSUim9hlmg5F+jg5OoF5rf2Qhs7PVysbCWAKLOUgg9/E3MIvk A==;
X-CSE-ConnectionGUID: d1uCtXz6She0q5AgtzFZSw==
X-CSE-MsgGUID: meZvSjuQRU+lAYCL0RttVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="79402978"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="79402978"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 17:20:16 -0700
X-CSE-ConnectionGUID: vQAVuVGETIaB+E7uCemrGw==
X-CSE-MsgGUID: Lw3q0SDRSW6Wf67W7Mvtkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="184384018"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 17:20:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 17:20:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 17:20:15 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 17:20:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CruG1ZJuZdtEo4KVha438iIQHruYHlX1XSrUXL0z+J8rCmqmp4FWOPbn/sv/BCb08BjnBYtCrS/hr7ib40f9rt+GSCgeE1wvWmG6EErHQSqZi4PFTkxBQmsOx5F6it/QbHxrxBxpO4Ro1q9S+WzR9fLhUeABnAt9DU2dkwDZsp5YA6JUfw1TuMTYVxXckrnvWuwHGkyHYDjJzvjgPViB5SvaveW6DJW5V2T0JyM3ZcqX7UkjX0+l7K67h7vBZXYZvku2Go1fgmw6mBN5hNhjrUcJ/EygKqBDojvEs35hSfhK94Yt37ylWxGD52/9rnHL6zDO1szNpEQUX+8Bhj1ZwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrPqrGDRu0MjAC/CclHVeqgdBTUjodlbjx+MAcxNsM8=;
 b=Mtj4w9R//RUnB5BTo5/BWEvzA7Gp8E4FCAUBmjosEb8pcSSuXf6+/acdc/DEkBU+Kr3dxTrpm72d7nlGkTomRx0Nb8X6g/JH/svqSd8rUg0NaLnoiZE/mHEKEEapWW+B9wVnXJjx2j+PwvoIbMua+oFphAhJDXg4dOB+UX7IbOk/8ouhVV4276ItokXC/j1OA2uvr2khFlbXS6uqZ4vD0TctGwmVS0UkexIl/w8qKhavRsXb2YRoXLWsLM/vAM6w2LKU+Q/TnC412/THZ3KjIsCMR1rZ6yOVSDyHoUVNWYKPN4QTSjObTcFJogLZoebpBZILMJjBcoyWHfUjE9JnkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by MN2PR11MB4597.namprd11.prod.outlook.com (2603:10b6:208:268::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 00:20:09 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 00:20:09 +0000
Date: Mon, 6 Oct 2025 17:20:08 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 00/30] VF migration redesign
Message-ID: <aORcuItiopcmMl1o@nvishwa1-desk>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251006111038.2234860-1-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0379.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::24) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|MN2PR11MB4597:EE_
X-MS-Office365-Filtering-Correlation-Id: 69477232-ecc8-498b-d1f7-08de053745fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u+/N+e6xuKEpTfOsQ+dBpDW1kb7Ng0P12L5dynYoXlTbjMvq8l4MdoouM/jK?=
 =?us-ascii?Q?1ort1mJJsTBlHR+0lzPaQABtd81mDa1qMddqrZBZSNTQS5V3ZBhT8cA5QuM+?=
 =?us-ascii?Q?NJsXhkMJzYPxz7NYIHt8/mvJI2KlhG8kLUIb/+0rh2aDffWwbn7ga2Hcgodm?=
 =?us-ascii?Q?KhRH5F2uARxHRJRGBtNjv+tXFj+2ZI5BpRSyRuw9uRJ7bJUiMk+Up8K1j5uL?=
 =?us-ascii?Q?hDNh0K7a+4zr4IBLgZt4JE/pbGgL0OWDZWQN835GyfwpEGjfsBic870awnRW?=
 =?us-ascii?Q?uyUCWJvNbb0WVFCaAD4iRF2UlwNzqLQDhWUmCFNeXKqQZarhxUnhYNLsskwt?=
 =?us-ascii?Q?63hGIXU0jwsT1/XGIVgn/wfq4+pI3n4BqyuCjBmt5HRwi3OveScEBtbIKpJ0?=
 =?us-ascii?Q?eTQ+TfhC2mJ/gRwJrAA+6Wnrmmi3k13Mqf2+b+e3wSx44kFsPefQdn/gmLW5?=
 =?us-ascii?Q?PPsqoS3340voiXCmypijR9fZDTqgA3UKknjo1N70eR4yZkYHBX7AOQvyqGJ/?=
 =?us-ascii?Q?sDZF4hvv+odOHXjI7pVph7mHxaopPofqQ6icL1xPsLPM+5H21IdqOcwcTek+?=
 =?us-ascii?Q?UmWJGVWOmLJifKd8jPs297fIcbSvHMAq390PdjyDRYMmSzMgRSLzwFTIYqEW?=
 =?us-ascii?Q?uwn2YMTo97jQNMzqOMQMiH26nrpEGohKOSxgtIXsSX7Yve6L/GV11d3qYUMG?=
 =?us-ascii?Q?9t3Q50dC/7rnZYKcd6ILUvXYT412TwQhaX8YaDkUKOWEawIJpzmuAyo1Wc9M?=
 =?us-ascii?Q?ncqBhrrwMrcdLA+6TZrDccq7JeK6t5/LAtpe/u40Fc5KqJiHgwuPN5PgHatd?=
 =?us-ascii?Q?OrnwbA4Rbh2hexzE9/nV98xFpsqcUNn5mF5KLo4woR32ycS1vLNP3mPYtX7J?=
 =?us-ascii?Q?UD6mHPGcQNkJ7tcLBE6LDHnNWJ1Q0FkPYFJUD/EQItCRTHgISbeyrxg2OID4?=
 =?us-ascii?Q?yISl4ro3PdnQ+4CygeE7brpq2sV/yBnyvvtNeR69E2GVwmMVXzsWCrtZOtq+?=
 =?us-ascii?Q?JTB7CWD//9Wrurcw3SnPuq0IeyxOvzn9PW5htAPnQFUXPwyiFHwnLz7oL/Di?=
 =?us-ascii?Q?X8UcIF3vHUwxnjRyVlbh4SSrWUTbAQZ93Yehc67pOmwGXKIRTKGjjUwFmNIF?=
 =?us-ascii?Q?o4neuPhLw2DpLH1B7q0YfuuTgZEthaYmOasJK/4/47ly45NBBljcW160L4KM?=
 =?us-ascii?Q?upitzQLoCVUK1JLavJhQd7610UpQXLeaYE1r6EhKeDQT6O92XeX9zBitmPB8?=
 =?us-ascii?Q?OCimeVT6sDNMbUE2M0u5qXLGI5n14FHDhVpIhMKk684lDCx8Jzy5++vWWhxu?=
 =?us-ascii?Q?9mbheDBP0eAL2H76z5kSq5zqE3FvnvSSKhpkUUuS1e4mWf2+o/wBdyYTRK/K?=
 =?us-ascii?Q?+UIMY+e3R9Xvb21grKeg/dxCYcS8/qEHCCQId/fyXZazrsr/qi7b4cpDfoV1?=
 =?us-ascii?Q?Fr12olBQhsDmvnFMO4Y0RM/mQAM9Eg7k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gmO5d8iW7Tjm2hG0GM6PQCt43tqjiflI+QqPTESQsxAmUNrI4WRmIvtK5rd0?=
 =?us-ascii?Q?E8ikVdlEIwY7kuNeLykcwOAqN7VkojUGGAuT17lWxkMgKnzHSBwcay0aF0SK?=
 =?us-ascii?Q?uELc5IvnWf65QollXI/99u/eP+stdDJXfFeKOctUK22Tb+Mvg1Z3FCnLGv1M?=
 =?us-ascii?Q?g6evzmgrxq9X6Rdfcx0JQWk5HxnQBLs/IO+Rly+KiX07xVDzhhzlyN+x0ikj?=
 =?us-ascii?Q?xZ9gpNsT70qNWoMSt1RWD662PmBf32v3VMmw31iS4zhcrXItykmwigdHqwNs?=
 =?us-ascii?Q?u3e42WpRsHiDrxEDsKZepKM0yDpDIevrPIMIlpSuY4ThKl1zmC8eUxwmy8t/?=
 =?us-ascii?Q?n0LyiaL0KYL6PXiGi9kdic0jz9vWuuQTNnvgiChSQ7CyrNteyGrTgJji2KUe?=
 =?us-ascii?Q?HUVJFyr5jOcrhmQA9zSX9F8To5mSCbu5rdpG5rOz8WPb2BjgXM8UN4yiCo3U?=
 =?us-ascii?Q?6JgiimTvZx7HGVZsQ0woqtCZOSoEg/PEKwttQOVzLOaHuFRR3wlYJBy2wnL0?=
 =?us-ascii?Q?7tGapUsD7Z3c2sDNml+f+ABiNKcyHAipvhC845iddLViXGGjhu/dlI+3l1wK?=
 =?us-ascii?Q?z8Yl8ysS75TDQIWRQRsVcVtqwVo3iw3neNfpFo2UJmAO/v0QQWBtJz4kUeGt?=
 =?us-ascii?Q?YmgEUaXs6UHHosAeClbsJokcLgFcoSr6+lOQQEJ+khj6cCzMG44ihd7dulxZ?=
 =?us-ascii?Q?DdKOU/Kh6G8pDN9CVJxwFUKgOeoL1mEtLMun5WNjGPLOePQsoSvnzCYFa/DE?=
 =?us-ascii?Q?Ob9yuBVrDBVrZILPbbTmepMTxRE+qI2yHRe2PrOAKP8FuQxVIjtLAI+KAm3h?=
 =?us-ascii?Q?g5B+bcIPvkN4x+ATifeTHrr7FAsNBNeiqsTXr+hFZdV1PedyI9ecyGzbP+Ge?=
 =?us-ascii?Q?aLPvwrhwNX2c/Ec1dg7GPsgTj+hIMpp4azv4ooDnXjSV4ArMnz++LftIkk1o?=
 =?us-ascii?Q?sA33xY+jZJTZ3Xb35dJQbY5xtmNxHBMOI1WoNvUd3cv+TJpVtgG4R+NGXGmQ?=
 =?us-ascii?Q?GrtJkIWf1yggS/j1gin5ilL7CY2ogdjjoenxmyQMtaVkBy/eaj2mLwkXEMZ/?=
 =?us-ascii?Q?g018wqYUxHQhtXYQJMheGpozj8Tt0eHOYC8Yi/+alEJJp2qL8gyZ6IxEsiWA?=
 =?us-ascii?Q?mrpM+v2W2bqu+uqPIzstZCIGHVbdNbywm2QuelmaB0qt1gDRjfFWuvKF2b+a?=
 =?us-ascii?Q?zo4pV76x6X8HyoQwaoM1bbS7RkLBEbf2qFqZKxt1jrqTommUKhJEwqHOD/xl?=
 =?us-ascii?Q?Igb951qmKpfp9pUGo8h15rLL9j/rGlyZVsbPEik1Cy33EFN3+75L8CbAjBzj?=
 =?us-ascii?Q?FD2GeSn2MTqLiwNOHSMswrufLVE5LZCpxpu0FxVZGRbXnxU2fzAtCXpl08Zy?=
 =?us-ascii?Q?3BtALlY+WB1asvpufIc793a9UtLEBiwSm0pStbR9Qa5S+gR3bVDadWhMXmbE?=
 =?us-ascii?Q?m0WjmwcApdI7dDVkcb8uezTi2lYPCEF57lQNjDR5tfwO9KZe0bgRlyTB5e9V?=
 =?us-ascii?Q?t/MhEr82IjQAPlAPrOvSVHVSjLV1uAZxy79w854hDlnrgu8ULqy0KKijUdZN?=
 =?us-ascii?Q?Omht7EtzGX30DqwBeLJAeq4W4JMeKkGdrzU5g0FZrk/QOvljiePvbbM3zCaB?=
 =?us-ascii?Q?AkwlnH9WgqEKvcYsz+gQDbQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69477232-ecc8-498b-d1f7-08de053745fe
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 00:20:09.0474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0svW45PFeQmbGCyMd2aUc0wpGmc0EOfmQbfBB1+5lKDPppKAk6EV+v6CcHRpgcJOFn1lABKM301+fp0FqYbIaUgM9jgxAkSoPAzwbjDfbl1eS9uAwjWJeWrzH7dJ6dN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4597
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

On Mon, Oct 06, 2025 at 04:10:08AM -0700, Matthew Brost wrote:
>Rather than modifying buffers in place using GGTT addresses during VF
>migration, this approach relies on the submission backend's stop/start
>mechanism to issue fixups. The patch titled "Document GuC Submission
>Backend" provides a detailed explanation of the design.

I don't see this "Document GuC Submission Backend" patch in this version
of patch series. I saw that in older version of the series, but there
also, I think it was missing xe_guc_submit.rst file.

Niranjana

>
>Testing was performed using an out-of-tree PF/VFIO driver with manual
>triggering of VF migration while IGT test cases are running.
>
>IGT test cases:
>
>- A new series [1] that exercises active contexts, job resubmission, and
>  compressd memory.
>
>- A new test [2] that actively creates / destroys queue on each
>  submission
>
>- xe_exec_threads basic sections, which test context registration loss,
>  schedule enable loss, and job resubmission.
>
>- xe_exec_threads balancer sections, which follow the same flows as the
>  basic sections but include a work queue (GGTT address shift).
>
>- xe_exec_threads compute mode user pointer invalidation sections, which
>  exercise the same flow as the basic sections, plus replaying
>  suspend/resume flows.
>
>All code paths in "Replay GuC submission state on pause/unpause" that
>replay state have been manually verified via debug messages "Add debug
>prints for GuC replaying state during VF recovery".
>
>v2:
> - Fix lockdep splat
> - Fix checkpatch
> - Fix PTL issue with LRC W/A buffer
> - Fix race creating / destroying queues across migration exposed by [2]
> - Include a version of Satya's patches in [3] which enable CCS save /
>   restore across VF migration /w GGTT shift
>v3:
> - Address feedback
> - Fix preempt fence mode deadlock /w work queues + VF recovery (Testing)
> - Add NULL checks to scratch LRC allocation
>v4:
> - Fix CI failure
> - Remove config lock
>v5:
> - Fix CI failures related to lockdep
> - Address various comments
>v6:
> - Rebase for CI
>
>Matt
>
>Matthew Brost (28):
>  drm/xe: Add NULL checks to scratch LRC allocation
>  drm/xe: Save off position in ring in which a job was programmed
>  drm/xe/guc: Track pending-enable source in submission state
>  drm/xe: Track LR jobs in DRM scheduler pending list
>  drm/xe: Don't change LRC ring head on job resubmission
>  drm/xe: Make LRC W/A scratch buffer usage consistent
>  drm/xe/vf: Add xe_gt_recovery_pending helper
>  drm/xe/vf: Make VF recovery run on per-GT worker
>  drm/xe/vf: Abort H2G sends during VF post-migration recovery
>  drm/xe/vf: Remove memory allocations from VF post migration recovery
>  drm/xe/vf: Close multi-GT GGTT shift race
>  drm/xe/vf: Teardown VF post migration worker on driver unload
>  drm/xe/vf: Don't allow GT reset to be queued during VF post migration
>    recovery
>  drm/xe/vf: Wakeup in GuC backend on VF post migration recovery
>  drm/xe/vf: Avoid indefinite blocking in preempt rebind worker for VFs
>    supporting migration
>  drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC context register
>  drm/xe/vf: Flush and stop CTs in VF post migration recovery
>  drm/xe/vf: Reset TLB invalidations during VF post migration recovery
>  drm/xe/vf: Kickstart after resfix in VF post migration recovery
>  drm/xe/vf: Start CTs before resfix VF post migration recovery
>  drm/xe/vf: Abort VF post migration recovery on failure
>  drm/xe/vf: Replay GuC submission state on pause / unpause
>  drm/xe: Move queue init before LRC creation
>  drm/xe/vf: Add debug prints for GuC replaying state during VF recovery
>  drm/xe/vf: Workaround for race condition in GuC firmware during VF
>    pause
>  drm/xe/vf: Use primary GT ordered work queue on media GT on PTL VF
>  drm/xe/vf: Ensure media GT VF recovery runs after primary GT on PTL
>  drm/xe/vf: Rebase CCS save/restore BB GGTT addresses
>
>Satyanarayana K V P (2):
>  drm/xe: Use PPGTT addresses for TLB invalidation to avoid GGTT fixups
>  drm/xe/guc: Increase wait timeout to 2sec after BUSY reply from GuC
>
> drivers/gpu/drm/xe/xe_device_types.h         |   5 +
> drivers/gpu/drm/xe/xe_exec.c                 |  12 +-
> drivers/gpu/drm/xe/xe_exec_queue.c           |  64 +--
> drivers/gpu/drm/xe/xe_exec_queue.h           |   2 -
> drivers/gpu/drm/xe/xe_exec_queue_types.h     |   3 +
> drivers/gpu/drm/xe/xe_execlist.c             |   2 +-
> drivers/gpu/drm/xe/xe_gpu_scheduler.c        |  14 +
> drivers/gpu/drm/xe/xe_gpu_scheduler.h        |   2 +
> drivers/gpu/drm/xe/xe_gt.c                   |  28 +-
> drivers/gpu/drm/xe/xe_gt.h                   |  15 +-
> drivers/gpu/drm/xe/xe_gt_sriov_vf.c          | 458 +++++++++++++----
> drivers/gpu/drm/xe/xe_gt_sriov_vf.h          |  13 +-
> drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h    |  33 +-
> drivers/gpu/drm/xe/xe_guc.c                  |   4 +-
> drivers/gpu/drm/xe/xe_guc_ct.c               | 121 +++--
> drivers/gpu/drm/xe/xe_guc_ct.h               |  11 +
> drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  15 +
> drivers/gpu/drm/xe/xe_guc_submit.c           | 486 +++++++++++++++----
> drivers/gpu/drm/xe/xe_guc_submit.h           |   5 +-
> drivers/gpu/drm/xe/xe_lrc.c                  |  15 +-
> drivers/gpu/drm/xe/xe_lrc.h                  |  10 +
> drivers/gpu/drm/xe/xe_memirq.c               |  48 +-
> drivers/gpu/drm/xe/xe_memirq.h               |   2 +
> drivers/gpu/drm/xe/xe_migrate.c              |  28 +-
> drivers/gpu/drm/xe/xe_pci.c                  |   6 +-
> drivers/gpu/drm/xe/xe_pci_types.h            |   1 +
> drivers/gpu/drm/xe/xe_preempt_fence.c        |  11 +
> drivers/gpu/drm/xe/xe_ring_ops.c             |  23 +-
> drivers/gpu/drm/xe/xe_sched_job_types.h      |   9 +
> drivers/gpu/drm/xe/xe_sriov_vf.c             | 240 ---------
> drivers/gpu/drm/xe/xe_sriov_vf.h             |   1 -
> drivers/gpu/drm/xe/xe_sriov_vf_ccs.c         |  28 ++
> drivers/gpu/drm/xe/xe_sriov_vf_ccs.h         |   1 +
> drivers/gpu/drm/xe/xe_sriov_vf_types.h       |   4 -
> drivers/gpu/drm/xe/xe_tile.c                 |   2 +-
> drivers/gpu/drm/xe/xe_tile_sriov_vf.c        |  30 +-
> drivers/gpu/drm/xe/xe_tile_sriov_vf.h        |   2 +-
> drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h  |  23 +
> drivers/gpu/drm/xe/xe_vm.c                   |  26 +-
> drivers/gpu/drm/xe/xe_vram.c                 |   6 +-
> 40 files changed, 1250 insertions(+), 559 deletions(-)
> create mode 100644 drivers/gpu/drm/xe/xe_tile_sriov_vf_types.h
>
>-- 
>2.34.1
>
