Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18574CD042C
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 01:54:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEEEB10E056;
	Tue,  6 Jan 2026 01:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7G5E/yq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A227610E056
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 01:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767664483; x=1799200483;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hJ6ETin/rcecbrrt23ns8gBmnIjmK5kARljQYIz9Bck=;
 b=H7G5E/yqad9t+akyYfReF36D+EZf8chgbt45o/qPKxh3GS79ELRMalFF
 vWF9SS0e0ymYFKNI6/t1Vrx/4pwKsP145VwwZuY79NveAg4kucCvR1WC5
 iOstPnsYeWvPDvDkyb4TUOZ2cvEeS4T9H2uhHNn1XGzkaUTucKinRmDsJ
 j6j1O6t6kq1YRlkKA75FZpMXxiDrQ77dBjSTxM9c3k67tN1OzwjWiMTJv
 bbHxd8dAQvMIg2OXojRYqKbGp28caNiQXwqq1XWRrTd5gbCMNwuSKrzTN
 vS7Rt/DaORuCFEXeITgGEpQWWBaF/JbzuTaD91R31q+vB8SLKMT1jJJnC g==;
X-CSE-ConnectionGUID: wrh5ths6Srixzy19lNiYIA==
X-CSE-MsgGUID: raScBCIXTqGusCimD8LCqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="71612311"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="71612311"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 17:54:42 -0800
X-CSE-ConnectionGUID: RdvWLfdEQ0CWfwUmUuilmA==
X-CSE-MsgGUID: K/Cl5vvfSiex0WD2RZBbqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="207089941"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 17:54:43 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 17:54:41 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 17:54:41 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 17:54:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xbq06Ca8IUxCbEC/XjsPXvlVAE2vU9Z1z3rUpEWHxagJ4csCc9HT7RqlKHtB499xfop4rqgPTcTXUqyxYN4RE4mar/ZTHQi/ayPYE10U3OhJNnxMWXMjLsEwyg/rOdQt2G2vQqrUn0y1tLuvkbQBc5GsjQj+WC4yMNHgL0wkvqIHXLAH0zBjJP7JyT8ZHVy5J5THBnimWHPHxKZazKEgfoakzPgNz39S2s+1w19d9mJyok2zCSiRZv3+2kYvC48dhgY64IefSSmz+YSBZnr7F2cSKs2pLCsBmlhqoaj0ay9DtVmYbUrafeQ26CmTuwB9tC1BMOyceVb3uPliCBXHHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=keSZhxFDoyag4/vP39r1UccWYs6zNVIl49omH09vWt4=;
 b=o8fe77tgIeO9UBgeOo7+bQiww0s8ezQTPZ5vy8aXh0CSOYnKfv3pe8wHiQrfDDdr9xIyL36Dq+dKW3tQxYhKHOUACRuNsmQVzg84ivAoUGdN0OTSp0Wl1/eRK6NUq86jb4ZVmNVNZ5+qU0i5SpX438ssXsLULyzVDzUSGMivsi4XFPvhU2huRR+3+nAY4EZnPqDouGZQOcEgIcZnFP0458Bztxv/A4COIYN5VQrXehSy7l2kthX1FEWk/q3GucL4vMcfzebWLsVEK+Eayvac4fp7ufRABQZleyfo1yWzpIEG3gqDU9bTa2xXRkl7bX+OpRMe42A+EWsPniCAIevk6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4721.namprd11.prod.outlook.com (2603:10b6:5:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 01:54:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 6 Jan 2026
 01:54:34 +0000
Date: Mon, 5 Jan 2026 17:54:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] Revert "drm/xe/multi_queue: Support active group
 after primary is destroyed"
Message-ID: <aVxrWJb/v0n+Squf@lstrano-desk.jf.intel.com>
References: <20260106012920.2850975-4-niranjana.vishwanathapura@intel.com>
 <20260106012920.2850975-5-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260106012920.2850975-5-niranjana.vishwanathapura@intel.com>
X-ClientProxiedBy: BYAPR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:40::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4721:EE_
X-MS-Office365-Filtering-Correlation-Id: 66902a42-d637-44e8-f988-08de4cc68ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8JRrxZSIYsr+DgV4xEJTqCK0C3X6QnBFrm+RnVZYixDt5+MVLV0Gz6InZf16?=
 =?us-ascii?Q?X43dUmx7iA8Tmt9DRdOm4VM6YDZ/VTZY5dBUCeJObDVZcoVPHvX3f9ZJRUDa?=
 =?us-ascii?Q?7sori3lVcN4qboIAMznGE51IU8cgMvI8ZoGuRZtC4snnQ5z9P+emRceyVDPr?=
 =?us-ascii?Q?j+ajiJLxuakUI789B0ekeKs3b5nbOfN1VFRZoiowFkhYGnFjfgPfcvZHW34m?=
 =?us-ascii?Q?9ozWMurjEnECQBV37xswwkj0TCyX8hPMpnU3pZcIwH2GcZXB9dxVN8AolYsZ?=
 =?us-ascii?Q?vY7jDnPjpIbvvBqGf3JuPqR9Mn323oAGcvAIkoIwRu+g+vU+wa5f3EGQMZRc?=
 =?us-ascii?Q?HEx7n9IEv5M4lPcgbXfkf6FeHhZjs9l2jEcxZAzTFy7GS/y7TUK8hhdw5smK?=
 =?us-ascii?Q?IKEAjBT+Vl5yvEK7s92pz+ZX0bpHLdl0fVjDWdFoSDj8EcKKE6YDpJvWqdHU?=
 =?us-ascii?Q?gZ8l2ZhagKlMKiEXNNRIAK5JXMLQ+0VMhTCeiGDjuktdRp1+ANrGiF/vv116?=
 =?us-ascii?Q?fs6TCj4I14SbSSPaMkODBxw8Gkxm0F3ySUxWyrJzlL0wC5xLvK22Nw8P3Nj0?=
 =?us-ascii?Q?2LA3F3m1Q9sNoeQqeTiS+cwcJ/FnOOtktF6ZVGTvS6xRkqp0kteaOEN6SIZB?=
 =?us-ascii?Q?vT9953A+0ra54yqhfKVMDvCsPIrRSvzgxI6MfkWXay31gwxtMc1mYUYuKn6v?=
 =?us-ascii?Q?SGVYyn2IKVxTvQKas2mcKua6CBb1OI60izWgz+9wq50mcu5iO7DjizbMI01p?=
 =?us-ascii?Q?xK4hbBt/cKo8YBlkiYr/tlUkGU65pe0PGeK2FMJN9dDZdzGB08vCuSzU0/2l?=
 =?us-ascii?Q?ueXaBucLNy9Y5/ggOF6/dO9FskEIG0uGIJ9XhErp5zyRsaddazHM94eFbj86?=
 =?us-ascii?Q?8DONBSfqAmnxuGi426dEAVD1HkNvh+NMeue4G6EE8TGm/4mEwhs6sBPkvXXf?=
 =?us-ascii?Q?C065h7mczNey+ahx5bprZYhthBfmcSOvKUyw+YoEOBBYYyFANqmQu17FFvdj?=
 =?us-ascii?Q?s9hGi5pcgXkh9Xlj9TZrl26kh9Dcky9WDS0aaTarB61Z0HgVLh6eBMxUdOQr?=
 =?us-ascii?Q?Jr7t6jdSsGraX5T1Kxk7ggNG2aN1wB5EScHyB4FoxqRBCZPu2sjnEIsPFvxh?=
 =?us-ascii?Q?uABVobTJCK1oSVwzyKqAkovY+p1Hc1QR+K6bkQJkgrLhse7+5icQCc9l/ETe?=
 =?us-ascii?Q?R0kLATrFmkVnPntDJGsr7L8AbYZoiu0EoMTMAyXpVp0fuPnMt9THjXfNxUeL?=
 =?us-ascii?Q?Y7yTp9KpsmGVkpq/rx5aBRV5ka96LpTTRydKkNbSPfV51bqzJPLI0ICNsnnl?=
 =?us-ascii?Q?tK9FgxZZhxZIuF414W/dJCz65d7V0dq1ydj5MH+KrioW0dUwoXklITMvzD0P?=
 =?us-ascii?Q?g57nELxGC9gcpXjcbM9iCcpDurRAzCO9XTdoVzAXd1hf9Ey1rkGUA9EJMuT9?=
 =?us-ascii?Q?qQJBqu/2Dc/M65i5i7JNxhCLcsZjUHmV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qb7bRtg/ymzW9ckYBa0Ge7T86aqo7Po+F5YLEbCwTHZSrOmmZoYXc2uW6g3f?=
 =?us-ascii?Q?db+2g/whPTkFa/Kc6im52iYHL/iEYMeAmd44+u0HwQexGAb4xmjgjbLWLkDe?=
 =?us-ascii?Q?QVBUJ7RZZFPFxO9W5Er+PgsqxBm4s7TIg1uaJoCXOvE4q8+kr3lrSa8VNqBb?=
 =?us-ascii?Q?paSSVeJE4x5WFnp9DsVbEbRa1o9Phc9xTQbtpRne9vHnvMINVbvYGph2oTxC?=
 =?us-ascii?Q?eIb3uru0SFk887LOcRZvIpXg3PrRYYrIR5WKPADgs0Y2If6d5exWG3CUnkkK?=
 =?us-ascii?Q?I7Kv/JCYB8hj1f0afLuKSWfSbrad9SyZiAg/sTdb54gQN/FhXbZI+tT5gJ5B?=
 =?us-ascii?Q?5OnRn7TqPZPR/1bSqYbTaF1dhIPHjv8NVsDX0mYCfiqulVW63mErH4cxSz40?=
 =?us-ascii?Q?fPFuiUt1w3QMzXQw/0qKV23sCmEg1INrEiKPWV/eQ8/Nf0AImPfGx/pjE9Mm?=
 =?us-ascii?Q?Xws7qeo9LM8HaJ1ao9PqVdvv2X9ixQfA5gYkasdQlmmMOkMSMTJvRFe12Ey+?=
 =?us-ascii?Q?AQCcesH3DwJ5tlKZPcJXugldqJ1ugvMNk7rDq4DfLD0HDsNbQm6zz2LydNEd?=
 =?us-ascii?Q?eUBrv8r04gb7dN9jE39nkEQOkfWTxcwzThT3I19LGJTiAX12njY++EHtvp4z?=
 =?us-ascii?Q?lYCRV1+nHdmhEy3GZMtBTELItFPGd/nBNfW6zNj6G2+xcYfuqDcg5zNrHYEf?=
 =?us-ascii?Q?3oqHkpHG7sjP+fo99VbrOVoBvxb5P3y0cZUWLiR+mg8OEKIm87Av6tBGAc02?=
 =?us-ascii?Q?CZMqO5SeFTVj4b/v8eQjHURUk3XO7ZXsmAN0YAg/m8sLGlMCZPTcHQ0t+VOB?=
 =?us-ascii?Q?ZR9S49d+7nl1dPn9WpXY9n0CGZwrcW0OaZPoXemq+9a1foHdnBKHcfVqIrKQ?=
 =?us-ascii?Q?R79MmjiuPowB2biKF8XPqVJARdNGvJ4VIzm/y3hVEQW+gbmF7UTJj3I1mH7h?=
 =?us-ascii?Q?VsvOs3+2qwcjGkISOikv1bEQQgAlPKqOOiqgVJNp7MzYSsWk0BkNpXKHOEYR?=
 =?us-ascii?Q?3tb4JWgfqpVm95L6kKWJG+j4Do73BQdcOiXXp7RKy51NkW0d2pksXuuxZ0Xm?=
 =?us-ascii?Q?+jKFF6NL+Az6ATXKlQYHqTg6quHWatIorS+E0NvGIIvRUL/5s1ijPKjtZiSX?=
 =?us-ascii?Q?uNzHVKDAW7xfTuwfOYeUysnXK9lEeNoav1mPgrXzIyJ78t8Azb+ZuKhvaYot?=
 =?us-ascii?Q?kwLsq1+1hn/huXb2cmqG5Ee+Yw0kTjv+5Xu5oExCrVrbG1qio1xhxgbsfWs8?=
 =?us-ascii?Q?m0isPx3EPpOZLtHjYjDBI7FH6QfLyaGm5jgG5DACbIVWXFetHaUKvnttGuw/?=
 =?us-ascii?Q?hkZL3cc6pYTjTzeZI7Pu9LZp7nhU0qwpVtgYxLVbty17afbEWkbcfSAiw2tR?=
 =?us-ascii?Q?vk5pZxanRQainUyB7xk0e27gUNlz6UbjtMftHL9H41M1ut4+mJO4/C5f7TJw?=
 =?us-ascii?Q?uaA4TJR1qYWX/GDZUiHudnDxxqV86Qck5xzWKj4HTF+0JLOMSKDwj/Jzh/LL?=
 =?us-ascii?Q?aEN5hNvzqNkaE/p7/cORNkED0Bli6KbfGjs+oreTgXc/YpTOGORZ6pS/iinI?=
 =?us-ascii?Q?8x8j/2PyoPFri5kTKTAj/rJlMahmsSNImFogFe5r+jdKeg+dCfqpA0hXB358?=
 =?us-ascii?Q?kzms2I6jn4gJ2tFvGNzAv+Y2WAKeLMZgVbGxkn4dIvGiM5RO0WTbZRXa0KSM?=
 =?us-ascii?Q?5moiZHxhqBDiQhwsoJgUK7o3jjKHaaUlKI9xLuGI2G8fseTmlQ6Efb6AN9CN?=
 =?us-ascii?Q?cd2+mRI2RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66902a42-d637-44e8-f988-08de4cc68ab3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 01:54:34.8639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mQnOHjUsgpL8enqVkkhvaCF3dKz7E3t5JsW/S/uaxrDs4yKYQOE5Z2T2Jxh1JFmb5In+bWXvybhB43yRwCsyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4721
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

On Mon, Jan 05, 2026 at 05:29:15PM -0800, Niranjana Vishwanathapura wrote:
> This reverts commit 3131a43ecb346ae3b5287ee195779fc38c6fcd11.
> 
> There is no must have requirement for this feature from Compute UMD.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Also please make sure Rodrigo pulls this for 6.20/7.0 PR.

Matt

> ---
>  drivers/gpu/drm/xe/xe_device.c           |  7 +--
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 55 +-----------------------
>  drivers/gpu/drm/xe/xe_exec_queue.h       |  2 -
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  4 --
>  include/uapi/drm/xe_drm.h                |  4 --
>  5 files changed, 3 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index e101d290b2a6..f4741cbe4c45 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -180,12 +180,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  	xa_for_each(&xef->exec_queue.xa, idx, q) {
>  		if (q->vm && q->hwe->hw_engine_group)
>  			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> -
> -		if (xe_exec_queue_is_multi_queue_primary(q))
> -			xe_exec_queue_group_kill_put(q->multi_queue.group);
> -		else
> -			xe_exec_queue_kill(q);
> -
> +		xe_exec_queue_kill(q);
>  		xe_exec_queue_put(q);
>  	}
>  	xa_for_each(&xef->vm.xa, idx, vm)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 0b9e074b022f..529a40ca4002 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -467,26 +467,6 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>  }
>  ALLOW_ERROR_INJECTION(xe_exec_queue_create_bind, ERRNO);
>  
> -static void xe_exec_queue_group_kill(struct kref *ref)
> -{
> -	struct xe_exec_queue_group *group = container_of(ref, struct xe_exec_queue_group,
> -							 kill_refcount);
> -	xe_exec_queue_kill(group->primary);
> -}
> -
> -static inline void xe_exec_queue_group_kill_get(struct xe_exec_queue_group *group)
> -{
> -	kref_get(&group->kill_refcount);
> -}
> -
> -void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group)
> -{
> -	if (!group)
> -		return;
> -
> -	kref_put(&group->kill_refcount, xe_exec_queue_group_kill);
> -}
> -
>  void xe_exec_queue_destroy(struct kref *ref)
>  {
>  	struct xe_exec_queue *q = container_of(ref, struct xe_exec_queue, refcount);
> @@ -716,7 +696,6 @@ static int xe_exec_queue_group_init(struct xe_device *xe, struct xe_exec_queue *
>  	group->primary = q;
>  	group->cgp_bo = bo;
>  	INIT_LIST_HEAD(&group->list);
> -	kref_init(&group->kill_refcount);
>  	xa_init_flags(&group->xa, XA_FLAGS_ALLOC1);
>  	mutex_init(&group->list_lock);
>  	q->multi_queue.group = group;
> @@ -792,11 +771,6 @@ static int xe_exec_queue_group_add(struct xe_device *xe, struct xe_exec_queue *q
>  
>  	q->multi_queue.pos = pos;
>  
> -	if (group->primary->multi_queue.keep_active) {
> -		xe_exec_queue_group_kill_get(group);
> -		q->multi_queue.keep_active = true;
> -	}
> -
>  	return 0;
>  }
>  
> @@ -810,11 +784,6 @@ static void xe_exec_queue_group_delete(struct xe_device *xe, struct xe_exec_queu
>  	lrc = xa_erase(&group->xa, q->multi_queue.pos);
>  	xe_assert(xe, lrc);
>  	xe_lrc_put(lrc);
> -
> -	if (q->multi_queue.keep_active) {
> -		xe_exec_queue_group_kill_put(group);
> -		q->multi_queue.keep_active = false;
> -	}
>  }
>  
>  static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue *q,
> @@ -836,24 +805,12 @@ static int exec_queue_set_multi_group(struct xe_device *xe, struct xe_exec_queue
>  		return -EINVAL;
>  
>  	if (value & DRM_XE_MULTI_GROUP_CREATE) {
> -		if (XE_IOCTL_DBG(xe, value & ~(DRM_XE_MULTI_GROUP_CREATE |
> -					       DRM_XE_MULTI_GROUP_KEEP_ACTIVE)))
> -			return -EINVAL;
> -
> -		/*
> -		 * KEEP_ACTIVE is not supported in preempt fence mode as in that mode,
> -		 * VM_DESTROY ioctl expects all exec queues of that VM are already killed.
> -		 */
> -		if (XE_IOCTL_DBG(xe, (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE) &&
> -				 xe_vm_in_preempt_fence_mode(q->vm)))
> +		if (XE_IOCTL_DBG(xe, value & ~DRM_XE_MULTI_GROUP_CREATE))
>  			return -EINVAL;
>  
>  		q->multi_queue.valid = true;
>  		q->multi_queue.is_primary = true;
>  		q->multi_queue.pos = 0;
> -		if (value & DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
> -			q->multi_queue.keep_active = true;
> -
>  		return 0;
>  	}
>  
> @@ -1419,11 +1376,6 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
>  
>  	q->ops->kill(q);
>  	xe_vm_remove_compute_exec_queue(q->vm, q);
> -
> -	if (!xe_exec_queue_is_multi_queue_primary(q) && q->multi_queue.keep_active) {
> -		xe_exec_queue_group_kill_put(q->multi_queue.group);
> -		q->multi_queue.keep_active = false;
> -	}
>  }
>  
>  int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
> @@ -1450,10 +1402,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>  	if (q->vm && q->hwe->hw_engine_group)
>  		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>  
> -	if (xe_exec_queue_is_multi_queue_primary(q))
> -		xe_exec_queue_group_kill_put(q->multi_queue.group);
> -	else
> -		xe_exec_queue_kill(q);
> +	xe_exec_queue_kill(q);
>  
>  	trace_xe_exec_queue_close(q);
>  	xe_exec_queue_put(q);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index b5ad975d7e97..b1e51789128f 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -113,8 +113,6 @@ static inline struct xe_exec_queue *xe_exec_queue_multi_queue_primary(struct xe_
>  	return xe_exec_queue_is_multi_queue(q) ? q->multi_queue.group->primary : q;
>  }
>  
> -void xe_exec_queue_group_kill_put(struct xe_exec_queue_group *group);
> -
>  bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>  
>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 67ea5eebf70b..5fc516b0bb77 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -62,8 +62,6 @@ struct xe_exec_queue_group {
>  	struct list_head list;
>  	/** @list_lock: Secondary queue list lock */
>  	struct mutex list_lock;
> -	/** @kill_refcount: ref count to kill primary queue */
> -	struct kref kill_refcount;
>  	/** @sync_pending: CGP_SYNC_DONE g2h response pending */
>  	bool sync_pending;
>  	/** @banned: Group banned */
> @@ -163,8 +161,6 @@ struct xe_exec_queue {
>  		u8 valid:1;
>  		/** @multi_queue.is_primary: Is primary queue (Q0) of the group */
>  		u8 is_primary:1;
> -		/** @multi_queue.keep_active: Keep the group active after primary is destroyed */
> -		u8 keep_active:1;
>  	} multi_queue;
>  
>  	/** @sched_props: scheduling properties */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index bb69f9b30c7d..077e66a682e2 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1280,9 +1280,6 @@ struct drm_xe_vm_bind {
>   *    then a new multi-queue group is created with this queue as the primary queue
>   *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
>   *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
> - *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
> - *    set, then the multi-queue group is kept active after the primary queue is
> - *    destroyed.
>   *    All the other non-relevant bits of extension's 'value' field while adding the
>   *    primary or the secondary queues of the group must be set to 0.
>   *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
> @@ -1331,7 +1328,6 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
>  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
> -#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE			(1ull << 62)
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> -- 
> 2.43.0
> 
