Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D029FCD98CE
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 21:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3E810EB78;
	Fri, 12 Jun 2026 21:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXnUMj/R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1790110EB78
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 21:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781299549; x=1812835549;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1Dnj9J2SoJN3aQGylwtM6RM58+Phwhs8z71XhGxvbFQ=;
 b=PXnUMj/RHx4rDOyAPiBeu563qQj8CEPnK+YWUDLv6L/DE6hJnfQsYeuA
 HiVqN6Vvm9PZ0TUZvkVaX1HszpZmCzSb0QyZf647puZlbvEos4W9GyiL/
 cpvIHT0ZFSEQ4eik1Gn4VWcxTouNY08GBipMF1cgh5VTHP1lG4s1H+nBu
 VUAsJuct1YFuUb+rOgFEjSjsKwN+Ar4gxI4aBn80dmByR11k3jyC+skZG
 /b9YuVAqO5MmD93CJF2Xbkqq9B2ZlFLGZR5xfNw9csMHXTnNoVUJH57KW
 k5n7E//du8FenJiiBsbCkCyAMwQu4aG2GwS9M94EHDk/qphvCViQrUQOU w==;
X-CSE-ConnectionGUID: WEiuRJKYSJyUBuNdQw0wuA==
X-CSE-MsgGUID: hmgQngYHSFetLM2mwMnwrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82045488"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="82045488"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 14:25:49 -0700
X-CSE-ConnectionGUID: HEJvyo1yRlGmb635MGy/2w==
X-CSE-MsgGUID: FsPqBalySCi1id2hO0kQ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="246945778"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 14:25:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 14:25:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 14:25:48 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 14:25:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+9mYMjID/C3jL74fyl6zT95AVurWejKLQ6IDR2DKGjmgLk/LBVaSiPqZPAUrbE4SBlelqbNhkJCU4lZUJwLv0sv53hIPn52qTBeDoR9etdjq/GYQDnrQTQS7HK5DP4hztSYkkplJa0Zr+ob2oYmrhyVEX63U0moIxge3A2wfbaLy5cF3I870XkHVjJrcU839W9UwGCJO0Nfcfy0oOy/8kIJvDc1DMxHxXf47oJb+U/dtNNPCjGzkcB5DuwLaF+uXrc35N3sokV5Qt5lVgqq7Mt1sI7LqiDDFsKH7qYcSQ+M0+HjpWdW1sVZSm7H2BZjGmpz4LOM6ws9zZ2GBd9lww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqFIERJP0zPPjZU3SbxkuDZih8ZsMqi5GwCuBSGneJ0=;
 b=N1FUq2Fq4P8b5rUiITGRTKstsNCdVx32MkH86rfNAvw63LTXTOhHek5d7F81ZEWkyp5Unpi2WCzufmOyqq22aiPegLAEawbF56Uf1PgqRzUZb1lAEVar7hsY8PO8VTGaujN/SLU+U+qOzVQOQH+QBEXRGD4zDNJt2BC6XcgdtaOmwJ1MWJNN8vaGfCzN1G4VL/3avmV/oOQbiYXQXb7szPBgWpUaHcBdNyr9WKodjM3tp/rDqh7+soNXlvWTVv1rSc5xGjvJdy4D6xQrJyc2VO0aepbhb+PVU4fh2HAul5k8ya+1ig4E0LCkeYMEfDLpcGYn8zHdvlfr/nq6rYKPZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA3PR11MB7528.namprd11.prod.outlook.com (2603:10b6:806:317::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Fri, 12 Jun
 2026 21:25:45 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 21:25:45 +0000
Date: Fri, 12 Jun 2026 14:25:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/xe/eustall: Add workaround 14027094826 to
 graphics IP 35.11
Message-ID: <20260612212543.GJ6214@mdroper-desk1.amr.corp.intel.com>
References: <04a98a6d8566eabd96fbaa23cbc8545841863a8c.1781220263.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <04a98a6d8566eabd96fbaa23cbc8545841863a8c.1781220263.git.harish.chegondi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA3PR11MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c265ba6-5785-4142-aaf7-08dec8c92a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: TXYDV9X/E0v6GEfau83qeF3barRmvEHau2qpa2izmSOycKnOiVLrFODo/4wLzsdJdenqPZpOKjvKY5COVkCLHdRFOsfBVBFvs9i2BLFNH4miYyL1QAzolV5D52S+3GUmOua0zNOui9sIp+ZUg337+MPsQKFZjPtKdjeii/I+6DNfWI51lhXpCIbuMXAKhb1LTWIcDLIBb+M7VAFP6hYGsErw+LFqJ8ZjPoh3oQBjFaY4XdKWdZnQkTdZdEAYdMd9P3Gl7t0GSFV8drTER0sVDT9qczCDYHQIG8Ymfw+qji+KtYOhFgDGbz5bMC41Z1NOygegU9nWsJSQzI51OADo0QwiU6UxhcRz1OfYK/82hReuqtkSgAG+vxWw7WF7mNcp+KXy2cUOgq0yO7YxRypkY2lEDfUj2lGD/o1pxWTTT4lUT+nHz6ZkQEIS3EPoWbQ4aXYnNH90YvLHa6bXbkUmewNrScE4gbNVrUR1hhdvYqkTUG08TPeT1LiWl/bhJZg3xijYbPVjEuw0D21NTWlU3iKTK9rhnyVVRKPfiA9QIBPToVBmM8sQuD8+bEPNSNmF0oc1UeAtwIysa2GB9Uv7dEO2oJvWkAWKBgaqdflM2tMXR4PB/L4L7dvg1QiLYm7iH7aEjPSdej3FkFVHJ7Nw/NQKVsOb0Zc3KH0MkSf+vSXjUWvJZpWh9l0yGfrzMRtY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OWalPANPF2jBf9z3dmd3xVPdJxiyEml9oTg+nnq5Da/JUla5zvuyTw8VCTww?=
 =?us-ascii?Q?lSMDfwBjauSm5SnXWqafZaZ7rzPlXzrz0gY+vCmwJ6KYgGHxd9/dlGjHnxdA?=
 =?us-ascii?Q?kiDBo+SR2JEv5IcEde8pWa7153RFi2bu6yJbMFSAac2bWPBwKuW0KaoXanMm?=
 =?us-ascii?Q?mc0/eR39YDz/08hP4VwmafqI32832/gXExh+7mNUv0H9bBMi4YldYHYGbACs?=
 =?us-ascii?Q?yrvH80Ec8sHqKX/Jsp1xWxSZXD1A5/h4Vx83KEzW+04rxXzwVCpirJ0TeeNf?=
 =?us-ascii?Q?NaOZMgq9iwwN56bds0FQXcyqKiyYLxF10eKcTmr1yjod2TTW3RKnjBp1+Vmt?=
 =?us-ascii?Q?zGYa1QOEd0XcaascMQ/VsucLiGRkYacqBGhQ5giJEnZhcLC5/PyRmdHOJuZ9?=
 =?us-ascii?Q?kHQR0Q9rHbWksFBZq4tmP5otaoXWa2nlMClVqdRVvAIWZDppxFL+Kl0Wqxf9?=
 =?us-ascii?Q?GUCAddh4wPB010hjG94F0P9O5vkcMsM7isp1fbkOAk6IfGla14t9d3/w2GQv?=
 =?us-ascii?Q?HE9lr3OLbBQs0Vp5NeFY7mfFG/cNY5riyl5NVSzokM412ivJ04EeyWmLENb/?=
 =?us-ascii?Q?wQQwCkwY9qytsdD1vfD05XVIx2dNWhjYoeQQ9yvTRdQ7jipJWeBkl24OkP4A?=
 =?us-ascii?Q?ofqhDiz63lQ2NL+wgOinW0sNxJlv6wxv/1gB7v9B/0LZ6l+senF3v7YVeZHM?=
 =?us-ascii?Q?HluDwmPyE2vliRyTWYfyhS7gXyW7azeikENFZ2NTcbmxnkwZsNnMyxjzXxW1?=
 =?us-ascii?Q?qDBlhMsI8QPefy1sAx51LrnomwEJKow3s82QfWMvmcnHIp6ASvVPIT4EURVN?=
 =?us-ascii?Q?/cjj1jwOKdnb1hm9ICTBRmnwmOjMLtfhv1Nn7qSlJRnq6KxSRBj7PooQABsw?=
 =?us-ascii?Q?x5M2EsDLSZUif2YCCbgz8jbdgWwwW5Dhmx/k+UwHU1IcSmuv/RG8hJyfslHX?=
 =?us-ascii?Q?Mov3tJvxln46nJ7sMnJyT7YA4Z6w8EVKme9g4Xocl+wtt2EOh8EV43BgNEEx?=
 =?us-ascii?Q?ifBqib7jaJWKva4BbIyQpzP9wMemKRP7n8Yo/OGbWQ0j3jf/kXW85U57o7ie?=
 =?us-ascii?Q?ZF3Xv/ciB1K18mGYxlYSzzrLDGbufoOhauWmivXbNjGUuuAwmDYG52rMwxHs?=
 =?us-ascii?Q?rZpXKbljfswjpZ9zyst7REGshZOPL+ngwbyIWoRIpgF2k36ybfmNmi2KL4Nq?=
 =?us-ascii?Q?QcbJAx0A+F6/zfx7DilTwITIbTlFYSI9N6pcShZZVRK9RWicTA/jj7og6GgO?=
 =?us-ascii?Q?aGVcMQklWJNXgyIBNvlGwS37vR9VWhlXzGhCJQlOMYSLekP+kAgJyOARpEMc?=
 =?us-ascii?Q?Lqg7Z8/3HTQhKI5lnlQW8tRcw8KAaO/S/5y+z8nfVMt6/QwcIUSGzcOfjbcp?=
 =?us-ascii?Q?/PyrIDI9XAW4wBF20/hW0txagbq7IONriFIQblRKHmSW44e7F0qNyQE5503d?=
 =?us-ascii?Q?w7C59SfaPRtMs78iOZdKnYiRy+d4j54bWsfR4pt9CadW8WEcxQvgUBGvBHMI?=
 =?us-ascii?Q?zYZWnd104+jNMfMBPY81V24/MAVAZvVyR094PRfwmChCYJ8uYlBFx6ob2ZUB?=
 =?us-ascii?Q?O4rOlOVAp7YqPw/Z2Jw6TT9FSqYJW8p5bweNqowAXdt/ZpF4QPaS4OXKqdrI?=
 =?us-ascii?Q?+pJYJzWiib9zWRsopOgJfmZmSoK8ekBR9x1zPhp8eC1A6Utqr3XGTY6PLf+3?=
 =?us-ascii?Q?8TaNFc+nZq3LweDy8fCxdrRXMl7RJhzc/9gE7iGMVldrLP5qqIxdVu9sXiw2?=
 =?us-ascii?Q?q/TZR8e+InmGgEx3xNvWAgIj6NaGRXM=3D?=
X-Exchange-RoutingPolicyChecked: Y5k8SrmdwF53UdG0hY5hsggb372nhaBtLGypMocU6FjmEm1EaRUWu67AKJ3bsVjap/M3BwIruHuDpLWZdK3f1t4o9dUDAEAgDudUbpc0ja2e1t7u7j+KvJpNj3hguIYpGUUBGg4Ln0nxN+IsC/+r7AshDIiFS+62eme+jWY4o+/wN5v2fK865W+IMGnT8pmn8pEushXxQGz6brbnDOJtf8nIdRY4ELEFOHQt8BUk1/4g5scbqJyNn1PmOwuEjGycr1XT4WsQGMQ8CDSdZBJ0ca91LqY9XUjM7soagvoFSZUsvs0DVcT+xRct6+PNhcZtFrllK6uVQManoq62eAd+/w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c265ba6-5785-4142-aaf7-08dec8c92a15
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 21:25:45.5160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Arp9fxtNbjLYlC0TlNd9yFZ1mV4nf8wagOsb/ogkvqAaVNYiWvKJ9fyNisFYoTWf/o3o00Pfo2oct3eLAtv7lG6As9vcD7UgB7ki0dpVLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7528
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

On Thu, Jun 11, 2026 at 04:34:27PM -0700, Harish Chegondi wrote:
> Before enabling EU stall sampling, write 0x20 to the SWF scratch pad
> register. When the firmware sees this register set to 0x20,
> it applies its part of the workaround and sets the scratch pad register
> to 0x60.
> 
> Before disabling EU stall sampling, write 0x40 to the SWF scratch pad
> register. When the firmware sees this register set to 0x40, it reverts
> its part of the workaround and sets the scratch pad
> register to 0.
> 
> Bspec update for the SWF scratch pad register is still pending, but has
> been confirmed offline with the firmware team.

I think the key point we should try to get across in the commit message
is that a firmware component, not the driver, is responsible for the
actual implementation of this workaround, but that firmware needs the
driver to notify it whenever EU stall sampling is being enabled/disabled
so that it can do the necessary actions on its side.  A specific
register is being used to communicate requests/acks about the
enable/disable status between Xe <-> firmware.

Hmm, what's actually documented in the workaround database right now
says that the Xe <-> firmware communication is supposed to happen on
register EUSTALL5 (i.e., 0x53c[9:3]), not the scratchpad register we're
using here.  Is the workaround database's description outdated?

> 
> Bspec: 53188
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  3 ++
>  drivers/gpu/drm/xe/xe_eu_stall.c     | 46 ++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
>  3 files changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 08251c7a1a4b..b86050503c4e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -616,6 +616,9 @@
>  #define   CCS_MODE_CSLICE(cslice, ccs) \
>  	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>  
> +#define SWF_SCRATCHPAD				XE_REG(0x4f000)
> +#define   POISON_SUPP_MASK			REG_GENMASK(6, 5)
> +
>  #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
>  
>  /* Applicable for all FORCEWAKE_DOMAIN and FORCEWAKE_ACK_DOMAIN regs */
> diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> index d37770c58c5d..4d0f97ca4cdb 100644
> --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> @@ -7,6 +7,7 @@
>  #include <linux/fs.h>
>  #include <linux/poll.h>
>  #include <linux/types.h>
> +#include <linux/iopoll.h>
>  
>  #include <drm/drm_drv.h>
>  #include <generated/xe_wa_oob.h>
> @@ -20,6 +21,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_topology.h"
>  #include "xe_macros.h"
> +#include "xe_mmio.h"
>  #include "xe_observation.h"
>  #include "xe_pm.h"
>  #include "xe_trace.h"
> @@ -682,7 +684,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
>  	struct per_xecore_buf *xecore_buf;
>  	struct xe_gt *gt = stream->gt;
>  	u16 group, instance;
> -	int xecore;
> +	int xecore, ret = 0;
>  
>  	/* Take runtime pm ref and forcewake to disable RC6 */
>  	xe_pm_runtime_get(gt_to_xe(gt));
> @@ -693,6 +695,26 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
>  		return -ETIMEDOUT;
>  	}
>  
> +	if (XE_GT_WA(gt, 14027094826)) {

It looks like the actual workaround number (i.e., the lineage ID that
stays constant across all releases a workaround may apply to) is
14027054324.  So we should be referring to this as Wa_14027054324, not
Wa_14027094826.


> +		/**

A "/**" signifies the start of a kerneldoc block and this isn't
kerneldoc, just a regular C comment.  Same for the next one below.

> +		 * Writing 0x20 to SWF register will signal the firmware to suppress
> +		 * poison propagation.
> +		 */
> +		xe_mmio_write32(&gt->mmio, SWF_SCRATCHPAD, 0x20);
> +		/**
> +		 * Firmware will write 0x60 to SWF after suppressing poison propagation.
> +		 * Wait until the SWF value turns 0x60 before enabling EU stall sampling.
> +		 */
> +		ret = read_poll_timeout(xe_mmio_read32, reg_value,
> +					(reg_value & POISON_SUPP_MASK) == 0x60,

We don't really need any mention of "poison" in either the comments or
#define's since that isn't relevant to what we're implementing here.
We're just conveying EUstall's enable/disable status to the firmware
(and waiting to get an ack back); whatever steps the firmware takes to
actually implement the workaround is outside the scope of the Xe driver
and trying to reference them here just causes ambiguity and confusion.

> +					1000, 1000000, true, &gt->mmio, SWF_SCRATCHPAD);

As noted above, the workaround database is mentioning a different
register (and bitfield) than we're working with.  But even if we assume
that the information there is out of date, we still need to make sure
we're handling our reads and writes in a consistent manner.  The write
above seems to be assuming that this communication is the only thing
this register is being used for (so it's fine to just write a 0x20 which
will wipe all other register bits back to 0), but the read seems to be
assuming that other bits _are_ being used for other purposes and it's
masking the value to just extract two specific bits.  We should clarify
which is the case.  If this workaround's communication channel isn't the
exclusive owner of this register, then we probably need to be doing a
RMW of the register (and maybe also ensuring that we aren't racing with
other register updates somehow?).

We should also probably #define the 0x20 / 0x40 / 0x60 / 0x0 magic
numbers with names like {REQ,ACK}_EUSTALL_{ENABLE,DISABLE}.



Matt

> +		if (ret) {
> +			xe_gt_err(gt, "Time out while firmware is disabling poison propagation\n");
> +			xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
> +			xe_pm_runtime_put(gt_to_xe(gt));
> +			return ret;
> +		}
> +	}
>  	if (XE_GT_WA(gt, 22016596838))
>  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
>  					  REG_MASKED_FIELD_ENABLE(DISABLE_DOP_GATING));
> @@ -730,7 +752,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
>  	reg_value |= XEHPC_EUSTALL_BASE_ENABLE_SAMPLING;
>  	xe_gt_mcr_multicast_write(gt, XEHPC_EUSTALL_BASE, reg_value);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static void eu_stall_data_buf_poll_work_fn(struct work_struct *work)
> @@ -840,6 +862,8 @@ static int xe_eu_stall_enable_locked(struct xe_eu_stall_data_stream *stream)
>  static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
>  {
>  	struct xe_gt *gt = stream->gt;
> +	u32 reg_value;
> +	int ret = 0;
>  
>  	if (!stream->enabled)
>  		return 0;
> @@ -853,11 +877,27 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
>  	if (XE_GT_WA(gt, 22016596838))
>  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
>  					  REG_MASKED_FIELD_DISABLE(DISABLE_DOP_GATING));
> +	if (XE_GT_WA(gt, 14027094826)) {
> +		/**
> +		 * Writing 0x40 to SWF register will signal the firmware to enable
> +		 * poison propagation.
> +		 */
> +		xe_mmio_write32(&gt->mmio, SWF_SCRATCHPAD, 0x40);
> +		/**
> +		 * Firmware will write 0 to SWF after enabling poison propagation.
> +		 * Wait until the SWF register value turns 0.
> +		 */
> +		ret = read_poll_timeout(xe_mmio_read32, reg_value,
> +					(reg_value & POISON_SUPP_MASK) == 0,
> +					1000, 1000000, true, &gt->mmio, SWF_SCRATCHPAD);
> +		if (ret)
> +			xe_gt_err(gt, "Time out while firmware is enabling poison propagation\n");
> +	}
>  
>  	xe_force_wake_put(gt_to_fw(gt), stream->fw_ref);
>  	xe_pm_runtime_put(gt_to_xe(gt));
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static long xe_eu_stall_stream_ioctl_locked(struct xe_eu_stall_data_stream *stream,
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index f8a185103b80..293aa83feca7 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -65,3 +65,4 @@
>  
>  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
>  		GRAPHICS_VERSION_RANGE(2004, 3005)
> +14027094826	GRAPHICS_VERSION(3511)
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
