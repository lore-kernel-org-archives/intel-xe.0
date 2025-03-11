Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811B6C282EC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 20:49:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 407FE10E27A;
	Tue, 11 Mar 2025 20:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y0YC8JnK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31ED310E27A
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Mar 2025 20:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741726147; x=1773262147;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5LzVxksHlHYRT1gfA7ZiCLxzarwIKPDsVnCzYjOmo1E=;
 b=Y0YC8JnK407CuhDioVUnAGYXqTLGkWkrRpLBoCwPndicc0PAxJcBOnjm
 jT5Z4aOVbLo2Y8KERTczLXJBtH9nDWfaWpMJLbwYXK+OMvLQ3MrEkCueY
 bb3gkQhUZt1ZSfESUaMmK5RY/d7gk3FyI2CGkq0AhSODZMfIlPvkZE0ac
 8y5KavuX+P3Pp5JxRo7INpiyxK8EXnuUzbIgwuBEEuV+8eUoz2ZOqmfZ0
 IYNxG7aWQ/XQu5AdoTe1D8UQ7nqZnbcNBFjyxhqW0RqVby3haQzvN528X
 lvh0abt6pltw6GeGjA95+1LC/W6H0kXB2Y5xkbLQ9vnYQr3dCXKny4RDQ Q==;
X-CSE-ConnectionGUID: h691WYv1TgWb5mzZfghj4w==
X-CSE-MsgGUID: b6WAK8AbS36bp9xyIe78xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42914925"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="42914925"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 13:48:56 -0700
X-CSE-ConnectionGUID: z6rJU+RkRB2swwRvoC2dqg==
X-CSE-MsgGUID: gmqZx8FXR3aa1DL5/yaHAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="151386966"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2025 13:48:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 13:48:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 13:48:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 13:48:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGJtzOath69FxZQYywYH3/MGV6g/pngAW/47raDLbAWHUAvt6cAUhZ7xvAq4r7XoapXHOUu5hE7spQAJ4sHVvTb9cvmDWeQ3PlukwCKV+vJ2jGvzN8rbBewKnU6dXIakmXGV4ylXG6aASjl7PKZyXAaQFQV7sGgvK+nPIrNx4mzJD72UWAP3FvKGVwvk0ABfeYYgH0LiGfMnjnh5hOyAEq5uqY7Mv2gx4r7kjqOCEXJg+ZzgQ3I8f3NmawdHjCXCmjJwj13RE2XR9ZZfhSDUQGbiXgxibG+lfh/UKiCBqKvi1PaBzdchf3CM07J6rJzxn4ob5KZCt6Z1d3uvo4WVCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRqaSKCFpbX/quV2rYH/PaYuri4fD6F44OHzw0+ve5g=;
 b=veng+vZB3BdEb9zhJUNCcZAN1sZ9Njn0Xietnb6+y7vK95d2PeQR/WYCvJ80Q+pyRXGtX+PZYAkpyu8qvPFGLMWmYW5BDEu2xN3UML9tISyEpEbclAmRntudTBzeOFA7XyV5MJzO6MIjfn6mLMgHN/7y/16iwM9L0UFIpTmujXC0VTxTvKxSQxs6j+tBJ2jC36HVWAJDeDbHaSS2Vd2tuTMJI07sh8Li6fJ3Cewnc22HYqYlo2OHKSOWF7wPVkRPEU88fV5FraT1d1LrabAqhNeAIDr+2hHvdFjGcL81GsMF/Tv5zl6pGY7sLvqPaIz7BYRzB18Ue+2fDL0pikA9Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5266.namprd11.prod.outlook.com (2603:10b6:610:e1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 20:48:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 20:48:37 +0000
Date: Tue, 11 Mar 2025 15:48:34 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/8] drm/xe: Simplify GuC early initialization
Message-ID: <xr2yafotmc4zdby7ubomxi4d4bnw2relnfcr3pip76pzmxyrvp@hnjcejaadlqn>
References: <20250310200653.89731-1-dev@lankhorst.se>
 <20250310200653.89731-4-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250310200653.89731-4-dev@lankhorst.se>
X-ClientProxiedBy: MW2PR16CA0015.namprd16.prod.outlook.com (2603:10b6:907::28)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5266:EE_
X-MS-Office365-Filtering-Correlation-Id: cc7dee5e-e7bb-4a5e-4de3-08dd60de18c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|27256017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wVXKsUEnRFoOm+ae5/PoKCQfyH7gchyJAxAvuCBPSTTzaC5ApXUkq/YyABn6?=
 =?us-ascii?Q?hZzeder3lBTolHnygiNgT4oA2Z24wOQGmpjibmNgpr3lAeh/adaJhg5EO8xs?=
 =?us-ascii?Q?GxXEFvKyS05/Tij/AMQC+M4tIGh0NCZpMWOwUumpJmJpVVQkq2Jo3J6wlV+8?=
 =?us-ascii?Q?D7lT3Oj0GdFW2qCascZLJsCD/sVo9dzkn6UbpVC1dpOWtwNeahP9XeBHlJHF?=
 =?us-ascii?Q?IqeZaUAdu/vsuVW0ekwzGcmEQM3Pdh1yJlkuv1PmbbUFA5iKJh6OO+Os9KYp?=
 =?us-ascii?Q?OhqDYVHuL8cKN8DqxAdZoVONQRtLsOldQTanSqtfRSSK7sM2Oo/VDtVGGIv/?=
 =?us-ascii?Q?SRkBlOjtdvxKd8YIIzwLLjL9xCNDzEy2w/NYMxx46DeZ/OXgxGr+md5wE6qD?=
 =?us-ascii?Q?kM/eMizVSuSU95J3eDhnW33/ZKGA3GuKy3IWFB9XtpdkyLwTYKLDI788c+iB?=
 =?us-ascii?Q?+FpUlgoqICgJNdBEj1d98NDU3C299Jyh/MPps8B1tSWminau4v0Sl0mByg5V?=
 =?us-ascii?Q?EbQ48Yq0GFlOPGSJKtjlQXFefEPRKeURF0MyEgiqGGE8UnD2QFM7cAJ8AuP4?=
 =?us-ascii?Q?ZzzyzYBTes6OtehdtQvvtyUrpYVjmdo1lsWg8nKkJNPPFLVsfbFmH8HuAv8J?=
 =?us-ascii?Q?QtjTrjZ+G1yg2y20T8L9VD/SZl+bdVfMfElw+00gf2Sdfreq0walDOvYwx55?=
 =?us-ascii?Q?1qJrWg3XHbLXLoS6lz2F2yFYJNJiMoj00oKcNMkWA1dVNyE0cN9HIsfLJqub?=
 =?us-ascii?Q?s+j1J39JfJHiEcQDraf5xJA7iGbpVJldMoKIENZvoLzQgQJZiZDaOFNdahJT?=
 =?us-ascii?Q?APZ6TBKjv6uskOR48sW6XF0yXplKc5IStbvo6Mca0TG57HD6/p4YbKxTptir?=
 =?us-ascii?Q?K6RKdYVbAreivqoKmUGDu/58kIMOvBnRiMpnGOXKqC6SsZZKX1W4+mAbhC4e?=
 =?us-ascii?Q?NUQKyKcVhSppD4eWtJAkfkma6i8HWAKP1S6x3vUqRs1MhYJCPFqX6g/uE6du?=
 =?us-ascii?Q?+dpnFcThB/Wagn4mIiFmHrWYwN+tCtp2jAiQSXgWNI5P9Dg+qVn7CvW6REVP?=
 =?us-ascii?Q?M/+GCI/Vbl+p/XfajcZSs5z+xKEdrs803AM70X4ebP1CC8V2U84V09idHa5L?=
 =?us-ascii?Q?4E0Sub7FNiCA2rF7FwtWgC4znxEcFidE2nz8tHO+tr5bg3DEbYXcAWiK3m1I?=
 =?us-ascii?Q?BiEwbk+4Z/VGA17hCuDf3ApEgYu64FzULXVsOE06+fXnvqNRMn2hMe5/rz8H?=
 =?us-ascii?Q?QrBCftTrhwpqtvalLqGN1rXPwl/EOM/YKOklbOAKaYD1wd7o6cv0qPivgfjz?=
 =?us-ascii?Q?DXcRl/YW0YfjMVXazh9E0X+RV/grHwliLhZQS0seFw5YvASdNoH7MPlPiuom?=
 =?us-ascii?Q?4JPMYC5F6N4vJx+Eo6mEyHq/Oot01LWb3FF0jVTFbxgLFTSsF/eLAKHRMHap?=
 =?us-ascii?Q?0nBkgDkW0uM+cVIGNbiYJ1Yo8U/pai0M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(27256017); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8c0bki7mOLwQrYI0bNwik1T8hbOgVGKuTcHQ6n55356j3dz3OXRYPsk/jorD?=
 =?us-ascii?Q?mAcCUQE72/uCcc3o1I2m0pyNKzp50gK1aSP0/4yXSIDWE5qqEea/f5o0kreR?=
 =?us-ascii?Q?1mRBMBUl8UitmYrYuod8ZMWbtnZuS7r8hKXO2BGAxblmrhS6Z1OEOCOh8u3+?=
 =?us-ascii?Q?6gLZDtyH8FwLt6IX5xw8caYwtinKE0Q9pyPTlRH9UScStdTDVD7A9AUaxrYk?=
 =?us-ascii?Q?j7+fz57uFVO0rQ3cMtGiMJx8jSnSTO3aA6OMGIaSzqoqA3HBhjqIgfHtb93O?=
 =?us-ascii?Q?x+oCeoAXEWyuLjKldnWmY/rrMKx0PXqYLOIFnH87OriS13jp9B+bS/YBkx3G?=
 =?us-ascii?Q?0/Z3EFCRVxe8PJBnP5CiDJKYnwEZoDxcFTgLZl2eDvwAC4n6lKX5FYZfeelY?=
 =?us-ascii?Q?NJOWECSl5832o21ydDuBQKDkBt3dFyeTTwQij785IFsOhEG6EYOMdbSeKXI0?=
 =?us-ascii?Q?FZmCoi4lPlEXOpki8KNrwX6Xzonk0tYYkoONygnEmveYIFqnNl56nhAeHp2+?=
 =?us-ascii?Q?bUOmijMlIwV4AZ/9NiAy5mgCP8XIo9MF1/jBLQWmpy6iFE0dQ4We3wGIJVpk?=
 =?us-ascii?Q?UZ0FmYAs9uECEHyRj9xitz6++oTHykF1SZB19yb6n2xrGk+vtsBzSg3+inAc?=
 =?us-ascii?Q?A5PrlhBlzyY5iTdhieF2Z1rd4ctFvEQwftuoQG+NT2OwcL4lctpcTAilcpPg?=
 =?us-ascii?Q?mYdWB5eNgmOtjRjurnDvfjW0KIGh0JL1W0fC7Sz31Gsi3xh+NNBvShh+gpel?=
 =?us-ascii?Q?igLCIUngpXpEhBJhyuhEjhB/hJMkK0eImQANzOgVpQLmoQ3dztRnrFgKkhSs?=
 =?us-ascii?Q?+iUqknqXREITiMlEWZehS4XE4XO9GfRQs1Fx/Th3mVM5A2BuLmV1gIcbp6X5?=
 =?us-ascii?Q?DiPe4irB9zPLiq1USPlabi65znQaLiHBoqceG0nPYQ6/CKhWFNIQnFOvgYI0?=
 =?us-ascii?Q?V4tsuOE/hEHSG5oAda7Yz8CalkQ/M4mSc6hI/wIBFcHnwLfk5sGzsT9QeJ2p?=
 =?us-ascii?Q?G+pWTpd8bq+jowADQxGqKptmp+vMnumaTKMOPsGkj9b/ZnFyA5XBRk6t40mI?=
 =?us-ascii?Q?kGnG3Yal+VRCH+vC+6Pa7/MXA17LkUA/yW/P67y84powqJ+qqYT80M1KJPTf?=
 =?us-ascii?Q?MVSUojHrkxXcDD1fqxxMLM7AzqnsMRfslH5hCOzNoinqZ1R2ByKR5UxM9IVp?=
 =?us-ascii?Q?qEcKBdBpHXwAgT1A6k4uLOGDFAPLxolSTjTrw31CW3N53JcunWhCUaLkTlei?=
 =?us-ascii?Q?iTnDmisLcOmDu8JTftvDZGaQlDMxlckIVgE5Y2TKeXxIM+Sj/ZjcpAZGetiR?=
 =?us-ascii?Q?3//8y0gx4reiEwSKOeg/OYQlnfHdPm82uogcfE4/pQqOqRwMkd55sgyg032Q?=
 =?us-ascii?Q?dUTduR/OwPGcLYnLoV4cIQhQ3XMNx0kfAGPwcv/aLO5z0dASop6BxwRLlBw0?=
 =?us-ascii?Q?97ST2XJ1OoS3iIvTiB/rGdXENBrG+GnB2iIwzqSsjdXOROBV+9RjfdUerDY/?=
 =?us-ascii?Q?YC7mUtYb4wheWkZ2N1tVUljFtnVE3zKhMzwEL+8kOyxE31poTs/r/JodUtIW?=
 =?us-ascii?Q?DW6rfZO3H7bOkssZ904B5kKDt/zrMqNljGAg9C1QtuO58ikuvLiuBqZTzxO6?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7dee5e-e7bb-4a5e-4de3-08dd60de18c5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 20:48:37.4046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTeDfq7jhMYB3fYXpH5NknWB2dLTPTseKYgJ/GH+Uet4xenrwYqyKYcnWv9z459g3hQzCrdhKvAiNQ7JGNT038V3ClE+iXEVDUjVrrCZyYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5266
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

On Mon, Mar 10, 2025 at 09:06:48PM +0100, Maarten Lankhorst wrote:
>Add a 2-stage GuC init. An early one for everything that is needed

it's already a 2-stage load with

1) min load for hwconfig;
2) normal load

can you detail how are the split now?

>for VF, and a full one that loads GuC and is allowed to do allocations.
>
>Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>[mlankhorst: Fix british spelling]

what is this trailer supposed to mean?

>---
> drivers/gpu/drm/xe/tests/xe_guc_relay_test.c |  2 +-
> drivers/gpu/drm/xe/xe_device.c               | 16 ------
> drivers/gpu/drm/xe/xe_gt.c                   |  9 +++-
> drivers/gpu/drm/xe/xe_guc.c                  | 51 ++++++++++++--------
> drivers/gpu/drm/xe/xe_guc.h                  |  1 +
> drivers/gpu/drm/xe/xe_guc_ct.c               | 28 +++++++----
> drivers/gpu/drm/xe/xe_guc_ct.h               |  1 +
> drivers/gpu/drm/xe/xe_guc_relay.c            |  6 +--
> drivers/gpu/drm/xe/xe_guc_relay.h            |  2 +-
> drivers/gpu/drm/xe/xe_uc.c                   | 16 ++++++
> drivers/gpu/drm/xe/xe_uc.h                   |  1 +
> 11 files changed, 82 insertions(+), 51 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
>index 13701451b9235..b951d55ef1b32 100644
>--- a/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_guc_relay_test.c
>@@ -42,7 +42,7 @@ static int relay_test_init(struct kunit *test)
> 	kunit_activate_static_stub(test, relay_get_totalvfs,
> 				   replacement_relay_get_totalvfs);
>
>-	KUNIT_ASSERT_EQ(test, xe_guc_relay_init(relay), 0);
>+	KUNIT_ASSERT_EQ(test, xe_guc_relay_init_noalloc(relay), 0);
> 	KUNIT_EXPECT_TRUE(test, relay_is_ready(relay));
> 	relay->last_rid = TEST_RID - 1;
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 38b8e3e961a2f..343f7ac67eaee 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -772,25 +772,9 @@ int xe_device_probe(struct xe_device *xe)
> 		err = xe_gt_init_early(gt);
> 		if (err)
> 			return err;
>-
>-		/*
>-		 * Only after this point can GT-specific MMIO operations
>-		 * (including things like communication with the GuC)
>-		 * be performed.
>-		 */
>-		xe_gt_mmio_init(gt);
> 	}
>
> 	for_each_tile(tile, xe, id) {
>-		if (IS_SRIOV_VF(xe)) {
>-			xe_guc_comm_init_early(&tile->primary_gt->uc.guc);
>-			err = xe_gt_sriov_vf_bootstrap(tile->primary_gt);
>-			if (err)
>-				return err;
>-			err = xe_gt_sriov_vf_query_config(tile->primary_gt);
>-			if (err)
>-				return err;
>-		}
> 		err = xe_ggtt_init_early(tile->mem.ggtt);
> 		if (err)
> 			return err;
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 10a9e3c72b360..a0b9052c41b0f 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -375,7 +375,14 @@ int xe_gt_init_early(struct xe_gt *gt)
> 	if (err)
> 		return err;
>
>-	return 0;
>+	/*
>+	 * Only after this point can GT-specific MMIO operations
>+	 * (including things like communication with the GuC)
>+	 * be performed.
>+	 */
>+	xe_gt_mmio_init(gt);
>+
>+	return xe_uc_init_noalloc(&gt->uc);
> }
>
> static void dump_pat_on_error(struct xe_gt *gt)
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index ecf597f9d80c6..bd8c3e5a5c9fa 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -626,21 +626,11 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
> 	return 0;
> }
>
>-static int vf_guc_init(struct xe_guc *guc)
>+static int vf_guc_init_noalloc(struct xe_guc *guc)
> {
> 	struct xe_gt *gt = guc_to_gt(guc);
> 	int err;
>
>-	xe_guc_comm_init_early(guc);
>-
>-	err = xe_guc_ct_init(&guc->ct);
>-	if (err)
>-		return err;
>-
>-	err = xe_guc_relay_init(&guc->relay);
>-	if (err)
>-		return err;
>-
> 	err = xe_gt_sriov_vf_bootstrap(gt);
> 	if (err)
> 		return err;
>@@ -652,6 +642,35 @@ static int vf_guc_init(struct xe_guc *guc)
> 	return 0;
> }
>
>+int xe_guc_init_noalloc(struct xe_guc *guc)
>+{
>+	struct xe_device *xe = guc_to_xe(guc);
>+	struct xe_gt *gt = guc_to_gt(guc);
>+	int ret;
>+
>+	xe_guc_comm_init_early(guc);
>+
>+	ret = xe_guc_ct_init_noalloc(&guc->ct);
>+	if (ret)
>+		goto out;
>+
>+	ret = xe_guc_relay_init_noalloc(&guc->relay);
>+	if (ret)
>+		goto out;
>+
>+	if (IS_SRIOV_VF(xe)) {
>+		ret = vf_guc_init_noalloc(guc);
>+		if (ret)
>+			goto out;
>+	}
>+
>+	return 0;
>+
>+out:
>+	xe_gt_err(gt, "GuC init failed with %pe\n", ERR_PTR(ret));
>+	return ret;
>+}
>+
> int xe_guc_init(struct xe_guc *guc)
> {
> 	struct xe_device *xe = guc_to_xe(guc);
>@@ -661,13 +680,13 @@ int xe_guc_init(struct xe_guc *guc)
> 	guc->fw.type = XE_UC_FW_TYPE_GUC;
> 	ret = xe_uc_fw_init(&guc->fw);
> 	if (ret)
>-		goto out;
>+		return ret;
>
> 	if (!xe_uc_fw_is_enabled(&guc->fw))
> 		return 0;
>
> 	if (IS_SRIOV_VF(xe)) {
>-		ret = vf_guc_init(guc);
>+		ret = xe_guc_ct_init(&guc->ct);
> 		if (ret)
> 			goto out;
> 		return 0;
>@@ -689,10 +708,6 @@ int xe_guc_init(struct xe_guc *guc)
> 	if (ret)
> 		goto out;
>
>-	ret = xe_guc_relay_init(&guc->relay);
>-	if (ret)
>-		goto out;
>-
> 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOADABLE);
>
> 	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
>@@ -701,8 +716,6 @@ int xe_guc_init(struct xe_guc *guc)
>
> 	guc_init_params(guc);
>
>-	xe_guc_comm_init_early(guc);
>-
> 	return 0;
>
> out:
>diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>index 58338be445585..965bf72912009 100644
>--- a/drivers/gpu/drm/xe/xe_guc.h
>+++ b/drivers/gpu/drm/xe/xe_guc.h
>@@ -26,6 +26,7 @@
> struct drm_printer;
>
> void xe_guc_comm_init_early(struct xe_guc *guc);
>+int xe_guc_init_noalloc(struct xe_guc *guc);
> int xe_guc_init(struct xe_guc *guc);
> int xe_guc_init_post_hwconfig(struct xe_guc *guc);
> int xe_guc_post_load_init(struct xe_guc *guc);
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>index 72ad576fc18eb..ffeda89b136ba 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>@@ -204,12 +204,10 @@ static void primelockdep(struct xe_guc_ct *ct)
> 	fs_reclaim_release(GFP_KERNEL);
> }
>
>-int xe_guc_ct_init(struct xe_guc_ct *ct)
>+int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
> {
> 	struct xe_device *xe = ct_to_xe(ct);
> 	struct xe_gt *gt = ct_to_gt(ct);
>-	struct xe_tile *tile = gt_to_tile(gt);
>-	struct xe_bo *bo;
> 	int err;
>
> 	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
>@@ -235,6 +233,23 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>
> 	primelockdep(ct);
>
>+	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
>+	if (err)
>+		return err;
>+
>+	xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
>+	ct->state = XE_GUC_CT_STATE_DISABLED;
>+	return 0;
>+}
>+ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
>+
>+int xe_guc_ct_init(struct xe_guc_ct *ct)
>+{
>+	struct xe_device *xe = ct_to_xe(ct);
>+	struct xe_gt *gt = ct_to_gt(ct);
>+	struct xe_tile *tile = gt_to_tile(gt);
>+	struct xe_bo *bo;
>+
> 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_ct_size(),
> 					  XE_BO_FLAG_SYSTEM |
> 					  XE_BO_FLAG_GGTT |
>@@ -243,13 +258,6 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> 		return PTR_ERR(bo);
>
> 	ct->bo = bo;
>-
>-	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
>-	if (err)
>-		return err;
>-
>-	xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
>-	ct->state = XE_GUC_CT_STATE_DISABLED;
> 	return 0;
> }
> ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>index 82c4ae458dda3..9f28fc135890d 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ct.h
>+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>@@ -11,6 +11,7 @@
> struct drm_printer;
> struct xe_device;
>
>+int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
> int xe_guc_ct_init(struct xe_guc_ct *ct);
> int xe_guc_ct_enable(struct xe_guc_ct *ct);
> void xe_guc_ct_disable(struct xe_guc_ct *ct);
>diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
>index e5dc94f3e6181..dc60955a0271a 100644
>--- a/drivers/gpu/drm/xe/xe_guc_relay.c
>+++ b/drivers/gpu/drm/xe/xe_guc_relay.c
>@@ -322,7 +322,7 @@ static void __fini_relay(struct drm_device *drm, void *arg)
> }
>
> /**
>- * xe_guc_relay_init - Initialize a &xe_guc_relay
>+ * xe_guc_relay_init_noalloc - Initialize a &xe_guc_relay
>  * @relay: the &xe_guc_relay to initialize
>  *
>  * Initialize remaining members of &xe_guc_relay that may depend
>@@ -330,7 +330,7 @@ static void __fini_relay(struct drm_device *drm, void *arg)
>  *
>  * Return: 0 on success or a negative error code on failure.
>  */
>-int xe_guc_relay_init(struct xe_guc_relay *relay)
>+int xe_guc_relay_init_noalloc(struct xe_guc_relay *relay)
> {
> 	const int XE_RELAY_MEMPOOL_MIN_NUM = 1;
> 	struct xe_device *xe = relay_to_xe(relay);
>@@ -356,7 +356,7 @@ int xe_guc_relay_init(struct xe_guc_relay *relay)
>
> 	return drmm_add_action_or_reset(&xe->drm, __fini_relay, relay);
> }
>-ALLOW_ERROR_INJECTION(xe_guc_relay_init, ERRNO); /* See xe_pci_probe() */
>+ALLOW_ERROR_INJECTION(xe_guc_relay_init_noalloc, ERRNO); /* See xe_pci_probe() */
>
> static u32 to_relay_error(int err)
> {
>diff --git a/drivers/gpu/drm/xe/xe_guc_relay.h b/drivers/gpu/drm/xe/xe_guc_relay.h
>index 385429aa188ab..e0afff4542cfc 100644
>--- a/drivers/gpu/drm/xe/xe_guc_relay.h
>+++ b/drivers/gpu/drm/xe/xe_guc_relay.h
>@@ -11,7 +11,7 @@
>
> struct xe_guc_relay;
>
>-int xe_guc_relay_init(struct xe_guc_relay *relay);
>+int xe_guc_relay_init_noalloc(struct xe_guc_relay *relay);
>
> int xe_guc_relay_send_to_pf(struct xe_guc_relay *relay,
> 			    const u32 *msg, u32 len, u32 *buf, u32 buf_size);
>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>index c14bd22820441..6adff7dffea50 100644
>--- a/drivers/gpu/drm/xe/xe_uc.c
>+++ b/drivers/gpu/drm/xe/xe_uc.c
>@@ -33,6 +33,22 @@ uc_to_xe(struct xe_uc *uc)
> }
>
> /* Should be called once at driver load only */
>+int xe_uc_init_noalloc(struct xe_uc *uc)
>+{
>+	int ret;
>+
>+	ret = xe_guc_init_noalloc(&uc->guc);
>+	if (ret)
>+		goto err;
>+
>+	/* HuC and GSC have no early dependencies and can be completely initialized during full xe_uc_init(). */
>+	return 0;
>+
>+err:
>+	xe_gt_err(uc_to_gt(uc), "Failed to early initialize uC (%pe)\n", ERR_PTR(ret));
>+	return ret;
>+}
>+
> int xe_uc_init(struct xe_uc *uc)
> {
> 	int ret;
>diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>index 3813c1ede450e..4003eb79757a7 100644
>--- a/drivers/gpu/drm/xe/xe_uc.h
>+++ b/drivers/gpu/drm/xe/xe_uc.h
>@@ -8,6 +8,7 @@
>
> struct xe_uc;
>
>+int xe_uc_init_noalloc(struct xe_uc *uc);
> int xe_uc_init(struct xe_uc *uc);
> int xe_uc_init_hwconfig(struct xe_uc *uc);
> int xe_uc_init_post_hwconfig(struct xe_uc *uc);


I think we need some documentation and maybe init state keeping.
It used to be:  init_early() and init(), with the first usually being
only about SW, no hw. But even with some hw initialization, the order
was clear: now with a mix of init(), init_noalloc(), init_early(),
init_hwconfig() it's hard to follow.

Lucas De Marchi

>-- 
>2.45.2
>
