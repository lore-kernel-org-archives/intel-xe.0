Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8CACA6002
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 16:48:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C161C10E61C;
	Wed,  7 Oct 2026 16:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="axX1+q8n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDF810E61C
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 16:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791391703; x=1822927703;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=o+efbmyLy8+lqzUc/Z1dG2s9zmiEbNrw0qh1E1fi1ro=;
 b=axX1+q8nRS2Vr3lrZTNkym6Rp0Jwf7GQIMTOSpMT9K+QbIDbAbWH9LkU
 PfYkqq9DthOz4XW41/k28kyH3D6oSf9h0srPOHie3Hs1KzAFOlzMmI8JL
 OraronYI+kFuD03VSeDb/UE+4I7Y9YAnBYPLM7x8tvudx1aDZOZ2lpZVr
 iTqvujM1bAXhzYv1vXnQg2g8JYfddHrM4jJ4weIdPeMaXgP126rXppkQu
 YC4CvjUUmU5dOdQEivbtuEg0qZMWUQ9k+k8S7FwELQjjiJed16iBA9Kki
 T5o0uze9KC0vqY3NvcjCXDtY11Pcv/Xqv/sruGfE2sd41tXEGat3K8e81 Q==;
X-CSE-ConnectionGUID: 7LAE4bn9SaKo8CKUwcBFkQ==
X-CSE-MsgGUID: bApyQffgT8WxbR2v1QT9cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="46715"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="46715"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 09:48:23 -0700
X-CSE-ConnectionGUID: IM/Y7NpvRzy78IK1iHpvyw==
X-CSE-MsgGUID: ouj/F8usTNaaLuM2+S/jmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="222998"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 09:48:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 09:48:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 09:48:21 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.49)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 09:48:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bsagFStBO8362xYpGkXFdMJ0khbX8YH0iGYapnA13n0CIjEbtlRikaTPXdqD+nAoIK01nISnb8ZyWVYSMXKno21w0GBCMXV4HLO/ihwFh3CM8+oV8A77WVvY8scfuy2HcHMsTWMv+ZV4GKsJ+1eZcGQMcbu3QQNaWTS67AWdQXFr3lHzXxx6qZl90x3u1GyCHSvXpe3nmCanOoKdqtlIn4E1wdRoySR4yhMwYTFR3RNJ4YweAhrAY5PxeS3FhyJAB13cQzNo32erN8vOkycznBCt0qbQFWnKo0nZz8MKIkuRIh7Zp4/kuIUpnK5eO53nl+o1CsKpNpsIgbNMYq2ixw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mH0LXegCAVo8cECRiXMfnZ3M1Z8rqE0C0j8NcaHoteY=;
 b=IIO4aPUkL4Hnu5FQQXK6iR/igEpr0bLK7VDwu8MnBnMVJSeiGaxe2dWz7sEbLfwstKW1QnsgnwQ4QWk4TFyXE3H4GTNmY+ieMFpdr6euZEkxzIoAN/j6AxRbVBq0aATmppFmOJ06LHmjoJtnZv5XE1VIubHiCExMeC+yctsh7w7z+69+g28H9d7CggxgKIuh5B52zaK0WGjza9VrhmgnF8w7tTjcIrGeQvJFWgsclrg5csIRbusPPdqWCEuW4O3BRSfB2MUBZIqujDWzsIYHH/2IdTvipzyZLJ2huEPpD0grwKwDkb3KvaONfbVSdhXx5RW82O5BhFtFkQZacd8z7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LVTPR11MB9888.namprd11.prod.outlook.com (2603:10b6:408:3c3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 16:48:14 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0472.015; Wed, 7 Oct 2026
 16:48:14 +0000
Date: Wed, 7 Oct 2026 09:48:12 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
CC: <intel-xe@lists.freedesktop.org>,
 <Ghimiray@soc-5cg1426vcc.clients.intel.com>, Himal Prasad
 <himal.prasad.ghimiray@intel.com>
Subject: Re: drm/xe/oa: Zero OA buffer at allocation
Message-ID: <asZ3zLcfcapGmqVQ@soc-5CG1426VCC.clients.intel.com>
References: <20261006020314.2711762-1-krishnaiah.bommu@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261006020314.2711762-1-krishnaiah.bommu@intel.com>
X-ClientProxiedBy: MW4PR03CA0235.namprd03.prod.outlook.com
 (2603:10b6:303:b9::30) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LVTPR11MB9888:EE_
X-MS-Office365-Filtering-Correlation-Id: 0463cccf-0901-44c5-3a78-08df2492c7b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|56012099006|11063799006|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: hENuh12ulDhjFazvOp6FtsXWopAGqjv1rWWY7DIHHUNaNrCXetCdwSnVQQaIuGqt2H1kH1WHelTGTgIxneySduZlkUEQC6dWvSpvAJaS04jIQdN5oqhc1Hn8GHGG4rDlawobHv4gXh6d9H6okXau7x1OkagwTB7Q+yIuCiQkbP4KCztc0KRzmqA3jcsZkQqDJFvG6vC+RC7S3lXFxaCG2gGaXhbiNqvOIYU1kW5hji8HW6olfm6tCBFYlF9PoqH6YQN0HRLC0zZMU4gBpYn8fX4ZrssIzJpkelCaiDB47BZcbXBR3iLASHcjGJm7uA6svFZAsc0FlNFmtmhuir/RZcjrISw3x+qFoRf5KDDlhTH/o4jmuNvr5Z6aolqm3StwOGLsSbr+OC/bkUWA4QkLitdrjQOPK/8AQHY6pKITnEgvZju8/aRqqhZoWPjItAbWwo6FWIDPV/leKS/LFjcsCb4PwgNPzCRw4XwchGYfmXtJ6BMCzJ0n9x1Jhss5BB5noYX7qANaYs7F3BttoHTXsKp5RV4c7m/kQrhmC11SuyDk61AVyiYJOpBy8j5+okD//PLxCefO+szeFJnsUef5HzkpL3jT/n50YiKbMeKtG+fPUTlcA6Payr0TYJnIfQr+bi+46XSyHTKbqee3TajzxOtYyewG65bmw2DClpW6AOY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXY3NHh5dnBhSllNdWZXbC91ZTdPU3BUYzl4VjdWTHJLNloySVF4dnZNcDlt?=
 =?utf-8?B?ci8yanVQUGJyby8rL1NRZUI1K0g4WUcycld0M2pQNE01TURkVk9MVWd4cy8y?=
 =?utf-8?B?WVBuL2tHdDNGdkV5RnBlSDgvQU1VVXg3eWorTWN6dnlRTGQrQUJJTHFCclJR?=
 =?utf-8?B?S3JpRjJpNFhuTjVBL25IcGtkcjA1cFFDZXpjcGZXT0h4Zm1oN3JCdkMrZW0r?=
 =?utf-8?B?dE82YWV2WDExUTJiMmx2QlNnbUFpMUZ6QWNKTXBJVEJqOC9obklJcXZodGIy?=
 =?utf-8?B?cHVPRVpvSVRlNEFEZ3JLMXoxZlZKamxrcFJFb2hXYk81WEJPWHZrM3hsMG9X?=
 =?utf-8?B?eWZGVkczZ3UwOUsyU0NnQVZ3OFVBY1A2R2wxV2IxbnU4a1BaMlIvUnVjODJn?=
 =?utf-8?B?aTZOOGJHWm5qR3FZMk16bldwL1NleFMyLzBsU2dqUXpYM0h5SzZGOStHZnVp?=
 =?utf-8?B?NDZzY2hmRFYvdjA3d0ZqTEtmM05NWXNmSWVpZitxb2x0VmRKNVNpVjF5SXFJ?=
 =?utf-8?B?UFdpTzU0aDYrVHJDTWNsa05pU2dCK2ViRXRnNHB0b3E5NDYxaitJTGU2YWVF?=
 =?utf-8?B?dDdlMmYydWxaa0NLWUd5NWpjdWxrWGQvYSt3SlowM3hQTTlXNnN0d0VyMkd5?=
 =?utf-8?B?Vk80YVJDdVZrVmpmcWdPWVJWZ2dLczZldk1BdFZwRmpZTWR4UEd5NWRVWE1X?=
 =?utf-8?B?ZVdBSjFOR1FLT1F3aFZmNTBIRWxBNUJLWTRlMVdBQm1XTXYvdzRwUU56WlFN?=
 =?utf-8?B?RXZINysvYXdQMmJ5MnFyZXdjWHFUT29HbnI0eWpqSCtmT0FnWjZwRE9pcWVI?=
 =?utf-8?B?UW1JelhMRFNsZ2lqNHBUVVpZWStqVVQwazEwdVhCNVdteE9qUEd5MTUxdW80?=
 =?utf-8?B?c3ExR0pOOUwvYXIxbGRKMVJSalJIcjd6NXhVY1o1YWwzNEc1a1N5em9UcUxY?=
 =?utf-8?B?KzAxdzdqY0FoTlcyV2MwRWNoeVZ1T1ppRUsyR1JBYU8vY0NlOFgzbDgydWs0?=
 =?utf-8?B?N0FhT1FJVFc3VnI4bVNISmdoM2xiR25FMGFRdVJiQ3d6WkdNSWJKMFVCQkI2?=
 =?utf-8?B?dkgrTHFCQldRZ0Y2NkFEZlhjc3ZIUE5zdXQwTDhJWTNid3kyVm5KVFBtYWlo?=
 =?utf-8?B?Z0dhRWZvaklCMFNNVGxjT21rUDZWcTJKWkVSQ3dERTBsdG8va1NId1NNVCtX?=
 =?utf-8?B?RlN6Y2hvbnMwZ1hxcllMakZCZjRsRS9ZZWNIUjl4R2lHLzhxUUVQQ0M0OG1q?=
 =?utf-8?B?Z1ovbEVrUG9lcElhaUtSZDJQbjhuMlUzQm9uaHRpVjVDOWFSbFVaVnNIeGJl?=
 =?utf-8?B?YU5hMjBlM2l0bTR3bnYwVEJZcnplZ1hKSzExVUNmZzhhVkVrWTVHZXhKRVNZ?=
 =?utf-8?B?eFZiZHpDb0Rrc1p5L0duc2JGK0JPMUZIYU90ZXZvQk1GZ0F6WXJEMGxMa0dQ?=
 =?utf-8?B?L3dBWHRMS2ZuMVIyZk1NbXBSMHNtZGJyeTFyMjBvU1NnNkcwWHpnRjc3a0pO?=
 =?utf-8?B?VzhKSTZNMWQxVzVnWUNRTVl4eUhpbjdBcjZIMXNUYjhCSkszaEcyc1c5eDlP?=
 =?utf-8?B?b0Q0SCtqaUNDQngyNyswMytKQU50R1I0dXhZY2k0cDJyL2t6Tm9Gakt0R2dz?=
 =?utf-8?B?NEhjRFU1UE9PcnBXS1lwSGxOKzgvaUg2K0NqS3hQd2NsK0dOcHNhQWVqNFhS?=
 =?utf-8?B?ckNQWU9XOVBCbTgxSW1icU4yTWEzbXFlVSs1WERRTWFOekVySzJLY2wrUVBB?=
 =?utf-8?B?TDFOL3Fwem5nYVkxcC9oV3c4MEpZSDB6TkdNVjNJQVZPU0ZpNzQ0U3JaSE1R?=
 =?utf-8?B?VFFSbG9yUUxMNmRpWHNvOG94UnpyUGY2cTJ3RlJ0QWtMZDcyZE5TU3c0RjUx?=
 =?utf-8?B?b1ZLOVIrdWc2TnFHQkpuSThJNmxGR0NhaHdFOFpTMW1SRTJQM2VQWWZBakdz?=
 =?utf-8?B?MjJ0b0tyd21yWGp5UTE2WlFGR1NhQm5TYXpmbmozbzBobUt0WmlOYmNzOWVm?=
 =?utf-8?B?VEtBZXY1R296R2ZxS01xNS9rNndoSXpDb3VWOGk4RXhaNzNtNVJSUWo0b0Vs?=
 =?utf-8?B?d3VWYjREcnNlTjlLdlZCSzFrY3NrMVJpWjBCUmRYdFVhOU5POElpcURvcDIv?=
 =?utf-8?B?YzFnNDh1OUtlMHF3K1VjQkdWNnRpbnp2MXdxUHhTMU50OWJ2U3Y3WG9qdEo3?=
 =?utf-8?B?d2g0cHpnakdmdHBkNUtuMllyazRnQ2FuOWVzVDd0SE1RalBTRitpOW1KdmJp?=
 =?utf-8?B?ckcxVys2TGkwTkNJNTlTR0dJR2JiYmhxL1d3bFZCbis1eEFUVEFqTmhQSUp6?=
 =?utf-8?B?cVpnYkhmcTZOT0EwbmJ1TDNlejh3eWVuR1J4UHBldytFbmx2bXlZTnZ2RitQ?=
 =?utf-8?Q?Ep3MHZz+H0+dzYOHW1owx7cQswIjs3CiVbhHt?=
X-Exchange-RoutingPolicyChecked: BSqe/bajFWtpW+zIZ6shPUuSGuCCz+B6VzMseAWXksarE6ucnCsjC9jSG5tKTgNBvY0wKgneeqlS1hkEpOG/7OEUIS7Qkn2OKF9rnJaymSrk5LEgyhSBjkdeKwBjWwrxvfv9hkv+DXJFYs3ExONeeZPR5Mnu7Qq8Bx/ADlBgDg9LnCiDtJ/0KMus1KlPQt8eDDzs/eS2nlSQp/iRM53lkSTgh+OMBk5WOiiV9yKqJFqyL4tmsfAZABWsWPJ+FNpQZrXd3NvNhepz55HhhW4EbJC6DG3hOSOKBHXdr2gyOe/gZZxs2UWe+esDtUuxGP1Cs3oOsIjNQ3lw+87jEUyDdQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0463cccf-0901-44c5-3a78-08df2492c7b4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 16:48:14.5465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MPAk59s6lSeEvkVz1pVlEkj3RsBvNBEdumiw+Wde41yUhs6XwC8P9Gou53jelrYAPIOskPNnH1Md3UylSTH5hZjWkHQ/k3KxbchaZrxDPOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVTPR11MB9888
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

On Tue, Oct 06, 2026 at 07:33:14AM +0530, Bommu Krishnaiah wrote:
>ttm_bo_type_kernel BOs are not guaranteed to be zeroed on allocation and
>may contain data from previously freed pages. Since the OA buffer is
>mmap'able by userspace, this can expose stale kernel memory contents.
>
>Streams opened with DRM_XE_OA_PROPERTY_OA_DISABLED allocate the OA
>buffer without calling xe_oa_init_oa_buffer(). Zero the buffer at
>allocation to prevent information disclosure through mmap.
>
>The existing zeroing in xe_oa_init_oa_buffer() remains necessary for
>zero report-id/timestamp detection on enable/re-enable.
>
>Fixes: 392bf22238ff ("drm/xe/oa/uapi: OA buffer mmap")
>Assisted-by: LLM
>Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>


>---
> drivers/gpu/drm/xe/xe_oa.c | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index a3484e943c55..3bb8bbef4c37 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -914,6 +914,13 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
> 	if (IS_ERR(bo))
> 		return PTR_ERR(bo);
>
>+	/*
>+	 * ttm_bo_type_kernel BOs are not zeroed on allocation, so the buffer can
>+	 * hold stale data from previously freed pages. Since the OA buffer is
>+	 * mmap'able by userspace, clear it here to avoid leaking kernel memory.
>+	 */
>+	xe_map_memset(stream->oa->xe, &bo->vmap, 0, 0, xe_bo_size(bo));
>+
> 	stream->oa_buffer.bo = bo;
>
> 	stream->oa_buffer.bounce = kmalloc(stream->oa_buffer.format->size, GFP_KERNEL);
>-- 
>2.43.0
>
