Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC98C67861
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 09:49:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABD110FDA8;
	Fri,  5 Apr 2024 09:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TK8Sioyy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B4910FDA8
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 09:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712310548; x=1743846548;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wtW5K99VEIAG8aeyrFRfShc0MZO65aN8D0LTPXOK/mI=;
 b=TK8SioyylonIWnsFHjtnyb1qowea6FiuO+hIPig1Je+YGWwp3Y2yY+9u
 oIQ4hgrQcrItyUfc0srsoRZFVuWlRuMMjd6wgIWophJsPYeAvd3R9ZlhA
 E1+q3QzkQL4utlbUxOoIxKf3EEQRTJfXcnia2z/er81uLeB6S91fyg4qs
 qGu/Hc7vTD1Bp9hIq20R2KGzHRp6J3eogXVj/CbpYBHsQm6UqELfdKyEG
 nxMBTHkitg2luJ1eYwAywvHTVIRC4DigAx9vawa22E7u8H3DQ177/zocU
 y1xr6lA3LM6lryM9bq9cesYsGTXAMwyU4ETKWEmwF7ndEQvmUm2FDVyZt A==;
X-CSE-ConnectionGUID: PpW9+T0+TS2nysW49gvmXA==
X-CSE-MsgGUID: r2CdFm2YRGuxPcgKD+147g==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="18195649"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="18195649"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:49:08 -0700
X-CSE-ConnectionGUID: Rv85IUsQSM6+cyielygnkQ==
X-CSE-MsgGUID: QmO/IdPgTFaf0cWcVE3MVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19187053"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 02:49:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 02:49:07 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 02:49:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 02:49:06 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 02:49:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOS/4FJzzafAWiVXcOUTxA01EVQUdSTAzYFNUEfZnv9DwxvSUlnmST2XAL50lQgD01s5Sm7/B4o2K8M3fRPu4AS2WxfuGvvpozpW8WwP3EnrLmZFFE7/cWoNfxzKhL0ODJTJuGsFJf8lk5Xh/zD4LiK4GhwdZo7ld/p3zs/DmSU/pTsTByTkbXkFzEo918wXU8ootO1VwzHHI3lDT/OiIYhdETdi9xB5XKkdl3ZpotzTwT00cw1gXx+kROEJ53fX3GcW3/uO9G6y0eSAejKAL1bBuowjwr487emHupYpNLHzy+MLAeYEpAXjQIJYNWTvlMB2FFwy+4dbaIvjZk+6Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31Sywby9VK+bqZGISBavszNi/uH/QLXWpsqcSD9BbiI=;
 b=QVLnY7PPV/s5P3hz25K6ffZKi8kyW+PulCmzGNbNT+AUASmZfsXYhJSERs5mOs3D69mg7g5NSdNJNW9vPviCkas4fR7B6jbwlx9EluSR1l1iR4n2C1ey9IapIuR8NcyLJ5Z2oyKwNYQGEcwqKCd9TMBC/Tj4p1zQmMSscvQYUF3BSvJTc0VoUK1HsKghGUtJa7MDMhrqogV7xDlQ9cLIDUPdROUitaalUmAxYQHEHHa9EsHZwwDi7YzOnrwjUDi+hi/5il27wxPM5rSKrFcUb2AQij9WjKRzz1WPz/1xRtpBpb1g39Ny/zBnrpd13GR1scXh8D4xm71GcT88cCD9Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Fri, 5 Apr
 2024 09:49:00 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::bf52:bbe7:ecec:9952]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::bf52:bbe7:ecec:9952%5]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 09:49:00 +0000
Date: Fri, 5 Apr 2024 15:18:32 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 06/11] drm/xe/xe2hpg: Determine flat ccs offset for vram
Message-ID: <Zg_I3KaYBoM78zAb@bvivekan-mobl2>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
 <20240402124724.1238122-7-balasubramani.vivekanandan@intel.com>
 <20240402143053.GD6574@mdroper-desk1.amr.corp.intel.com>
 <Zgz6Si0AaY2A8x8c@bvivekan-mobl2>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <Zgz6Si0AaY2A8x8c@bvivekan-mobl2>
X-ClientProxiedBy: SG2PR03CA0126.apcprd03.prod.outlook.com
 (2603:1096:4:91::30) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|MW4PR11MB7164:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u0mzwswW9j7SE7VqL/roH+Scq4vnDU/8tJ+g1/s/93OjFwiSJaRHqPHcXc0hRAt4I+W8tRpXuNQQ81adK7ywSLfZwN1Oh43ZH8T+WaLQ88vT65/dxz+nLTv5+MRihp5ywIhaXXduXnNzd/jbE662N91CLhk6Pjlq4X4YFn3Dyb2jTz54tZZ4unkZqesxB+EfiGn+T5BmdugHEy/jUQZWVsYdylMqlgxF8Y3BwIF5ouTNru84HapF4SuG9SThht0v+3kgSqdDbtKB+Xzsz/sliXHk70e79RQ1ATBEsCoWBMLvFgjzVZSIFEBPHaL33IPrjwFKZ8AI1MAol/+cMZL5chJ06R0XVRtQJNSe1n7vPFfmpgY9dxqehbHcUwEwHJrNm/UcjUCAkWunh7zgZvxbPL0jMxSts0fDJA0YoY6YtVNvndYywSrc2L+cU2MAnAhI4jsrjUSu4S5yhn0l0+w3x01rK6SgFNGHCVl8TTY1vSaLeJ3X1j1iCaLYo4b6ZF6ydaXMIhUXTDYYfvPN4L6zH9HezU5LMoga7sLMrGJEaKWzcO95ZjJ8BMtCv4MkkyuWjQ7X0Ie/IH+Ot5fmPfHvHmx553ztA9KiL4UzpsxgmWzVY+QfEVJ3tRfKhYOVi7Q9aenq5x3ml23P6u9HDYCee+ZyZPPc1IRM5Df2PdQZnuw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm5uWlJoUUpENTJLUVpOOGEwZXZNdTFhb3IxaWFMa212S1BNZHNObUgwUVhn?=
 =?utf-8?B?emRiNytocXpHUEREV1VZdS9PdXMrenQ0eVplYUhqNkhON0xrRGM5Rkc5SkFl?=
 =?utf-8?B?QU1YTkFLb3RsRVpaVklqS3k5VTJpNUFOODlYQVovNkh3MnZiSjVxYVJXQS85?=
 =?utf-8?B?aFN5azZKVDJUYWdTUUtwMnIwSHBmZHpHUWhHL0x0VFhKak1yRkpNeks3dUtk?=
 =?utf-8?B?bzZKVnl3SFNxZ3VscnJ0VmhXaWxUbTE2UW1Rd293bGFjU05HcGhvTS9NVmVB?=
 =?utf-8?B?Y0NDS0dyVWlZZFJTQmRvMGYvWlltaXN6K3cxT1JiUERJbkJzYkcyNlVJUzZp?=
 =?utf-8?B?N05aK21WdS9EczMxZDVhalA4KzQyY2I1S3RYeVZJVVJJSWtTNzJqWkFicy8v?=
 =?utf-8?B?SFprRVM1dy9FRWNNSFR6TFJ4Vk5mTVB6dGFqcmdZdk4yZjVpR05vclc2L2xZ?=
 =?utf-8?B?RjVya0lDOFFEMGI5MGo1cWtMZThqZ0srTjJCWmMxbG1hQWZVZFZRQXN1UHJZ?=
 =?utf-8?B?MjVvTzdXdno3RmxKNzEyc2tVNHJTNisyVmlyam5mWDZIZ00yUk9ONnhkYUx4?=
 =?utf-8?B?b0htR0hPMFlxcjRIL2tUTXdtZDNVc2xTNUJ4WGRHTjRrcnJPZWZZWmlUT01Z?=
 =?utf-8?B?SGkzTVBvMDJ1ZWtqM0EyUm9TSS9KVDIvTmFaZ3VOL2hScDB2STJNQ3pHakRX?=
 =?utf-8?B?dVdZSzFOcmFCNVE5ODV6L2oxeXRzdmtqbWZ5TTFIODZMTXRGZGpRVEhnMGFW?=
 =?utf-8?B?U3JxT1J0RW9pdlFwciswSURtOWtGR3ZyYTNDODBwYjV4TnpSa2JqMXluM1ZF?=
 =?utf-8?B?elRvU2pGZFZFL1lqTXBUMXBDckZaSGpWOXVNTFVWcDJaYkNDME16U2h5MXc0?=
 =?utf-8?B?MlJKQzFncmxMYmh6TXFSNU5zV3YzUVpSRThIQVI0dWx4dXhqdjFBb0hRTlo3?=
 =?utf-8?B?TDE2dnU3azI5VVhlM09FOHdxaEpFT2xVUWNDdFpVLzdYR1dhWktxcHloWC9G?=
 =?utf-8?B?WXpKd09rK2RaQ3U2WWpWU2FoaUNYSVZKS1JMZEZBbm5UaXpzc0YyNjFRbzNY?=
 =?utf-8?B?bU0vZ1d1TEJxd0NBVDJkaTNRd1pjdGpCRDdIdm9JL2l5MjhYY3ZSV292dzgz?=
 =?utf-8?B?bUxrQU9mUWEwanNOUHg3d2trL2Y0RHZjL3IxbWk2MkRoTUU4TWZZWWtsNGFB?=
 =?utf-8?B?a0lYWDhTMi9yV3JMNGdGK1M4aU5yLytodHhjS1l5Y05QaUt3MU94TEdpcDFo?=
 =?utf-8?B?b1FBV2NhOWtLdGY3aENoRWc4anFucE9aOWdlaldjZEJ6RnhpaTN4amJLd3JU?=
 =?utf-8?B?TSs4S0QyM2lWV3dxNmRHRkVvNTEvN0tha0RuSHdvc3JGbm1kWlNPWU1EL0x5?=
 =?utf-8?B?UVF3QmlnYXpzQ1RmSUwyMFh2ditqOU5TOGxMT0cyNTJVd2dZU0xmdGlIZVZE?=
 =?utf-8?B?N1NUK0VFNHMyZlc1NUJjRENlRzZYYXNlaXZTZlN2THAxOFk2VjFNckhwSEg4?=
 =?utf-8?B?TG9aZjZiaStBNGJPeVJyR0MyVmMvR3Vwd0dBYkpzazRveUkxMnhVTTlFWmFL?=
 =?utf-8?B?SnpacG5SYTlpN3A4OWs5N1V6TFlUR2pmODhCZDZxVFdCYTFxTVpEZ0xoRWI2?=
 =?utf-8?B?S1hLQVB2NitPQ0hhODdGeUt2dE5rT2N6UG9SUjZGZHJadUJaVDl5R1VUZnNo?=
 =?utf-8?B?L2RRcGRaQkhjRDZkNzdtMDZvYTc5UkwxSThZY2E2UWdkU3hrTzYyc1lSQ25m?=
 =?utf-8?B?T1ZSV2pmeFh2NGgvWXEyT0hrRGRBOC9LQU9ieEMyaVIvTVNlVVRMYXZ0RXFx?=
 =?utf-8?B?eDA2TWJhUUNHRk41dmlFMmNlZkRGVFF5VStWd2hLZTRkVTg1cW5NMnJKemdm?=
 =?utf-8?B?U2U2RXJmL2RsNUN2WHpGbVMyL1REZDF2cHRxMkhmWjdGZXJBcXg3aGc3dUFU?=
 =?utf-8?B?KzVlaXN0ajBwWFVzMkg2YUxQMklzY0x0YmZRSWhrMXNhVW8zWnVpMFNzUE1u?=
 =?utf-8?B?RzFjbFcwVll1aG51dTQ4NHh1NnpWTkxId3o2T1BtUzZmbm9rV2Qrb0dsOFhR?=
 =?utf-8?B?dDZmblVSWURpKzdNbUx2eTVuUkUxYXhKai93UWpOQlZEMU95S1h0VzFzRklj?=
 =?utf-8?B?bnNiYnpLSVBSdTEvbThkcytRc21EUGhOZ0xGd2phcGpYcWd4QW1xU3BsamlF?=
 =?utf-8?Q?TLBzGDV8fs8xywcct1qw/KI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c78a80b-aab8-433f-a93b-08dc55559e3e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 09:49:00.0793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2AkWvl0FefBPVCJ3s55mhWAtVqivzw9JYLlkHV9rN5LOzeVEMNJFHAdAtJLITRmaB5yC46b7PxQs4JNMo3s+ytKM0Oa4cUtI8tSJrpoK3sdTBrzEkwN6rgwdJxbi56p1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7164
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

On 03.04.2024 12:23, Vivekanandan, Balasubramani wrote:
> On 02.04.2024 07:30, Matt Roper wrote:
> > On Tue, Apr 02, 2024 at 06:17:19PM +0530, Balasubramani Vivekanandan wrote:
> > > From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > 
> > > on Xe2 dgfx platform determine the offset using Flat CCS size
> > > bitfield of XE2_FLAT_CCS_BASE_RANGE_[UPPER/LOWER] mcr registers.
> > > 
> > > Bspec: 68023
> > > 
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  5 ++++
> > >  drivers/gpu/drm/xe/xe_mmio.c         | 39 ++++++++++++++++++++++++++--
> > >  2 files changed, 42 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index d5b21f03beaa..ea75c1f0ebd0 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -69,6 +69,7 @@
> > >  
> > >  #define XEHP_TILE_ADDR_RANGE(_idx)		XE_REG_MCR(0x4900 + (_idx) * 4)
> > >  #define XEHP_FLAT_CCS_BASE_ADDR			XE_REG_MCR(0x4910)
> > > +#define XEHP_FLAT_CCS_PTR			REG_GENMASK(31, 8)
> > >  
> > >  #define WM_CHICKEN3				XE_REG_MCR(0x5588, XE_REG_OPTION_MASKED)
> > >  #define   HIZ_PLANE_COMPRESSION_DIS		REG_BIT(10)
> > > @@ -141,6 +142,10 @@
> > >  
> > >  #define XE2_FLAT_CCS_BASE_RANGE_LOWER		XE_REG_MCR(0x8800)
> > >  #define   XE2_FLAT_CCS_ENABLE			REG_BIT(0)
> > > +#define XE2_FLAT_CCS_BASE_LOWER_ADDR_MASK	REG_GENMASK(31, 6)
> > > +
> > > +#define XE2_FLAT_CCS_BASE_RANGE_UPPER		XE_REG_MCR(0x8804)
> > > +#define XE2_FLAT_CCS_BASE_UPPER_ADDR_MASK	REG_GENMASK(7, 0)
> > >  
> > >  #define GSCPSMI_BASE				XE_REG(0x880c)
> > >  
> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > > index 5d13fc7cb9d2..49a32b03fcf8 100644
> > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > @@ -163,6 +163,42 @@ static int xe_determine_lmem_bar_size(struct xe_device *xe)
> > >  	return 0;
> > >  }
> > >  
> > > +static inline u64 get_flat_ccs_offset(struct xe_gt *gt, u64 *tile_size)
> > 
> > It doesn't seem to be necessary to pass by reference for tile_size.
> Correct, I will change it.
> > 
> > > +{
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	u64 offset;
> > > +	u32 reg;
> > > +
> > > +	if (GRAPHICS_VER(xe) >= 20) {
> > > +		u64 ccs_size = *tile_size / 512;
> > 
> > This value only gets used for the assertion below, but should we be 
> > taking the value from 0x8804[23:14] rather than deriving it from
> > TILE_ADDR_RANGE?
> The intention of the assertion is to verify if the flatccs base address
> provided by XE2_FLAT_CCS_BASE_RANGE_* register pair results in flatccs
> size which exactly matches the tile_size/512. In other words, it is
> validating the XE2_FLAT_CCS_BASE_RANGE_* content. 
> Therefore getting the flat_Css size from the
> XE2_FLAT_CCS_BASE_RANGE_UPPER(0x8804) itself doesn't seem to be the
> right approach to me.
> 
> > 
> > > +		u64 offset_hi, offset_lo;
> > > +		u32 nodes, num_enabled;
> > > +
> > > +		reg = xe_mmio_read32(gt, MIRROR_FUSE3);
> > > +		nodes = REG_FIELD_GET(XE2_NODE_ENABLE_MASK, reg);
> > > +		num_enabled = hweight32(nodes); /* Number of enabled l3 nodes */
> > > +
> > > +		reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_LOWER);
> > > +		offset_lo = REG_FIELD_GET(XE2_FLAT_CCS_BASE_LOWER_ADDR_MASK, reg);
> > 
> > This register also appears to have a general "enable" bit for FlatCCS in
> > bit(0).  Should we be reading that to make sure FlatCCS hasn't been
> > fused off or disabled by the IFWI?
> yes, makes sense. I will update the patch.

While reworking on this change, I found that driver is already reading
this setting in the function xe_device_set_has_flat_ccs and updating the
flag has_flat_ccs.

Regards,
Bala

> 
> Regards,
> Bala
> 
> > 
> > 
> > Matt
> > 
> > > +
> > > +		reg = xe_gt_mcr_unicast_read_any(gt, XE2_FLAT_CCS_BASE_RANGE_UPPER);
> > > +		offset_hi = REG_FIELD_GET(XE2_FLAT_CCS_BASE_UPPER_ADDR_MASK, reg);
> > > +
> > > +		offset = offset_hi << 32; /* HW view bits 39:32 */
> > > +		offset |= offset_lo << 6; /* HW view bits 31:6 */
> > > +		offset *= num_enabled; /* convert to SW view */
> > > +
> > > +		/* We don't expect any holes */
> > > +		xe_assert_msg(xe, offset == (xe_mmio_read64_2x32(gt, GSMBASE) - ccs_size),
> > > +			      "Hole between CCS and GSM.\n");
> > > +	} else {
> > > +		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
> > > +		offset = (u64)REG_FIELD_GET(XEHP_FLAT_CCS_PTR, reg) * SZ_64K;
> > > +	}
> > > +
> > > +	return offset;
> > > +}
> > > +
> > >  /**
> > >   * xe_mmio_tile_vram_size() - Collect vram size and offset information
> > >   * @tile: tile to get info for
> > > @@ -207,8 +243,7 @@ static int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size,
> > >  
> > >  	/* minus device usage */
> > >  	if (xe->info.has_flat_ccs) {
> > > -		reg = xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);
> > > -		offset = (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_64K;
> > > +		offset = get_flat_ccs_offset(gt, tile_size);
> > >  	} else {
> > >  		offset = xe_mmio_read64_2x32(gt, GSMBASE);
> > >  	}
> > > -- 
> > > 2.25.1
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
