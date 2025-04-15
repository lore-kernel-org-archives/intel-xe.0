Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4324DC369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 14:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE04E10E7A2;
	Tue, 15 Apr 2025 14:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J8L9flry";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D37B10E7A2
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 14:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744726908; x=1776262908;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=65Wbv7HfYK7IzjF4lyM3A3fLJ/Q6nsGyWTKJ5SNUeDM=;
 b=J8L9flryqebSdexvgC3GjgLlAgp2Sh16ivEu6o9+SIe22LC0BypM2kFu
 l1IpjneUE6woqXp0RSIuSS+QRrfB3wjtBDivbs89EeYJRcHQCJ2BOkpog
 eVhFGcvzHyCy4t4HxXGlzh12uAVbJyS+iq3cOMieukb2YgFLLs+Keoezu
 gm7Y6YieWCGiJac2OiFwR4zdFpb7RkczOOq1dvVYVUeT3Cl8DRVKVO43n
 MjeWz83NTyI/qCi+P9WmRzwnfFSLq70liKEDTvCiNBoDITel1Sa+YKV0w
 1bXKtsAGaGsasbk9/BXbB18VVITlIe+JdwXtjgA6CfBbjAIWLvIGpySph A==;
X-CSE-ConnectionGUID: fXUkLhyPR/mqZhzhPPoYfA==
X-CSE-MsgGUID: g5Q/DY7PTje8WbXA0jahPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46403781"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46403781"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 07:21:47 -0700
X-CSE-ConnectionGUID: Wy/IV0ihQmOlrI+ln02SXg==
X-CSE-MsgGUID: XE007cfsQ2Ke1c3qKJqNvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130097102"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 07:21:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 07:21:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 07:21:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 07:21:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpYzBqJsYnD9WCHPzhqtjmV7bRE9tQffVuXz24sI3F1TywDL/2so3KkdhuCpPrDyVdsM6iS13/Ala3KHZtzRZgo6hgmzlXTpU+t9ABS/HTC11Nasqxgsc2sHjmI3cMcfZsLF3FZ1FRCRZ1P8sHyUBpOmGY435ImZ+wqBnzRG8fCrlFvZwAdg9ci9vTr9S0XVR3nTRb75S9QZAKAuSLK7lw5kIWVbCWMwg6RSP+9CwyssKKYwu4j89Wa+7ZqR4ukrvg8SQwYCjegfASvuMPpqGxeqYCj/fRyU1ETG23+Q0Q1R8ki2tJgfhFCF+oePDe+7iGR6My+FIO3LJYxgsbkd9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAMfdITLPkjuVAhbFlmZctqXuUdhr1EzfHONc7eIeks=;
 b=PnXr2wHsLcyVnupIZ/P5Q07yPHG+OIasNhnd9pRgAd7rhVPVSyrpQppFqR6OUqPUgDaR/ipTazVsqTYnXoiW3j4ACWCA6XilpNliBdZ3gA+fvowjL28RYGAoakhC4XBbpmHLJRlSiGNxBS3CLwMwimua7bkDHdtdK51SATuS/97P0M2aD/hU2VA8DNps0Lkb23sk1VpZuatb5NKZtAOGAkD2Wlpk4pBzueLi4j7NOXE2dJxrr/TZuEx4Bhjg0AOilEj1vz1kPYoipcqzpTc8pIwjzrljgWtZcXwknLhjXOuT8Eeo4cotxwjIZu4GqcCw07kdvisqHqNprX3777OBhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA4PR11MB9081.namprd11.prod.outlook.com (2603:10b6:208:56e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Tue, 15 Apr
 2025 14:21:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8655.022; Tue, 15 Apr 2025
 14:21:44 +0000
Date: Tue, 15 Apr 2025 09:21:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5 01/16] drm/xe: Adjust ringbuf emission for maximum
 possible size
Message-ID: <lfkzpxkrhacp3rvbvjgi2soqxjhuvwn3ueuptnrt6x72ivxfwp@fqkojbw5gbeb>
References: <20250403190317.6064-1-tvrtko.ursulin@igalia.com>
 <20250403190317.6064-2-tvrtko.ursulin@igalia.com>
 <Z_5KC1Xny1EZCxR6@fdugast-desk>
 <6c723c10-4466-4d30-80cd-d8ef01ae0f19@igalia.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <6c723c10-4466-4d30-80cd-d8ef01ae0f19@igalia.com>
X-ClientProxiedBy: MW4PR03CA0264.namprd03.prod.outlook.com
 (2603:10b6:303:b4::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA4PR11MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: 18ea9b1f-5968-497b-3449-08dd7c28d952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mPReL0xDKNzgbK9NFee9rhV90qZmFICNs3zB17cWWBHMi+0hS8NFKAGvtzFM?=
 =?us-ascii?Q?NWhB1H7oqyB5Lj6nK0ir8j96aHOoxmOM1esm24PhZQqcuD8NJrdvrAelONEj?=
 =?us-ascii?Q?rmTZJEqP7RHRh7hHMQIyt+bjEm6itloJrHQrEK4F9sgVMMVJPnkexEDhls4M?=
 =?us-ascii?Q?YH4j3n7iYvU9g2yA/C/2kDpchtRUDQbZVtVkRekvmL0pOXwKyldQwzMsy4hq?=
 =?us-ascii?Q?SQ1e7C5Dy1u9og/+ZWJkvHdh8LKVRER6QiF08f4lRd0a1ENlDCMNIheJSWTr?=
 =?us-ascii?Q?/FtosS/X2JwwjAia8D/Jr9KqLG7MTOROd9+hLIJgm4cIUv0rhnHPnlqAYn6g?=
 =?us-ascii?Q?c7UQip8MN2RpDT3zFiE6l0QQabioq/eA/PdRuVm62BPgCihsshFAdaC2QHVt?=
 =?us-ascii?Q?8kzF4NAvYti8bW6j/qTcX9BFwUb7QARHOH3UEglkc9oFBLH1CQTOThAT6JR8?=
 =?us-ascii?Q?6ZhKfL3E5exfl5vS0RDgbx+UYq9CuLjF5Q63OVQbQcmVLtLmur+ZSk5lIgVG?=
 =?us-ascii?Q?qL8WL5Lq430eDlO12rxlhWGYuuTXpaLmrr/BdeGFy5ozBW+e+j6UJGFdfVVB?=
 =?us-ascii?Q?JW5znMNzNUM88OI13ieiJfSjh1tiwlOwLpdUf2pGP82zDlYhKnCugtG7Kd2l?=
 =?us-ascii?Q?QbeuXBUJHGyWin1jDWKoq8FPI2AdIEGeUcWyzfyfGizbXMwQjiE1gHXpagQj?=
 =?us-ascii?Q?XjUmf/HyUzIOve6tRUFz9zm8JnIcDIS9yIsqAVEnSHqqc2ZBqZkxBTWaNgMj?=
 =?us-ascii?Q?66m7Ij5tHOJkW7bJN+MBcisnqcs23UCBjWcXsWFw4F3mq31W4OYE2p3kiMRW?=
 =?us-ascii?Q?bhsPuFkOCutHJYT1U3dI1Ie1aEgU4GHFixE7FHSxIHPNlGFOmOuqgGVUAdga?=
 =?us-ascii?Q?o31c4Vzmyu8kZ0ir4YoMWis2NBEQvGljz/UM0w/jv7oAh07mXO4Ch+vl3bIL?=
 =?us-ascii?Q?DSDSVdT9PlMf8IU5m23Y30o6yi3w10EJcLhGMdJYBwHvhjuEfb3YeCov9jA8?=
 =?us-ascii?Q?vgupSLuurK0H5fX/9lkQSzMQvNhdveFJHFzY+IJsM9PSEfSpmDdFG5vn4Mig?=
 =?us-ascii?Q?U9nrE3gy4xUU/DKM9wVFFYgyLuOdIvEuRKf9kt4F6QxC5U3Zt8KpQKLqNVjd?=
 =?us-ascii?Q?FPyBFOChAfUosk/R2RGH2DYfN4OD0oYE2ilHaGbz2IaqX5o8vFM0vMx5PmQQ?=
 =?us-ascii?Q?xeEECWpAnhjS4Ti2xo0IykVzcJHQcQW6J+xokeUYLhLWag4azzCx1dZet/uQ?=
 =?us-ascii?Q?esIbARV3ErfkF9Qnleo0/cnDKumw54GTE275h4+WfhN9kE8NKJa+mih974HI?=
 =?us-ascii?Q?HQVReAQhtU8YIXPauboKMlEXfralSmh9BcdicbxNM7m46PTmSMcmczVdLofZ?=
 =?us-ascii?Q?0jhw63zojVNVbfsfK93Py1VyoFLIkomAHxllIB9DYxKxok7Vi7HqmqGsJChS?=
 =?us-ascii?Q?TIHcB9Qaqc0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LFVCMOM6jfcKjtNNxwIh4mhwclamwlvYJzvDHWccXOOa19h3I1rJ2BbK9YDD?=
 =?us-ascii?Q?kP4ob5JcDAex7BpkJ0NFKU5xP7BP8tVxN9o/gDhAc7FAbYBmSJIJMWeg8lZX?=
 =?us-ascii?Q?WqPV2EaMbmoNoqyvM//yh3ASBPs26u9Hww/zDYu11qtbaSa9fi6XfY6mpZLQ?=
 =?us-ascii?Q?Bol4qDRux8Bi+69jVEtHDubfxLwES3/G5e7qCU50cfBeP7Pd2Vyzn/1Ntmn1?=
 =?us-ascii?Q?eDBNHMQdlXAK0ZjSz4PbO35xyheSWYFuLb1NVxxyCxgqXfoS1wPCB9wsejH3?=
 =?us-ascii?Q?4CMzu30W/rIUkJBXphL5q99hrJKbV4SOEyCaYVF38rokIwM9RzUM3g54miF2?=
 =?us-ascii?Q?Hn61jtrvAyRX8f+jOHlCpIFtaeLrg2tIhB0IlNzkH2qygIxts388XFBEkGtA?=
 =?us-ascii?Q?9KLQZW4Uev23RmyP63PYSy9P6izbcjX21bOPLCCItpH1RAzZuV7rC5q2Yqp7?=
 =?us-ascii?Q?TkEQlTMbuH2T6vrS5dJMtUu4lVEuj89GaqpXuJTKEakv3/UG9b+ehf9V65l+?=
 =?us-ascii?Q?HY2XPbpw12gehhQYN364+wksoa56dAbASd6MKS8kJfFHoMFNbSq/ddI2+8am?=
 =?us-ascii?Q?GRTibAOydAF0UJUSPUb3SxffNw98qjx4fSu9/Zc9dIqmLsSwXiMIckNtJnD3?=
 =?us-ascii?Q?fnTeLYdXdl9tAZgb8ji0eadIDZ63l0y3706tPFcl/pIUKu6nub5DpQ/m3TMA?=
 =?us-ascii?Q?7Q/bcWRDBHo+L/vDAZIjKrZexNLAVfGey0mzBPcMXxuADoh1rakTrC2oPN7l?=
 =?us-ascii?Q?1Jj1b59oigFgfqzmmn7HYvar8lOEaBJKxG+zg8WGhykwf65eh6dgiDG4+VAa?=
 =?us-ascii?Q?nWcKrfpAdtEePWvhuO2aheP5jCFIWiv9eHwODLSZmvj8LB6EJGmSzXZkFuOM?=
 =?us-ascii?Q?rewCbMMcoZGiLinrDixzEbS1QslkPeoTjSuClO6jN7KNcmL9m+zIT/mDIPz3?=
 =?us-ascii?Q?zEdkoaV4nDo04oe/nqamX8tVXfiZcbChMc7OnzMj2KjqpNP9tkHRSMjFK7jg?=
 =?us-ascii?Q?OrVjqdpHb+NTIH5D2viDWV1NDb0Jf/yWahsqwDaLf0JlF6J+jaft+hrK9ncD?=
 =?us-ascii?Q?0hwhTZw29N5MGc15JltVotzdw0PKPbYlSH6Tpp9FZ5fWvJyCpcI7t1M3vT7P?=
 =?us-ascii?Q?+fyWtck133n7iQaX80bt3l60SFSgfxV5AH2kOqPPOTm4+L3bw3UBVOeWVFEi?=
 =?us-ascii?Q?Y74Jx31maT3mkcxAE14LbxD9F0/S6eeNtEfWWsOO3sBYArl42oQvMDNA50ZS?=
 =?us-ascii?Q?Ks9FhIbhwEDDspYrRGtQ2enQ+9DSZoms7LFrFvBvTk584B/to3MnTe+WIjPC?=
 =?us-ascii?Q?G3pSddO686RfnVI9e25astgNgOK5/CI1u65ITI5WgQTMFoMpOmqIEMIHbD2a?=
 =?us-ascii?Q?ZAQmSIU6irs78PHCrOfleZsO0V0Ta4mWZ5+qPmfuYa7D9JSKdCQfN9+mwXlN?=
 =?us-ascii?Q?4YLKmZ1UqEP2ANODWWKbGojYnspUvmtYHfeOONYvtlMKTkTI7EuyMwh/ORcS?=
 =?us-ascii?Q?9GAK8wPNIQGfn44cKXjh/dbVbTiU7v175hrezF9m8C4FHDwDqWxkk8xfgfC9?=
 =?us-ascii?Q?wa1NaoavCv8wawKxzH0JOp7Df/+WnJ+0OZdufvcXce5ptVk1nzzvsPn7VQza?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ea9b1f-5968-497b-3449-08dd7c28d952
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 14:21:44.4490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0RCAYyutzvKhI30WxY3lAQr2/bss7bh7kRR5rslLRr2d/j7p/wRqh3PDzX3SynAyZhppW0S/7mgahXCqp5JGhv0IrrnDmSgPLxGqneZa0+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9081
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

On Tue, Apr 15, 2025 at 01:40:26PM +0100, Tvrtko Ursulin wrote:
>
>On 15/04/2025 12:59, Francois Dugast wrote:
>>On Thu, Apr 03, 2025 at 08:03:01PM +0100, Tvrtko Ursulin wrote:
>>>MAX_JOB_SIZE_DW seems to be undersized. For the worst case emission from
>>>  __emit_job_gen12_render_compute I hand count 57 dwords so lets bump this
>>>to an even 58.
>>>
>>>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>>Reviewed-by: Francois Dugast <francois.dugast@intel.com>
>
>Thank you!
>
>Can you (or maintainers) take this one from the series or I should 
>send it standalone?

applied to drm-xe-next, thanks.

Lucas De Marchi
