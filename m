Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E734C8303C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 21:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0557A10E764;
	Wed,  2 Jul 2025 21:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gM49mmeO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A49B10E764
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 21:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751492187; x=1783028187;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+T0MPlVeqgfTDQ3e3gfedQ0DwUt/4e3ji/yzv5KiikY=;
 b=gM49mmeOu43Yf4mNGqa+0+PwsKaSYqXTkrmzYeaKK4iAwvVodhIT7NBX
 oae7qu9e/fQH0GiTykUJsLJXEky4k4kI66Xv1JiSupwE8KP8TdEEeO2pn
 RbZONs2bLjn7KKo1DdI4yKXEDxpcxdihQKTdh7N+iVM0UJLgQQ3OODzNT
 x29V5aCb2bU0tMKlwE+d647mLqfKY6cib8gQ1nnepAsRY+uYC+7ucv/h8
 yOhzxErpTBDxRTKJXCCAHmuOyNavFaM4O/qCepiTuSeAJQiqb6OZeIwvd
 v+uKRGO5JuIeEWEXMJMcAguNQYRkB6HwbC+hztqvPyMnC/NFszwptke4j Q==;
X-CSE-ConnectionGUID: ppOz6vblTAi0R5Bss/eErw==
X-CSE-MsgGUID: VtrmpKwZSdalFGgv36GauQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53923561"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="53923561"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 14:36:27 -0700
X-CSE-ConnectionGUID: 11fbdyLOSmyrywVLcnTSLg==
X-CSE-MsgGUID: hVwadzFAQ1CXuswMd+jAdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="154261982"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 14:36:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 14:36:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 14:36:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 14:36:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4L08AwtVDz9ZOLgSMn1Uh5UAtXr/85/8rQV1fGFwMql/542L8nYLEmJaMvflhRy9v0+botsHP3qC2eQnAJ/6usOy7TyYzya13+kphzqqqG+RjMQ1Nzazkbwi0SpOMKKtlgJ28eDVOpE+OMLqu/D99/D/yJOhQaeU7o9X1LtnefdUVt69rkL/w95cOHXxYtxjqd0WMlbZlxzqEUF8YmzFbxwrPNlLWU5B+auEDDZQUXjx8ofgdJ6MORFfAzQn+z4d2RpbKjLFynGnTxqMe6OevIQdpQiyvtFCCYPE+enE+rFDQYGkEdls3rySQYZZmKzrQ2lHF/bYPxWS6X4vGQ97w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vao7v+ok/xgKLIPN9QFbbYfGpB7WTB8W/NYInU+Ld8=;
 b=S2fIdMiXzeYABe1k64UER1sY/PFW/2RxQO1zepT24+05sxWfMBg7G8J+PgkUiMhkwrXvXr1F0RYg3QenUqaw2aRSAzZUITkt0QhzbAoYelZO4GgT5Mf6sheuVTmebq79ZDE17w84E4t92Le41BXfagm+oZj6FSSpektOKhxGm7oSfAhAEDEdItzMoB2BUDRrEs0u8E8teH1wUHNCw3nIAVCCf4hhgupAVkMI33/wNCFrouEIxl5deM1uzosSLu/RROb80zxhWa5HrUs8yZfytoSOoPFlXN1lVjxipFQvMK1D3pzqyj6mEe6/w0b53d2XSZWum2EQiVxp/A28uWNN1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by MW4PR11MB6764.namprd11.prod.outlook.com (2603:10b6:303:209::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 21:35:41 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%5]) with mapi id 15.20.8880.021; Wed, 2 Jul 2025
 21:35:40 +0000
Date: Wed, 2 Jul 2025 17:35:35 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>
Subject: Re: [PATCH v3 6/7] drm/xe/xe_hw_error: Handle CSC Firmware reported
 Hardware errors
Message-ID: <aGWmJwgk-VLYxxp7@intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-7-riana.tauro@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702141118.3564242-7-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR05CA0188.namprd05.prod.outlook.com
 (2603:10b6:a03:330::13) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|MW4PR11MB6764:EE_
X-MS-Office365-Filtering-Correlation-Id: def149b8-e0bd-4601-6d83-08ddb9b0645f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?YbIWS+/u/lgIOLbTeoiAhvVUbPnd7QiCyJStFz3z/T7KoNBNHonYivivzz?=
 =?iso-8859-1?Q?/47gJ+7SG06AOzytjMqAvwEkFX6WodQoVBJBBMfc3zLEaxKE4koJCnMLjY?=
 =?iso-8859-1?Q?eoor3hQtKlNwXHteCeweo94pQG4UOLYnfil6H+E7h4krlV+A4+yeCrv84+?=
 =?iso-8859-1?Q?JOIPGDPZq9VaYqTsI0qFXNjzlDjoPC6TwdXlwU2//odci1wZW2B0p2dJpO?=
 =?iso-8859-1?Q?vTYvNHZ01qgEqYx2VoXJv5PhKWRrPuJLxtJDvVUgP9II+NUJvJHu+1Qx2V?=
 =?iso-8859-1?Q?v/R56vdqIg41ytYVc7w8JePL5pQoNuj4G3ZBJgZki7jEOuW44xJW8pyrqC?=
 =?iso-8859-1?Q?WW5cR/Nx2wkPFAuBLPwxVPKXr21Wg6s1Uh/z8+W5xK5czivBg8bMhdGSBx?=
 =?iso-8859-1?Q?ovARzRVaNhJ/TRfSQNYc7yP7f2jvCh8wH6hs2/4hMTOFXfM2rWK5RFCyMZ?=
 =?iso-8859-1?Q?9I9CQQP6uBNkJGTwgOPL430hEnNf8h9eE7qqL9Y9WhxOIhmhIeG5Hum77W?=
 =?iso-8859-1?Q?hwJlAgC+h0EDR2xWF5yy5ar9Cov4ws7qA8UCosjq5rfxftF8+RVfYYJddn?=
 =?iso-8859-1?Q?91grhRma+OSmzyhllOXxlKdDnZkN9ClkyWCIde1DMsHVI7q2Oo27z7nRGs?=
 =?iso-8859-1?Q?FsCnCjjbVxcQKALhxOMM6h1YhuRAGsGharyK8zHFYtRy3v4YswpHaCqHf+?=
 =?iso-8859-1?Q?eReUDAWzB8pZFBtVvx4I1ejBubs3bXKUykW8fsPCJDqaq9mLW0ZVGkYp4A?=
 =?iso-8859-1?Q?J4/oXOqdwdEilpTMRxWIJvopZybZ3jtqvBVALbkc6V12y85M6BTIcdGixk?=
 =?iso-8859-1?Q?R+eYZPLj8GI0+7b01w3+QViK7+kGx4bAdadbGPNxAwRt0uds4sV/Lgg/Jj?=
 =?iso-8859-1?Q?79bImyvSbP8OqwPwGT93J7zhl4S4bUH6zoopUJizVgwIuJmUvGYjuZudLE?=
 =?iso-8859-1?Q?pPqkuOHZGnnmvAKKN3n18djqP8Z61HpjzlAFfP4v+OerqbNoAVoLsdBQl9?=
 =?iso-8859-1?Q?vzvVlJ0MsGkZyzSU/z8lAWqQs9grpx9+T5Ks99Ffav+MvnoqkeZ2r/RyGe?=
 =?iso-8859-1?Q?4WwiILGBo2TvNyh8elPUTdAunopAmnKldr3NwkzOlQ4m1FGUsXrCsPDqxk?=
 =?iso-8859-1?Q?hkPiIx1W8Y/7Hg6jQomVu40MFOKiCrRzRCKRU6+6Kc0sK+QHwsAqdZC3LB?=
 =?iso-8859-1?Q?AxfOV+EOWWRVxkTHheI7IcFPGCmIphIZ4PQyI86JNrY+DMNgTaipZ2xidy?=
 =?iso-8859-1?Q?YZP6RMFAvw4lfUnh2FWJw69L6PU3ui02UTFj1hbgkomoZD15cDGOwsjfeL?=
 =?iso-8859-1?Q?jmdKEk4+OIgwWEOZqxmIegzYN9cfpP3Lj4ze4WIOjs6AMFL2CMPzeHAiss?=
 =?iso-8859-1?Q?0lmx2v/INrqs8/5aQDVu/s+QAnPNETcHn4iPfVs7TTHFjl6244Opsjby0v?=
 =?iso-8859-1?Q?VpHHFM6Gqm8N4FkSTARovMZjQwjilP03dMgF4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?UbWyJkuOgcGf2ndGgJE7yQVgkTls3szV3Vz9wC2ShY6ArjUuYrtbdeAMhe?=
 =?iso-8859-1?Q?MCL8PmFAnUwMAX4fk6OLyr/el1184silkhPTdE26yio7n8k3wC1A53bQp3?=
 =?iso-8859-1?Q?YC+FzpYv4n4LXQCdxxOM9R53mVLvv5gi7KKGnUdgWQ7AB8rtDSfWN4tibJ?=
 =?iso-8859-1?Q?Kb+q9wZRDAXRJ4vQrmYE+VRiZ8FrmjYijTgekhDcLotoIE1Vevvs/Pq3a1?=
 =?iso-8859-1?Q?RsC4ivfqrA5y2Qd4MnXIrMrOqNt8qSvxoXKh/KWlXK7hcz4DLtckJRAvYV?=
 =?iso-8859-1?Q?6w/q0dXARh+wzAMsTdlTvElA0DK0+1dlvFNwKmT5SErlz02yvCztzkgY1Y?=
 =?iso-8859-1?Q?9rXi1hxU1/teyQyAyAyMKxL81DZMr9wL4+39D0fwH3TFfII5AqrPPSxY33?=
 =?iso-8859-1?Q?7CkzNEBS4Cy1EycE0LfPoxd/lUvKQVwjzUdDsKMgLudVlH7I0CN7CBgaiQ?=
 =?iso-8859-1?Q?qQfvS6eSxW/bTZ7OrH1tY+G9uPuC4tJXEVVQD2buT04GO67UXr8YVvEvON?=
 =?iso-8859-1?Q?JgDecw9SHtFbTzpZvczQsq3hy5AbrVpyl3YuwoXp7USRLISb9b33STqN7v?=
 =?iso-8859-1?Q?b3Pb7T2RRImZJ1oBYOyXhRZIQOpN6jOM17lkN+rjWb92KwIW/aqh0EsgGE?=
 =?iso-8859-1?Q?sDm4r2/tOfvXCeMppsrTwKosVkUpFcUIqwjmVVItXyO+HM+vA97wJ5+ogM?=
 =?iso-8859-1?Q?MPtrygkDcvBmxwnFVRTuqJAznudwMGFSwJGQC2RUz9I2PsDKR6Tnt/hKYt?=
 =?iso-8859-1?Q?1tYWrA6jh7nTkQeDY2wLsrL2KDzT2FiqFrIxzy5yryoKK1q/JtRVaZ5EyK?=
 =?iso-8859-1?Q?gLNtOLJ6Jez6hdBBKK1YuHHfCX8gWv4hA44KzGuoFHN/7tgoQxY9talFxq?=
 =?iso-8859-1?Q?nHmt3otRdEEVy4KZVfNYKY/RGxbT1vi0d28Xhyp7B/f23txe0mqfjUonbZ?=
 =?iso-8859-1?Q?ItXf0tkpuF35ec4a3ikHwReojsqa/Hw+tjJ1bJFGn+TRBPXJ74w1Y64qrR?=
 =?iso-8859-1?Q?de8efpWXHb4lY0Eqn4rB9MKtXIvW5ntBtkEN9rC3THZkkwqOVMkGv7xYqr?=
 =?iso-8859-1?Q?hZ66eTKSN562Ky/NApJdrv5RxAkx3Su/kiYzNwHch5JV8KhbZNf3VZa4Kd?=
 =?iso-8859-1?Q?C8WpQgbDHPZsohCr1kQuZR+ad6AkbxZOSRODfTC06RMTycIIxkdKprGcmj?=
 =?iso-8859-1?Q?09ZCoAeCs+V4hbkH1E8yOsAV8xg7ZG7trBvcVv8RUSXNHsSfYNkRgZoSv/?=
 =?iso-8859-1?Q?efONiLPMsITOH5siiatQtFUGIy0NZWJurqx43HzOWGXPpy7L30o2ZWoxOE?=
 =?iso-8859-1?Q?MqRNtcrK9SfAW+Wnq4I+OtycWjbaKbZvxBZYIsNibQKoIb+HlwRfZ3fyDT?=
 =?iso-8859-1?Q?lbQ7AF0tJ+Rgf/PHG3Ewiq3/KO3yecSC2mgdMdWrFsGVaQ5fR2dEPOUdjV?=
 =?iso-8859-1?Q?MCkwQMwMiST6e7l/iPzlIVaQ8GuLpjwAzrbhT6kleCkvaK5Fofshofhmx1?=
 =?iso-8859-1?Q?bZSar8Ipo6hDhC0Ac3kJiFBh8v/1aIz9fVi77NEH69FJfiwoq4ioGJz86R?=
 =?iso-8859-1?Q?S9b400ayeTHrDpa1WGAf5eVSXI4dLf+zGQevijogPDE5yUsUS3flbmHb6y?=
 =?iso-8859-1?Q?LFIgwChh23EKK5QOITy0LvbWnjUUSWfoIq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: def149b8-e0bd-4601-6d83-08ddb9b0645f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 21:35:40.8718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P0pf2l/h7oLIYB1ECD2TlidJy8ruUBfGoF1iMUg95VwRi/HvHqt5ODzRH/JmX+LxtGnCaE76UPqTguo3wU9r1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6764
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

On Wed, Jul 02, 2025 at 07:41:16PM +0530, Riana Tauro wrote:
> Add support to handle CSC firmware reported errors. When CSC firmware
> errors are encoutered, a error interrupt is received by the GFX device as
> a MSI interrupt.
> 
> Device Source control registers indicates the source of the error as CSC
> The HEC error status register indicates that the error is firmware reported
> Depending on the type of error, the error cause is written to the HEC
> Firmware error register.
> 
> On encountering such CSC firmware errors, the graphics device is
> non-recoverable from driver context. The only way to recover from these
> errors is firmware flash. The device is then wedged and userspace is
> notified with a drm uevent
> 
> v2: use vendor recovery method with
>     runtime survivability (Christian, Rodrigo, Raag)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gsc_regs.h      |  2 +
>  drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  7 ++-
>  drivers/gpu/drm/xe/xe_device.c             | 11 +++-
>  drivers/gpu/drm/xe/xe_device_types.h       |  3 +
>  drivers/gpu/drm/xe/xe_hw_error.c           | 70 +++++++++++++++++++++-
>  5 files changed, 88 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> index 9b66cc972a63..180be82672ab 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gsc_regs.h
> @@ -13,6 +13,8 @@
>  
>  /* Definitions of GSC H/W registers, bits, etc */
>  
> +#define BMG_GSC_HECI1_BASE	0x373000
> +
>  #define MTL_GSC_HECI1_BASE	0x00116000
>  #define MTL_GSC_HECI2_BASE	0x00117000
>  
> diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> index ed9b81fb28a0..c146b9ef44eb 100644
> --- a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
> @@ -6,10 +6,15 @@
>  #ifndef _XE_HW_ERROR_REGS_H_
>  #define _XE_HW_ERROR_REGS_H_
>  
> +#define HEC_UNCORR_ERR_STATUS(base)                    XE_REG((base) + 0x118)
> +#define    UNCORR_FW_REPORTED_ERR                      BIT(6)
> +
> +#define HEC_UNCORR_FW_ERR_DW0(base)                    XE_REG((base) + 0x124)
> +
>  #define DEV_ERR_STAT_NONFATAL			0x100178
>  #define DEV_ERR_STAT_CORRECTABLE		0x10017c
>  #define DEV_ERR_STAT_REG(x)			XE_REG(_PICK_EVEN((x), \
>  								  DEV_ERR_STAT_CORRECTABLE, \
>  								  DEV_ERR_STAT_NONFATAL))
> -
> +#define   XE_CSC_ERROR				BIT(17)
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d6b680abc3ae..fbc50cebfc11 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1154,6 +1154,7 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>   */
>  void xe_device_declare_wedged(struct xe_device *xe)
>  {
> +	unsigned long recovery_method;
>  	struct xe_gt *gt;
>  	u8 id;
>  
> @@ -1169,6 +1170,12 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		return;
>  	}
>  
> +	/* Default recovery method */
> +	recovery_method = DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET;
> +
> +	if (xe_survivability_mode_is_runtime(xe))
> +		recovery_method = DRM_WEDGE_RECOVERY_VENDOR;

what about the DRM_WEDGE_RECOVERY_VENDOR as an option to this function?

Then, from the survivability mode you call:
xe_device_declare_wedged(xe, DRM_WEDGE_RECOVERY_VENDOR)

> +
>  	for_each_gt(gt, xe, id)
>  		xe_gt_declare_wedged(gt);
>  
> @@ -1181,8 +1188,6 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  			dev_name(xe->drm.dev));
>  
>  		/* Notify userspace of wedged device */
> -		drm_dev_wedged_event(&xe->drm,
> -				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET,
> -				     NULL);
> +		drm_dev_wedged_event(&xe->drm, recovery_method, NULL);
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 7e4f6d846af6..5daf5ba6bf51 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -241,6 +241,9 @@ struct xe_tile {
>  	/** @memirq: Memory Based Interrupts. */
>  	struct xe_memirq memirq;
>  
> +	/** @csc_hw_error_work: worker to report CSC HW errors */
> +	struct work_struct csc_hw_error_work;
> +
>  	/** @pcode: tile's PCODE */
>  	struct {
>  		/** @pcode.lock: protecting tile's PCODE mailbox data */
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 0f2590839900..73c788fd0dee 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -3,12 +3,16 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include "regs/xe_gsc_regs.h"
>  #include "regs/xe_hw_error_regs.h"
>  #include "regs/xe_irq_regs.h"
>  
>  #include "xe_device.h"
>  #include "xe_hw_error.h"
>  #include "xe_mmio.h"
> +#include "xe_survivability_mode.h"
> +
> +#define  HEC_UNCORR_FW_ERR_BITS 4
>  
>  /* Error categories reported by hardware */
>  enum hardware_error {
> @@ -18,6 +22,13 @@ enum hardware_error {
>  	HARDWARE_ERROR_MAX,
>  };
>  
> +static const char * const hec_uncorrected_fw_errors[] = {
> +	"Fatal",
> +	"CSE Disabled",
> +	"FD Corruption",
> +	"Data Corruption"
> +};
> +
>  static const char *hw_error_to_str(const enum hardware_error hw_err)
>  {
>  	switch (hw_err) {
> @@ -32,6 +43,58 @@ static const char *hw_error_to_str(const enum hardware_error hw_err)
>  	}
>  }
>  
> +static void csc_hw_error_work(struct work_struct *work)
> +{
> +	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	int ret;
> +
> +	ret = xe_survivability_mode_enable(xe, XE_SURVIVABILITY_TYPE_RUNTIME);
> +	if (ret)
> +		drm_err(&xe->drm, "Failed to enable runtime survivability mode\n");

This could simply call a function xe_survivability_mode_runtime(xe), which
declares the device wedged with vendor specific reason.

> +
> +	xe_device_declare_wedged(xe);
> +}
> +
> +static void csc_hw_error_handler(struct xe_tile *tile, const enum hardware_error hw_err)
> +{
> +	const char *hw_err_str = hw_error_to_str(hw_err);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_mmio *mmio = &tile->mmio;
> +	u32 base, err_bit, err_src;
> +	unsigned long fw_err;
> +
> +	if (xe->info.platform != XE_BATTLEMAGE)
> +		return;
> +
> +	/* Not supported in BMG */
> +	if (hw_err == HARDWARE_ERROR_CORRECTABLE)
> +		return;
> +
> +	base = BMG_GSC_HECI1_BASE;
> +	lockdep_assert_held(&xe->irq.lock);
> +	err_src = xe_mmio_read32(mmio, HEC_UNCORR_ERR_STATUS(base));
> +	if (!err_src) {
> +		drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported HEC_ERR_STATUS_%s blank\n",
> +				    tile->id, hw_err_str);
> +		return;
> +	}
> +
> +	if (err_src & UNCORR_FW_REPORTED_ERR) {
> +		fw_err = xe_mmio_read32(mmio, HEC_UNCORR_FW_ERR_DW0(base));
> +		for_each_set_bit(err_bit, &fw_err, HEC_UNCORR_FW_ERR_BITS) {
> +			drm_err_ratelimited(&xe->drm, HW_ERR
> +					    "%s: HEC Uncorrected FW %s error reported, bit[%d] is set\n",
> +					     hw_err_str, hec_uncorrected_fw_errors[err_bit],
> +					     err_bit);
> +
> +			schedule_work(&tile->csc_hw_error_work);
> +		}
> +	}
> +
> +	xe_mmio_write32(mmio, HEC_UNCORR_ERR_STATUS(base), err_src);
> +}
> +
>  static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_error hw_err)
>  {
>  	const char *hw_err_str = hw_error_to_str(hw_err);
> @@ -50,7 +113,8 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>  		goto unlock;
>  	}
>  
> -	/* TODO: Process errrors per source */
> +	if (err_src & XE_CSC_ERROR)
> +		csc_hw_error_handler(tile, hw_err);
>  
>  	xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err), err_src);
>  
> @@ -101,8 +165,12 @@ static void process_hw_errors(struct xe_device *xe)
>   */
>  void xe_hw_error_init(struct xe_device *xe)
>  {
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +
>  	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
>  		return;
>  
> +	INIT_WORK(&tile->csc_hw_error_work, csc_hw_error_work);
> +
>  	process_hw_errors(xe);
>  }
> -- 
> 2.47.1
> 
