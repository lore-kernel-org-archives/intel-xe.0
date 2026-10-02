Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BE0CA5FDD
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 12:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B82710E593;
	Fri,  2 Oct 2026 12:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JgJmqYox";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DAF10E593
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Oct 2026 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790945000; x=1822481000;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lCWdmIYmJvgNBYZqTnUIXbUzBl9C0MXTdV+jCHK8lGU=;
 b=JgJmqYoxLeOB4Fj3zJ4BL6hRatbpkB01Hvrr5T5LeofDcFIopFwL4+wp
 l7hVqWH46RFUgWbF7G/tWXfyXP1yma+2lXAp5t8sMLgcQnZV6rmJhU0hM
 AatAFWCYAmqXDh+jkBLEYguaj31NP05CsYVPp8JPpKvOTA+j7ZANhbmJ5
 7Y+86KxtTugZTPB1Tq0rODGQiil6ze4BBeLFXzy0cnhaOBppHH45BsiqK
 EKNCL9uTn2SzxxOgQNwsAAuu7dROTl+TpSBcHbwfljXP50K6aO0BctPRp
 zRXTSd6O9JFMTjuC+m8nS8UCXJh2RQ534TAqJEoi0MMFmQWTov2OBzkip w==;
X-CSE-ConnectionGUID: CTC2ygLJRGOaezqRDbYevw==
X-CSE-MsgGUID: Z0B20mXuQOKUrC24mcPUTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="95523341"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="95523341"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 05:43:19 -0700
X-CSE-ConnectionGUID: YTZAOi6+SR2QEwflnkj4Kw==
X-CSE-MsgGUID: +5QTbHcWTyyRjaN+JibLAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="304203425"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 05:43:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 05:43:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 2 Oct 2026 05:43:18 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.52) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 05:43:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bdDWqkvDR7C9hrWsbeYmMX4c+SDE+j/2hXnkR7FDeb9PtAz+ycG1NfcrNJ/9OuT7PPgvMJfAy/O9TeAGSz/n2jxxoL1GHDNmzmOMR+B15vwcOV3Gv3UIaskqRbspAwilAZj9IyPee2HeHuEoLs0gaVUuptgr6rQeVTNJ3Qe5E8efMC9veaF/4C6/GSui0vYkzZo6C0HuGThWDP+yjV+R5vmR8Y/78SfAFd1gYmV4dQcmzuNb8h4Gk0kWZweqaFoIXCPZF9i3+u/4P3qXKo+8I5kDiQOVLq2WbQiY8AoM+RHC0pKnvJcPFb7TDegpdeBhKvuhB5Mrh6O3j8KWTBnd8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6U4fBkGRHm5iXIYHmZPlYvq7vOUab9qlHXrIU9KF6Y=;
 b=Q/glVl+GEFSZLe8ZKU9130Ve5TY3/V6v/aikmndii6pDMNYBDBYnsTMYGbZVTluBLQtv4WP2M6+sOQ45OPKr030Xvpt9T+EkTXPS29EG6asa19UaWCAefkHRVFTfW4k++MY9a/A26u/7SaWFIrviEPKcin+a8dW5YVrcDOZ7mtpT5SQ6sppIKH4omkcQnjPmBbwlx8wDZFEVjciY0Mkgc191BgIws77h9uDkyrbOzOaIWFmzTu1PGt1jP0Djzf9gEpmtUvrZwRG94zTjozL8gCrOJiLAHORzd6mVVLNMsmw2JuS2jBYTQ2nJBJMogs87IMsVH7r727IpincRbrOUaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by LV8PR11MB8534.namprd11.prod.outlook.com
 (2603:10b6:408:1f7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Fri, 2 Oct
 2026 12:43:16 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 12:43:16 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>,
 "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Siddiqui, Ayaz A"
 <ayaz.siddiqui@intel.com>, "Muqthyar Ahmed, Syed Abdul"
 <syed.abdul.muqthyar.ahmed@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "hansg@kernel.org" <hansg@kernel.org>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 1/3] platform/x86/intel/pmt: Fix NULL dereference when
 reading crashlog data
Thread-Topic: [PATCH 1/3] platform/x86/intel/pmt: Fix NULL dereference when
 reading crashlog data
Thread-Index: AQHdUfDK3gfLc439Pk2pzeQ3Z8J+mLbqMFiQ
Date: Fri, 2 Oct 2026 12:43:16 +0000
Message-ID: <CH3PR11MB04614953E9398FF44E0BABE0F3C1892@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261001220351.1592138-1-david.e.box@linux.intel.com>
 <20261001220351.1592138-2-david.e.box@linux.intel.com>
In-Reply-To: <20261001220351.1592138-2-david.e.box@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|LV8PR11MB8534:EE_
x-ms-office365-filtering-correlation-id: b3c39b87-ab02-4e06-2915-08df2082baf9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|11063799006|4143699003|10067099003|56012099006|38070700021|18002099003|22082099003|921020;
x-microsoft-antispam-message-info: 6eHKlnscRPV+vwMdta38L9m2axbNsKJabGyfFHMG2MA6vv+1BfskJxhg1D4CNOZB8lFREdDuIgIXL2rPuD3EKuXfAYrxyQcJwC6rx2VdOPv75BUskVOk0HaPk017x8X1hE3JEOBjhFsZmH++VoW1mw1TWDzLVaVW8zYLw0ETEr9+f/llfNHLpsKtskhUo5451AeLiOCVIhdUAti89W5l9fH1VI4sN8KCSJ4fys6BeATnhd3RcaUz0gAQof6Sd0qd0sAFVYn5mlErFqrl58kkUmZki31K9Mv2vtB5YMo9dk1sNxgJffK5qUImxJ7HL9kB6lai4pHkEO2KrKzEbaX/yp+i08cer7VCG1lLDmI/br0wx+70Z8eNuKZPi4XwP/EhB8WKOUGIV9T/xJYQyZxio9ZnxwIpYfq6UqMFgKvUioY3xILGTG2genfB2Y7fcAhodwhpoMLj+ACImKxay88trtPoaZuW8h1j1F9nH436oS0CEhos6LIOig7lJSyD30uiPOg2tqjpft2iskuae7g+v/y4XF20w3EzGjVvUtB97EuE9FVV8LxVriShr3PPjOQ2my3mliIXaGVWZ6lDQpW8jDJAwAv1Iq/l7ixXs9BxChPnlABxYzfyAFqck3/xvNoY2I+h5TI/13gK+rBG+5opdjzDOBuFYvxFc201IaLijLZ7BVt+vx4Sr0dPnUzzjZOKmerKQzh0AaU8rXqkdcl6v4KLto5UkvrL4oyQi8taxkBQzvb7/HWtZBPC9T6K6eiS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB046149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(11063799006)(4143699003)(10067099003)(56012099006)(38070700021)(18002099003)(22082099003)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fOgoftBLuATyol+cNJYqfMKJ2CFzRE4NkQ0v62mEziK7IeLyCHPJNLcqRlR7?=
 =?us-ascii?Q?+73LoPOuc/t0RdooSQ6Dw6Zbwi3pYasR5PJ4xiJ6XufVmNMmn5ZMl203I15a?=
 =?us-ascii?Q?iQjJo3M2u3S7EZw8XILsIUNCTAyAXegsGC5yeWgTCWMWWsoloFEPIxKc22vt?=
 =?us-ascii?Q?3qrR6VKon9oek8wiTEwSRlNl5u422biRAuseQ0k2J/trKm6TZ59PwskVn2sj?=
 =?us-ascii?Q?W499wRkYqcC4HS3ioVuTm7eHEeT5Z90NbdwOGQ/2sl2AUOnTM/ihimZWtXz1?=
 =?us-ascii?Q?5op66Q1wCyoJ/LueL15V8SIsYOYb/OaHOQYGAgS51lppH/a0k0eSSXapMsn1?=
 =?us-ascii?Q?4YVcOtfFUFON/nIVY3Y9jxoSpbayy1146xr4EGUgk66zixs7vjkXL4ZhFzhk?=
 =?us-ascii?Q?GwgV0hJ+Md+tQFqhQFNxmG7iIZNxWbjRNCbSnI7CC+ghnfJ6eL+KyXP6yyxx?=
 =?us-ascii?Q?yRXXpCSQoyiDFnrEyQJzL4FG4HnU+HMDDOal3pMhiBgP+dtLOaZEZo6AyWbH?=
 =?us-ascii?Q?2kpSidghw9q9EUPi+bPE0qI8ODKhDx41QrRpDAw4afdJ4hXWkzW0ybOW/ACl?=
 =?us-ascii?Q?4VNb37nEi8FcUs7tZqhwWVPx2WjTBXDENa4ufpTYdm3VpK2Q4oXmq0j/JsMc?=
 =?us-ascii?Q?7BI4vdRrlv9An4RChWNSveThuPJKMz4MCFmoGMd06Lk7vyaAzP415e945mZD?=
 =?us-ascii?Q?NuxUArOwvvJy6Od5uOFAP0lSSDvku1ajt71Y/xpNQg8gRsaHv3JgH/PeFxBs?=
 =?us-ascii?Q?EGUBBDeIdWr3M1pA6suLfYVcVAslTPCkN4xesXtWRuy5FxYcDR7D4ZVxLfkF?=
 =?us-ascii?Q?r3eXyukkMZPD2EtkL+8hAZV9z8enx8fxXO6VZ0VIelfvjE1DOW26vKzUd+p+?=
 =?us-ascii?Q?L/sL4RUFLAMePenZd1RFtPn6O8b+wQk/z9UMXTvCvUhgsO7MdfUtQNAxH2Ai?=
 =?us-ascii?Q?UcDA25Xdybhr3BUFQuEE32Na+sVB5AxtPWdwe221vCqm+DVCl32Jnq7A+Bup?=
 =?us-ascii?Q?1hkDmj2TctNtDe2bBGUNxRM5o/TYA8ZjMyxvEpxca93wdFpLnKGO9WpooiMQ?=
 =?us-ascii?Q?YBhERp9uiyeWWYehmSo0VZmqQptVCCN6Wi/mah+KyTxEJ/19/cLQOqCOCiar?=
 =?us-ascii?Q?F/2hgo1jID952QJxYVHYRVLMNyVZDDkch84t8L/kQSut0p9Fjfhj/uOtiFx0?=
 =?us-ascii?Q?gdzhCWlP685KaHf9yj72GOpfA1WhNqdS+mYD3aQ3exJCmCjcBGMRHvUj+b02?=
 =?us-ascii?Q?9HYp8y6bVLq6cmc+22QlQ0yTgzki74Kjk8+NcmnjK36QHMrakj8zR362ITqu?=
 =?us-ascii?Q?IEvF2ys+/tJXeBQixn9f8LEvIQT9UzxbNffs6WucGozs9wuHWhnHEsuwwfXb?=
 =?us-ascii?Q?5BSnu4NvPkQkWtyQkvS4N6CY8bjMn4FpzXEjknIji3uMKdvsTJFQip/F9ZdJ?=
 =?us-ascii?Q?0ETYo1yu/ATbNRHNQL6Gc+zUWmuwuoXjuMfR8dwg4QbYPJTf9NnYdxTH3BlM?=
 =?us-ascii?Q?G9jjOR6iQWgPR2s0NCJI2eZiQ5oURlYJjPGMDkAeRtW5dTjfF0AFXoWFpmWb?=
 =?us-ascii?Q?DvcV/oOPZhQjIkVwpRZZnj4CN0i5cbg4spQOwUMInRRx3jtL5svg+E8E8Udm?=
 =?us-ascii?Q?17Pc8oDORuy4Bl7JH8iIAi3WpqQxHLFgfzEarei8nbZgG5g64nUIrP1fiJXk?=
 =?us-ascii?Q?nCcSnRo2FSwgDdEpJE//awi/Yospu+X31qJjMQ+tFt/DzDuXTL9i+zX4gHOv?=
 =?us-ascii?Q?GVoWPbFvkw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: y0UJtoBzxciZojLW9WswgZHCXVypqImb6/0w4yBmwSrMAE2emaHhld/IIe8BKb5Crgtb2aSaDjJPDbePEA7BOuVyFv26j26fDIZLypziIhNf66Rk11H1IHHYX0HqNmDCnk5tQ1/AkoDCxQ8pOzdkJztdYxR8WgsqKF2CHImMAnxG/S+zM5CqhvgHltHaWpJar2rDLbuKKqQHsadBRAIqbTVONhR/UDbVSyjBrRnxQy5RHwzUtVFPfK4Xl54+w5l6QvODIYBj61zm4+g0NXxT5SOp3iOXIOjmAZQCXzUTukJ1mzB0ab+3wWZNW7VwHXGwni6GeeiYK6sl5PKju7WEOA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c39b87-ab02-4e06-2915-08df2082baf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 12:43:16.4594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uAULExFO5O4wi1vmnPYlyrWM+tvygsk5RsDkoCDXlRJYppcPtgEJx/812PLX5OdVU86bKypkf2Ryi+hGEUepdMA2w4wsyired4nW+9zdxzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8534
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

>-----Original Message-----
>From: David E. Box <david.e.box@linux.intel.com>
>Sent: Thursday, October 1, 2026 6:04 PM
>To: ilpo.jarvinen@linux.intel.com; david.e.box@linux.intel.com; linux-
>kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; Vivi, Rodrigo
><rodrigo.vivi@intel.com>; Ruhl, Michael J <michael.j.ruhl@intel.com>; Sidd=
iqui,
>Ayaz A <ayaz.siddiqui@intel.com>; Muqthyar Ahmed, Syed Abdul
><syed.abdul.muqthyar.ahmed@intel.com>; intel-xe@lists.freedesktop.org;
>hansg@kernel.org
>Cc: stable@vger.kernel.org
>Subject: [PATCH 1/3] platform/x86/intel/pmt: Fix NULL dereference when
>reading crashlog data
>
>Commit 353042d54d82 ("platform/x86/intel/vsec: Switch exported helpers
>from
>pci_dev to device") changed intel_pmt_read() to pass entry->ep->dev to
>pmt_telem_read_mmio() in place of entry->pcidev. entry->ep is only
>allocated by the telemetry namespace's pmt_add_endpoint() hook. Crashlog
>entries never get one, so any read() of a crashlog sysfs data file
>dereferences a NULL pointer.
>
>Use the intel_vsec_device parent device instead. The PMT class device is a
>child of the auxiliary device, so derive it the same way
>intel_pmt_attr_visible() does. This is the same device telemetry stored in
>ep->dev, so behavior for telemetry and any read_telem() callback is
>unchanged.
>
>Fixes: 353042d54d82 ("platform/x86/intel/vsec: Switch exported helpers fro=
m
>pci_dev to device")
>Cc: stable@vger.kernel.org
>Assisted-by: LLM
>Signed-off-by: David E. Box <david.e.box@linux.intel.com>
>---
> drivers/platform/x86/intel/pmt/class.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/platform/x86/intel/pmt/class.c
>b/drivers/platform/x86/intel/pmt/class.c
>index d0ab8e33c62a..b69c79785d9c 100644
>--- a/drivers/platform/x86/intel/pmt/class.c
>+++ b/drivers/platform/x86/intel/pmt/class.c
>@@ -90,6 +90,8 @@ intel_pmt_read(struct file *filp, struct kobject *kobj,
> 	struct intel_pmt_entry *entry =3D container_of(attr,
> 						     struct intel_pmt_entry,
> 						     pmt_bin_attr);
>+	struct device *dev =3D kobj_to_dev(kobj);
>+	struct intel_vsec_device *ivdev =3D
>auxdev_to_ivdev(to_auxiliary_dev(dev->parent));
>
> 	if (off < 0)
> 		return -EINVAL;
>@@ -100,7 +102,7 @@ intel_pmt_read(struct file *filp, struct kobject *kobj=
,
> 	if (count > entry->size - off)
> 		count =3D entry->size - off;
>
>-	count =3D pmt_telem_read_mmio(entry->ep->dev, entry->cb, entry-
>>header.guid, buf,
>+	count =3D pmt_telem_read_mmio(ivdev->dev, entry->cb, entry-
>>header.guid, buf,
> 				    entry->base, off, count);

Hi Ilpo, David,

My patch:

[PATCH v11 01/20] platform/x86/intel/pmt: complete pcidev to device update

Fixes this issue in a slightly different way... (uses entry->dev rather tha=
n entry->pcidev).

David,

In my patch I have also updated the intel_pmt_get_features() function to us=
e the
entry->dev value (rather than entry->ep->dev).

I think the ep->dev is for Telemetry access, and "features" is a general us=
age?

Should the _get_features stay entry->ep->dev?  or is entry->dev "more corre=
ct"?

Thanks

Mike

> 	return count;
>--
>2.43.0

