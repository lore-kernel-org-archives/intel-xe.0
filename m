Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB8ACFD2F6
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 04:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FCA10E0CB;
	Tue,  2 Dec 2025 04:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZwSjD3B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A7310E0CB
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 04:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764648125; x=1796184125;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=QlCCJPY1e4SyHbnOj20b76jnMyZLi7tC8tkOjycpk5w=;
 b=kZwSjD3BOmigv38yOo5HiOb+9HLu3tE2JABVDzY4TvGscCj7z5BuQnNH
 dIAS+BvUhI4Kfskg7Coe9hV9JiYNgaPEKha5igxw1OsAt+8oUM+b7/zUI
 5t2GyQjRrHTL4vOe2SmsVdAdstWJW40HIJxFIqRULuDgT8RSBvReQW9on
 T+tQovDCp7touxm5K7YqwpkVLUkt2bWgU5ySgnsMbzz7JOvBqm9Q4Ky0M
 pk36bVc/rQDIyunyVtVUQB5e7MFmzVfN7x8UvP6IG8s16Y+cRjsswZsfp
 xfT54plmiUZ0OqV//E6ySIfqQlNUekyOl0tdvOTN1rfmaZB25oR8XhgLW A==;
X-CSE-ConnectionGUID: KLLzzrdLQuqI2GS4t/skgg==
X-CSE-MsgGUID: LPWAaZqQRHG9sDXvBcI7rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="84205321"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208,217";a="84205321"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 20:01:49 -0800
X-CSE-ConnectionGUID: 4ZYJ1AQ9SBGYGj9Fz3dVSA==
X-CSE-MsgGUID: Li/Gs4LxTC+aX40Vuxu6Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
 d="scan'208,217";a="199196926"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 20:01:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 20:01:41 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 20:01:41 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 20:01:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsk2fiLXHnVbtpGAqx+n7OiaS9DMabcgXRXM+tcDQLJEPt/gE10AxCoBwa+RAvmpl7gGhschzI/iHw/zz7qHWPycXUs7RhHl0MkBdidVcLky2oGeBII9gEI0VzOPzcCIEjwdf7xnmKiLh410zBG3/VCZzfKQdl3w+j/aU2NXR/Fr8U76BOusj/Tap89Wsy411yo02nAmhT56JXwEL5T/60s88XVUOvSZsyvCxh/GxdB7y7IAQKbeHnNnuxL5THchX261N3ePvaR4fu39F1elTAw5ALGJ3P6u7ggUTn7MWo6b733DBB6EVcforJjj05vX9Q8bI6Ak8CPhQqGGRgX8ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dsix9jXEOK3tAkSAXp4aAR90nlhnNzIT1Ir4MG4nOVw=;
 b=acyEZmyjLcxhujsnjBzUdp1C1igFkgC4aMriGmzjJbtqizQMtvWu3wFx94BfcLmDlyRWXCiRs+/fgbQCMV6nemkOBi06Sz15igieHZCXbluDYcBLuITchuLDPbra6VABFmxlZyMdgZI5jszJyD47t/JIg4X4qRSbrTbGmTfkoWFnk7k2tTlCoiy4w8YbA6F6e1SfEnqUPzO7p3zigQSqdJWlawBypo/emvEQKN5J92sOe9U3beKZp4W/UkOUtQDD7UpGcRB9W+Lqd3Me7raKYBsARrF2m4Xv+0u5a7HJaUN4EKsCZJWwPN3dxVATJ5kw8dozn0m6NA/FAhBnafWmtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB3041.namprd11.prod.outlook.com (2603:10b6:208:32::17)
 by SA0PR11MB4768.namprd11.prod.outlook.com (2603:10b6:806:71::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 04:01:37 +0000
Received: from BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3]) by BL0PR11MB3041.namprd11.prod.outlook.com
 ([fe80::8f61:c439:8828:cbb3%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 04:01:37 +0000
Content-Type: multipart/alternative;
 boundary="------------7n1BWqNFEsKaySjwfqjaFptq"
Message-ID: <b28559ca-d69a-41f2-8075-c9c8cb2bb091@intel.com>
Date: Tue, 2 Dec 2025 09:31:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 4/9] drm/xe/madvise: Implement purgeable buffer object
 support
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-5-arvind.yadav@intel.com>
 <aS5FAhlXkBly4a1D@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <aS5FAhlXkBly4a1D@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MA5P287CA0087.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::16) To BL0PR11MB3041.namprd11.prod.outlook.com
 (2603:10b6:208:32::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB3041:EE_|SA0PR11MB4768:EE_
X-MS-Office365-Filtering-Correlation-Id: 99fbc28b-bfc4-4ac2-ef62-08de31577d84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGJQdWZPdTFNdjFLOWt2UXBseHVjRjdsMlZUdDkrdXBCTU5vejFjRWRLTUdu?=
 =?utf-8?B?U2huUTc3K1hCc0VuQlFYNVBmVGQ4M205dGFSRk5NcG1pS0w3bE1iMmh4K3hS?=
 =?utf-8?B?bC90dlYwWU5pZ3JJSU4xN2ZnMXdVZW5PVnUxMGpyWFFva0JRMFRzL3MxVXZr?=
 =?utf-8?B?UW5lbVRPSzJqV0hETkRIcWhNTWJ0cDl0dVE0TDMwa3JxK0thY0EybEJDVWt2?=
 =?utf-8?B?bitWMk15RmNTNVQ2bXVKNG5TSHp2czVaRU9pMlMxZ1Z5cUdHUmRqM2Z4dUZ5?=
 =?utf-8?B?ajhPTnA3WUo5K3VGZElmdUUzblNzOWVuTHBsZXhESUJ4ZkEzeFdrczU3dnov?=
 =?utf-8?B?K0g4ZGY1YXQ3cmRKcVV2TnU1YVN2OFl1eVRGNDcrNTR6TFdxT20rL0w0REhw?=
 =?utf-8?B?MVFYQmVJSEFyREpkeXByeUU3djlhclN2YmJjQ3hSYTZ4Tlh3SWdPTkhkOCtI?=
 =?utf-8?B?cEVIR0RpdldGSVZnKy9nVFBrTVpnUVg2eU9VWThwSnRpNHNVNkp6bnNrSVcr?=
 =?utf-8?B?emROWlo0YU05QWhaRFduVjRUZXVmU09QanJyNUV4Z1ppRkt4dVM4TzdpVXJW?=
 =?utf-8?B?ZU05eWY0ZE1hczFUTjZTZ1RUd1FzMkRXb1c2UXc3WFVCYmVWMXNLL1NTcDA4?=
 =?utf-8?B?VFU1cThGbEVlZUZndEJxanJKbFBYZGVTMXlXcGRCdUxaWkt3QkpWY0YraUVv?=
 =?utf-8?B?ckpPd3l6SDRBcnNJZTNhUldRd3grdm9rWG5PRlVOVHdwZndqUmlsVURWdkdz?=
 =?utf-8?B?S2xkb1k0dlNsMTZuRWFabDdmTmluM3piaHo4aXlhRUw0SFd3N0NjWmZjTzhz?=
 =?utf-8?B?bVJjaHZ1eHZVQWlqMmMweW4zcGdSaXNNOE5UVHlERGpNYTYvQmNSMTFpUWtq?=
 =?utf-8?B?OENueXVCZDZQT1R6TFQvRjFFYWVQbFBKZThJZ2JHS0k2N1pUdjA2NStMd1Fk?=
 =?utf-8?B?R0xVNCsrdkY0MVcwc05MS2pabWNFVE1CWkdCRGI2TmpkQXo5SU1YN2RtZGFq?=
 =?utf-8?B?dFl3aVZ2MTRDcFhpWXpUM3ZWT1F4Tll2WkZmWEc2MnJJOXZVZDBFMDVQL1NL?=
 =?utf-8?B?b0VYSTk1WEF4ZWY4R3BiUDJWMVJwWVo2ZjVRSmt2T0paSytmSThuc283Yll5?=
 =?utf-8?B?bkhjanZDY3dBMVZxM3RreVY0ck1ZNGd5L0xkeHVMb2VpaGxxdnJJN2RjK0dU?=
 =?utf-8?B?WEJ2bmVRTHBmNU1MRE1wQURvbXpQd3pCZSszM1NkYkJrdTNnNS8xR3lZUVAv?=
 =?utf-8?B?a2tLdWpCUElGeWxPRmppT2JIaUs0OWtwRFVMa3Z2MldVUzJPcE1iRS91UnNR?=
 =?utf-8?B?YTg2VkdrTVc5emNUdWR0dU95c1BNa0R4T2xscWdTcmFSaWxBUXVhWU5zYi85?=
 =?utf-8?B?Sk9ZTXRodlNTVk90d29HYUpHUHhUTnBRZXc5RzMrbFJ3ZVNPWFEvOGxsaEw3?=
 =?utf-8?B?cFR3R3MvNCs5bjFYejIwRGllaFVodVY0WmhKNUNqK1JtWGIxcUladHE0Q3VK?=
 =?utf-8?B?TjA3TG10eTJUNWx6L08xNk5vUUl5a25Ybm95NFFQWnRCQXErSTJQMnEyVTRF?=
 =?utf-8?B?S0paQ0pkL3pPK1FCSys1QWRYNVdwcEN6UzVxeDNpd3MyL3dhaXg0MUU1MUxJ?=
 =?utf-8?B?b2dUVm0yNDg1S1dreEQ2bWZ4V3MrOXZkSXF2RDVEK1hxeGI5YUF2RHA3WjA4?=
 =?utf-8?B?VlU5clVHQ05yaFEvanduSVZxNnVCUnEwdzVKY0NCcUlENUpIREJQU21DVTNL?=
 =?utf-8?B?NWFqbHBEM3FDcS9VZWtCVlFtUHQwS0ovWkY2QTRXeHVtZUh4a1RuNmVvYTZ6?=
 =?utf-8?B?a3lYcms0OG5jQnVNQVpYemcyMVVBbGkyalVITi9PR0lUK3VrcWdJeXZkemE1?=
 =?utf-8?B?NjBvbFNMMVpvdk1CVGVzWjdQNkNIV2dLZE5laEQzdzVqU01RZUhaWTBuaUpl?=
 =?utf-8?Q?K5MSH18NoKtSfP7EEJUlwCNQ8yA3yaGa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB3041.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEYzOWJKQU5BYk5YTDFDcnpIWUpoTzRhbWl4RTVmNVF0SDBuS0lqQkRTWklr?=
 =?utf-8?B?QnM1cUpZU2NhQzJ1UFg0eGFDM0owQXFNa2ZBbnJ2STVrNHpOK2pGZ0t0ZTB0?=
 =?utf-8?B?SWt0V3ZHMkVzZ2ppZldJcnR1WUZyWXk1bzJIUWZPa2dJV2xZaytvRTY0d0JY?=
 =?utf-8?B?MzdhRHBGMmY4ZStSMjBldmltTVE2RVhDR3RvSmJxWkJMdDFGd1hDTGhNdlpo?=
 =?utf-8?B?Mm9sWlhQeXlKSHpLemcvL0IwTXBhWWJBb3orc09WTEFiMFRGbU4vVldkSG9O?=
 =?utf-8?B?RC8vRm9QL0w0elF3ZVNyNmJzbE1oeTBZU2lHL1VaekxFNktMUCsxNlQ3MVNV?=
 =?utf-8?B?LzJzSzRkb0RlZVhQNGxDcGhMTWxDQmZUNjAxZmhzOFZhZVpESVpIMjJQcDg3?=
 =?utf-8?B?SHk5c1c4RVJlaDQ0MWlrK3VJNlhTQmgzR1VObkdhczZJZEJmOE9KdGNkSUxh?=
 =?utf-8?B?Y0d1OEovQzdLMCswQ2tOTVp1clI2RmIyQ0R3bldEakVlOGlmNUJWTi80S3l2?=
 =?utf-8?B?UndEVW5iM01xekllc2Y3QXFMNDlNcllGYlZoUm1IWnFsMXBmMGt6NHBrL3FI?=
 =?utf-8?B?Zm95aHhHOTVUMndzNDFpdmJkSnBWalVPUks4V1p1MC9MM01KeXR4YUFlWlZR?=
 =?utf-8?B?V3lRRFRFNks2Szh1cWZCWWd5ekREdmxCRmVGM2FjbTdkVzc4bVIyNGNNWGMx?=
 =?utf-8?B?SkViQnBFMHhkNUtuRHVHa1NkbUNJdnNKckMyVlVneHV1QXNWMm9uYnF3Q0JL?=
 =?utf-8?B?V1dkNGhpWkhrQ01HMXB4RWdKdVMrUm1GSUZDaU1yMU44N1pkc3RYTlloMUll?=
 =?utf-8?B?T1p0VVk1c3pURkV2MmxTR1lWV25ER3hzUFE3KzJMc093R0tFdE5TMTlSbFIr?=
 =?utf-8?B?eUZPSUNqT3lxRGhUaUNvbjNQbXl5QjhoTllyc2t6Q1RuRWpGZDBqM2lrRDBD?=
 =?utf-8?B?NzhDeGZtRzROc2N4TDhLRHFhY2k0Tm5QNVowb0NXWkZ1Nm5XekZjcWNCSmlW?=
 =?utf-8?B?WDZEbmI3T2k2STUyMHkzKzZFb3RyRjBKSWd5aVVScTNIekJ1YjFRdXFydE95?=
 =?utf-8?B?Y01jYUN3NGcyMFdTaENnTlNXYklSeHh5d3lPa1R3TFZWcjZ1cFIzdlhyQ2hX?=
 =?utf-8?B?Z1JxSDg3TWFQR01GRlppMzg2N2JlZ3ZpU1JhRzZqNnh5U09veVRCL0NLTVE3?=
 =?utf-8?B?MU9lM2t6SStxcXg1YjFxQ2JwZVJRMTN1WHFCcmNDRVNMcURaTlhramVqczI2?=
 =?utf-8?B?TlpISmVJQ0VLazJuQngwMjZ2ckh4MlNSaFN3WGplUFZKRmFCUnl6dlB0REg2?=
 =?utf-8?B?WnlYMk9OdTFpYU1hOW8yWkhzcmVMTnZWNnFWYnk0N2RtYjg4eWxzUEdFQ2E2?=
 =?utf-8?B?cjNkdEhVMk1zc3N3clhuSE1sUDQ0cWhlZEtBYjJucTA4R1ozRk1UQW9lWDBY?=
 =?utf-8?B?QWNLaFRWcGM4dFNacUZSLzM4UEF1SENkSDNFdGhJeHFDZ3ZNRmtCVjkwMUl3?=
 =?utf-8?B?eDIvTURjOXdsZ0xxTWpiMWpFMTk4ekJTWVNzWnFpVGJZQVloMG9YVWtPSFFW?=
 =?utf-8?B?ajIvcGNNN2s0UWZyT2Yrbi9hSlNXU3dFRjhHNnpvbGtDNWVnQm8yblQzRWVV?=
 =?utf-8?B?THpSd1JtOXFpUnI5TlMxWkZWSDJ1VEpyL3QzREtLY05KVngrWndwdEI2M3Fv?=
 =?utf-8?B?ZVJGMlczaWdmNS9BaE9FQTdEV252NHR4UVc0YllFbGdqME93MGcxd2NpMWtJ?=
 =?utf-8?B?K2xXRE5HNG55Znp2ejB2cjVBWW1GN1lpUm5HbjB6RGFPUTRnVnpwSC9neUFu?=
 =?utf-8?B?V05HMTBoVTBsQkh0MTZFcW5idTVDcHdqdldBSU5UL3paTENZYXhuWXhWcjlu?=
 =?utf-8?B?akVKbjlqdS8rWGJaZ0oxLytUR2QxcGQwTXVXT1NxekxKTWpXNzlyRnFUbmlQ?=
 =?utf-8?B?ZDVPSkRzUDdMTjIvOVZNcncxK0dxY2M5dllZMXFNRGc2MktNYzE4YWRJT0JI?=
 =?utf-8?B?RE9majk4b2Y1b29nTnRLR2RDWjNpczNWamJncjRNZDNIdG9WbFJTbFpCdHlU?=
 =?utf-8?B?eTljYnBEWTlHN0pDcG8vT2RTSGd2dUdab2puVmp6MnFlc1gwenBTRnNuUWxD?=
 =?utf-8?Q?YWRAkZzCr0epK0jPz/auTENb+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99fbc28b-bfc4-4ac2-ef62-08de31577d84
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3041.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 04:01:37.4975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P9mLK/ibdtqLPnypb6FUemesDXn5gD6XeYzhfAJnQYgRlxFV6lhA6BkC4KGVt+dOwbKQxY0E1Yj5K7xQQI3vOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4768
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

--------------7n1BWqNFEsKaySjwfqjaFptq
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 02-12-2025 07:16, Matthew Brost wrote:
> On Mon, Dec 01, 2025 at 11:20:14AM +0530, Arvind Yadav wrote:
>> This allows userspace applications to provide memory usage hints to
>> the kernel for better memory management under pressure:
>>
>> Add the core implementation for purgeable buffer objects, enabling memory
>> reclamation of user-designated DONTNEED buffers during eviction.
>>
>> This patch implements the purge operation and state machine transitions:
>>
>> Purgeable States (from xe_madv_purgeable_state):
>>   - WILLNEED (0): BO should be retained, actively used
>>   - DONTNEED (1): BO eligible for purging, not currently needed
> Quick comment - should we use TTM priority levels so WILLNEED is a higher
> priority (less likely to be evicted) than DONTNEED (more likely to be
> evicted).
>
> Expect more comments but just a quick thought.


Yes, we should leverage TTM priority levels for better eviction ordering.
Currently TTM has separate LRU lists per priority 
(man->lru[TTM_MAX_BO_PRIORITY]),
and eviction walks the lists starting from lower priority BOs first.
  1. Set DONTNEED BOs to priority 0 (evicted first, before normal BOs)
  2. Keep WILLNEED BOs at priority ' XE_BO_PRIORITY_NORMAL' (normal 
eviction order)

~Arvind

> Matt
>
>>   - PURGED (2): BO backing store reclaimed, permanently invalid
>>
>> Design Rationale:
>>    - Async TLB invalidation via trigger_rebind (no blocking xe_vm_invalidate_vma)
>>    - i915 compatibility: retained field, "once purged always purged" semantics
>>    - Shared BO protection prevents multi-process memory corruption
>>    - Scratch PTE reuse avoids new infrastructure, safe for fault mode
>>
>> v2:
>>    - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas Hellström)
>>    - Add NULL rebind with scratch PTEs for fault mode (Thomas Hellström)
>>    - Implement i915-compatible retained field logic (Thomas Hellström)
>>    - Skip BO validation for purged BOs in page fault handler (crash fix)
>>    - Add scratch VM check in page fault path (non-scratch VMs fail fault)
>>    - Force clear_pt for non-scratch VMs to avoid phys addr 0 mapping (review fix)
>>    - Add !is_purged check to resource cursor setup to prevent stale access
>>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav<arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c           | 72 ++++++++++++++++++++++-----
>>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 19 ++++++++
>>   drivers/gpu/drm/xe/xe_pt.c           | 36 ++++++++++++--
>>   drivers/gpu/drm/xe/xe_vm.c           | 11 ++++-
>>   drivers/gpu/drm/xe/xe_vm_madvise.c   | 73 ++++++++++++++++++++++++++++
>>   5 files changed, 193 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index cbc3ee157218..f0b3f7a13114 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -836,6 +836,53 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>>   	return 0;
>>   }
>>   
>> +static void xe_bo_set_purged(struct xe_bo *bo)
>> +{
>> +	/* BO must be locked before modifying madv state */
>> +	dma_resv_assert_held(bo->ttm.base.resv);
>> +
>> +	atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_PURGED);
>> +}
>> +
>> +/**
>> + * xe_ttm_bo_purge() - Purge buffer object backing store
>> + * @ttm_bo: The TTM buffer object to purge
>> + * @ctx: TTM operation context
>> + *
>> + * This function purges the backing store of a BO marked as DONTNEED and
>> + * triggers rebind to invalidate stale GPU mappings. For fault-mode VMs,
>> + * this zaps the PTEs. The next GPU access will trigger a page fault and
>> + * perform NULL rebind (scratch pages or clear PTEs based on VM config).
>> + */
>> +static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
>> +{
>> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>> +
>> +	if (ttm_bo->ttm) {
>> +		struct ttm_placement place = {};
>> +		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
>> +
>> +		drm_WARN_ON(&xe->drm, ret);
>> +		if (!ret && bo) {
>> +			if (atomic_read(&bo->madv_purgeable) == XE_MADV_PURGEABLE_DONTNEED) {
>> +				xe_bo_set_purged(bo);
>> +
>> +				/*
>> +				 * Trigger rebind to invalidate stale GPU mappings.
>> +				 * - Non-fault mode: Marks VMAs for rebind
>> +				 * - Fault mode: Zaps PTEs (sets to 0), next access triggers fault
>> +				 *   and NULL rebind with scratch/clear PTEs per VM config
>> +				 */
>> +				ret = xe_bo_trigger_rebind(xe, bo, ctx);
>> +				if (ret)
>> +					drm_warn(&xe->drm,
>> +						 "Failed to invalidate purged BO: %d\n", ret);
>> +			}
>> +		}
>> +	}
>> +}
>> +
>>   static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   		      struct ttm_operation_ctx *ctx,
>>   		      struct ttm_resource *new_mem,
>> @@ -853,8 +900,18 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>>   	bool needs_clear;
>>   	bool handle_system_ccs = (!IS_DGFX(xe) && xe_bo_needs_ccs_pages(bo) &&
>>   				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
>> +	int state = atomic_read(&bo->madv_purgeable);
>>   	int ret = 0;
>>   
>> +	/*
>> +	 * Purge only non-shared BOs explicitly marked DONTNEED by userspace.
>> +	 * The move_notify callback will handle invalidation asynchronously.
>> +	 */
>> +	if (evict && state == XE_MADV_PURGEABLE_DONTNEED && !xe_bo_is_shared_locked(bo)) {
>> +		xe_ttm_bo_purge(ttm_bo, ctx);
>> +		return 0;
>> +	}
>> +
>>   	/* Bo creation path, moving to system or TT. */
>>   	if ((!old_mem && ttm) && !handle_system_ccs) {
>>   		if (new_mem->mem_type == XE_PL_TT)
>> @@ -1606,18 +1663,6 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>>   	}
>>   }
>>   
>> -static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
>> -{
>> -	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>> -
>> -	if (ttm_bo->ttm) {
>> -		struct ttm_placement place = {};
>> -		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
>> -
>> -		drm_WARN_ON(&xe->drm, ret);
>> -	}
>> -}
>> -
>>   static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
>>   {
>>   	struct ttm_operation_ctx ctx = {
>> @@ -2202,6 +2247,9 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
>>   #endif
>>   	INIT_LIST_HEAD(&bo->vram_userfault_link);
>>   
>> +	/* Initialize purge advisory state */
>> +	atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_WILLNEED);
>> +
>>   	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>>   
>>   	if (resv) {
>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> index a054d6010ae0..8c7e5dcb627b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>> @@ -87,6 +87,13 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
>>   	if (!bo)
>>   		return 0;
>>   
>> +	/*
>> +	 * Skip validation/migration for purged BOs - they have no backing pages.
>> +	 * Rebind will use scratch PTEs instead.
>> +	 */
>> +	if (xe_bo_is_purged(bo))
>> +		return 0;
>> +
>>   	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
>>   		xe_bo_validate(bo, vm, true, exec);
>>   }
>> @@ -100,9 +107,21 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
>>   	struct drm_exec exec;
>>   	struct dma_fence *fence;
>>   	int err, needs_vram;
>> +	struct xe_bo *bo;
>>   
>>   	lockdep_assert_held_write(&vm->lock);
>>   
>> +	/*
>> +	 * Check if BO is purged. For purged BOs:
>> +	 * - Scratch VMs: Allow rebind with scratch PTEs (safe zero reads)
>> +	 * - Non-scratch VMs: FAIL the page fault (no scratch page available)
>> +	 */
>> +	bo = xe_vma_bo(vma);
>> +	if (bo && xe_bo_is_purged(bo)) {
>> +		if (!xe_vm_has_scratch(vm))
>> +			return -EACCES;
>> +	}
>> +
>>   	needs_vram = xe_vma_need_vram_for_atomic(vm->xe, vma, atomic);
>>   	if (needs_vram < 0 || (needs_vram && xe_vma_is_userptr(vma)))
>>   		return needs_vram < 0 ? needs_vram : -EACCES;
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index d22fd1ccc0ba..062f64b16a58 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -533,20 +533,26 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>>   	/* Is this a leaf entry ?*/
>>   	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
>>   		struct xe_res_cursor *curs = xe_walk->curs;
>> +		struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
>>   		bool is_null = xe_vma_is_null(xe_walk->vma);
>> -		bool is_vram = is_null ? false : xe_res_is_vram(curs);
>> +		bool is_purged = bo && xe_bo_is_purged(bo);
>> +		bool is_vram = (is_null || is_purged) ? false : xe_res_is_vram(curs);
>>   
>>   		XE_WARN_ON(xe_walk->va_curs_start != addr);
>>   
>>   		if (xe_walk->clear_pt) {
>>   			pte = 0;
>>   		} else {
>> -			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
>> +			/*
>> +			 * For purged BOs, treat like null VMAs - pass address 0.
>> +			 * The pte_encode_vma will set XE_PTE_NULL flag for scratch mapping.
>> +			 */
>> +			pte = vm->pt_ops->pte_encode_vma((is_null || is_purged) ? 0 :
>>   							 xe_res_dma(curs) +
>>   							 xe_walk->dma_offset,
>>   							 xe_walk->vma,
>>   							 pat_index, level);
>> -			if (!is_null)
>> +			if (!is_null && !is_purged)
>>   				pte |= is_vram ? xe_walk->default_vram_pte :
>>   					xe_walk->default_system_pte;
>>   
>> @@ -570,7 +576,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>>   		if (unlikely(ret))
>>   			return ret;
>>   
>> -		if (!is_null && !xe_walk->clear_pt)
>> +		if (!is_null && !is_purged && !xe_walk->clear_pt)
>>   			xe_res_next(curs, next - addr);
>>   		xe_walk->va_curs_start = next;
>>   		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
>> @@ -723,6 +729,26 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>   	};
>>   	struct xe_pt *pt = vm->pt_root[tile->id];
>>   	int ret;
>> +	bool is_purged = false;
>> +
>> +	/*
>> +	 * Check if BO is purged:
>> +	 * - Scratch VMs: Use scratch PTEs (XE_PTE_NULL) for safe zero reads
>> +	 * - Non-scratch VMs: Clear PTEs to zero (non-present) to avoid mapping to phys addr 0
>> +	 *
>> +	 * For non-scratch VMs, we force clear_pt=true so leaf PTEs become completely
>> +	 * zero instead of creating a PRESENT mapping to physical address 0.
>> +	 */
>> +	if (bo && xe_bo_is_purged(bo)) {
>> +		is_purged = true;
>> +
>> +		/*
>> +		 * For non-scratch VMs, a NULL rebind should use zero PTEs
>> +		 * (non-present), not a present PTE to phys 0.
>> +		 */
>> +		if (!xe_vm_has_scratch(vm))
>> +			xe_walk.clear_pt = true;
>> +	}
>>   
>>   	if (range) {
>>   		/* Move this entire thing to xe_svm.c? */
>> @@ -762,7 +788,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>   	if (!range)
>>   		xe_bo_assert_held(bo);
>>   
>> -	if (!xe_vma_is_null(vma) && !range) {
>> +	if (!xe_vma_is_null(vma) && !range && !is_purged) {
>>   		if (xe_vma_is_userptr(vma))
>>   			xe_res_first_dma(to_userptr_vma(vma)->userptr.pages.dma_addr, 0,
>>   					 xe_vma_size(vma), &curs);
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 10d77666a425..d03e69524369 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -1336,6 +1336,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>>   static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>>   			       u16 pat_index, u32 pt_level)
>>   {
>> +	struct xe_bo *bo = xe_vma_bo(vma);
>> +	struct xe_vm *vm = xe_vma_vm(vma);
>> +
>>   	pte |= XE_PAGE_PRESENT;
>>   
>>   	if (likely(!xe_vma_read_only(vma)))
>> @@ -1344,7 +1347,13 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>>   	pte |= pte_encode_pat_index(pat_index, pt_level);
>>   	pte |= pte_encode_ps(pt_level);
>>   
>> -	if (unlikely(xe_vma_is_null(vma)))
>> +	/*
>> +	 * NULL PTEs redirect to scratch page (return zeros on read).
>> +	 * Set for: 1) explicit null VMAs, 2) purged BOs on scratch VMs.
>> +	 * Never set NULL flag without scratch page - causes undefined behavior.
>> +	 */
>> +	if (unlikely(xe_vma_is_null(vma) ||
>> +		     (bo && xe_bo_is_purged(bo) && xe_vm_has_scratch(vm))))
>>   		pte |= XE_PTE_NULL;
>>   
>>   	return pte;
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index cad3cf627c3f..3ba851e0b870 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -158,6 +158,60 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>>   	}
>>   }
>>   
>> +/*
>> + * Handle purgeable buffer object advice for DONTNEED/WILLNEED/PURGED.
>> + * Updates op->purge_state_val.retained to indicate if backing store
>> + * exists (matches i915's retained).
>> + */
>> +static void xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
>> +				       struct xe_vma **vmas, int num_vmas,
>> +				       struct drm_xe_madvise *op)
>> +{
>> +	bool has_purged_bo = false;
>> +	int i;
>> +
>> +	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE);
>> +
>> +	for (i = 0; i < num_vmas; i++) {
>> +		struct xe_bo *bo = xe_vma_bo(vmas[i]);
>> +
>> +		if (!bo)
>> +			continue;
>> +
>> +		/* BO must be locked before modifying madv state */
>> +		dma_resv_assert_held(bo->ttm.base.resv);
>> +
>> +		/*
>> +		 * Once purged, always purged. Cannot transition back to WILLNEED.
>> +		 * This matches i915 semantics where purged BOs are permanently invalid.
>> +		 */
>> +		if (xe_bo_is_purged(bo)) {
>> +			has_purged_bo = true;
>> +			continue;
>> +		}
>> +
>> +		switch (op->purge_state_val.val) {
>> +		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
>> +			atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_WILLNEED);
>> +			break;
>> +		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
>> +			if (!xe_bo_is_shared_locked(bo))
>> +				atomic_set(&bo->madv_purgeable, XE_MADV_PURGEABLE_DONTNEED);
>> +			break;
>> +		default:
>> +			drm_warn(&vm->xe->drm, "Invalid madvice value = %d\n",
>> +				 op->purge_state_val.val);
>> +			return;
>> +		}
>> +	}
>> +
>> +	/*
>> +	 * Set retained flag to indicate if backing store still exists.
>> +	 * Matches i915: retained = 1 if not purged, 0 if purged.
>> +	 */
>> +	op->purge_state_val.retained = !has_purged_bo;
>> +}
>> +
>>   typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
>>   			     struct xe_vma **vmas, int num_vmas,
>>   			     struct drm_xe_madvise *op);
>> @@ -283,6 +337,19 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>>   			return false;
>>   		break;
>>   	}
>> +	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
>> +	{
>> +		u32 val = args->purge_state_val.val;
>> +
>> +		if (XE_IOCTL_DBG(xe, !((val == DRM_XE_VMA_PURGEABLE_STATE_WILLNEED) ||
>> +				       (val == DRM_XE_VMA_PURGEABLE_STATE_DONTNEED))))
>> +			return false;
>> +
>> +		if (XE_IOCTL_DBG(xe, args->purge_state_val.reserved))
>> +			return false;
>> +
>> +		break;
>> +	}
>>   	default:
>>   		if (XE_IOCTL_DBG(xe, 1))
>>   			return false;
>> @@ -402,6 +469,12 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>>   					goto err_fini;
>>   			}
>>   		}
>> +		if (args->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE) {
>> +			xe_vm_madvise_purgeable_bo(xe, vm, madvise_range.vmas,
>> +						   madvise_range.num_vmas, args);
>> +			goto err_fini;
>> +
>> +		}
>>   	}
>>   
>>   	if (madvise_range.has_svm_userptr_vmas) {
>> -- 
>> 2.43.0
>>
--------------7n1BWqNFEsKaySjwfqjaFptq
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02-12-2025 07:16, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aS5FAhlXkBly4a1D@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">On Mon, Dec 01, 2025 at 11:20:14AM +0530, Arvind Yadav wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">This allows userspace applications to provide memory usage hints to
the kernel for better memory management under pressure:

Add the core implementation for purgeable buffer objects, enabling memory
reclamation of user-designated DONTNEED buffers during eviction.

This patch implements the purge operation and state machine transitions:

Purgeable States (from xe_madv_purgeable_state):
 - WILLNEED (0): BO should be retained, actively used
 - DONTNEED (1): BO eligible for purging, not currently needed
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Quick comment - should we use TTM priority levels so WILLNEED is a higher
priority (less likely to be evicted) than DONTNEED (more likely to be
evicted).

Expect more comments but just a quick thought.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Yes, we should leverage TTM priority levels for better eviction
      ordering.<br>
      Currently TTM has separate LRU lists per priority
      (man-&gt;lru[TTM_MAX_BO_PRIORITY]),&nbsp;<br>
      and eviction walks the lists starting from lower priority BOs
      first.<br>
      &nbsp;1. Set DONTNEED BOs to priority 0 (evicted first, before normal
      BOs)<br>
      &nbsp;2. Keep WILLNEED BOs at priority ' XE_BO_PRIORITY_NORMAL' (normal
      eviction order)<br>
      <br>
      ~Arvind<span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite" cite="mid:aS5FAhlXkBly4a1D@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">
Matt

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> - PURGED (2): BO backing store reclaimed, permanently invalid

Design Rationale:
  - Async TLB invalidation via trigger_rebind (no blocking xe_vm_invalidate_vma)
  - i915 compatibility: retained field, &quot;once purged always purged&quot; semantics
  - Shared BO protection prevents multi-process memory corruption
  - Scratch PTE reuse avoids new infrastructure, safe for fault mode

v2:
  - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas Hellström)
  - Add NULL rebind with scratch PTEs for fault mode (Thomas Hellström)
  - Implement i915-compatible retained field logic (Thomas Hellström)
  - Skip BO validation for purged BOs in page fault handler (crash fix)
  - Add scratch VM check in page fault path (non-scratch VMs fail fault)
  - Force clear_pt for non-scratch VMs to avoid phys addr 0 mapping (review fix)
  - Add !is_purged check to resource cursor setup to prevent stale access

Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Cc: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
Signed-off-by: Arvind Yadav <a class="moz-txt-link-rfc2396E" href="mailto:arvind.yadav@intel.com">&lt;arvind.yadav@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_bo.c           | 72 ++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 19 ++++++++
 drivers/gpu/drm/xe/xe_pt.c           | 36 ++++++++++++--
 drivers/gpu/drm/xe/xe_vm.c           | 11 ++++-
 drivers/gpu/drm/xe/xe_vm_madvise.c   | 73 ++++++++++++++++++++++++++++
 5 files changed, 193 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index cbc3ee157218..f0b3f7a13114 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -836,6 +836,53 @@ static int xe_bo_move_notify(struct xe_bo *bo,
 	return 0;
 }
 
+static void xe_bo_set_purged(struct xe_bo *bo)
+{
+	/* BO must be locked before modifying madv state */
+	dma_resv_assert_held(bo-&gt;ttm.base.resv);
+
+	atomic_set(&amp;bo-&gt;madv_purgeable, XE_MADV_PURGEABLE_PURGED);
+}
+
+/**
+ * xe_ttm_bo_purge() - Purge buffer object backing store
+ * @ttm_bo: The TTM buffer object to purge
+ * @ctx: TTM operation context
+ *
+ * This function purges the backing store of a BO marked as DONTNEED and
+ * triggers rebind to invalidate stale GPU mappings. For fault-mode VMs,
+ * this zaps the PTEs. The next GPU access will trigger a page fault and
+ * perform NULL rebind (scratch pages or clear PTEs based on VM config).
+ */
+static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
+{
+	struct xe_device *xe = ttm_to_xe_device(ttm_bo-&gt;bdev);
+	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
+
+	if (ttm_bo-&gt;ttm) {
+		struct ttm_placement place = {};
+		int ret = ttm_bo_validate(ttm_bo, &amp;place, ctx);
+
+		drm_WARN_ON(&amp;xe-&gt;drm, ret);
+		if (!ret &amp;&amp; bo) {
+			if (atomic_read(&amp;bo-&gt;madv_purgeable) == XE_MADV_PURGEABLE_DONTNEED) {
+				xe_bo_set_purged(bo);
+
+				/*
+				 * Trigger rebind to invalidate stale GPU mappings.
+				 * - Non-fault mode: Marks VMAs for rebind
+				 * - Fault mode: Zaps PTEs (sets to 0), next access triggers fault
+				 *   and NULL rebind with scratch/clear PTEs per VM config
+				 */
+				ret = xe_bo_trigger_rebind(xe, bo, ctx);
+				if (ret)
+					drm_warn(&amp;xe-&gt;drm,
+						 &quot;Failed to invalidate purged BO: %d\n&quot;, ret);
+			}
+		}
+	}
+}
+
 static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 		      struct ttm_operation_ctx *ctx,
 		      struct ttm_resource *new_mem,
@@ -853,8 +900,18 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 	bool needs_clear;
 	bool handle_system_ccs = (!IS_DGFX(xe) &amp;&amp; xe_bo_needs_ccs_pages(bo) &amp;&amp;
 				  ttm &amp;&amp; ttm_tt_is_populated(ttm)) ? true : false;
+	int state = atomic_read(&amp;bo-&gt;madv_purgeable);
 	int ret = 0;
 
+	/*
+	 * Purge only non-shared BOs explicitly marked DONTNEED by userspace.
+	 * The move_notify callback will handle invalidation asynchronously.
+	 */
+	if (evict &amp;&amp; state == XE_MADV_PURGEABLE_DONTNEED &amp;&amp; !xe_bo_is_shared_locked(bo)) {
+		xe_ttm_bo_purge(ttm_bo, ctx);
+		return 0;
+	}
+
 	/* Bo creation path, moving to system or TT. */
 	if ((!old_mem &amp;&amp; ttm) &amp;&amp; !handle_system_ccs) {
 		if (new_mem-&gt;mem_type == XE_PL_TT)
@@ -1606,18 +1663,6 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
 	}
 }
 
-static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
-{
-	struct xe_device *xe = ttm_to_xe_device(ttm_bo-&gt;bdev);
-
-	if (ttm_bo-&gt;ttm) {
-		struct ttm_placement place = {};
-		int ret = ttm_bo_validate(ttm_bo, &amp;place, ctx);
-
-		drm_WARN_ON(&amp;xe-&gt;drm, ret);
-	}
-}
-
 static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
 {
 	struct ttm_operation_ctx ctx = {
@@ -2202,6 +2247,9 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 #endif
 	INIT_LIST_HEAD(&amp;bo-&gt;vram_userfault_link);
 
+	/* Initialize purge advisory state */
+	atomic_set(&amp;bo-&gt;madv_purgeable, XE_MADV_PURGEABLE_WILLNEED);
+
 	drm_gem_private_object_init(&amp;xe-&gt;drm, &amp;bo-&gt;ttm.base, size);
 
 	if (resv) {
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index a054d6010ae0..8c7e5dcb627b 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -87,6 +87,13 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	if (!bo)
 		return 0;
 
+	/*
+	 * Skip validation/migration for purged BOs - they have no backing pages.
+	 * Rebind will use scratch PTEs instead.
+	 */
+	if (xe_bo_is_purged(bo))
+		return 0;
+
 	return need_vram_move ? xe_bo_migrate(bo, vram-&gt;placement, NULL, exec) :
 		xe_bo_validate(bo, vm, true, exec);
 }
@@ -100,9 +107,21 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	struct drm_exec exec;
 	struct dma_fence *fence;
 	int err, needs_vram;
+	struct xe_bo *bo;
 
 	lockdep_assert_held_write(&amp;vm-&gt;lock);
 
+	/*
+	 * Check if BO is purged. For purged BOs:
+	 * - Scratch VMs: Allow rebind with scratch PTEs (safe zero reads)
+	 * - Non-scratch VMs: FAIL the page fault (no scratch page available)
+	 */
+	bo = xe_vma_bo(vma);
+	if (bo &amp;&amp; xe_bo_is_purged(bo)) {
+		if (!xe_vm_has_scratch(vm))
+			return -EACCES;
+	}
+
 	needs_vram = xe_vma_need_vram_for_atomic(vm-&gt;xe, vma, atomic);
 	if (needs_vram &lt; 0 || (needs_vram &amp;&amp; xe_vma_is_userptr(vma)))
 		return needs_vram &lt; 0 ? needs_vram : -EACCES;
diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index d22fd1ccc0ba..062f64b16a58 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -533,20 +533,26 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 	/* Is this a leaf entry ?*/
 	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
 		struct xe_res_cursor *curs = xe_walk-&gt;curs;
+		struct xe_bo *bo = xe_vma_bo(xe_walk-&gt;vma);
 		bool is_null = xe_vma_is_null(xe_walk-&gt;vma);
-		bool is_vram = is_null ? false : xe_res_is_vram(curs);
+		bool is_purged = bo &amp;&amp; xe_bo_is_purged(bo);
+		bool is_vram = (is_null || is_purged) ? false : xe_res_is_vram(curs);
 
 		XE_WARN_ON(xe_walk-&gt;va_curs_start != addr);
 
 		if (xe_walk-&gt;clear_pt) {
 			pte = 0;
 		} else {
-			pte = vm-&gt;pt_ops-&gt;pte_encode_vma(is_null ? 0 :
+			/*
+			 * For purged BOs, treat like null VMAs - pass address 0.
+			 * The pte_encode_vma will set XE_PTE_NULL flag for scratch mapping.
+			 */
+			pte = vm-&gt;pt_ops-&gt;pte_encode_vma((is_null || is_purged) ? 0 :
 							 xe_res_dma(curs) +
 							 xe_walk-&gt;dma_offset,
 							 xe_walk-&gt;vma,
 							 pat_index, level);
-			if (!is_null)
+			if (!is_null &amp;&amp; !is_purged)
 				pte |= is_vram ? xe_walk-&gt;default_vram_pte :
 					xe_walk-&gt;default_system_pte;
 
@@ -570,7 +576,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
 		if (unlikely(ret))
 			return ret;
 
-		if (!is_null &amp;&amp; !xe_walk-&gt;clear_pt)
+		if (!is_null &amp;&amp; !is_purged &amp;&amp; !xe_walk-&gt;clear_pt)
 			xe_res_next(curs, next - addr);
 		xe_walk-&gt;va_curs_start = next;
 		xe_walk-&gt;vma-&gt;gpuva.flags |= (XE_VMA_PTE_4K &lt;&lt; level);
@@ -723,6 +729,26 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	};
 	struct xe_pt *pt = vm-&gt;pt_root[tile-&gt;id];
 	int ret;
+	bool is_purged = false;
+
+	/*
+	 * Check if BO is purged:
+	 * - Scratch VMs: Use scratch PTEs (XE_PTE_NULL) for safe zero reads
+	 * - Non-scratch VMs: Clear PTEs to zero (non-present) to avoid mapping to phys addr 0
+	 *
+	 * For non-scratch VMs, we force clear_pt=true so leaf PTEs become completely
+	 * zero instead of creating a PRESENT mapping to physical address 0.
+	 */
+	if (bo &amp;&amp; xe_bo_is_purged(bo)) {
+		is_purged = true;
+
+		/*
+		 * For non-scratch VMs, a NULL rebind should use zero PTEs
+		 * (non-present), not a present PTE to phys 0.
+		 */
+		if (!xe_vm_has_scratch(vm))
+			xe_walk.clear_pt = true;
+	}
 
 	if (range) {
 		/* Move this entire thing to xe_svm.c? */
@@ -762,7 +788,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
 	if (!range)
 		xe_bo_assert_held(bo);
 
-	if (!xe_vma_is_null(vma) &amp;&amp; !range) {
+	if (!xe_vma_is_null(vma) &amp;&amp; !range &amp;&amp; !is_purged) {
 		if (xe_vma_is_userptr(vma))
 			xe_res_first_dma(to_userptr_vma(vma)-&gt;userptr.pages.dma_addr, 0,
 					 xe_vma_size(vma), &amp;curs);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 10d77666a425..d03e69524369 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1336,6 +1336,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
 			       u16 pat_index, u32 pt_level)
 {
+	struct xe_bo *bo = xe_vma_bo(vma);
+	struct xe_vm *vm = xe_vma_vm(vma);
+
 	pte |= XE_PAGE_PRESENT;
 
 	if (likely(!xe_vma_read_only(vma)))
@@ -1344,7 +1347,13 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
 	pte |= pte_encode_pat_index(pat_index, pt_level);
 	pte |= pte_encode_ps(pt_level);
 
-	if (unlikely(xe_vma_is_null(vma)))
+	/*
+	 * NULL PTEs redirect to scratch page (return zeros on read).
+	 * Set for: 1) explicit null VMAs, 2) purged BOs on scratch VMs.
+	 * Never set NULL flag without scratch page - causes undefined behavior.
+	 */
+	if (unlikely(xe_vma_is_null(vma) ||
+		     (bo &amp;&amp; xe_bo_is_purged(bo) &amp;&amp; xe_vm_has_scratch(vm))))
 		pte |= XE_PTE_NULL;
 
 	return pte;
diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
index cad3cf627c3f..3ba851e0b870 100644
--- a/drivers/gpu/drm/xe/xe_vm_madvise.c
+++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
@@ -158,6 +158,60 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
 	}
 }
 
+/*
+ * Handle purgeable buffer object advice for DONTNEED/WILLNEED/PURGED.
+ * Updates op-&gt;purge_state_val.retained to indicate if backing store
+ * exists (matches i915's retained).
+ */
+static void xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
+				       struct xe_vma **vmas, int num_vmas,
+				       struct drm_xe_madvise *op)
+{
+	bool has_purged_bo = false;
+	int i;
+
+	xe_assert(vm-&gt;xe, op-&gt;type == DRM_XE_VMA_ATTR_PURGEABLE_STATE);
+
+	for (i = 0; i &lt; num_vmas; i++) {
+		struct xe_bo *bo = xe_vma_bo(vmas[i]);
+
+		if (!bo)
+			continue;
+
+		/* BO must be locked before modifying madv state */
+		dma_resv_assert_held(bo-&gt;ttm.base.resv);
+
+		/*
+		 * Once purged, always purged. Cannot transition back to WILLNEED.
+		 * This matches i915 semantics where purged BOs are permanently invalid.
+		 */
+		if (xe_bo_is_purged(bo)) {
+			has_purged_bo = true;
+			continue;
+		}
+
+		switch (op-&gt;purge_state_val.val) {
+		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
+			atomic_set(&amp;bo-&gt;madv_purgeable, XE_MADV_PURGEABLE_WILLNEED);
+			break;
+		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
+			if (!xe_bo_is_shared_locked(bo))
+				atomic_set(&amp;bo-&gt;madv_purgeable, XE_MADV_PURGEABLE_DONTNEED);
+			break;
+		default:
+			drm_warn(&amp;vm-&gt;xe-&gt;drm, &quot;Invalid madvice value = %d\n&quot;,
+				 op-&gt;purge_state_val.val);
+			return;
+		}
+	}
+
+	/*
+	 * Set retained flag to indicate if backing store still exists.
+	 * Matches i915: retained = 1 if not purged, 0 if purged.
+	 */
+	op-&gt;purge_state_val.retained = !has_purged_bo;
+}
+
 typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
 			     struct xe_vma **vmas, int num_vmas,
 			     struct drm_xe_madvise *op);
@@ -283,6 +337,19 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
 			return false;
 		break;
 	}
+	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
+	{
+		u32 val = args-&gt;purge_state_val.val;
+
+		if (XE_IOCTL_DBG(xe, !((val == DRM_XE_VMA_PURGEABLE_STATE_WILLNEED) ||
+				       (val == DRM_XE_VMA_PURGEABLE_STATE_DONTNEED))))
+			return false;
+
+		if (XE_IOCTL_DBG(xe, args-&gt;purge_state_val.reserved))
+			return false;
+
+		break;
+	}
 	default:
 		if (XE_IOCTL_DBG(xe, 1))
 			return false;
@@ -402,6 +469,12 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
 					goto err_fini;
 			}
 		}
+		if (args-&gt;type == DRM_XE_VMA_ATTR_PURGEABLE_STATE) {
+			xe_vm_madvise_purgeable_bo(xe, vm, madvise_range.vmas,
+						   madvise_range.num_vmas, args);
+			goto err_fini;
+
+		}
 	}
 
 	if (madvise_range.has_svm_userptr_vmas) {
-- 
2.43.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------7n1BWqNFEsKaySjwfqjaFptq--
