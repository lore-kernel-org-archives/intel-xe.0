Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1EFE77197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 18:10:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967FA10E770;
	Tue,  7 Jan 2025 18:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pf7T6bOC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67FF10E76C
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jan 2025 18:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736273452; x=1767809452;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UpmXbIKX/BAck8D/+lIeLv6mo4vKLU5aiT77UndMiko=;
 b=Pf7T6bOCoK5+sCE5BiymeAHfnUjDWKM31PAXZvxHrQ0FuFCqfvuMYqtx
 rO9IxA2VcmaD0B3qmTDzsLMhDS4o+lYw6W4LqXNIWwnEot8JVkEMoij2v
 In4bkK038oBwFaQSqPDwoFHj0oGdOHHDzDTosXowxYvZzF0JsIXtWxhyi
 oaOJpRaFOCePe0nyEqrEykrLRfgQpSmHq9AuROjrlxa57HQ/MGFey4XoT
 /MbmHwpVjsiNtktOINwJxo3Qz9jDT1xImscahlDXcUCPI0iGG/IkfEIQh
 q+ZVHU3KLt8D2Vi6G8wybBnIO+kmQMl7sx7Zuv2haZGvY6qjczlbznQV/ g==;
X-CSE-ConnectionGUID: RbR/LnLpTVW9N5zpADBOlg==
X-CSE-MsgGUID: NNN7FJZYRZ+NuJmq+GYfKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="40241757"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="40241757"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 10:09:03 -0800
X-CSE-ConnectionGUID: gnY8YvAyS6a92c9axiwrnQ==
X-CSE-MsgGUID: 1ecHD38JQKWVXRZKfg9Diw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="107840983"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 10:09:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 10:09:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 10:09:01 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 10:09:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yn2K8EQjmu9w2gekqn/9/sE0kb6r27Xbb9h3qbwwPfm+Rg/QDMGq5dm/rpKJis9L6s+XMQHWIzabp78E2oAd/lHBdMkb2ViBfRzCc3L6gRhrudbA7fUJbo/9LqgY9yPJ24ZjxZkWwS9tJAf6Yu9BIESotJNUzy6hrvRuzqMlNtfwz7n7r2pYXSafeAy2y7S5FEBa09EJ5QI4R0y7nrCJNeTg1CKCtouIWzcu9l8/QxYHd5B04jPC5RJ0c15J0DJeyz5v8BSEQZHNT4fYDR8sdgyh7f/KsT2ajhC01rU9+0+sY1IyuvrhSIxnnHzZuA6fh2ZqWVL2BGHUS9RyiG7xXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcBr7weq5UCQx/RqoPeSPJBiivPpZ9oouhNSyEuYN00=;
 b=JVeKt9/O1IMaV55KhNLGU3ruUFHhL+Y2hgC709Hs37FWKK9lfiDc33sHGUfRW97+BbeTL+9sbAfrkX3NlTanOmQxMN412LvhEKbaYVW6hDpSQUvccaFtxj8tve6/w+4hPEg8d6COH7oLWyeRujq7Mi2Cfa8On1OHGPKbo8iXfjZ2rBBuFzD3okTniAJApqh5OaUyohVqb0QBAdF6rEaz2w2jG9bGW7v8ZDMhW4AQt6z+3BC0q4aWDxaoFwRtGgLsXqqO8sYuZEpyQc/+pcIwxDh5+6yVxI1GYP1LgTxdGhDGyexX7MZ2msZ7Cg5EnrkJcFX806Pckd4ewQVLOuUWSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DM4PR11MB6333.namprd11.prod.outlook.com (2603:10b6:8:b4::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.14; Tue, 7 Jan 2025 18:08:58 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.8314.015; Tue, 7 Jan 2025
 18:08:57 +0000
Message-ID: <4be083bf-3652-447e-9152-d17257e1bc59@intel.com>
Date: Tue, 7 Jan 2025 10:08:55 -0800
User-Agent: Mozilla Thunderbird
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v10 1/4] drm/xe/pmu: Enable PMU interface
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Riana Tauro <riana.tauro@intel.com>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>
References: <20241220011910.103280-1-vinay.belgaumkar@intel.com>
 <20241220011910.103280-2-vinay.belgaumkar@intel.com>
 <Z2XbqLncDdx7_45Z@intel.com>
Content-Language: en-US
In-Reply-To: <Z2XbqLncDdx7_45Z@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF000132E7.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::27) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DM4PR11MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: d63ea271-d896-4392-30a4-08dd2f465af4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUdQNkV6Nnd3OCtybXRzU3pYRFliblNKWEtSTzluOHpXd0o5SGk0NWd3THpN?=
 =?utf-8?B?RkdHSkpIL1BCRUlLV01xYlJMam5IVVZRK095d0NsaHFzQTVSZzZlT1pUSys1?=
 =?utf-8?B?bzhOMlZycEt4Nm1TZ2xyeGNMenBFVVk4SGtLQi9sQkRHNTJiWXNNVGh6aEh4?=
 =?utf-8?B?UEQxbWY3djJOK2ROeFBYMkl4akxibzFlRlpsemtvMXB0UXJWNFRQN3dzN0hW?=
 =?utf-8?B?N0M5Wi9RRVRYZzd1d1hhL0FFZUJJaEljU0h6VVk3Q3Btc1B4dkk1NDhvNkVJ?=
 =?utf-8?B?a0RyVXhyYnZkdEtYOTVhYkJ1NmFOYXVleTd3ZWVIaE1zeXQ3Mzc5a2toblpq?=
 =?utf-8?B?S1dldlM3YkVja1hSSHZhTFFvRi9yL2t0eE01dlBobUtuT2RhQXFnSzdSRXNt?=
 =?utf-8?B?TzNGSy9pZzArMnhvWXJXYWxYTHY1bG1LMm9iR3QvTHkwM2lCTDkwSEFaZHF5?=
 =?utf-8?B?eVRINXl3U1U3NVBBZk1ncUgwWGxjTUM2cDNlYWFNVnhUM3BhcFZqdElNS3p0?=
 =?utf-8?B?RC9LNnFNNm1TVTR3VGExSENpYkNxZGtNZ25IdGszU0JxK1ZLbmRjNTZuQWdM?=
 =?utf-8?B?cGxWSmsyZk9hajNJYTNVbHNtTUpSODB1aWt3MXREMGJXbGk3dkFNV0c3aGZw?=
 =?utf-8?B?cThWZWoxUDZWT0NzayttL1RSdm9tWFluS01vRmJWQzd1MDZhWFRDa3NzaUxI?=
 =?utf-8?B?TVJ1aVpDMHVBZFVTNzJHYjdwTVJMQ0c3S21Jc1hnSmZJWjY4TkE5OElhUlJW?=
 =?utf-8?B?bVp2eXJZVmhNaW5ScGdLS1Z4SmFOYWVDRVVKdC9ZekRlamdORE5XYi9lam9N?=
 =?utf-8?B?cUV6dzJlbUFUWHpqNUQ3cmpYdkFRc3NZa3BCUmFqT01FNk9BR3VsSVRWSDZs?=
 =?utf-8?B?MSs3T1cwL1VSYU8yTWM4TGtxNVVEU0RONGdUVlRObmhEdDg3Ny8vVVlZNS9q?=
 =?utf-8?B?ZWNEVkFtbVJIeEdJR0lpTms1andmbjNDcnJkOEJ5TW9sa1hFZXVzUXZjZ3VI?=
 =?utf-8?B?Q2lFMDdlT0xiOTVRRXRZUm1aTmZIektva0EwN2dJL0cwS05OM0lRRmpjeFJL?=
 =?utf-8?B?U3d1SUpxWlBrUGtvaGhGSGp0THlGY1A3TWNrQW5zaTY3TXVMVFFaczczeXgw?=
 =?utf-8?B?bUFnQXoxM3hQVW1hWHQrelRSZERBb2ZYckdBdEJmNzZSYWJGNTNKQ0tkVmFm?=
 =?utf-8?B?bGpadHFNKzVFZ0dCQW9pdUM1Z3V6bUJHRVJHOU15TlBZdXVsVnhYMGtzUWRU?=
 =?utf-8?B?dit6RER0V1NzeTZVY2FEemtDT3g5T2xNYXJtaEJsSjc4ZkN0KzRPYjcxQTNB?=
 =?utf-8?B?aGNtZGxkSjhuVnlLUTNpVGhFeUZpalZnWVpZUTJYZlkreWkvV3hwU2lvdGtR?=
 =?utf-8?B?am44dlN4TXE5aTB2NzJpZnhSS0tpWUJDN0dubEZKQkFzRm5lOURVaUJZaldT?=
 =?utf-8?B?dnFGZXZXQlRsOTBUQVBZUzFUd05kdzJ5bURiekNoMlVtQ0ZQckxVc3F0K3dF?=
 =?utf-8?B?aE5WRWU1dHp3L0RTdnBRcnRHRUd3MDkrUlN5dXc4aVBBZDZQZXl4MWtSSjJm?=
 =?utf-8?B?TWo4M0dBVWNwWnF5ckZWaUVMMEdXcVZkNFptWE50cFY3clBld1lzT0hYUHk2?=
 =?utf-8?B?SGluLzNrWm1aczl2QUdRU0xkYmptRkVRSUlJZUZ3OXp3anhYb2JSM3dRUHZC?=
 =?utf-8?B?Zy9vemxKY2xSNGVIZkl6b1R6VThnT0ZpRWJ6dWtvdGx5eWFYN1RUWmNIQU4w?=
 =?utf-8?Q?C/azOhmkxz/UP4cafuNIXgsMYIt42DFkUqaKZpo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yyt5bzJuQjc0MzludUdQTDRsd1VWZHByQTVpMm1KZ1RTYThCQkZ0MDlBUU9K?=
 =?utf-8?B?SnhxN0dtd250TmJ4amlzUjgzblMxeVR0MjQ2Y2FaNWczVlNpd3VJRHRZcmhH?=
 =?utf-8?B?TjBFY1JJaFFVd2w2alNsK3Y1Sktoc2NzRTdXSWl2MUNXdy9mQmdKUFk2blRu?=
 =?utf-8?B?d0lRZHluOHdsY2E2bDlGdTQwREhGN281Ny9wZS9WVEFwMm9HblhvTVY3TElC?=
 =?utf-8?B?VHBYR0I5V3EreDZxb0FyWVZkanhybXE5bUFhYmlCVEczN08wNFRSTnVaVTFS?=
 =?utf-8?B?RmhkTUdiMGxaSkt3VXpYSWVkK2hDeDA0ZFk2Z3hCWkxqcmFwNmRjbFpMVWVB?=
 =?utf-8?B?OFlPM1FkR2o0N0MvdlVaMWFTbGd4Q2xnVjQ1NzcycWNRSVZYdG5UVlEwSnk0?=
 =?utf-8?B?QUJhbFIrTE4xT1htSW9ENTdCdzMzUDRZd1lpRTc4dk8zVitsZTErUytTVmlT?=
 =?utf-8?B?ZDdnejUwS3hERVBBOGQ5VjJpYjlrYUcvUmtROE94Ny9pM2ZxRVVtWUtsTTQ0?=
 =?utf-8?B?bFlDZ0VTVVBCbGNPSU82K1FqTVpxTm10QktlSGFXTVdZd3dhMFR1QWNlWTlL?=
 =?utf-8?B?NE5XK0RPQ1Y1K1BZbVVwNXhmK0s4VVozdjJMdUwvaTBUSkloM2s2NEp2dm9t?=
 =?utf-8?B?VHBRb0NTMnpRQllpQnYwanV0cTlBNWpDK3hLVUVFeEhkUU9RL2QydlFIYlov?=
 =?utf-8?B?bys3akZnNlJLYzFyK0Q1NXFKK2xXdmZQejJmeE95Tk9BTWwvNTlGQXh0Q05H?=
 =?utf-8?B?UGdwSUZMSFU1YnY4SVkxTnFEbkRFWllsNHBJTGd5TXFoazNZTEhIQjhWcEh1?=
 =?utf-8?B?VHFHQ1V4R3NyajBydTNSSjZ6YzBwZFA0Sm51dUFTcU5aZWI5S2hSczhDU1c5?=
 =?utf-8?B?T1VncnBFU1VSUWFCVkVjUmZsZ1NLZm01S3ZSeEZvRUVxOEpCWWZMb3BDdGdS?=
 =?utf-8?B?MFkxbHVaL1MrellGTUgwVTJDVVlzT0N5Qk5QTkgrR1hZajBNaFdnUUQ2dG43?=
 =?utf-8?B?bExkK2FYWUhaM1FSS1RNQXdUT1l0bXBsRzBlSitEaE5xME52QktCZ2M4R2dK?=
 =?utf-8?B?R1IvSXVhcVpkS1lxR3piOE94Y3VtdWtRQ21yV3F5VjVQYU8rR0hWUEt1eSts?=
 =?utf-8?B?Y2p3cFFNdWJYYzl1UGdQbk1tcWI2Z1FjZ2ZIajN2OGVucE5ZRGZEZ1pwY3p0?=
 =?utf-8?B?ck9Dcnh4dkRUaXdIeXZKQU1BdFFXNmgxWUhKWWtIRHVYOGltbGVla3pXQUJF?=
 =?utf-8?B?T0VETDhXajJmZXM3ZDFmcm8rS3c4T2YvN29SQW9CbDJkU0xScW1mWWZjbkh0?=
 =?utf-8?B?WjRDVUt5Z0dGdnVKN0VNbE9qSmgyem5nZjFSRUNzZlhxTXlmRytVYkdmMnhR?=
 =?utf-8?B?b2dxQ09ySTdKcWhsY21NMng4eUVaYklCQ1RBMExJdVNFamFnOVQ1OWM3ZXJO?=
 =?utf-8?B?Y3Z5M1NoSW9JN0xoVEZzTUs3RWhTT3c2enlKWWprUXV3eXNpeHBPanFsN2g5?=
 =?utf-8?B?SStOenpBZTd3V1llTytHTWRMZkU2dU9LdHNuNTFIQUlGSGxsSExBL1h1Ti9G?=
 =?utf-8?B?MmRNMEswUldDYjhsREdNdHVqTGVLV2h6SGhyU1lQbTNWcnYxR0pXeU5qWVp2?=
 =?utf-8?B?T09ZRzIxRDNMenRYM29hVFVPaUtzanhHUFZTV29saEF1Q3NCR1pOYWJYUUN0?=
 =?utf-8?B?MHZtQ0ZzY0M4N3BLc0EyRm5WbGt5N1hLMFl6L05wUnpkTWdWRXVHdVBuTWRO?=
 =?utf-8?B?TmVxYkwzcUFwWFJMaERFMTFCa2NwQXQ5NWtWK1pjeXFLa1ZlQnlVY2wwdGRN?=
 =?utf-8?B?V2lQZkZDRmJUZUorTDd2R0RlUURkNlBMWUpmQ1dZUkZaNVRLc1Z1WG0wSjJa?=
 =?utf-8?B?R0pqTGFkMTBuMzFIcVVOTHg4aDVCN3ZXVklKY3hwbWN1YzF6ZE84K2tlcjFa?=
 =?utf-8?B?bmxmSFJ1R0hzek1ObVdKSnRZQ2p4WG5NWHNaRmRRcjZxczNxZ0tDdWMwdlV3?=
 =?utf-8?B?cmNqQ2oxWmd1RlovNnh2V2dBZW5xQlhseGdzMWpaWE05VjJmM3RBbDBNSlcr?=
 =?utf-8?B?NnhkSGVXS2lHV0t0ZnlRVjVRR3ZXdStDYkdkamdybEppQzZyYmtVWXNHZUdq?=
 =?utf-8?B?aXhmenkyVHhzVXlleEplT3RDVSt3MEd2aThDREEzdjd0Skl0VXZhbzBwdklZ?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d63ea271-d896-4392-30a4-08dd2f465af4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 18:08:57.8637 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqWq+3A33FPKVF5SoGVE4M6cTJdEdZxAZRyKIe+l5xwk5ZBSQ/M751dhs1hAt4QyIZrVq3CxlgIKH4qJKT6IozYMMnRmrZ2MBXkq48SOzxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6333
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


On 12/20/2024 1:03 PM, Rodrigo Vivi wrote:
> On Thu, Dec 19, 2024 at 05:19:07PM -0800, Vinay Belgaumkar wrote:
>> From: Aravind Iddamsetty<aravind.iddamsetty@linux.intel.com>
>>
>> Basic PMU enabling patch. Setup the basic framework
>> for adding events/timers. This patch was previously
>> reviewed here -
>> https://patchwork.freedesktop.org/series/119504/
>>
>> The pmu base implementation is still from the
>> i915 driver.
>>
>> v2: Review comments(Rodrigo) and do not init pmu for VFs
>> as they don't have access to freq and c6 residency anyways.
>> v3: Fix kunit issue, move xe_pmu entry in Makefile (Jani) and
>> move drm uapi definitions (Lucas)
>> v4: Adapt Lucas's recent PMU fixes for i915
>> v5: Fix some kernel doc issues
>> v6: Address comments from Lucas.
>> v7: Define events per device and use xe_gt_id to choose GT (Lucas)
>> v8: Use config field bits for gt_id as well. Use raw_spinlock_t
>> to avoid deadlocks with perf subsystem (Lucas)
>>
>> Co-developed-by: Bommu Krishnaiah<krishnaiah.bommu@intel.com>
>> Signed-off-by: Bommu Krishnaiah<krishnaiah.bommu@intel.com>
>> Signed-off-by: Aravind Iddamsetty<aravind.iddamsetty@linux.intel.com>
>> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
>> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
>> Reviewed-by: Rodrigo Vivi<rodrigo.vivi@intel.com> #v4
>> Cc: Lucas De Marchi<lucas.demarchi@intel.com>
>> Co-developed-by: Vinay Belgaumkar<vinay.belgaumkar@intel.com>
>> Signed-off-by: Vinay Belgaumkar<vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |   2 +
>>   drivers/gpu/drm/xe/xe_device.c       |   3 +
>>   drivers/gpu/drm/xe/xe_device_types.h |   4 +
>>   drivers/gpu/drm/xe/xe_module.c       |   5 +
>>   drivers/gpu/drm/xe/xe_pmu.c          | 621 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pmu.h          |  26 ++
>>   drivers/gpu/drm/xe/xe_pmu_types.h    |  72 ++++
>>   7 files changed, 733 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 7730e0596299..ab4a1af795fc 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -300,6 +300,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>>   		i915-display/intel_pipe_crc.o
>>   endif
>>   
>> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>> +
>>   obj-$(CONFIG_DRM_XE) += xe.o
>>   obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index bf36e4fb4679..ca557c22c979 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -49,6 +49,7 @@
>>   #include "xe_pat.h"
>>   #include "xe_pcode.h"
>>   #include "xe_pm.h"
>> +#include "xe_pmu.h"
>>   #include "xe_query.h"
>>   #include "xe_sriov.h"
>>   #include "xe_tile.h"
>> @@ -760,6 +761,8 @@ int xe_device_probe(struct xe_device *xe)
>>   
>>   	xe_oa_register(xe);
>>   
>> +	xe_pmu_register(&xe->pmu);
>> +
>>   	xe_debugfs_register(xe);
>>   
>>   	xe_hwmon_register(xe);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 8a7b15972413..bd1e72d318f7 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -18,6 +18,7 @@
>>   #include "xe_memirq_types.h"
>>   #include "xe_oa_types.h"
>>   #include "xe_platform_types.h"
>> +#include "xe_pmu_types.h"
>>   #include "xe_pt_types.h"
>>   #include "xe_sriov_types.h"
>>   #include "xe_step_types.h"
>> @@ -525,6 +526,9 @@ struct xe_device {
>>   		int mode;
>>   	} wedged;
>>   
>> +	/** @pmu: performance monitoring unit */
>> +	struct xe_pmu pmu;
>> +
>>   #ifdef TEST_VM_OPS_ERROR
>>   	/**
>>   	 * @vm_inject_error_position: inject errors at different places in VM
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index 0f2c20e9204a..d3a9d4bc9bee 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -14,6 +14,7 @@
>>   #include "xe_hw_fence.h"
>>   #include "xe_pci.h"
>>   #include "xe_pm.h"
>> +#include "xe_pmu.h"
>>   #include "xe_observation.h"
>>   #include "xe_sched_job.h"
>>   
>> @@ -96,6 +97,10 @@ static const struct init_funcs init_funcs[] = {
>>   		.init = xe_sched_job_module_init,
>>   		.exit = xe_sched_job_module_exit,
>>   	},
>> +	{
>> +		.init = xe_pmu_init,
>> +		.exit = xe_pmu_exit,
>> +	},
>>   	{
>>   		.init = xe_register_pci_driver,
>>   		.exit = xe_unregister_pci_driver,
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> new file mode 100644
>> index 000000000000..e6d25e8b7b7c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -0,0 +1,621 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/xe_drm.h>
>> +
>> +#include "regs/xe_gt_regs.h"
>> +#include "xe_device.h"
>> +#include "xe_force_wake.h"
>> +#include "xe_gt_clock.h"
>> +#include "xe_mmio.h"
>> +#include "xe_macros.h"
>> +#include "xe_pm.h"
>> +#include "xe_pmu.h"
>> +
>> +/*
>> + * CPU mask is defined/initialized at a module level. All devices
>> + * inside this module share this mask.
>> + */
>> +static cpumask_t xe_pmu_cpumask;
>> +static unsigned int xe_pmu_target_cpu = -1;
>> +
>> +/**
>> + * DOC: Xe PMU (Performance Monitoring Unit)
>> + *
>> + * Expose events/counters like C6 residency and GT frequency to user land.
>> + * Events will be per device, the GT can be selected with an extra config
>> + * sub-field (bits 60-63).
>> + *
>> + * Perf tool can be used to list these counters from the command line.
>> + *
>> + * Example commands to list/record supported perf events-
>> + *
>> + * $ ls -ld /sys/bus/event_source/devices/xe_*
>> + * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
>> + * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/format/
>> + *
>> + * The format directory has info regarding the configs that can be used.
>> + *
>> + * The standard perf tool can be used to grep for a certain event as well-
>> + * $ perf list | grep c6
>> + *
>> + * To list a specific event for a GT at regular intervals-
>> + * $ perf stat -e <event_name,xe_gt_id=> -I <interval>
>> + *
>> + */
>> +
>> +static unsigned int config_gt_id(const u64 config)
>> +{
>> +	return config >> __XE_PMU_GT_SHIFT;
>> +}
>> +
>> +static u64 config_counter(const u64 config)
>> +{
>> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>> +}
>> +
>> +static void xe_pmu_event_destroy(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +
>> +	drm_WARN_ON(&xe->drm, event->parent);
>> +
>> +	drm_dev_put(&xe->drm);
>> +}
>> +
>> +static int
>> +config_status(struct xe_device *xe, u64 config)
>> +{
>> +	unsigned int gt_id = config_gt_id(config);
>> +
>> +	if (gt_id >= XE_MAX_GT_PER_TILE)
>> +		return -ENOENT;
>> +
>> +	switch (config_counter(config)) {
>> +	default:
>> +		return -ENOENT;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_pmu_event_init(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	int ret;
>> +	u64 event_config;
>> +
>> +	if (!pmu->registered)
>> +		return -ENODEV;
>> +
>> +	if (event->attr.type != event->pmu->type)
>> +		return -ENOENT;
>> +
>> +	/* unsupported modes and filters */
>> +	if (event->attr.sample_period) /* no sampling */
>> +		return -EINVAL;
>> +
>> +	if (has_branch_stack(event))
>> +		return -EOPNOTSUPP;
> can we do all the EINVAL checks first and this one right after the
> einval code?
ok.
>> +
>> +	if (event->cpu < 0)
>> +		return -EINVAL;
>> +
>> +	/* only allow running on one cpu at a time */
>> +	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>> +		return -EINVAL;
>> +
>> +	event_config = event->attr.config;
>> +	ret = config_status(xe, event_config);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!event->parent) {
>> +		drm_dev_get(&xe->drm);
>> +		event->destroy = xe_pmu_event_destroy;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static u64 __xe_pmu_event_read(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	const u64 config = event->attr.config;
>> +	const u64 gt_id = config >> __XE_PMU_GT_SHIFT;
>> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +	u64 val = 0;
>> +
>> +	switch (config_counter(config)) {
>> +	default:
>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +	}
>> +
>> +	return val;
>> +}
>> +
>> +static void xe_pmu_event_read(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct hw_perf_event *hwc = &event->hw;
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	u64 prev, new;
>> +
>> +	if (!pmu->registered) {
>> +		event->hw.state = PERF_HES_STOPPED;
>> +		return;
>> +	}
>> +
>> +	prev = local64_read(&hwc->prev_count);
>> +	do {
>> +		new = __xe_pmu_event_read(event);
>> +	} while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
>> +
>> +	local64_add(new - prev, &event->count);
>> +}
>> +
>> +static void xe_pmu_enable(struct perf_event *event)
>> +{
>> +	/*
>> +	 * Store the current counter value so we can report the correct delta
>> +	 * for all listeners. Even when the event was already enabled and has
>> +	 * an existing non-zero value.
>> +	 */
>> +	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>> +}
>> +
>> +static void xe_pmu_event_start(struct perf_event *event, int flags)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (!pmu->registered)
>> +		return;
>> +
>> +	xe_pmu_enable(event);
>> +	event->hw.state = 0;
>> +}
>> +
>> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (!pmu->registered)
>> +		goto out;
>> +
>> +	if (flags & PERF_EF_UPDATE)
>> +		xe_pmu_event_read(event);
>> +
>> +out:
>> +	event->hw.state = PERF_HES_STOPPED;
> please avoid this goto here by using if/else on the if (!pmu->registered) { if (flags...} else { event->hw.state...};
ok.
>> +}
>> +
>> +static int xe_pmu_event_add(struct perf_event *event, int flags)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (!pmu->registered)
>> +		return -ENODEV;
>> +
>> +	if (flags & PERF_EF_START)
>> +		xe_pmu_event_start(event, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_pmu_event_del(struct perf_event *event, int flags)
>> +{
>> +	xe_pmu_event_stop(event, PERF_EF_UPDATE);
>> +}
>> +
>> +static int xe_pmu_event_event_idx(struct perf_event *event)
>> +{
>> +	return 0;
>> +}
>> +
>> +struct xe_str_attribute {
>> +	struct device_attribute attr;
>> +	const char *str;
>> +};
>> +
>> +static ssize_t xe_pmu_format_show(struct device *dev,
>> +				  struct device_attribute *attr, char *buf)
>> +{
>> +	struct xe_str_attribute *eattr;
>> +
>> +	eattr = container_of(attr, struct xe_str_attribute, attr);
>> +	return sprintf(buf, "%s\n", eattr->str);
>> +}
>> +
>> +#define XE_PMU_FORMAT_ATTR(_name, _config) \
>> +	(&((struct xe_str_attribute[]) { \
>> +		{ .attr = __ATTR(_name, 0444, xe_pmu_format_show, NULL), \
>> +		.str = _config, } \
>> +	})[0].attr.attr)
>> +
>> +static struct attribute *xe_pmu_format_attrs[] = {
>> +	XE_PMU_FORMAT_ATTR(event_id, "config:0-20"),
>> +	XE_PMU_FORMAT_ATTR(gt_id, "config:60-63"),
>> +	NULL,
>> +};
>> +
>> +static const struct attribute_group xe_pmu_format_attr_group = {
>> +	.name = "format",
>> +	.attrs = xe_pmu_format_attrs,
>> +};
>> +
>> +struct xe_ext_attribute {
>> +	struct device_attribute attr;
>> +	unsigned long val;
>> +};
>> +
>> +static ssize_t xe_pmu_event_show(struct device *dev,
>> +				 struct device_attribute *attr, char *buf)
>> +{
>> +	struct xe_ext_attribute *eattr;
>> +
>> +	eattr = container_of(attr, struct xe_ext_attribute, attr);
>> +	return sprintf(buf, "config=0x%lx\n", eattr->val);
>> +}
>> +
>> +static ssize_t cpumask_show(struct device *dev,
>> +			    struct device_attribute *attr, char *buf)
>> +{
>> +	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
>> +}
>> +
>> +static DEVICE_ATTR_RO(cpumask);
>> +
>> +static struct attribute *xe_cpumask_attrs[] = {
>> +	&dev_attr_cpumask.attr,
>> +	NULL,
>> +};
>> +
>> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
>> +	.attrs = xe_cpumask_attrs,
>> +};
>> +
>> +#define __event(__counter, __name, __unit) \
>> +{ \
>> +	.counter = (__counter), \
>> +	.name = (__name), \
>> +	.unit = (__unit), \
>> +}
>> +
>> +static struct xe_ext_attribute *
>> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
>> +{
>> +	sysfs_attr_init(&attr->attr.attr);
>> +	attr->attr.attr.name = name;
>> +	attr->attr.attr.mode = 0444;
>> +	attr->attr.show = xe_pmu_event_show;
>> +	attr->val = config;
>> +
>> +	return ++attr;
>> +}
>> +
>> +static struct perf_pmu_events_attr *
>> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
>> +	     const char *str)
>> +{
>> +	sysfs_attr_init(&attr->attr.attr);
>> +	attr->attr.attr.name = name;
>> +	attr->attr.attr.mode = 0444;
>> +	attr->attr.show = perf_event_sysfs_show;
>> +	attr->event_str = str;
>> +
>> +	return ++attr;
>> +}
>> +
>> +static struct attribute **
>> +create_event_attributes(struct xe_pmu *pmu)
>> +{
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	static const struct {
>> +		unsigned int counter;
>> +		const char *name;
>> +		const char *unit;
>> +	} events[] = {
>> +	};
>> +
>> +	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> +	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
>> +	struct attribute **attr = NULL, **attr_iter;
>> +	unsigned int count = 0;
>> +	unsigned int i;
>> +
>> +	/* Count how many counters we will be exposing. */
>> +	for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +		u64 config = __XE_PMU_PM(events[i].counter);
>> +
>> +		if (!config_status(xe, config))
>> +			count++;
>> +	}
>> +
>> +	/* Allocate attribute objects and table. */
>> +	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
>> +	if (!xe_attr)
>> +		goto err_alloc;
> this looks wrong to me, you don't need to kfree anyone in this case...
ok.
>
>> +
>> +	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
>> +	if (!pmu_attr)
>> +		goto err_alloc;
> same here, you only need to kfree xe_attr in this case...
>
>> +
>> +	/* Max one pointer of each attribute type plus a termination entry. */
>> +	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
>> +	if (!attr)
>> +		goto err_alloc;
> and here, you only need to kfree xe_attr and pmu_attr in this case...
>
> I know, copied from i915 and 'it works there'... I believe it works
> because kfree itself skips if NULL, not because the code is in the
> best shape...
>
> but perhaps I'm just paranoid?
Ok.
>
>> +
>> +	xe_iter = xe_attr;
>> +	pmu_iter = pmu_attr;
>> +	attr_iter = attr;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +		u64 config = __XE_PMU_PM(events[i].counter);
>> +		char *str;
>> +
>> +		if (config_status(xe, config))
>> +			continue;
>> +
>> +		str = kasprintf(GFP_KERNEL, "%s",
>> +				events[i].name);
>> +		if (!str)
>> +			goto err;
> hmmm, here you don't need to free everyone, but only all the above before
> the loop and the ones that you have run in the loop already, but not the
> entire loop again below...
>
> or perhaps the for loop below takes care of this and I'm just paranoid...
We are freeing all of them. If there are sys/memory issues where even a 
string cannot be allocated, might not be worth continuing with anything?
>
>> +
>> +		*attr_iter++ = &xe_iter->attr.attr;
>> +		xe_iter = add_xe_attr(xe_iter, str, config);
>> +
>> +		if (events[i].unit) {
>> +			str = kasprintf(GFP_KERNEL, "%s.unit",
>> +					events[i].name);
>> +			if (!str)
>> +				goto err;
>> +
>> +			*attr_iter++ = &pmu_iter->attr.attr;
>> +			pmu_iter = add_pmu_attr(pmu_iter, str,
>> +							events[i].unit);
>> +		}
>> +	}
>> +
>> +	pmu->xe_attr = xe_attr;
>> +	pmu->pmu_attr = pmu_attr;
>> +
>> +	return attr;
>> +
>> +err:
>> +	for (attr_iter = attr; *attr_iter; attr_iter++)
>> +		kfree((*attr_iter)->name);
>> +
>> +err_alloc:
>> +	kfree(attr);
>> +	kfree(xe_attr);
>> +	kfree(pmu_attr);
>> +
>> +	return NULL;
>> +}
>> +
>> +static void free_event_attributes(struct xe_pmu *pmu)
>> +{
>> +	struct attribute **attr_iter = pmu->events_attr_group.attrs;
>> +
>> +	for (; *attr_iter; attr_iter++)
>> +		kfree((*attr_iter)->name);
>> +
>> +	kfree(pmu->events_attr_group.attrs);
>> +	kfree(pmu->xe_attr);
>> +	kfree(pmu->pmu_attr);
>> +
>> +	pmu->events_attr_group.attrs = NULL;
>> +	pmu->xe_attr = NULL;
>> +	pmu->pmu_attr = NULL;
>> +}
>> +
>> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>> +{
>> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>> +
>> +	/* Select the first online CPU as a designated reader. */
>> +	if (cpumask_empty(&xe_pmu_cpumask))
>> +		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
>> +{
>> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>> +	unsigned int target = xe_pmu_target_cpu;
>> +
>> +	/*
>> +	 * Unregistering an instance generates a CPU offline event which we must
>> +	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
>> +	 */
>> +	if (!pmu->registered)
>> +		return 0;
>> +
>> +	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
>> +		target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
>> +
>> +		/* Migrate events if there is a valid target */
>> +		if (target < nr_cpu_ids) {
>> +			cpumask_set_cpu(target, &xe_pmu_cpumask);
>> +			xe_pmu_target_cpu = target;
>> +		}
>> +	}
>> +
>> +	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
>> +		perf_pmu_migrate_context(&pmu->base, cpu, target);
>> +		pmu->cpuhp.cpu = target;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static enum cpuhp_state cpuhp_state = CPUHP_INVALID;
>> +
>> +/**
>> + * xe_pmu_init() - Setup CPU hotplug state/callbacks for Xe PMU
>> + *
>> + * Returns: 0 if successful, else error code
>> + */
>> +int xe_pmu_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>> +				      "perf/x86/intel/xe:online",
>> +				      xe_pmu_cpu_online,
>> +				      xe_pmu_cpu_offline);
>> +	if (ret < 0)
>> +		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
>> +			  ret);
>> +	else
>> +		cpuhp_state = ret;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_pmu_exit() - Remove CPU hotplug state/callbacks for Xe PMU
>> + */
>> +void xe_pmu_exit(void)
>> +{
>> +	if (cpuhp_state != CPUHP_INVALID)
>> +		cpuhp_remove_multi_state(cpuhp_state);
>> +}
>> +
>> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
>> +{
>> +	if (cpuhp_state == CPUHP_INVALID)
>> +		return -EINVAL;
>> +
>> +	return cpuhp_state_add_instance(cpuhp_state, &pmu->cpuhp.node);
>> +}
>> +
>> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>> +{
>> +	cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
>> +}
>> +
>> +/**
>> + * xe_pmu_unregister() - Remove/cleanup PMU registration
>> + * @arg: Ptr to pmu
>> + */
>> +void xe_pmu_unregister(void *arg)
>> +{
>> +	struct xe_pmu *pmu = arg;
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +
>> +	if (IS_SRIOV_VF(xe))
>> +		return;
>> +
>> +	if (!pmu->registered)
>> +		return;
>> +
>> +	pmu->registered = false;
>> +
>> +	xe_pmu_unregister_cpuhp_state(pmu);
>> +
>> +	perf_pmu_unregister(&pmu->base);
>> +	kfree(pmu->base.attr_groups);
>> +	kfree(pmu->name);
>> +	free_event_attributes(pmu);
>> +}
>> +
>> +/**
>> + * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
>> + * @pmu: the PMU object
>> + *
>> + */
>> +void xe_pmu_register(struct xe_pmu *pmu)
>> +{
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	const struct attribute_group *attr_groups[] = {
>> +		&xe_pmu_format_attr_group,
>> +		&pmu->events_attr_group,
>> +		&xe_pmu_cpumask_attr_group,
>> +		NULL
>> +	};
>> +
>> +	int ret = -ENOMEM;
> unused ret variable in a void function...
The ret is used internal to this function.
>
>> +
>> +	if (IS_SRIOV_VF(xe))
>> +		return;
>> +
>> +	raw_spin_lock_init(&pmu->lock);
>> +	pmu->cpuhp.cpu = -1;
>> +
>> +	pmu->name = kasprintf(GFP_KERNEL,
>> +			      "xe_%s",
>> +			      dev_name(xe->drm.dev));
>> +	if (pmu->name) {
>> +		/* tools/perf reserves colons as special. */
>> +		strreplace((char *)pmu->name, ':', '_');
>> +	}
>> +
>> +	if (!pmu->name)
>> +		goto err;
> move this above, then you can avoid the if (pmu->name) condition in the
> other block...
ok.
>
>> +
>> +	pmu->events_attr_group.name = "events";
>> +	pmu->events_attr_group.attrs = create_event_attributes(pmu);
>> +	if (!pmu->events_attr_group.attrs)
>> +		goto err_name;
> this function is indeed handling the goto error conditions much better
> than the other one above...
>
>> +
>> +	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>> +					GFP_KERNEL);
>> +	if (!pmu->base.attr_groups)
>> +		goto err_attr;
>> +
>> +	pmu->base.module	= THIS_MODULE;
>> +	pmu->base.task_ctx_nr	= perf_invalid_context;
>> +	pmu->base.event_init	= xe_pmu_event_init;
>> +	pmu->base.add		= xe_pmu_event_add;
>> +	pmu->base.del		= xe_pmu_event_del;
>> +	pmu->base.start		= xe_pmu_event_start;
>> +	pmu->base.stop		= xe_pmu_event_stop;
>> +	pmu->base.read		= xe_pmu_event_read;
>> +	pmu->base.event_idx	= xe_pmu_event_event_idx;
>> +
>> +	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
>> +	if (ret)
>> +		goto err_groups;
>> +
>> +	ret = xe_pmu_register_cpuhp_state(pmu);
>> +	if (ret)
>> +		goto err_unreg;
>> +
>> +	ret = devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, pmu);
>> +	if (ret)
>> +		goto err_cpuhp;
>> +
>> +	pmu->registered = true;
>> +
>> +	return;
>> +
>> +err_cpuhp:
>> +	xe_pmu_unregister_cpuhp_state(pmu);
>> +err_unreg:
>> +	perf_pmu_unregister(&pmu->base);
>> +err_groups:
>> +	kfree(pmu->base.attr_groups);
>> +err_attr:
>> +	free_event_attributes(pmu);
>> +err_name:
>> +	kfree(pmu->name);
>> +err:
>> +	drm_notice(&xe->drm, "Failed to register PMU!\n");
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>> new file mode 100644
>> index 000000000000..d07e5dfdfec0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
> probably good to remind to change this and every other header in this series to
> 2025 already?
ok.
>
>> + */
>> +
>> +#ifndef _XE_PMU_H_
>> +#define _XE_PMU_H_
>> +
>> +#include "xe_pmu_types.h"
>> +
>> +struct xe_gt;
>> +
>> +#if IS_ENABLED(CONFIG_PERF_EVENTS)
>> +int xe_pmu_init(void);
>> +void xe_pmu_exit(void);
>> +void xe_pmu_register(struct xe_pmu *pmu);
>> +void xe_pmu_unregister(void *arg);
>> +#else
>> +static inline int xe_pmu_init(void) { return 0; }
>> +static inline void xe_pmu_exit(void) {}
>> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>> +static inline void xe_pmu_unregister(void *arg) {}
>> +#endif
>> +
>> +#endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>> new file mode 100644
>> index 000000000000..2b3f8982023f
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -0,0 +1,72 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_TYPES_H_
>> +#define _XE_PMU_TYPES_H_
>> +
>> +#include <linux/perf_event.h>
>> +#include <linux/spinlock_types.h>
>> +
>> +enum {
>> +	__XE_NUM_PMU_SAMPLERS
>> +};
>> +
>> +#define XE_PMU_MAX_GT 2
> is there a way to make this more generic?
> otherwise whenever we have a platform with
> different max we will forget to adjust here...
Seems hard to do. MAX_GTS is defined in xe_device_types, which includes 
xe_pmu_types, so using that leads to circular ref. Doesn't look like 
there is a clean solution here, as having the sole definition in 
xe_pmu_types may not be the right choice.
>
>> +
>> +/*
>> + * Top bits of every counter are GT id.
>> + */
>> +#define __XE_PMU_GT_SHIFT (60)
>> +
>> +#define ___XE_PMU_PM(gt, x) \
>> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>> +
>> +#define __XE_PMU_PM(x) ___XE_PMU_PM(0, x)
>> +
> please add also a doc comment for the xe_pmu struct itself, not only for its
> components...

ok.

Thanks,

Vinay.

>
>> +struct xe_pmu {
>> +	/**
>> +	 * @cpuhp: Struct used for CPU hotplug handling.
>> +	 */
>> +	struct {
>> +		struct hlist_node node;
>> +		unsigned int cpu;
>> +	} cpuhp;
>> +	/**
>> +	 * @base: PMU base.
>> +	 */
>> +	struct pmu base;
>> +	/**
>> +	 * @registered: PMU is registered and not in the unregistering process.
>> +	 */
>> +	bool registered;
>> +	/**
>> +	 * @name: Name as registered with perf core.
>> +	 */
>> +	const char *name;
>> +	/**
>> +	 * @lock: Lock protecting enable mask and ref count handling.
>> +	 */
>> +	raw_spinlock_t lock;
>> +	/**
>> +	 * @sample: Current and previous (raw) counters.
>> +	 *
>> +	 * These counters are updated when the device is awake.
>> +	 */
>> +	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>> +	/**
>> +	 * @events_attr_group: Device events attribute group.
>> +	 */
>> +	struct attribute_group events_attr_group;
>> +	/**
>> +	 * @xe_attr: Memory block holding device attributes.
>> +	 */
>> +	void *xe_attr;
>> +	/**
>> +	 * @pmu_attr: Memory block holding device attributes.
>> +	 */
>> +	void *pmu_attr;
>> +};
>> +
>> +#endif
>> -- 
>> 2.38.1
>>
