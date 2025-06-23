Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245A3C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 23:32:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C742310E47F;
	Mon, 23 Jun 2025 23:32:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1y+3H5M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C05E10E47F
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 23:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750721534; x=1782257534;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O29eY7AT2tz7aCULN73hGWb66xqnv3ajShL7fCK6djo=;
 b=D1y+3H5MrzRtnukEb1UzNIar0ibwe5oALZegHyGsr/YiQFphoXUwdhwJ
 hx+gjyx102RZtvakHmEQT5NMM558QzwVMT3fiBKdw1XG9XyaE4t5KYpJ3
 hWy3b+I96ZA2Dz3aFjvcrn9FVThqit8jgDmySt4Wan3zY8c/Au81sBr5c
 RlwoBJnWgPcI/y/1u2YRvmTZaogG8oSta/whCWFUV+6jkoXJ+KWBG0Fi+
 gVt6bDVFPo+GYG986LjnsaXzfX+bzg+z5xxLpVAwst0RQ0CESz2+QoK8R
 uONg48HB40qgdYoHskLHhs1wYn5uauQdhLIJCjq9nKTaYwRQmDhFdPNey A==;
X-CSE-ConnectionGUID: 2xnUS81yTWSnSR9D7SWh4w==
X-CSE-MsgGUID: e6BBaFRnROuSKAnFntqiOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52816989"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="52816989"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 16:32:06 -0700
X-CSE-ConnectionGUID: pBpKMQQoSQWMvUQj9nsMLQ==
X-CSE-MsgGUID: r0yVkaraTgmmqBTmLxMgQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; d="scan'208";a="152435840"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 16:32:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 16:32:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 16:32:03 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 16:32:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqy8l32DA70KYpDQQwrf3OI8MNiL5ozuXfuOn1Ss7hygO9DGuVMBbeuOHnYApPnHESUBEdoedb6QICpo6iDuJ2nwBTOvF5NOobreztUf8WhJ3nGCf914LfgezMMhSAKUO9Ea8LiKZpUthRlwa/2RZM3DfM+gdtkymFvhVuG39tTkAjtbK+Auim0OcoZpnUFJlWP5+dijlE0CPsl8KTxviCThiURcL8+B9qJGLq+udpGQbDBm0lhjO+cTIJexfvDDePYB0Z+np/fZJ7dXTpzd4GpEZzV3ZPALvoAdWx5c1yyH+/7HtdFwJbiq6dUvQIw3uMm/07ZpKPMApCYKgpCFLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCkkhNWGribNk76jUlISiImwQ/O291liwJvXO3t1HDw=;
 b=jdAix2fO3oIQRvivQT52UqCfNc+cuBEKSQlnSCJZrbIKhpRlHcxT+pNe61GD7ETMfRfUyxgKjXcd/GPPz8FA4zvv1gdAwZQS9C97bXxOL2wS+VPDkF2Dretbf3FItsLB/lc7QnOCElGxqxY4F9XPxJoUa1L2NCIczhcOSR4ZEdR9Xr2Bh0NB92HJyF+7l6LdN/0K79V5+dEMfoWj9qMUeon5U6aGKufyA0dxkijcG8ZvulvyZLFoCzqDnzg8I3m6R7Zid7jSrI3BNwl8DXh/Dbzlxf3iU9T40TeRvqeCS/iPMAQInQ9uhYZg0ZJQMOkpucsXczZggQNq+gXr0x1c9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SN7PR11MB8111.namprd11.prod.outlook.com (2603:10b6:806:2e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 23:31:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 23:31:32 +0000
Date: Mon, 23 Jun 2025 16:31:30 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Matt Atwood <matthew.s.atwood@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/5] drm/xe: disable wa_15015404425 for PTL B0
Message-ID: <20250623233130.GE4868@mdroper-desk1.amr.corp.intel.com>
References: <20250620214920.718179-1-matthew.s.atwood@intel.com>
 <20250620214920.718179-6-matthew.s.atwood@intel.com>
 <aFnDJdKKgT_-j69u@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aFnDJdKKgT_-j69u@intel.com>
X-ClientProxiedBy: BY3PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:a03:255::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SN7PR11MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: addcfe78-4c03-49aa-2163-08ddb2ae1689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vRY+t5vsY1J0p+fg2Z2yUmjIDM0ebyxORKWeBddmuC/3+19XQ+t1bZGqAijj?=
 =?us-ascii?Q?kJotZgO5CoI+smg4R+lXG21HapX2EOEqNuMf59r3YZKxDRc3noUslZwS8RuB?=
 =?us-ascii?Q?6iBuYSBROU0Jvbp1T1BT1oWqo2bCJEWYOGvBtLRzjM30qBL5/1j/xlTg1JkB?=
 =?us-ascii?Q?Cu0T7HROJDrdAd4l7qYN6kKQoleKclpf6A3wNftW5EYG7nbpBw6LkdtwG6j7?=
 =?us-ascii?Q?CUkhGYyaQBXTOO4MK72ouHIXf4q8BVuB2YLHJclaqaTMAyb2B7DvFp7PjfVE?=
 =?us-ascii?Q?lyF9rGmawO9qMbkCh9YJl9RxkEgz3HhXwhf75gchPk7n+e8gf46fI2rF5m2G?=
 =?us-ascii?Q?FRLBCYw7r41iYir95VQNo/us0wUcVjEB/GtPUL2EfDDWVRqZnHI3KDtbnquj?=
 =?us-ascii?Q?aV0oxuNX+hxKPNZ0jzZoSknSWcxjBAsv4HHmq5CLnQIyhb0q3wdt4EyGowHz?=
 =?us-ascii?Q?A5begiJ3lgBVJmaQkwa4LGTEpASRX/i7HMC/YTC12HhEnFrlP/uUjaJqxTXp?=
 =?us-ascii?Q?ZyEDzkx/iRoAsvF1JLfcnsY3vTvLS97x1Y6rVogCm6SX6dKhmMQgf7yVM1Fb?=
 =?us-ascii?Q?8k19FBudk2YSpHWgONUO1OUMXGA6bvCQG78E9ezUHJrgHKytNRv1pGWB6UIi?=
 =?us-ascii?Q?9zTFOhPM3UD6fiKfBBtspoeTPbOxbS8lDo3vbEvhdU5flwVp4/JM9HhUHny1?=
 =?us-ascii?Q?cKHe72qZhLPCth3ad9hcKMr7+r2/mq/8iw2FcCdYZfz4uF8LlqAkM20Ft9ZO?=
 =?us-ascii?Q?b1zDH44jM/ixitSolTeVXlIJV9C9qajcrCCtEtxgLoaP8SlA776tzvR9tiyD?=
 =?us-ascii?Q?411fZT6Zt/lqZ6s7xC0Inet14VaGmYxWCIfWa7fitQcZRpEFP7CE9LSNaHFh?=
 =?us-ascii?Q?JqD+BSVq+c58gtLEe2xbZT+4LBnLPc4j5kYFryrN4r3d3+3BLCv5UaG1S7cK?=
 =?us-ascii?Q?Vn9Dy0wBIhZtbyYsZIUj1vXb+9iASDlf7Md+W32l6fdcZVCNp2sx1ZNtpcHu?=
 =?us-ascii?Q?z80X0LkA61VycNH14+bFDJhNr8bY9dqjDSu5+TbCj+nTq1vwGROLUidwRuRR?=
 =?us-ascii?Q?MsliZfGIcFnCC46FtqQw9pdzBEFJ5nBLVB06SVp+YXtWuwfjp3mprZOEddHu?=
 =?us-ascii?Q?B4HRfm+hjjUf6z498OG7cRnAy2R952vMcDhuOad+JILcHDu6T1hfDyNl7wgP?=
 =?us-ascii?Q?m5PKIo7YXYhE0T+qZlupw2gDAQKqlp5K4SL2h9RLzzFAL0DFO7qotHV+6ITB?=
 =?us-ascii?Q?JqEXYGlZrZveD9rXV5xa0E/jtQtIwUh2tmswjjeyCb0JKxc2w8dkr1xTx4mm?=
 =?us-ascii?Q?hDIycMBe7UC6s7zdj3c2Hjvf5QuuBhm96A4oMjTqzy1Bn0q8Q0QoQNDE8R+c?=
 =?us-ascii?Q?ZeG16XaYBiIAo3/oMNY7zAxn/Tbzbu9rujoSB7iij/cMhrZYPdAGOhiHSYid?=
 =?us-ascii?Q?iY3EAQQGWY8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HAVFJRSo+qfUD/efUbvwLxPL0Yc/icF534XyAEClRFVxxzask1XQUf0E1irW?=
 =?us-ascii?Q?fVKYg8avNCuoWbDQMWbp+ZqQFngE60SFExO5wPeFNazg87/Yw62MY62ZMANu?=
 =?us-ascii?Q?kqWVa4mCrnsepQdPpXbSJmvRLrMYYkDruMVdSSR4MJ+hW3WR5VaaxWEF3Jmw?=
 =?us-ascii?Q?XYuL5Sniy744aZqVhplA5E7bGqs8cFVGDpZEyASHNXghDfHDCQf5HFJpVeMx?=
 =?us-ascii?Q?RFVQ+nsd7zXA99T6kIyr3zDwjNf+JVh1W0aoD2bCvCQnuKnieXfpVt/YLvNz?=
 =?us-ascii?Q?m7DLO7NnhKkqW3V+MMTtpilQPnyUEVzh6/mDVodg9qMyAj0ADNiProwCKj8t?=
 =?us-ascii?Q?/0dO7xBXfkYgAzet4FO1i4VtPBE971sBKdpLKhZQnlOMoxzhD59FQ0GdKre7?=
 =?us-ascii?Q?J7gEFvSMhfqS16tyhGlZAdmNoNa4tWefHBOVMY9zFe1f9PK4eoTXihNzL/Tj?=
 =?us-ascii?Q?HuNBzn/bVeYKy+oyA6vjv5Xt5FdF8JYjJ1l7wZ64wvnw9YQ9zHrlOIFM03+Y?=
 =?us-ascii?Q?vg5rU2gI35wMkeexPvIUtcB3BQZikfWfv9ElPZNlbR2OLXX/NpPaADvKjlMI?=
 =?us-ascii?Q?2qbFl+9bcae8MgOJhRzGpD22AyN6fa9hoiO776E9nDxigMOt/7239GYuaphw?=
 =?us-ascii?Q?0SA9XR/x2K8ZufB+PgYIaIOA4rDwDoL9jXAdMjb61vRLEkOZIs8z181GOKW0?=
 =?us-ascii?Q?WK5jnPp9tuXdYRdBlJltB+aouehSgXXNCnmlgH4K9JSu1cnG+TDXuC03T7BC?=
 =?us-ascii?Q?H8a/nyzMjbi5emjoOu8iy8N9N2hHzBmBqesikbcFchzC8pUlrQstCd/lNtyB?=
 =?us-ascii?Q?kN3RmrOVo+iT/j40dFNV56eltglRTqFqPIMjH8FG4i6LwaQRas03wfje6gsD?=
 =?us-ascii?Q?26UKn2EIHsUk/ElXQkqYopzjvS5+cSJ/oGt45ZmlGlvMwaY6yM91A9G4dmGG?=
 =?us-ascii?Q?fzwxOw9Jug8ZhB7iFgyaZKiYc1rV3dNjVNr9+Ck0BxvzQzR2gExeP9QuKACP?=
 =?us-ascii?Q?vWcgyOuRCWj/l/edsD4TqUJNCHw9FFpAGfzZoWWWs8+uWBs7azbRbQokXym8?=
 =?us-ascii?Q?BezdbCrUGA/8OiJOlq0osig5glDpdAziHNzww3jWy6czwXK7yF+J+6BksCBN?=
 =?us-ascii?Q?L8upLWrHDZd5MsDVmAxzYhLVZiEkIjxy3DiMja4M9yp0NBE1b537WYT6DJ2U?=
 =?us-ascii?Q?+6d5H3gEG/Pc2n2wyk+TpLao/ejN3mv28tCQ6v6sBhDW6ofDP7XQkcqdqX2l?=
 =?us-ascii?Q?/7Ad3fcbA3yIMeN9VyflY7vS7CmuPban7P2Hh4EiC2wkD7ugXOX6gs2TYbA7?=
 =?us-ascii?Q?/oJn0OBx++bUvlRElIKxKBktQzYa1dycxQGbcI/0wlyv1ckvDISrud9ky55m?=
 =?us-ascii?Q?aoiJdy2mryNiftMRC2ZAszEzjCY9RosYfPKLX9zCu06qUc9K3ozpPnn6AjIg?=
 =?us-ascii?Q?sq1wWqwQhiPaiPNP7ERL4mMphFH4yRRDZKKOedGmsZB8EBt51xlQGVvsvtSS?=
 =?us-ascii?Q?Instg+CKYGZkSQBa5VQ156WiWYhZlewEPWkOp6xgpSf/X91KiqjlvdONdbpD?=
 =?us-ascii?Q?ngZZxdUjlCay+0XqKIVcDl3ExuUN86rt7a3MEz5/Gr3nJnN7KO8EVMWoPkxi?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: addcfe78-4c03-49aa-2163-08ddb2ae1689
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 23:31:32.9525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fyKBMw9cTbkwrBBQuirn2ZsKWOw7+BzkwOekNRFrP9ZcisB9N7UUtG7ckE98HoAmtAG0eRQFPKXLanuVqpX9tsOqBBD5peNwUoIXC1SmK6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8111
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

On Mon, Jun 23, 2025 at 05:12:05PM -0400, Rodrigo Vivi wrote:
> On Fri, Jun 20, 2025 at 02:49:20PM -0700, Matt Atwood wrote:
> > This workaround only applies to PTL Compute Die A0. However, this
> > information cannot be determined until after the GT is brought up. This
> > means that we will assume that it is required for the initial bring up of
> > the gt. After GT init, the oob workarounds are enabled for the GT. Use
> > this flag to then manually set the bit in the soc oob bit field to 0
> > which will help performance after device bring up.
> > 
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pci.c        | 6 ++++++
> >  drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
> >  2 files changed, 7 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index ded0f3dc8d73..a624c3fb9498 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -34,6 +34,9 @@
> >  #include "xe_tile.h"
> >  #include "xe_wa.h"
> >  
> > +#include "generated/xe_wa_oob.h"
> > +#include "generated/xe_soc_wa_oob.h"
> > +
> >  enum toggle_d3cold {
> >  	D3COLD_DISABLE,
> >  	D3COLD_ENABLE,
> > @@ -890,6 +893,9 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> >  	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
> >  		str_yes_no(xe->d3cold.capable));
> >  
> > +	if (XE_WA(xe->tiles->media_gt, 15015404425_disable))
> > +		xe->oob[XE_SOC_WA_OOB_15015404425] = 0;
> 
> We are discussing this offline, but I need to make it very clear here
> that we should not move forward with this as is.
> 
> Two unnaceptable points in here:
> \
> 1. _disable. We either enable or we don't. If we need to wait for the gmdid,
> let it be and enable the workaround after that. GMDID should be one of the
> first things and I confirmed this workaround is so rare that in an a0 situation
> you could wait to only enable after you read the gmd-id and confirm the
> media is A0.

This is exactly what we *can't* do for this workaround.  The requirement
is that on any impacted platform, every single register read must be
preceded by four extra dummy writes.  There's no such thing as "early
enough to ignore" --- it's specifically noted that even pre-OS firmware
and such needs to be careful about doing this as well.  So this causes a
bit of a chicken-and-egg issue:  we cannot read the GMD_ID register
without having the workaround active on impacted platforms, but we
cannot figure out whether the platform is impacted until after we've
read that register[*].  We also do a bunch of other register reads
during early driver probe before the xe_gt is initialized enough to be
able to service workaround lookup queries.  So there are a few options
here:

 * Mark the platform as always being active on PTL, then come back and
   disable it later if/when we confirm that we're on a stepping that
   isn't impacted by the issue.  This is pretty simple conceptually, and
   is quite likely something we'll need in the future for other
   workarounds.  That's the approach MattA has taken here.

 * Add two separate workarounds in the driver: 15015404425_early and
   15015404425.  15015404425_early is an SoC workaround that applies
   unconditionally on PTL, and 15015404425 is a GT workaround that
   applies only on specific media steppings.  Both do exactly the same
   thing (4 dummy writes before any register read), but
   15015404425_early is checked before all early MMIO accesses and
   15015404425 is checked on all others.  The downside of this approach
   is that we'd need to use a completely different set of MMIO
   operations for early driver boot (i.e., no xe_mmio_read32 and such).

 * Ignore this workaround completely if we can confirm that it only
   impacts pre-production steppings.  I don't think we have confirmation
   yet that A-step hardware is preprod-only, so we can't take this easy
   path yet.

> 
> 2. Don't mix SoC with Media. If the Bug is SoC don't wait of the media stepping
> and check directly for the SoC that needs this. So, don't create an infra that
> already has an exception in it. And if possible, avoid the infra at all. This
> might bring even more confusion to the w/a handling.
> 
> This w/a in specific here is soc, but it is getting mapped to our media-ip,
> so let's use the media check...

I think more explanation needs to be added to the patches to clarify
exactly what's going on since it's still a bit non-obvious.  The reality
is that our modern platforms aren't actually "SOCs" at all anymore;
they're technically MCP's --- Multi Chip Packages with logic (and
sometimes hardware issues) spread across the various dies.  The hardware
teams still refer certain things to be "SoC" logic for historical
reasons, even though that logic is technically distributed across
multiple chips these days.

We absolutely need some kind of "device" workaround framework that isn't
tied to the GT and that can be used before GTs are even up; we have some
non-GT workarounds today that we're not really handling properly, and we
know there are more coming.  I think when this workaround first came up
I suggested a "device workaround" infrastructure and using the same
general XE_WA() calls, with a _Generic() implementation to lookup the
status of a workaround in either the xe_device or the xe_gt depending on
which is passed (with the xe_device workaround table being initialized
much earlier in the probe sequence).

Issues outside of the GT can live in different places:  the GCD die, the
compute (aka CPU) die, the IO die, etc.  Each of these have their own
steppings, and the MCP itself has a stepping too.  In some of these
cases, the proper way to determine a stepping is to map PCI revid into a
die stepping.  In other cases the proper approach is to "fingerprint" a
die's stepping by inspecting some other IP that lives on the same die
(similar to how we used to fingerprint the PCH back in the day by
inspecting the ISA bus device).  For this workaround the stepping we
care about is the compute (CPU) die stepping, and since standalone media
happens to live on that same die, the bspec tells us how to figure out
compute die stepping from media stepping (A-step compute die <=> A-step
media IP in this case, although that isn't something that's guaranteed
to always be true).


[*] An alternative to fingerprinting compute die based on media stepping
    would probably be to check the CPU stepping through whatever
    mechanism is used to print the stepping in /proc/cpuinfo.  We'd have
    to find separate documentation on how to map the numeric value there
    into somthing like "B0;" I don't know off the top of my head where
    that documentation would be but the core kernel guys could probably
    point us in the right direction.


Matt

> 
> > +
> >  	return 0;
> >  
> >  err_driver_cleanup:
> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index 8c2aa48cb33a..822cbff13819 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -71,3 +71,4 @@ no_media_l3	MEDIA_VERSION(3000)
> >  # primary GT GMDID
> >  14022085890	GRAPHICS_VERSION(2001)
> >  16026007364 	MEDIA_VERSION(3000)
> > +15015404425_disable	PLATFORM(PANTHERLAKE), MEDIA_STEP(B0, FOREVER)
> > -- 
> > 2.49.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
