Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B4DC38150
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 07:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CFB10E69B;
	Wed, 10 Jul 2024 07:19:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dD1gqPmg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F70310E69D
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 07:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720595956; x=1752131956;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Oln4b/CNinPpYhOA2cWOBnNOHMSedQoKrvGPofclCpI=;
 b=dD1gqPmg+tidWy2veGSDMgaOGvxfYO+tEMt1K3zF2XzbsZgfCXbA4+Gk
 TINB2UoWC38/76nj2tNU15G+143+Me8kRi0IZaDeumX4zNyksc+K0Ih1y
 vAVQ4njlF/fl6TykGGnhS3L/DtX8RrAeZ2eX/XPnPxptmB7+0R6yGzXVm
 YQqh0hKWYzXfmjgclqEbMNXLDMfqfnc+/GlWrewhX0SaNpQyu6dwH+uES
 T1K9SQDenjMoPv9ev6Hed7xbRE9tVgDFnU1q1c2S0VaezDr7cGwxidJC4
 msY9ptyPMeizIqbfKpF6PtqFxtudyj7xG2gkkh/+tFOXwavgcTtkb4P2Z w==;
X-CSE-ConnectionGUID: oVOHYdg7RC2krnm+gwWXBA==
X-CSE-MsgGUID: eHL2LNgJTemGArbp9UzNww==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="43315234"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="43315234"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 00:19:16 -0700
X-CSE-ConnectionGUID: gCV6agZoTQWwzHhE2V1opw==
X-CSE-MsgGUID: NF/7hWJDTV+Sn/s4y9LvZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="52407661"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 00:19:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 00:19:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 00:19:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 00:19:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 00:19:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TV/B8ixBrHbuIzXgJPLQfrGHsR//tCZFcDGgbPbcVUkxPyathtfohCBbWRHaUpILClRX1115c1wlasDrEHNWgfW2sz6DqckXojaY36RBccEez3S06k2Xr0IXMf1T11JYRtB/GzeAbXJr24ICuS8tAKXCn+WR9pNGwqQZ2z2HshVxTmq00y4+ES4JHmFn0YCHYxmDfkncZnKyw3nN4AQFaE/d7td72/h9+/uD38+1gTDiffzzlN4i1FJD58DlXgv6GYYX4p4Qrh+jwIAkBvrndy5tCtjMbUHVGrI9Mpt/dthlv6BOVbsPjQ5XVynR773KbUF84n5UvUn2otUHFlWLAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yUnoj7ws2SCSXPQHyG/aa6L0nxNR7ErfA7bLHgz0XE=;
 b=AIhvBPv7UEWiP6D+x2YwWg+1NRV62ONchOUgZI/3DFKNMFLzcd7r/sXuQcaCJJk0srbkM9vLlYb1Wp52aBNPnhJxHW++7PuQV02WTn70d3gjqmk/H/x9xrzlGdE+CquqOdbQmCkY+VTmU4kPGJm3CrIYuUdFSV942fI6TGTAb+pG3YJM1qkf5HA6dt8eebYHjUtdP13nKLUneuPq5hk8yBHc39B6fDa6JAzJN3f0ZieKEY6diyhRgOgqzqHfIOi4YecSXXq082nNdLclEqYI5PlQxGsVeEEeg6HN0V+QzZ7n4xVxywwnmH7BKekvrO3gL+GPOZ6NYj4kYAmRNPU0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SN7PR11MB7140.namprd11.prod.outlook.com (2603:10b6:806:2a3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 07:19:12 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%4]) with mapi id 15.20.7741.017; Wed, 10 Jul 2024
 07:19:12 +0000
Date: Wed, 10 Jul 2024 00:19:09 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Dani Liberman <dliberman@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <illevi@habana.ai>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 7/8] drm/xe: msix support preparations - enable memirq
Message-ID: <Zo417fHDo0ZRRYiA@nvishwa1-DESK>
References: <20240627124043.2923586-1-dliberman@habana.ai>
 <20240627124043.2923586-8-dliberman@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240627124043.2923586-8-dliberman@habana.ai>
X-ClientProxiedBy: SJ0P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::7) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SN7PR11MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c65e5c3-40cc-4dcd-a51b-08dca0b098e6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EEEE0vdz8MzPpURMPnleuO+6WviPYEJRDNcb33QtvezNQbbP5OO4czBax5If?=
 =?us-ascii?Q?4w+Ehasp0p9cxsZJNKvzbkd6neAiytnwairMcecVrLOFUOwjy3BBL/pFVe2Q?=
 =?us-ascii?Q?VC7/8fyH9ga6gslnDnTn78h8nLA8DNTcUnFAePP7q4ESFPeUXoH0DxtnQfDK?=
 =?us-ascii?Q?d31gf3TEewdfft6EPnyh2YDJz5CtQF0sNg1eq3h5J5abotd/NsE8IebfrwCa?=
 =?us-ascii?Q?4h3GMYDzizr1M88PXpfye6sdT6zSFRXMBWdS/pQTVZRcSGd0QRxXeoYjcNEg?=
 =?us-ascii?Q?4b3y3bFQeka9195A6zme2BENWgU/yjIwMQwLsqX7RmdGU+XAbDsWPt3KlqbV?=
 =?us-ascii?Q?NlbKw4zIUtDByri3RZhfmlnrcXeR3KTp+AJVK2SfDuYup7RSIPpnBdG4ip0C?=
 =?us-ascii?Q?R4sVn8A2PRZDXCgYdSHgIICbEePVP0z8Ny9du+zwT/js0Zu7riSF7MIvSs4R?=
 =?us-ascii?Q?I7+1nEdzJfXe5OyH1876EulACnLTCNhtlgT3WkqYgN6Co5gtle4RdHvhtOPB?=
 =?us-ascii?Q?bgNgk8MH+Z/g8aOH4PLrBEDqBACEYO5WSGvkLCUe/+nLaP46yrs9HuH46zED?=
 =?us-ascii?Q?5RtafkqkQlwinjd2zunH5+qnEUlkeM4cT6c095ic5dOjnX0J6sb/bI4ID+Z4?=
 =?us-ascii?Q?ZgvajjXp645mJoScuSjIOmn2JnvKFZr/+JVqTISVZDn91o3oj3pEs3seUMzk?=
 =?us-ascii?Q?HYcB/AVaznLhx+xiGkC5K3OSDUwoWJXs8nR0a04RjRdYztB/InhM7C+J3S+w?=
 =?us-ascii?Q?HdbMEZoW2Yh/E/iMnU7pQbBlb2zXVLoXCvptbXGZOXuLN6j8J20nLav4I40N?=
 =?us-ascii?Q?k+N2DCMrG1WScpBiJfMcdhzUIoyTp3PbenZtnNW+UNjXp++7XMBIkVq00xdg?=
 =?us-ascii?Q?Ty5tNv+DLpZRrnh1s88PlCOohDVVA4FUfAL+HT/EH7DEa3Axo2oyg4mfHJdE?=
 =?us-ascii?Q?g1rfG/QGRL1O9CvrEHiPGsWJ8m+LhnOChV3oEvT+w+WQZpG7uyJ+RxT8Ve/j?=
 =?us-ascii?Q?z1J011Cg89Nj8gq1Ntih/aDzNigCTNoxRqdP5roWqgvW/RSzYc+y+JeecWJ1?=
 =?us-ascii?Q?IjmVHiVhMxYulKX3abJoYHa6PS3dmDu0/70n2ePDgUDH/B8hXByny5PUFyy1?=
 =?us-ascii?Q?aXR10TYxg95PYA4C0PNs6qC4pIKFU1TND9b19xqmcXkZmZlpdV0aW+c+URNd?=
 =?us-ascii?Q?DgbiBOqv7LXiIOVLjvLLuoIl8Zcl628Mm9WkQ2zslYaiW/fOR5c/AfSJ1EQm?=
 =?us-ascii?Q?8dbv7zLv3TIrOPSVyJV6j/ngVJtsoReAXCul32tGrjtOKOPJxJRW4HMCJSIe?=
 =?us-ascii?Q?nEuNNk9hHkE2maOurkkMsVwKehJ3p3MMnyHZ1p5o2NEC6A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M+xex1hdFgTGyli+grTm4KF3h6kw/QZ7iiskz5noAni9gkbVvCvZEMGvFNVK?=
 =?us-ascii?Q?PMw1sde1ZSgtkLX12oD311Tllh8uA2jEbt2lh1ipACIJy7t59FIdTpNypJ72?=
 =?us-ascii?Q?bUtPiLzlitRiYBbfrJEyEVCJ5TWz0vOHH6R+6LVpEBZijMf8q8jGU6tSU0Wm?=
 =?us-ascii?Q?oRTmXHJhfKocuhhG4mzpujNdfgtT+3ibejL9m+D+u1H1cOarcYIrr8+cinpE?=
 =?us-ascii?Q?ALCMbZylMFXzuVv7cZLUug1ZU3+TCt5hprNkVekqm8pMLw2HfVsZ/OuKNjeL?=
 =?us-ascii?Q?uOMMtiWBWWTbSBHNBXqfGoYgMBDI0Oa31RD4/5dXyckRdjBLQOzM716fDGoc?=
 =?us-ascii?Q?YEEgSfXEZ/ur8gaTJ/qZ0Qnr3JEeSrmphzvxE8rTD2ed1uXSU0sKlLXVlm0Z?=
 =?us-ascii?Q?DMSVmoZPJGoyX3mccnEXzBaaxEPAenIBTrzJB4vvVc4H2im80wa0CiX1NnnX?=
 =?us-ascii?Q?xWnpmLD1fcLhSgRw8BySy2Pjh3mVW30AnQADVUJv3giDW5LVOWt/7fXu1lQ5?=
 =?us-ascii?Q?+BXic4PKHC9NeLJ2QgMXjR2K21dr8lco5LhubKBQDls4q+GrsD0yzDoOMlsq?=
 =?us-ascii?Q?HsaPgHCj4uAiEcJOQXPCd6CVGr4wYaWlDv1Xz+K6qnYqwRb7YPl6IbjIOg7e?=
 =?us-ascii?Q?qa1JY9F4HRnA3k+B0Zssj8bfjedu+99gIrDQYghRkbCjMNAUlmYWVIbqV+b/?=
 =?us-ascii?Q?OCKHpKiMtdr2ZlR3h1R6JpSlsAQFElDkn1CzQkFlkM0HHjfst1dUSWUQyKW7?=
 =?us-ascii?Q?tAObZ3leBl5wr5BTIo++3St/kKtqWNZNCNbIf9gQHbrSuJOkfmS+xVIM8YDr?=
 =?us-ascii?Q?MzXnn9NEPN3P34XNGZPYN2D0KZdLao4UtuMFuwLGR68L/GOfMs73Q1Md7ySr?=
 =?us-ascii?Q?wGHe5+5EXpR47viMK7XGcnVglcVrT7OAvdJx09kICqtLeoi8PPFMExK0D0KT?=
 =?us-ascii?Q?8xQDX5SecVtPLxqWkNJGrIUbVFPikqt7Mts0wEQbMdyCQsv/9Fdd/NIteIIN?=
 =?us-ascii?Q?F6iDRdrTOM3ThVyrHS5PRdHQVw347qEy0ljlhNFbMtDEx1hxIRrEzAaJg596?=
 =?us-ascii?Q?4QWSnSPw5Md/avOL0fKN9QTraH309l+WafVRQgmhBiXmREl9zqe17BivxBRw?=
 =?us-ascii?Q?IXauO7AH2malILuFzh1brsYJ7w0lY711d6iorNvIzbIbdgAlwfJgS0qB7PiQ?=
 =?us-ascii?Q?wecgQoGhjTSqwNkO71Lk4+qNQq2VemErenrqKrRvlIonJm16cnSxJLSA90HN?=
 =?us-ascii?Q?Aybmb6Lh2yDxfu00ghqk8x97n0ksLC+15sL50qcmxSmKXEm0fiKI60CxYiTl?=
 =?us-ascii?Q?KlVIuCOjt1uPVM982UgMJ4eBRxNpItpgqUp1ZVvpikKI0T6s+TmpXXjWN0a6?=
 =?us-ascii?Q?thkEstsbG2Ob31H0gJjIr0DKFvzORpA4pKw7ZSCl8BH9iic2TcPHStW6mS+y?=
 =?us-ascii?Q?GrKDHe9405RnjEfIL3WM8nhN/VuQevDn+gnZWS6rjYtdn/5i45QcFF6ALVAz?=
 =?us-ascii?Q?tYwADd19f7OyYhs/IO8/fylD/D2ncuTrE4hZxhjVyKYJa7l0HixidqJU/odz?=
 =?us-ascii?Q?Z/Skh4ULtBGGtuRaamjEbFfvYQo9BimGfNNj8h0Q4QE0bVRAfvMIIRCljub4?=
 =?us-ascii?Q?rsBllQH1n6354AR4ZNfbrkM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c65e5c3-40cc-4dcd-a51b-08dca0b098e6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 07:19:12.1040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qbP7EzpNOUqpxLE5efBoB3qmVasiEdIgT+N+lfbPMFP8CqRNjpPzS/9o1L9FZORTkKE1YSxig7kE8scw50mCKNXkTIgSw4qgjvBGfommzx0bR+gwk9GYgX5MsSS/laux
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7140
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

On Thu, Jun 27, 2024 at 03:40:42PM +0300, Dani Liberman wrote:
>From: Ilia Levi <illevi@habana.ai>
>
>In order to configure the HW engines to use MSIX, we first need to
>enable memory based interrupts (memirq). Up until now only VF used
>memirq.
>
>Thus before enabling memirq, we need to test whether MSIX is enabled.
>For this purpose we move IRQ vectors allocation to an earlier entry
>point.
>
>Signed-off-by: Ilia Levi <illevi@habana.ai>
>---
> drivers/gpu/drm/xe/xe_device.c |  6 +++-
> drivers/gpu/drm/xe/xe_device.h | 12 ++++++++
> drivers/gpu/drm/xe/xe_irq.c    | 56 +++++++++++++++++++++-------------
> drivers/gpu/drm/xe/xe_irq.h    |  1 +
> 4 files changed, 53 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index e4c7ecefa33d..1f5d40904927 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -591,6 +591,10 @@ int xe_device_probe(struct xe_device *xe)
> 			return err;
> 	}
>
>+	err = xe_irq_init(xe);
>+	if (err)
>+		return err;
>+
> 	for_each_tile(tile, xe, id) {
> 		if (IS_SRIOV_VF(xe)) {
> 			xe_guc_comm_init_early(&tile->primary_gt->uc.guc);
>@@ -604,7 +608,7 @@ int xe_device_probe(struct xe_device *xe)
> 		err = xe_ggtt_init_early(tile->mem.ggtt);
> 		if (err)
> 			return err;
>-		if (IS_SRIOV_VF(xe)) {
>+		if (xe_device_needs_memirq(xe)) {
> 			err = xe_memirq_init(&tile->memirq);
> 			if (err)
> 				return err;
>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>index bb07f5669dbb..7b4f651652e9 100644
>--- a/drivers/gpu/drm/xe/xe_device.h
>+++ b/drivers/gpu/drm/xe/xe_device.h
>@@ -9,6 +9,7 @@
> #include <drm/drm_util.h>
>
> #include "xe_device_types.h"
>+#include "xe_sriov.h"
>
> static inline struct xe_device *to_xe_device(const struct drm_device *dev)
> {
>@@ -154,6 +155,17 @@ static inline bool xe_device_has_memirq(struct xe_device *xe)
> 	return GRAPHICS_VERx100(xe) >= 1250;
> }
>
>+static inline bool xe_device_has_msix(struct xe_device *xe)
>+{
>+	return xe->irq.msix_enabled;
>+}

This function should go in first patch and used instead of
xe->irq.msix_enabled check.

Niranjana

>+
>+static inline bool xe_device_needs_memirq(struct xe_device *xe)
>+{
>+	return (IS_SRIOV_VF(xe) || xe_device_has_msix(xe)) &&
>+		xe_device_has_memirq(xe);
>+}
>+
> u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>
> void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 3fdd297516ab..24e8445b2a76 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -559,19 +559,15 @@ static void vf_irq_reset(struct xe_device *xe)
> 	struct xe_tile *tile;
> 	unsigned int id;
>
>-	xe_assert(xe, IS_SRIOV_VF(xe));
>-
>-	if (GRAPHICS_VERx100(xe) < 1210)
>-		xelp_intr_disable(xe);
>-	else
>+	if (GRAPHICS_VERx100(xe) >= 1210) {
> 		xe_assert(xe, xe_device_has_memirq(xe));
>-
>-	for_each_tile(tile, xe, id) {
>-		if (xe_device_has_memirq(xe))
>-			xe_memirq_reset(&tile->memirq);
>-		else
>-			gt_irq_reset(tile);
>+		return;
> 	}
>+
>+	xelp_intr_disable(xe);
>+
>+	for_each_tile(tile, xe, id)
>+		gt_irq_reset(tile);
> }
>
> static void xe_irq_reset(struct xe_device *xe)
>@@ -579,6 +575,11 @@ static void xe_irq_reset(struct xe_device *xe)
> 	struct xe_tile *tile;
> 	u8 id;
>
>+	if (xe_device_needs_memirq(xe)) {
>+		for_each_tile(tile, xe, id)
>+			xe_memirq_reset(&tile->memirq);
>+	}
>+
> 	if (IS_SRIOV_VF(xe))
> 		return vf_irq_reset(xe);
>
>@@ -606,13 +607,6 @@ static void xe_irq_reset(struct xe_device *xe)
>
> static void vf_irq_postinstall(struct xe_device *xe)
> {
>-	struct xe_tile *tile;
>-	unsigned int id;
>-
>-	for_each_tile(tile, xe, id)
>-		if (xe_device_has_memirq(xe))
>-			xe_memirq_postinstall(&tile->memirq);
>-
> 	if (GRAPHICS_VERx100(xe) < 1210)
> 		xelp_intr_enable(xe, true);
> 	else
>@@ -621,6 +615,17 @@ static void vf_irq_postinstall(struct xe_device *xe)
>
> static void xe_irq_postinstall(struct xe_device *xe)
> {
>+	struct xe_tile *tile;
>+	unsigned int id;
>+
>+	if (!xe->info.gt_count)
>+		return;
>+
>+	if (xe_device_needs_memirq(xe)) {
>+		for_each_tile(tile, xe, id)
>+			xe_memirq_postinstall(&tile->memirq);
>+	}
>+
> 	if (IS_SRIOV_VF(xe))
> 		return vf_irq_postinstall(xe);
>
>@@ -731,7 +736,7 @@ static int xe_irq_msix_request(struct xe_device *xe)
> 	return 0;
> }
>
>-int xe_irq_install(struct xe_device *xe)
>+int xe_irq_init(struct xe_device *xe)
> {
> 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> 	unsigned int irq_flags = PCI_IRQ_MSIX;
>@@ -750,14 +755,23 @@ int xe_irq_install(struct xe_device *xe)
> 		return nvec;
> 	}
>
>-	xe_irq_reset(xe);
>-
> 	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
> 	if (err < 0) {
> 		drm_err(&xe->drm, "MSI/MSIX: Failed to enable support %d\n", err);
> 		return err;
> 	}
>
>+	xe->irq.num_of_interrupts = nvec;
>+
>+	return 0;
>+}
>+
>+int xe_irq_install(struct xe_device *xe)
>+{
>+	int err;
>+
>+	xe_irq_reset(xe);
>+
> 	if (xe->irq.msix_enabled)
> 		err = xe_irq_msix_request(xe);
> 	else
>diff --git a/drivers/gpu/drm/xe/xe_irq.h b/drivers/gpu/drm/xe/xe_irq.h
>index 4ab63e61a062..428ec3eb484f 100644
>--- a/drivers/gpu/drm/xe/xe_irq.h
>+++ b/drivers/gpu/drm/xe/xe_irq.h
>@@ -12,6 +12,7 @@ struct xe_device;
> struct xe_tile;
> struct xe_gt;
>
>+int xe_irq_init(struct xe_device *xe);
> int xe_irq_install(struct xe_device *xe);
> void xe_irq_suspend(struct xe_device *xe);
> void xe_irq_resume(struct xe_device *xe);
>-- 
>2.34.1
>
