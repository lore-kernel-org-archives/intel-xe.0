Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A29C3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 19:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B70010E1C9;
	Wed,  7 May 2025 19:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2ITEVhp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1369A10E1C9
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 19:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746646388; x=1778182388;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E3Tx9VygdbhONJZ5Jj4hrLTQhURA7McoWLPksYaLF9A=;
 b=j2ITEVhpqXqKf2ti0qD4fAnF6UxaoKZ3jFQmopa7EXIv0QeMPfmBLfHc
 UoZq7wWDZwHZa7KQe4oSsqqIhOY2h94GjY2UN90Lv+qypcYibQwCKjqLk
 V3k6tbH0ZLRbWCKr1PmKY2DFpyQVHf/BBF44vYnP0w09E4ZlggNxjVcyu
 Rd27oJZKqBVnmxE67iVOaUvMhHYZgLeNhI3Wc5JwgpJ4rLte3jcjvXLHg
 q1QbI6zGy7d/Y9WVvkj882CFquBGtHARieq0SzTqUWqQYwetPYHsEbaon
 hDeT4E3WyLwc1IfOGTLZ//3fqjUe/4y9V2ee+AMj6dVlmKsMqvzNl/cwR w==;
X-CSE-ConnectionGUID: Kk6qtt2MQiqUbNIYnDZR9Q==
X-CSE-MsgGUID: uW8h55CCTb63SZU7lEqZag==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48416965"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="48416965"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:33:08 -0700
X-CSE-ConnectionGUID: jmcm7vw+QQOaOZqlJSQHuQ==
X-CSE-MsgGUID: Ggn6YlWtQLuhkbpEDsLV8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="137048559"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:33:06 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 12:33:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 12:33:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 12:33:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEKWKl6jscljzasOqNVIGI6nDCOMXx8AB3L8IEtGOZd2sj742aYCc1PiAAEC8IMmBAiSGotPTr+Mz/a6sMOpf9oTewRDuldshZTvlA4XWVXw2GrpfMxTRuwXtHsAnyhS4TD8luT5wBd1gRelzlmy7K5TgSGA8gr91SiqJNT6+iU4VWAkH6fZIrpZibw7ypZskOqYWKkUfMQiHBffz8rzASmkL7KSAKYOYe7F+cjV3rJCY+TwahRj7hao59IiqSGY35yqRZ7GVMhMKWnJlNQ705XwftcXU40gTFLXiOQzCeFRyfBflOAidTzsnAOIuQYf0NqXFlxshrk6TqV+QqccfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9iTHY+5X9D/j/VItzf2CZePPyeEXfVOjp1phpEMFlw=;
 b=bSeSSIuYbOexOyoOak9QxrIU9JXcy8271I4GWmP25WTAaXW+peUsSlowTYnAXZgOy34b9n9aj7UHOuK2xgkqPpy76cP4IvJ1B+Amq8+SslKFDkVRZ+x+808mVK7DzmvTlsXLn6BtdksBjecv3w0RYX5F4bTL5jGh2i5kyJqg95UyeNDEishKyBzSBkpBkFuKZoU+KZtORUwcK7rZhChKuj+9wvCH/MI3Dh54zmbFRyvGUATa0g+gQ1ll8n453Vadlj/pqsVwKkZH6AjA2xNw0walKlvTRo1ZRWIvyTX0OyT7kWgToFlm8cA/u5eYi8zlon+9AsxJiIv5qlVIpXL/KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Wed, 7 May
 2025 19:32:29 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%3]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 19:32:29 +0000
Date: Wed, 7 May 2025 15:32:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v7 1/3] drm/xe: Move xe_device_sysfs_init() to
 xe_device_probe()
Message-ID: <aBu1SVfzSXA_h0UM@intel.com>
References: <20250506054835.3395220-1-raag.jadav@intel.com>
 <20250506054835.3395220-2-raag.jadav@intel.com>
 <cc1d7661-22db-447b-b90f-689e939b5727@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cc1d7661-22db-447b-b90f-689e939b5727@intel.com>
X-ClientProxiedBy: MW4PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:303:b6::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: 50fbdd0b-ec12-4cdf-2e0b-08dd8d9de763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JneeG7BYdBUUh6B3jYFAtASDFLF2+L1RmSpDu70aj9wX15fbVitqMy+xUN7S?=
 =?us-ascii?Q?k4Zmb4h9zkMmDHU6qtx1KesLl7mYzJr/VFpg5YmUs+RL/A8fWFJnbMw4XZoB?=
 =?us-ascii?Q?Yv5Cbe+0xhq6fRneUDdL7BTpT5GVTXoxCXsuEcLQTWFUVUmgB+cLO7J3axfQ?=
 =?us-ascii?Q?90aXnCMpKilNjCNZpICc5/FngQm5AJ/JseJJ+BMQl6SUdAjMrQCVNZJti6TD?=
 =?us-ascii?Q?kDDQUYRxSzmykqv6RZ4p9A1uqoKI/UwgW82n/7HdqQBOoTzhg9Ee4dT/KwW2?=
 =?us-ascii?Q?i6DMKCygd4bZGpL+5mPdLI59RuO6+s/wTfAKZ/6rRrtqYpdzHcm4VDISWX5r?=
 =?us-ascii?Q?vSgm4f3+xbQdTZ148VH+sl5sVkM8ux9QfOfjL/UiCP3Dm1VJCCYeHBvJYZwZ?=
 =?us-ascii?Q?nsxRH8dcIFrzQUp9eGDgKGTpR5JLlOZtV/SirGinfFq5MVY2JdZgXbClgNO2?=
 =?us-ascii?Q?qpzNovUyl4xMtJwP6Ewx6Fc9pJJJQa0BPQarWejLJPg3QWmjK5rsJUJuKJrs?=
 =?us-ascii?Q?p8fSACX/T19oBz52SLFWjuFSnZ+UMjUofWSd2zLWg2WyyHROHyE23iPuHHxd?=
 =?us-ascii?Q?zKO2keRSejBmXn+F7MLrGJddnnzJopJC8CMxL8Mqk2Kdhyel+uq/zGKjcPiJ?=
 =?us-ascii?Q?NnloCJRcm9jWE6Q8GZOq30RHuSIJlwwt8cwelS66+QNi6iocvTA7kEplkEUC?=
 =?us-ascii?Q?3hZA+VtjL6KioJox1/C55qp54TeGZ+HoIJMUkdn3/quypT9AMzMIHq5RH1Uy?=
 =?us-ascii?Q?WTRW8sHqw+grKkgfz1sT+u6LDQEZsDmTzgcgE4fIbVoeL8lHNvgfa0RTKreO?=
 =?us-ascii?Q?ZzUv0l64s57JIERBmN3t/5Nigtqfd4z0yA9CnSL2aAgF/Bh0qPi2x+GrQh87?=
 =?us-ascii?Q?HjpKzoQiLrVpcBBwyLQodMeocsSqe0i85YcIy7zRTMoB7repFHvfw5LHsfwb?=
 =?us-ascii?Q?MbSuxW2JO8rcZNAuw5chsweIStV+TgRblgQo/Y8B8CAHFKaIxx7Vfcht9S0o?=
 =?us-ascii?Q?map1QHVRJOxxiyOyt4S/13/+oCiDEfHEX4P0+0BJJzfYWrtWnVrrUe4D+QE9?=
 =?us-ascii?Q?hM1A4/ClOaBkzbvp5Olk9ZyQMTfB6KdPX96qRoWZ0OSBgJ/agMLw+o6bBXFj?=
 =?us-ascii?Q?X1Yi/aysGE8j22s6qa5dByFdQkoKNY52y+JjDjlghUG9xAtn4FsHK5b+AkpZ?=
 =?us-ascii?Q?erz2aVV5FK/qmNh/KVe45rY8s02cEVpsU7CbzMgIuJBJYcGG0c8mJndeed/y?=
 =?us-ascii?Q?U34JoNPYW3Hp/GPJmvzwZM8/AX4pYiSE8Y7aH9WdjycxE7yyhTVqvUbLdNG1?=
 =?us-ascii?Q?pZawadZvt533LXhUWSjfOuwxdhYWBdg5azPelbpgCD9jIYmUyNV7twJhd0jN?=
 =?us-ascii?Q?jMg+d1uR8EftZR4bufKclihv/NK3kwHR8W3g71KhIT/0rINFKfe4HstDWzdq?=
 =?us-ascii?Q?Tu6kFVQJ7q4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Aqlfzgt7rIJEMpoW2HeMZe0+rs1RphgpZK6QZ+w/uoOXtjmbyn2zhmKByi5?=
 =?us-ascii?Q?BWEwafsn4wVvsSW0BuUH/uvmyaOu3V6N/snm3hVY6uBIoHOWaPLSxYeXqdl9?=
 =?us-ascii?Q?8Rx3PMavUUCFPt+UoA4OCb58GglyhK3gUnaTlgatukO6ClX3cAUUg2BfuKX8?=
 =?us-ascii?Q?qSMvk08ViEjs/j+CVufMq46MvuLF9KB0y3xs1aPQn8rPGB386N39FNpDf0rR?=
 =?us-ascii?Q?b01PBoxqYRFufoJQDCdd90WBOZYjjh49Qt5Xq6P9lmxiFlQjoIsnoxpQCko4?=
 =?us-ascii?Q?QasYwcUWW+N58qhbIgUB0TwsXA2E36C73v0rH0aiHILR2yVzEqD6MTNoHWYh?=
 =?us-ascii?Q?iHe2WWQaZ5ZBEsY2zw7vf6TBlHjy3rGFO5ZqZmzoEISjnG/+R66Wyz+HL0FD?=
 =?us-ascii?Q?qPJbeDprAtwo7BKxBLmbSisxxhIgucPUULeJF+RfNqb8Phgd5Qz6WBt8qa82?=
 =?us-ascii?Q?ufnrh6zzG4jKCOXfaKgyJPWNt2B+7feYMqa4cxYLHwaIgikgXiwVncBPQUiD?=
 =?us-ascii?Q?6WuypEKsLiezbmBG51sEWqgGVmjevFkph1MEeAf9ftiR6Ung47W0hP3tEPav?=
 =?us-ascii?Q?gUDQXU0vUOghvfLKSHjtvxMMP+1EX42jolHK1A4tIpbGBrz8cFZ/80GpIWoo?=
 =?us-ascii?Q?LctJTNakgh53vJc9oxvaJdRiQHVYH8d4uYK2wur5rD8lRAiOvwWxO/EnG3+a?=
 =?us-ascii?Q?rVxuukZn85IZYg+CFU7ECOb+6+P9f0/6Nv3e3pOh1r8p5z/0b5duTPrxRQbz?=
 =?us-ascii?Q?yvg7gs97twzpcPi4FNJbyPY5f8yyLu/mdW26CxMmCvxE/IjWW555BU/hhesS?=
 =?us-ascii?Q?/lC9nww+CHweR+aCA4qciARMJbzH3ZiUJfFBNKzb1pSMPwO7Eb8ozIvJALPp?=
 =?us-ascii?Q?TrfO6KK/+MXCYBjILVoDSCHPgJNZB4/W3MO0AAv2EMuojtlW1nYE1XO5KEUv?=
 =?us-ascii?Q?BIE6U9QrDP5fTT7B5dMaJtycfldxK0JmbGgxfT/0ZakA/mMHkhxGTGbjMeCg?=
 =?us-ascii?Q?bL2GJ1luJ9vm1sKD7jj5WNuwPDvFj2iFpcztaxeFnImW8jHVlMw8mj3dmCz9?=
 =?us-ascii?Q?84fijMd69VjzLS39pc2VB69UWkAKCKsREowAz4e9QUBUC+QhBBr6pfi+qkY1?=
 =?us-ascii?Q?LjEoTjm1YEdTwQdqJXn6M9ZSzPhsZvq/wk+dNHYhl5CodoHB7ve3+3yuwB5V?=
 =?us-ascii?Q?gGP5eDvZyB7sofn9zy36iQ6k1dcKimL0+/iGQI3U1dM5Kaz86xSnH3e0wgUN?=
 =?us-ascii?Q?RYTBLFvTFuHgb4TTD8YG6iR2PFbt6YenG0T6PVPan2NK4nTKHGl80R8kaQnx?=
 =?us-ascii?Q?ZTze4WSvfpNtx39CwhEU16g18iXs7zZ65sTHFjc1cg9BhcRyP5vAZBUszGHm?=
 =?us-ascii?Q?l8pdHUrzYiTlHyAn3RvxweSvAiXhXxIqmHcrU+EzDTDP9mK+AOtxacB2UUZ+?=
 =?us-ascii?Q?nwaI0Q4pKnIgNtFfFyq/LSOScXvZXxORXe6yVNeuN0zpphpa16HGzpfiubQs?=
 =?us-ascii?Q?ZVlfX/qWY3GBU0vFLaZtWX9wwGinoH/CN1HD2vcGowAI1p7Vw+cGtH1Di9wa?=
 =?us-ascii?Q?wOOPykjNWuVe3fkBXSfGAGSl6L8fydMw7IkCdOxRRG8heo7wo1mOl5+Kkw6o?=
 =?us-ascii?Q?lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50fbdd0b-ec12-4cdf-2e0b-08dd8d9de763
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 19:32:28.9878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZbKWb5DIgA396L+zMDsOkr13DHIinO+BH90CGU4mZZeSV1BwLnHLWphZS8TstacUkDzfMpiMBBBAZD/1nEqCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
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

On Wed, May 07, 2025 at 10:20:23AM +0530, Riana Tauro wrote:
> 
> 
> On 5/6/2025 11:18 AM, Raag Jadav wrote:
> > Since xe_device_sysfs_init() exposes device specific attributes, a better
> > place for it is xe_device_probe().
> 
> Looks good to me
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>

pushed to drm-xe-next. thanks for the patches, reviews and the patience!

> 
> 
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device.c       |  5 +++++
> >   drivers/gpu/drm/xe/xe_device_sysfs.c | 11 +++++++----
> >   drivers/gpu/drm/xe/xe_pm.c           |  8 +-------
> >   3 files changed, 13 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 6c9d3009aa03..79b7b0ecfbae 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -26,6 +26,7 @@
> >   #include "xe_bo_evict.h"
> >   #include "xe_debugfs.h"
> >   #include "xe_devcoredump.h"
> > +#include "xe_device_sysfs.h"
> >   #include "xe_dma_buf.h"
> >   #include "xe_drm_client.h"
> >   #include "xe_drv.h"
> > @@ -916,6 +917,10 @@ int xe_device_probe(struct xe_device *xe)
> >   	if (err)
> >   		goto err_unregister_display;
> > +	err = xe_device_sysfs_init(xe);
> > +	if (err)
> > +		goto err_unregister_display;
> > +
> >   	xe_debugfs_register(xe);
> >   	err = xe_hwmon_register(xe);
> > diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > index 7efbd4c52791..d4c73acea1cf 100644
> > --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> > @@ -67,7 +67,8 @@ static void xe_device_sysfs_fini(void *arg)
> >   {
> >   	struct xe_device *xe = arg;
> > -	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> > +	if (xe->d3cold.capable)
> > +		sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> >   }
> >   int xe_device_sysfs_init(struct xe_device *xe)
> > @@ -75,9 +76,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
> >   	struct device *dev = xe->drm.dev;
> >   	int ret;
> > -	ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> > -	if (ret)
> > -		return ret;
> > +	if (xe->d3cold.capable) {
> > +		ret = sysfs_create_file(&dev->kobj, &dev_attr_vram_d3cold_threshold.attr);
> > +		if (ret)
> > +			return ret;
> > +	}
> >   	return devm_add_action_or_reset(dev, xe_device_sysfs_fini, xe);
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 38514cef817e..693866def183 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -16,7 +16,6 @@
> >   #include "xe_bo.h"
> >   #include "xe_bo_evict.h"
> >   #include "xe_device.h"
> > -#include "xe_device_sysfs.h"
> >   #include "xe_ggtt.h"
> >   #include "xe_gt.h"
> >   #include "xe_guc.h"
> > @@ -273,6 +272,7 @@ int xe_pm_init_early(struct xe_device *xe)
> >   	if (err)
> >   		return err;
> > +	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
> >   	return 0;
> >   }
> >   ALLOW_ERROR_INJECTION(xe_pm_init_early, ERRNO); /* See xe_pci_probe() */
> > @@ -344,13 +344,7 @@ int xe_pm_init(struct xe_device *xe)
> >   	if (!xe_device_uc_enabled(xe))
> >   		return 0;
> > -	xe->d3cold.capable = xe_pm_pci_d3cold_capable(xe);
> > -
> >   	if (xe->d3cold.capable) {
> > -		err = xe_device_sysfs_init(xe);
> > -		if (err)
> > -			goto err_unregister;
> > -
> >   		vram_threshold = vram_threshold_value(xe);
> >   		err = xe_pm_set_vram_threshold(xe, vram_threshold);
> >   		if (err)
> Lo
