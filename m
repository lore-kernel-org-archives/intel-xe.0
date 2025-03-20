Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4A6C28B30
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 21:24:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246C010E6A2;
	Thu, 20 Mar 2025 21:24:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RzxRVp6i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A219610E6A2
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 21:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742505864; x=1774041864;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3OzsJKvNk9X1l/KOapTRVOeCTJr2tNLmZ5kRedIx+yA=;
 b=RzxRVp6ibjige2dP1JhxlGfuiOaolb6wBF4ilP/5lC+LabN3n9Ff/Txx
 FCGin8KlfYbUr9NE6QYJ7SjKfNwj6MgZOLS2ixrrDg1qVu5lWGRDpApk3
 xqyOQVVBL57KkMXxLc6/nrftiPUmO9L9s51A3m61prQHQXWs617K/BY8n
 FVgawAIBJyXvln2JRG9SAoDS3AKcKsCwyE/+++g7re9wlwW1K2t5T30cS
 7BSjv1tAVW9/MjOLvbDoiGM79BFT5GgzDk1cFbXGDJB+9Cge2lb4wdvH6
 dcIJd8X8ZHar1qZDOLyJtgqMids7pkwjzuKDKc3OIfNZbM1ENFISxDy4m w==;
X-CSE-ConnectionGUID: rE9l7pTPRleMrchG8uJHcQ==
X-CSE-MsgGUID: yZnO3zOOSKevwrSvAoWvxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="61286612"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="61286612"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 14:24:24 -0700
X-CSE-ConnectionGUID: FtRIqyjoSsKMWxTcS/lLDA==
X-CSE-MsgGUID: bUjTwMllRj6oiOzliwIFvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="123183488"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 14:24:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 14:24:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Mar 2025 14:24:23 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Mar 2025 14:24:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EuC8B1hjhFCsmzfg0LTDQHIFCd5O36YTnjEIjviwtK9US6WqnxY//n2+A0dbRiIvi3czW4UwQ7dqlgRE6WxJm60oPdyIPfEACcr/BSEbMeV5mMcE6E0jPeOyzco6QFdT1end+sA1AtNSUWST5jGQ5b6rtoBiKf9aS6xQ8rurt2xRE2vAWq/MRvJqyU/PVRxnvFBF/zwJYEjNrUv6AoIlK+ZnS8atBBgb0bDmuefZbhX/ZIrUuiYps5InKkVPpxa7OB4Esi83syna5LTqFRyr8QWHVsWUA0F3BFnaFMH2aPCo5LHYYpLGPkv76TcoTJqyQqzaaL8MGT4y6jIktqErHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXe/i9c6KeqEGKvw+Yffjicuk8BOUQUZvSnBR1m8LY4=;
 b=t81CXKaC2qETqUFg28ZjuT42CFvq1aXWf0RLKPFW9aqzJEyINXqXL/1kwyCBx6RGvOPmsm21Eiy4HaiFB1UJ4+RjiWXL5tEjYdzbe+jgMZ9o4n+dryuDt4nUKtlzIeWEDSPD7dUym93TIY78nEsmzU2CoOpAXAo3SMBBXDyObW4zR1Gl5TteNq0EjPfdbQeLUCVPMLaYn717vJ+hjkgyDem6J+WM01m4YS7LL0dyoRGO1pHmlR+F7NnL0avKIqtns/Sgie6+he2dhO52t5np0lhNdiV+MicTQoBL9RRc3uszImLFJi62a6Xv6h4d7UQtQcWinryS/lBcjG9rAkuiUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB5940.namprd11.prod.outlook.com (2603:10b6:a03:42f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 21:24:20 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 21:24:20 +0000
Date: Thu, 20 Mar 2025 14:25:30 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 2/5] drm/xe/svm: Fix a potential bo UAF
Message-ID: <Z9yHynBrzS9yZaIL@lstrano-desk.jf.intel.com>
References: <20250317104132.8200-1-thomas.hellstrom@linux.intel.com>
 <20250317104132.8200-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250317104132.8200-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:303:16d::17) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: 977cc48b-b729-424d-db73-08dd67f593c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?lAi3Mf1h1hTZ4idvt12Eg6DKRupwNiX4iR9zrkhg+O0R0tVUOg6KWvF6a4?=
 =?iso-8859-1?Q?5XhIvjgbD3kzXrF0Ls5HSY88BhDfL3yVRZBZelqGkGIcl28nMrSQyM/BCT?=
 =?iso-8859-1?Q?nmDNSFZuygpGxLYVq/5PoehOAdvhI0gIBNO1+ohIpVXzsTutH7ogAyX3Qs?=
 =?iso-8859-1?Q?vlH/hQq3cp8Eo87APrSXHra7s9gO4nkJLkDLRUvjfi9SqT+A88yL2kPg38?=
 =?iso-8859-1?Q?X0Yy1y13avLZrgzchHfSbAMZGffqRJrCToMTJc+cUZbni3i2M6cCXweanT?=
 =?iso-8859-1?Q?btWhDo0Maqhk2M5f8X1IqyQFroO6mSUshjRBn+Xz92pWyWYn+1NR3O7uVR?=
 =?iso-8859-1?Q?R8rbmLxQ8NOBVA8XwSxZcu87W6vEq31eRS39mMx3B8dz5taKoQ39+TdM13?=
 =?iso-8859-1?Q?ikFvl+UsarI7e5m7zqxNuCdWZx5oSTjS5baL0xxFTbqd2inqhG0O7f0WGQ?=
 =?iso-8859-1?Q?l3VUmdkEysnCzgf+Ue/shtrlERrW45c3qgEdofVKgi6ZzMsQOzLIbg23Zm?=
 =?iso-8859-1?Q?eTBcv6lmIOJ3uR6IRDJ9GCMMa3bssGei8oh8DcNPl5vFQtxDFdQiukahaf?=
 =?iso-8859-1?Q?KdYDGFEUVr0KUqGEvmar7mOJZns59N3gQJD/kQVBOfiJC2/FgktVWJST27?=
 =?iso-8859-1?Q?mj5p/cfYtWS0UhYDGZdpK6sj635BQnx847KAK8vjY1sGeDy93jRofLPrjX?=
 =?iso-8859-1?Q?ffeqr5xw4I/ZTI2SXRFRPpxBpSwOmBYZlbhkbhZ5iFNN3D2uILDQ+9F7Y3?=
 =?iso-8859-1?Q?aoOyjNGoJiANpIFooNjPVp5v6UA7AG/1iwLSmGSKRBmJVOhT0MFVTySk/c?=
 =?iso-8859-1?Q?QJoSct/Gyoy/KJGouTiFZdTHASijjPgVeK5EFeBY4KnSpeOkMxEtaBpSX6?=
 =?iso-8859-1?Q?yvBWTfItHtA+6PfdBlka7upMl2LBh6mANnSPN8fs1MhO3KX/88CjeW1AIQ?=
 =?iso-8859-1?Q?Gx4MMewDUcvKRZZ6YQ5QkDVF6qIcXFoiGFPAQrhJDBBQYnTMCqZR3ubBu9?=
 =?iso-8859-1?Q?1J1FQNGQpN22wcifQrMkOq13ey+VoYmNbh3I5WvTnGHb1MwRpvZWRKwJ0k?=
 =?iso-8859-1?Q?o6gFX4dPet257A0bi+xmmNNo0PvJFFDPqMNZPp5jpkNhiMHOrkwGXKYsI3?=
 =?iso-8859-1?Q?Qc6kyULgZIArBMouObv8PrNW/DXKow2NayjxDI15gFPvLbtwXTLmk/oAWF?=
 =?iso-8859-1?Q?mFtIdvS07LS+Mr8i7lbN6DKTfCY0MrDNwIy8z9WPeXs0HKtoSuE5jfxp2k?=
 =?iso-8859-1?Q?VGa0nHbZjWC/vY7UKqENOr0RT/e8al4sKTBARe2PvsWucbg3Tv+FkrSJ9C?=
 =?iso-8859-1?Q?iXXflhdRY4/qTI0ZB4YIpUUkhtvViJcG5WjSe/Yii9rDN4FBDUdg+8aAyL?=
 =?iso-8859-1?Q?i833+Y54gpiZEy8wJxmZ6unkKaLn6or9VIGWIhzXXq6mZC0pCO8aog+Zap?=
 =?iso-8859-1?Q?6n/yQUzZVt3o66w6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?zaGcMEoTPprc+v5zOxcZKxfRiHhucJuD2bBLSV4/iFoOBvlkOPea96IgU3?=
 =?iso-8859-1?Q?K5QM/z5TD4nvlT2BmMPjJZ0vb9Lo5UW6iEiw4/DerP5WgB6T4wJ7bR8ICO?=
 =?iso-8859-1?Q?/KmXDERS7Wp5PQmwRo08p+Mq10nNhABKzjGgDelAbw0mezxL0fTumLaGQ3?=
 =?iso-8859-1?Q?bkeu2sxmlnTEHvQgavRzCRaiqp+oLzx0ya+Wb0VcsD/bnCpdjb/Xx8kPhd?=
 =?iso-8859-1?Q?pV/5NU06yQeNZFPt+O9M7acM2r5G65XMJ2q89OUUcQ63kWAOnpJVwDUK2V?=
 =?iso-8859-1?Q?fi97j8q+qpLDSUB6Qd0ei2wxeCPmskna7q1iMWaihdmcmmwhAijI7IYgny?=
 =?iso-8859-1?Q?XgZBULh9G6cUFRYUF+ihfR1psOwrcidXF0pB3bOxcO6I4T707ippUONbPB?=
 =?iso-8859-1?Q?Kk/p0vFbUijdWDbRmADORx+nelqdrkf4ogSS5X6Zyf3AY7LE6CqqwQGQmV?=
 =?iso-8859-1?Q?30DQw2eAjlL0KyLgvSy0LK/ZKV4JxBgYeVfOpPWC2J5+AEo/EMB5rDpUrZ?=
 =?iso-8859-1?Q?zmJ/DZyVc0aXZ5gXByebTR+5yDocTyip/QTe4pXMfO4JYYV/w0tCXPBvqh?=
 =?iso-8859-1?Q?v76aoWnUxA0B/Bzv6ucvXQo3gkC3VT8FyPH06Vym2x1ehMTGE8gOjxvq8Y?=
 =?iso-8859-1?Q?QYIKlNyt6iZc95vIWQZni+vJCiHLDZUL4MOX1RPZw/TMfrcslyuVVi4RMP?=
 =?iso-8859-1?Q?UXBPSniUaK/7p+VhXsg95WswLwS+T1bsO597su6rpN24SNw1mSfXIUAU1b?=
 =?iso-8859-1?Q?etiFmMU+Icsj8OJv2lfRdPGvP6C48jd/dDhhMN79LZEuek/hCR31WCyNIA?=
 =?iso-8859-1?Q?PCWHmZ8MmDIFOLfL2JsfZ5hzQXDZl+JRWAdvbfoyiojAVZZE6j1BmdCQim?=
 =?iso-8859-1?Q?bdm6xgwiQ0aa8B3CQkPvTwYnV7nXMOQVJ4s4REMhfg//Maz7gTfRPxiFvr?=
 =?iso-8859-1?Q?wOiOMgwOFo0PT/5KzKN8bwBRF0p867pmOGwsCCA6tvhZZUmr+gCS0vo9Qy?=
 =?iso-8859-1?Q?HBHCLTSnTeFjMZapa2iupdDFQ38yufCj/ww4aaLobR0R3XfJU2KzR/fyU3?=
 =?iso-8859-1?Q?Ru6StS8tLeADFcnvUWdRQELkDPzNryvQdEQEPwheCKdL5g6qImbopuhK0x?=
 =?iso-8859-1?Q?7tw55b9EnaAAEvsIooLUgR97sRuSoNtwrPtZUrHjn/oqtoem80NXRKhAsz?=
 =?iso-8859-1?Q?Wk/4iMjYpjvSquRv6yaj+NQZ7bQGYWw7EzCV/zvXg5mUs3dQHCjpy9OJnN?=
 =?iso-8859-1?Q?hnIHJHaM+J4MqwRqBIVB8LGVNUnYlYUUPtKZRHi3tHBo0NgI7UmoB/TQRH?=
 =?iso-8859-1?Q?SgCqO2Tp2VCAaljmQ3odDyGJ5126+Tx2ERtBOLXLEExLF66dLt5CLcAgo/?=
 =?iso-8859-1?Q?9bsSbgmLujeowXD5ZPEHWlSpyJjjdJwQ24zIbr6B2aJyhc+gUiaAxjoZO6?=
 =?iso-8859-1?Q?sX/3UAMRJqPxhw7/ZhSFyzUbcftGQF0m8LVRHc16oyLEdiIjMVJ6pWtA+0?=
 =?iso-8859-1?Q?enmP1skExWhF9TWxPbBs+A1s3OqkEDrXEPA/YbcSDqCig3PHYbKVrOLHdS?=
 =?iso-8859-1?Q?WULmP24TgRFkUeJ4/mX6dUka4NF1pHyqTCtxn86+aTxw18Xemv1MjnR0p4?=
 =?iso-8859-1?Q?YFs9MQYHXu3GiQGJHDcGpQkT5e4sHPa6C2X1k70+rXN4WeqaoaDK6MnQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 977cc48b-b729-424d-db73-08dd67f593c5
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 21:24:20.2390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VzgycQWklLBqkHit5EGhj7Fr88ZqI7HHyNL9WL6ZCAin3NFjCBIYE0Lx63zsdE/H5zCxkTTmtS0BMsej0fUaeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5940
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

On Mon, Mar 17, 2025 at 11:41:29AM +0100, Thomas Hellström wrote:
> If drm_gpusvm_migrate_to_devmem() succeeds, if a cpu access happens to the
> range the bo may be freed before xe_bo_unlock(), causing a UAF.
> 
> Since the reference is transferred, use xe_svm_devmem_release() to
> release the reference on drm_gpusvm_migrate_to_devmem() failure,
> and hold a local reference to protect the UAF.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_svm.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index c305d4c351d7..1a8e17a0005d 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -701,11 +701,14 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>  	list_for_each_entry(block, blocks, link)
>  		block->private = vr;
>  
> +	xe_bo_get(bo);
>  	err = drm_gpusvm_migrate_to_devmem(&vm->svm.gpusvm, &range->base,
>  					   &bo->devmem_allocation, ctx);
> -	xe_bo_unlock(bo);
>  	if (err)
> -		xe_bo_put(bo);	/* Creation ref */
> +		xe_svm_devmem_release(&bo->devmem_allocation);
> +
> +	xe_bo_unlock(bo);
> +	xe_bo_put(bo);
>  
>  unlock:
>  	mmap_read_unlock(mm);
> -- 
> 2.48.1
> 
