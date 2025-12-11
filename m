Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE07BD43356
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 20:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8587310E2BE;
	Thu, 11 Dec 2025 20:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wdc+a08y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8661B10E2BE
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 20:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765486478; x=1797022478;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=07Cb3HYr0coMs+ZIEVTRwvSbXZsHa9A7CBkmd2P/xpA=;
 b=Wdc+a08yldUzBRyhWrihII7bsOZRUqk2niL1ktMGP3aD7yaSgqklqGLi
 z8Djll9GV3Fq3b8hXtZr2mqZG08H6gAb0P1SclH8LAf7UJAW6UROAQVte
 Hq1QgKpzMvSx9s7ukHEFfxLjlZovsA799OfTaE/xxO1e+1mk+n6shvLEd
 m48OcnSk7JLewG27+sSs+fpFdBcHdRUut7BiSLc1dqvJMKuy/2oTyjZxD
 6QLTnMeLygnI5Bfrha3C0gKxeUdSngTPeUH9NUj4l0KzstSD0Jle9KxlY
 xNamomsfEgrn+QWtJcPDX6ZajU6iiNGjPiPsSDgQ+B1uASbTOKpgUkvlS g==;
X-CSE-ConnectionGUID: Zvd2hlpcQka4lt9TCld2bA==
X-CSE-MsgGUID: 6OcX7uaxQxy1AkC0spUBBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67409975"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67409975"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 12:54:38 -0800
X-CSE-ConnectionGUID: e66ytkbgTNSs/y2QaqoGfA==
X-CSE-MsgGUID: eg1ELeoCR8ilEt5jLTskEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="196893129"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 12:54:38 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 12:54:37 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 12:54:37 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.23)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 12:54:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUFQujYFLrvvWwmNB3bR9jrGNvJMwsT8XH2PVOZjysOXW17oHe9+9WL4rC1/X2t+E1Xv0Pqo31eXQLA/M8kMFbGePzrIX9AOxk3P0PXna61VBbQZUBdwgMfZowMv8WQweb9xnQH86mKwy95hRz+N1okV4UJzJOzWcE30fYjWBmh3c+EF/Ivx9q42Ox8BFk/57wfcReJMAanguGhYOhpRuAPYyLQiPVbVHnx8BceQtEapzXbdzuWe9L5alWmyHzYmoDuoJEG8OZekHmZ78VDnazJ/hA8qKNqU154dk2Qdz36NK+nu9fFL9BHmOActNp3AsUpw9l33ji8eYxG48gDG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrQpwqTqDvaT0IYaucSh6/sjMPDWCeJfz2KVNYyD4Ls=;
 b=uJfJbPn9Sf4z4le6HqeeIqtfy0d7Ruj0rT6QInl4vvxPTiw3Mlxv0SQfaE6bi4ymQ5/uUH7s+BRxlQ/chlQZ9zFA0Vr/DVckJMnAP+Mf9IVNFcJb+7kRLzAxGjDNDdHG2QK0LkDJoy9lYX2L8+65/VCV8WJQXZaKP3q4pj3vDbvuOJQomDH0GIgtVdfVKB0YrKjozxh15VmOPFgiZT5fWZopmGJjvoETQEWz+0Sp5YZ8uPh9y5Be36wUWwU9Z34suWHeZD6MAnfgyNwqYw8urkW83agdn6zrK4ieg4RaMv8tuPrLJje0zq7d4VP4S7Cp5RDh1fUxdRIog4UpTTQ/rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB7491.namprd11.prod.outlook.com (2603:10b6:806:349::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 20:54:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 20:54:35 +0000
Date: Thu, 11 Dec 2025 12:54:33 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe: Increase TDF timeout
Message-ID: <20251211205433.GB3956769@mdroper-desk1.amr.corp.intel.com>
References: <f95d5884e2ed41aaabd83c319c96d309442679c2.1765485659.git.jagmeet.randhawa@intel.com>
 <20251211205238.GA3956769@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251211205238.GA3956769@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR04CA0025.namprd04.prod.outlook.com
 (2603:10b6:a03:217::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: c13c4e29-7da1-4b64-2ec5-08de38f77df0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1d1EXsZpkmnr+eoDpQvsEoBAZkPNnNVnIoE3eThuxuWngCRnBiAEKLRiQT/P?=
 =?us-ascii?Q?RQ1YukqBKviGLd+APC4NLwVnk+2tpx51odgr5K28WGwyUclZb1BfRbO7XTKQ?=
 =?us-ascii?Q?KK6QCDjIm9Cw3TMw4VFDMQShtsa/wm95Dkc9jbwV6u6gh5lLkLbwiSOFZFzp?=
 =?us-ascii?Q?a7sIyJc/ieAIZlTzOeiclFPnbUlWQKun/uoPS245d+Mqw2qTIJmGxx4ts10j?=
 =?us-ascii?Q?lq8al9Cnoymwqv+YqQBuLwjhptOfGHxO+Dm/JmQNx9KezcS7XuMUAoj3IXZJ?=
 =?us-ascii?Q?A7Fu0PS6hVUe7hfcfWz63WUuxQK6VIrCKKAuV/qXGksgCIA+bO8wnCuh2LL6?=
 =?us-ascii?Q?vMd2TaH5Szy4v40I0QB7eqaZDdnEIhgniyUiVP/7RpHXI0QOUZW5yX0Zp9Id?=
 =?us-ascii?Q?dBbw4d2gHS10+1HC/U7KfrbZbJsoJ4U9zYJsmFVJTmxii5YrTByHcZXbHrtH?=
 =?us-ascii?Q?T9pyiCDDPDlTOPOReJCKZ1ZkEtbwNOj0XNWW8gAZnK/xmCpKG3RPULF9enNx?=
 =?us-ascii?Q?S+xpAQN5aeDjfMZEJUkRLN0GAroxBGoIuXHAFA4myA4xWNOw8kE8+4o3TWEW?=
 =?us-ascii?Q?JEiY9hOaiGi3FD0nPs8AacI7PbclTv8DSQp+q90xR372HftaYGgFIGxv0wGO?=
 =?us-ascii?Q?jbe5KDUjvRJqdMR58hH/vaKcb+jEmJs8F69A3sdIQOVB8m5GJ+1m+kIT/RsN?=
 =?us-ascii?Q?4z3qOisL/kkVCZrB5Wn3+P0hLR4hG6uHVdf0rRErLPBzOpb3h0SMVIV5Oscl?=
 =?us-ascii?Q?JHm4cXGhJtyqFw/60vRDCe5S6TAVjJeUEw7A5nn6BFqqXaY2TGejtqTZgcmj?=
 =?us-ascii?Q?n0tF2Ufj1Cqb/TxHJSBilaYjOYtRSShpilcToPNurWXre84QIbFE4q5FioTB?=
 =?us-ascii?Q?XJ0BiMLB9mVkZ6Y5esiZ7P3hLDjbi77DO+NAYimh9csQbqPtB4DDaIVnyVRE?=
 =?us-ascii?Q?aK/uJ1w7JAQx+3KZEJ0eR0BQULotkChdF5JEROSaZWEjFDgzLa9HK5MQ+lnm?=
 =?us-ascii?Q?TIkbY7YNjLtRlOLlfAlkiWBZfw1YrCuZhLqvlkUXYHEsJWjG1jUWgx3W5VcR?=
 =?us-ascii?Q?Oj6UFEaemX0CtvIMfXQZfA5pv2oLoVQ9nqgMe2vlHI9pqy9xM1zYDMuoqAl/?=
 =?us-ascii?Q?wqk16qn7fki7RoNVRKgeE9re00IHpkxHKBDbXeYV8g4cbKLlV0H6v+uWFdH8?=
 =?us-ascii?Q?CK9GJfo4pghRjsRtTl2qLw3KyxmRxR0p6QeNMeiDVDxMPwKfnicif5jvZLD1?=
 =?us-ascii?Q?OCTml+jKjDbAjuOO/16vPaAtcPzIOx2p1iZ/QK+KG68VKXd0m3F5t9risWtI?=
 =?us-ascii?Q?l5j8FgeIRBnSZ9jjsLxEj2ucMoyZPPHEZxvclzHCXAPooyYVHfb8FcICtgMQ?=
 =?us-ascii?Q?k+2S2LZlNexFAz7BX1X2EnBaydI8s+tCTCFmodKFfzOcquhhy8hyXiuhxd/K?=
 =?us-ascii?Q?jNgKOyz+OE4I1BUqGR9XdgX3AuxX2FSb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?saoxcUfcpk0bRoTY0YZY00ZsKr+OEl4g6ZI31p353NoO0/GEknco0HGP3BnD?=
 =?us-ascii?Q?yaq5V6tGKx1XZ5H9ZzLOBJUhBUvAx0XK6KGkXDChvTJ+tYObG4YqB6hfYuym?=
 =?us-ascii?Q?57eENGty3qHM0xoWGOQpa4hk2cr9+Dpo9TVFjiBx80rKlKTespbrUxDRiGeD?=
 =?us-ascii?Q?jQO+SpgW4/ZWwV8NbS9Q2EKw4vBLNDle6YbBDszH7AjyhjGq8uWM7P+lZaLb?=
 =?us-ascii?Q?H8xC07b4aQqEGDp9SUHN7SdUY7rt/6bjioM2nff2lvTKtE3Y/a3ntUQwwQKP?=
 =?us-ascii?Q?m6N1R7Qq5maHlOQxrP5CSfD/JD/iKMELiNwYG/3Tg+k7uJMglqvEB37tRmVu?=
 =?us-ascii?Q?ejb1SpZxezzyl/Q7ysJzg9rmctztX4agzYPXTMvYlosfnBZTrVC2iqVE9O3w?=
 =?us-ascii?Q?vv79mAUOMXxzWSXWuZGMVVvn4nF3U0j7E9zCr1zyuN30AuvKX98bT/Kk0SQO?=
 =?us-ascii?Q?diFmSbVslJGaVFRvf7GDbT680iLpzDk34KsnbHQu2bCLHTsX+5X58yWRUHaH?=
 =?us-ascii?Q?OduvKrzbo0sO+OgPFf2iQEbf0qCXnsnXa2TKd1/qXPszgMcPc7WVKD3QPwJg?=
 =?us-ascii?Q?BPxgpjMI+8/VSn0rIoWVKveuwxIEIGYXz8xALAyDYZaCPTYKxrYsXT2vaCKA?=
 =?us-ascii?Q?oCM/ExAcRJ16L1W8O7e7Khiu3pOeAQoAxF8iqp9kV6eay7vVebVvRjevPo8P?=
 =?us-ascii?Q?olQCwaOSJqgRxDN3aE6HBwf6pv13NQ8bzBG7rZzixUdP9lzZg6oFtV1L01gC?=
 =?us-ascii?Q?9TuXfSMmBPmtsUpFe2Zm7d35dNBQ1aGTWjPX+DRd4oekpkqFEdAk3BRQo9Xj?=
 =?us-ascii?Q?RfgVKlLhuI4fUyn1UEpbyyt0Y59YUordNz5Dv3zAX9tzKv3UToVd7yy21CVT?=
 =?us-ascii?Q?skQVhcV6nU2LBiiVEhi2brMwiHWDVC/k/qKyjbmIkQZ9r+k7APzsdby+JDUn?=
 =?us-ascii?Q?iaZ992xnnXgmgSZzboiH88CJIZkasS2y8TUtq26iTrByPB4zkKu3QWtY+eYT?=
 =?us-ascii?Q?8NhCttDnlQqFh9EY9+cEunqaHGHruxjvsROlFclkrBYsrBvYJSbH5vjV379E?=
 =?us-ascii?Q?FJk6ALOznsnU87qvzodPU1FbPwqn2mQcLfLB+zRKZkzdGZm5uve+f30fX9VF?=
 =?us-ascii?Q?QwSa0qiHcjI9EsUUVM2hihE9D0TgU79np6V1VYqSBZDYnbJj1B/gVNYrvnU0?=
 =?us-ascii?Q?EDi232Bim4ODbpK7KQgLdX/MyuAoX3E+cgUACkcO2jiaqbxI4KFuIrhjU/ms?=
 =?us-ascii?Q?4OtgFxT7IBBIFq/cTfGrGjBO5DoDIGF+al2l7reENA6ysZtvzTabeNs3v0+U?=
 =?us-ascii?Q?YMqc7kGuFOX7irRLzet72fj4wDPOxmbg4uLYgxawUqFn30s6rJaoY+1DwTRh?=
 =?us-ascii?Q?hweiJY7jgr1lwLXrp4qeVSMbk1rXRxlI8/I1/CDmWqZeCU/v26Yv2lDZmJ2e?=
 =?us-ascii?Q?o92UFz16Zu/gfV60AIOwiLIZDZ85IRLn0aevGKvvJOj5DJK1bO7vEd4pD7L7?=
 =?us-ascii?Q?vyDhoDaR2XiyXa4+wLr1KHpTzDVLXfD2H/w/B9unk4VqDhAzAVaSARyYE1HR?=
 =?us-ascii?Q?bWgDtJY+Wwfetd4blTpqX9PO0tlDR3CM/pQ/dvFPtd4Ow5eFpzYb4ut86c2y?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c13c4e29-7da1-4b64-2ec5-08de38f77df0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 20:54:35.5619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 313XQbbQ6fY1vtOxSOycCF6GhEg1TPMtbBJmTqyfxEKzsamV6cZklDBp9vwSAJPB+mw42pCutTQfuRzCFFyqGUN1ZiCAsjLI1kDCnOK+sgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7491
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

On Thu, Dec 11, 2025 at 12:52:41PM -0800, Matt Roper wrote:
> On Fri, Dec 12, 2025 at 04:45:43AM +0800, Jagmeet Randhawa wrote:
> > There are some corner cases where flushing transient
> > data may take slightly longer than the 150us timeout
> > we currently allow.  Update the driver to use a 300us
> > timeout instead based on the latest guidance from
> > the hardware team. An update to the bspec to formally
> > document this is expected to arrive soon.
> > 
> > Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

We may also want

Fixes: c01c6066e6fa ("drm/xe/device: implement transient flush")

too.


Matt

> 
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 1197f914ef77..db2f04e1e60e 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -1050,7 +1050,7 @@ static void tdf_request_sync(struct xe_device *xe)
> >  		 * transient and need to be flushed..
> >  		 */
> >  		if (xe_mmio_wait32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST, 0,
> > -				   150, NULL, false))
> > +				   300, NULL, false))
> >  			xe_gt_err_once(gt, "TD flush timeout\n");
> >  	}
> >  }
> > -- 
> > 2.52.0
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
