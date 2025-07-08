Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C480AC8303C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 18:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81ADF10E6C8;
	Tue,  8 Jul 2025 18:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKrFj6pC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A0010E1B9
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 18:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752000529; x=1783536529;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tp1E/43LJmGrvTEeWlZ7Wuiee8jvGR5yfdUJYV05hOU=;
 b=QKrFj6pC6XVkM7uFJXtVQplefk7S0rsCkQo0MlQ+IJkk38jTJemrQqbf
 9a9uDCkZ4gdiOJBe+6j1E0dhCP4X3cRRMARNHaWABL4WoAMMiAerVL36t
 HzW80XwXc43v4iegS92e6gq/BCPnyPm4H4ivGXStxBhNliPQMbCCtoN5a
 DT8tO0/EiZnNcdNRDBf6QkEBox7DW1ZBIK+erTXmP7Kzu/ZLQxLdmgd1j
 I1GRwMJ9v//dpF5v/ZQ4Qs5xGgKHpa3XdofvLaAnqPxXQA1DUXpbS1mSF
 exb44jL+KdjQx84NLNh7jwia+zt9eddCbFp7C/thMz1WPSra/UNC+gJeb A==;
X-CSE-ConnectionGUID: FBV6dY0CQKmSYUWFcuX9SQ==
X-CSE-MsgGUID: HFDd8QXAR1+s8m8Me87POg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54225515"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54225515"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 11:48:47 -0700
X-CSE-ConnectionGUID: ZbPTyCIrQOOkV6VXzkMcBg==
X-CSE-MsgGUID: PHbIh/N7QBePLx3bWwBFng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="154986166"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 11:48:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 11:48:47 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 11:48:47 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 11:48:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gPs0GHxrbpl8m76HBkTCQaHyaaRYL1YfcW7N7KPH15lEDri+FAAS5Q9XBOhYiovslw4eITrQ0gp1R40lw6uAAuQiXiJZUnv1mkJda5Oz0l2xUnwwRE4/RnAj7bUojZZn6MjkI0BiZaG+rUgLWpAo+9+HPkPcF5uzELRPtBrFfYjMMpllqSVKNqbC/DNumA1Agbi5k3mADw7fgfESpTKpmI+I1j2z55nsQBATzLvpGiqApRBayutbW19+lOr13d2FJWLgVb4MwjVo7dNJMO7DOsztwtHAzjEkvRUTLM0i2FzlsiyrkvJCcn1lPLHoKxFeqQ3tknVOFh+xZkMUZ0/stQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOacanW3mFYNRFsXbjvmGWZIA6auRP2SXz3YVQhagWM=;
 b=QZEttkLkD8ePFpD8HZuW+h4GsnQv6n/R5TsH/Y87JbFm2+Oyxz8CTpuuwkT+gdvKtUgyJElnhkUJUIUKNGH6Q6s3oMbqiyiaMBeczm2EZ3ST1oEUAj8qLoTPNw9gPay0MFWrjEV9kjCbOs/d1SeR++G6CuyagVZ3et+h+mhGOONFSmVIwpz6nAH9MxhonukewZmFrSWuw5dHxr8Ry3yD4Ckh8xObImNcaKEvcy81uGqFUwfM6p60Dz49qb8PFOV1+0lDsBBbB7sUjAxIkvZIU1bcwxZL1UVsP9SCUMjt+1Xm98wDEvnjhw+6SgZAiA8TI68wxRs2aPjz/YxxaSUVgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6137.namprd11.prod.outlook.com (2603:10b6:930:2b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Tue, 8 Jul
 2025 18:48:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Tue, 8 Jul 2025
 18:48:03 +0000
Date: Tue, 8 Jul 2025 11:49:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: Re: [PATCH v9] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
Message-ID: <aG1oS2eHN875k//x@lstrano-desk.jf.intel.com>
References: <20250707231108.3217573-1-zhanjun.dong@intel.com>
 <CH0PR11MB5444BDF25578E61761DEE2E2E54EA@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444BDF25578E61761DEE2E2E54EA@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW3PR06CA0009.namprd06.prod.outlook.com
 (2603:10b6:303:2a::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a6f1d9d-7b2d-46a0-f2c4-08ddbe4ff85f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kOUnrbbWLM78lfMwrbvFRtnFOKxAEwDjeKjIl2zqaL5jrJ2E4reEop3wEmvF?=
 =?us-ascii?Q?o7iyHcAjNsw0xBjGGaRDQcRn9ClaaLvPZYumbbgbliJm2RQkLQdFA/eXArmo?=
 =?us-ascii?Q?foJ4i5Lcvowaf5EalXlDHlElromKoDJzntdQJHRBrZmtzNSyTShyQwzI3G9c?=
 =?us-ascii?Q?xYzy1URNf3iz5oMsooFC/sa02R2xRuXmAu52Tjx6DUsPThVb4BxfP8zL8MI2?=
 =?us-ascii?Q?fEi4r7OF93vAKzee+qIShUDgIEr/PyZoPJ52ohxXs6coBMNHJYXo5JBXqmU6?=
 =?us-ascii?Q?H7dXKrD8kQ8YawTGQ/uRH50dbAzJkyAGD3wJH/n+aOGmKQEw2+NKlJ8Fx0jc?=
 =?us-ascii?Q?LXBuBfp8Qgz+6VGLoSvyhmIYVYOTVC+JqzXsLSMXmp/XicZcIfy7wP0mcdOx?=
 =?us-ascii?Q?YSYubf9ZT0i5Yq1gbKbsosIOQNftxUKxndcG4xYdnEzv9AR6oKwkmnz5hLJv?=
 =?us-ascii?Q?hUwq2B1PTsI16zZLRIH4552YMyZWhS6qlM7NWJkxwRI/jpJUiI3/AT+pOAsV?=
 =?us-ascii?Q?+xFZq+d1lQ/v1MQfOS5bQqApbWoyz7KKyn9ryehchAHkZcOT6fgm/skgHxxu?=
 =?us-ascii?Q?cVGwVDwo+LnrUvqLZzK0wUgAkmKqLiCYUDAlXAV17290GaP6HaYL9ZS7RIHM?=
 =?us-ascii?Q?iQKDc28fU3u1kjTU0UHcJXxCgSV8/AOgqhUD8ResW7sKZgBFRgL7BhA8sl8a?=
 =?us-ascii?Q?ZHcOt6ujSjjChr9M3H5v/4nZGea88wWy0XcBkvEXuZk74RwP9cllG6IUp3vh?=
 =?us-ascii?Q?mEWDxYifJ29HKBWaoU4HswxhF0wjXvAIRI9rqe4HQPyjQOTlNhLlysQfB/fZ?=
 =?us-ascii?Q?Sfd+GyRcxVXTy5jAMqhakzT9+lnj3TSQS6iGbH8+FC8Qrh8qY/q+r+glWkyc?=
 =?us-ascii?Q?eGW9p+x4sq0q2yR6Ee7dL8JramfyYZVqZNUxN7k2iB45duXoZvRAysJw2oi3?=
 =?us-ascii?Q?f2J9hKGBM0KRlXeyDs9lyBSTLpOwhm/xDJHI7XRX+bkj3ViLEHDmOq6zCtlw?=
 =?us-ascii?Q?hPkoW7ipGh3v2zw1BYQvyk7fg498rA1ATyG2HDgyJdxKv6NCBX0ZgMjQ3BKF?=
 =?us-ascii?Q?LGhns0r4v7gznL1bb1Oka1kZqcjJZKo1WA0EYwZi8b4+YtC+e8z5wzLFblIg?=
 =?us-ascii?Q?93cLKu0HKQczPi7KzLe6idO8PEd6YCz9cAkot9VrBdEQs0fg0/j51eZk50Eo?=
 =?us-ascii?Q?CPg22BGgoNNwBRWrS74C7aBRNtpVrwiUBGeA9IQCKD75kGsoVyHOdNRByJ5v?=
 =?us-ascii?Q?JERtjdVA63ybKAyMR66lGICi9tuMobseO0pyvp0N7qoivi+ajBatSaABxI8r?=
 =?us-ascii?Q?pQSEnkEV7AjKNCpvFPiPoYP95VH9Es0bpmAkbH6iu5ayA4Zrzs2CMxH9q+r8?=
 =?us-ascii?Q?CsrBDDk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yz6yG0Nxf4CnshGFXpvwFKeCuWVZGad+ZukogXa4P36ZD6deBcN9FZBfFnkK?=
 =?us-ascii?Q?PmAtMLt7NWQviwXOOE8lA15ui+zKh3LQQVyi+iPpCoJJb74KefYqx137DcKV?=
 =?us-ascii?Q?iMBq9kRHXU62BOXX0SRuw4tZAOqphUwQyKtqSyq2ZCwp1Kmayv0AUOgtm/ey?=
 =?us-ascii?Q?Acbprmiss6CVb3SbnkioMBpicJTicaLpZ9Apk9tkxap9KWpUnXhpXDkvVSw/?=
 =?us-ascii?Q?NsvDFB3+CWx8eV7ZJcB6orEtekyqT2ZR1HhToKj6ZNzv6ImJUE3B7oChTjmV?=
 =?us-ascii?Q?NB3kTi4lO5Y98/QfzRYuMk5uUZOChTg77+fB7xuMHbDUI2oOKUgmXCXmCvuf?=
 =?us-ascii?Q?vvVOEDFyZg1l3EbpNhJjJquYBYOsIkuFuJkFulTKuHAI0fT2gkvXtNC2pyFT?=
 =?us-ascii?Q?hH7/dUL92m234zo4STwHtHy5QzMAKgV3HoriPt0V55bfGwOQBzThY38RYbva?=
 =?us-ascii?Q?JOslaNZuVRNxXeBfyXUKbKD7ZwHN6RntzqDkwoUyVNDtYrSFm3mLXa/Lx7Bc?=
 =?us-ascii?Q?CfcAuMqnGUl/AyfpFVA1+YSFQq15atB3stT9V532gMJrdDnDpjmB1Kj6U/ME?=
 =?us-ascii?Q?1a56005qCpZtImTMHTSd8TH/o+aohIhY1sND/94pUvUbCC4D8ld58/uDZTnJ?=
 =?us-ascii?Q?W3XfH4ZuhcjRjlaaN+jpjExI17TPkDMqXa3ZcAqOTAxq/aJcA6y5YFEkNKDZ?=
 =?us-ascii?Q?Ukc6kSDhLkmtwlCYbxV+pg3DwOkeRZFifGt+y6nOyWzx/QiR27kX8pRkXXfr?=
 =?us-ascii?Q?UsFiCmDshzKJzEHkMLBVq6fVD3IzLe+urQQnWDt+IvUh1Z+s9eq5YeB9j8QQ?=
 =?us-ascii?Q?CJeqlXmgPipuNL36AcZWSwv5bSAYT6KVLp4FUkWEPKP493Q8u15ybjHepmsW?=
 =?us-ascii?Q?FDMrmN7AagsUmcmTNmfMsq9aiEwKbVAZk26lQM89s7TAHQVUnIXJlGEICRYu?=
 =?us-ascii?Q?9e6eUsxeAeJZum1aeerz+t5D7SoCA4ZNSIsXpBR7DqXHOMfeItouySRtWpWb?=
 =?us-ascii?Q?Gjz0kh/ga+mbg0BZ7xIYKLBA5O+t1/XcQgKMz7cvphDnduYH3yTmr9y+joYC?=
 =?us-ascii?Q?tnD8vzNK/KSC4m0sVZ+nVfkNfeej920kQJPzimgC4PtA9H7QNp78cvsuheJl?=
 =?us-ascii?Q?yHKXl4QfnTeJuvHCqpJExjI4MF5uZQmifskkvZjfWq0OPPtJTJkO9ZKJujAm?=
 =?us-ascii?Q?WcBo35J5FmkryiAXlDivn+uru/N2Lr+v+g2xxlo9SYvMWQyi0Mf03Ap87UOB?=
 =?us-ascii?Q?QYFMJsRaOvR2j0SRRxdkgo7peGIFG8T6FIDOIScVkd79Y6F0qAG2iM4fdAIT?=
 =?us-ascii?Q?oel0kiQQQqJMBQfjjq+63y23qGBlmJBSC4w3CmllKZSGfqj4bmXVS0lBI297?=
 =?us-ascii?Q?MHXHDIgTPKROdbvwXLS2aFeoL3BvFV7ndX82w3wxMnUaXYUXeRFtTG/Iw5yd?=
 =?us-ascii?Q?MX/7FPDF0lbPgpjiHAgFxIX3t7pRpLP32yYU37bKBfflLmFw7rxzHGUojJEe?=
 =?us-ascii?Q?cwSw9++IARI592CRBY9/bVJy9WVEb4yMoJVqCP9dcfQLEQ2Y4f6BybslELnr?=
 =?us-ascii?Q?OjeZHQ3KrnI1+DhB2Fbf0dFnnhJ4a0xAQSlBqW0uZNWnVHO1J/lO8f05uX6c?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6f1d9d-7b2d-46a0-f2c4-08ddbe4ff85f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:48:03.6172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjbIbtAe7E//1AsTDvK0AQg6K49KrJ7nJhD53JA2cYVC4sShgEghoOysN5IycOuIJIk2QiZxT3wU/dw/ajF8Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6137
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

On Tue, Jul 08, 2025 at 12:36:43PM -0600, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Dong, Zhanjun <zhanjun.dong@intel.com> 
> Sent: Monday, July 7, 2025 4:11 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Dong, Zhanjun <zhanjun.dong@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Summers, Stuart <stuart.summers@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH v9] drm/xe/uc: Disable GuC communication on hardware initialization error.
> > 
> > Disable GuC communication on Xe micro controller hardware initialization
> > error.
> > 
> > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917
> 
> I think you need to swap the order of the Closes and Signed-off-by,
> but that can be done at merge-time if it's necessary, so there's no
> need to create another revision for this change.
> 
> You might also need to remove the period from the commit name,
> but that too can be a merge-time revision, so again, no need for
> another revision.
> 
> Otherwise:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 

Also the change log is typically above the tags, since it is pretty
verbose for a simple patch, maybe just drop the change log.

Anyways:

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> > 
> > ---
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Stuart Summers <stuart.summers@intel.com>
> > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > 
> > Change list:
> > v9: Switched to xe_guc_sanitize
> > v8: Fix kernel-doc style
> >     Add error handling in vf_guc_min_load_for_hwconfig
> > v7: Add kernel-doc for xe_guc_disable_communication
> >     Unset submission_state.enabled as well
> > v6: Skip disable ct on xe_guc_enable_communication error
> > v5: Set wedge is excessive action, revert back to disable ct
> > v4: Fix typo and add new line
> > v3: v2 CI re-run
> > v2: Remove unnecessary jump to err-out
> >     Drop disable ct, switch to set wedge
> > ---
> >  drivers/gpu/drm/xe/xe_guc.c |  8 ++++++--
> >  drivers/gpu/drm/xe/xe_uc.c  | 18 +++++++++++++-----
> >  2 files changed, 19 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 8573957facae..b1d1d6da3758 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -1219,13 +1219,17 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
> >  
> >  	ret = xe_gt_sriov_vf_connect(gt);
> >  	if (ret)
> > -		return ret;
> > +		goto err_out;
> >  
> >  	ret = xe_gt_sriov_vf_query_runtime(gt);
> >  	if (ret)
> > -		return ret;
> > +		goto err_out;
> >  
> >  	return 0;
> > +
> > +err_out:
> > +	xe_guc_sanitize(guc);
> > +	return ret;
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index 6431ba3a2c53..3e0c3af235f2 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -158,7 +158,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
> >  
> >  	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
> >  	if (err)
> > -		return err;
> > +		goto err_out;
> >  
> >  	uc->guc.submission_state.enabled = true;
> >  
> > @@ -168,9 +168,13 @@ static int vf_uc_load_hw(struct xe_uc *uc)
> >  
> >  	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
> >  	if (err)
> > -		return err;
> > +		goto err_out;
> >  
> >  	return 0;
> > +
> > +err_out:
> > +	xe_guc_sanitize(&uc->guc);
> > +	return err;
> >  }
> >  
> >  /*
> > @@ -202,15 +206,15 @@ int xe_uc_load_hw(struct xe_uc *uc)
> >  
> >  	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
> >  	if (ret)
> > -		return ret;
> > +		goto err_out;
> >  
> >  	ret = xe_guc_post_load_init(&uc->guc);
> >  	if (ret)
> > -		return ret;
> > +		goto err_out;
> >  
> >  	ret = xe_guc_pc_start(&uc->guc.pc);
> >  	if (ret)
> > -		return ret;
> > +		goto err_out;
> >  
> >  	xe_guc_engine_activity_enable_stats(&uc->guc);
> >  
> > @@ -222,6 +226,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
> >  	xe_gsc_load_start(&uc->gsc);
> >  
> >  	return 0;
> > +
> > +err_out:
> > +	xe_guc_sanitize(&uc->guc);
> > +	return ret;
> >  }
> >  
> >  int xe_uc_reset_prepare(struct xe_uc *uc)
> > -- 
> > 2.34.1
> > 
> > 
