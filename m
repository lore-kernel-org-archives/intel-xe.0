Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37F9CD4F39
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 17:43:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C1810E3D8;
	Thu, 14 May 2026 17:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VHfb9RgO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B76210E3D8
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 17:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778780581; x=1810316581;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=V4whza4xVH2vvQRYGThr917HrKsy+H9sOarB6dRRB9U=;
 b=VHfb9RgOkmauEdHoEAAUaO0ULdr5U+qQPQg5+vseH9rIA/8uyZkxLJOb
 mvNwqRdmV4nhDFXSSk2u6uzdQqJoGXJjRV4y5axO3x0ksRebtRe//A666
 4ddaIeMW7goAXRdFrcIgWWdWl52OM49RfayRrNYlblx7KU678bXlbljgW
 oIWZIjFJfZPBAJvB86uu32WTGUl4dLRwn5ZJcm5NGimuo7K3VImmewVH+
 yRCSuRRjh9Gb0t2CBNtm+5WgNsVmj3BYjPEiUsmU7DoOIKYmCqFkce+OD
 jebRf+1Hyc5pForCcBwcRYKvknBSMHh4YwJk7ouzuZKdXacRk4nKETpy7 Q==;
X-CSE-ConnectionGUID: JakQHT9OQG2/AABAhdVEUA==
X-CSE-MsgGUID: txLXEc2wQGStdkx7K2AM8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83344014"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="83344014"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 10:43:01 -0700
X-CSE-ConnectionGUID: H8dMBuTiRpq77zf8UAcHdw==
X-CSE-MsgGUID: XbzG3M8LQ+WsuR6EEuwhbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="234017770"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 10:43:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 10:43:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 10:43:00 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 10:42:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFykZ7N6K3eDy0+0skrM8ekcS3C8GcsVDXvwBt147JfheiL1PySIX86w8hGhIQR/rQzTxluliLqTV5fjpzqi4Kaj6Q1KMRpL7HqTAS7mIXvbX+rCoF3bifPUp0vhJNjZM9c/WkKIXr7wvsOmU3NBRA8OkvtjLaSxFTyAI5PsKf6jwaIjcj5P07P29wEsIcq/9Dto88R9t3fVUjVajip6bskEis0kaQABIpyCwjEqznT9+DtVyRK8m35Ja+2OApoft7qI/FOiVMCbOE/R1EQMjDH0hJHHeHQBOh/i7xjG3cKdLMctESl4w9ImUeZ9rosfREMYosyHY1lw7gkQ5or73g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=porjTLaXl/TMA1LJfKi8kCjuIll93RfejNQJ2anDPuQ=;
 b=aksnldBZRG3lNbRvLa20xa7vhsawFZCK2IfS++dWkOfTurv+p0O2q8FHp543/Ss3BZKN6eyO7xkA1wrz8qVoTaKBD0uEZIVQcOjnVil7THcAF9h5mA8vOzjD6Un6U7dDL3yXj6oJ6qvWNA8PlPYJBaMk7iwk/nIg5PZfgtiIUVaCY4lAP+ZE+gmN8TIymG5vl0cI4LSCVZBPpAHM6RhbxGghBkf5EBnKYWwdjkYyOaPwFz/mt+xoWsRnw2AaLMVRA8psvGRRxe6Yl5jnGKiwDU+CST3mijjcHhpqYSIb9YWg2mYBErJngwEdjB4+Fx+4jWgRRmVhMqLvEuqAIaZYeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM3PPF208195D8D.namprd11.prod.outlook.com (2603:10b6:f:fc00::f13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 17:42:56 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 17:42:56 +0000
Date: Thu, 14 May 2026 10:42:53 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>, Dnyaneshwar Bhadane
 <dnyaneshwar.bhadane@intel.com>
Subject: Re: [PATCH] drm/xe/sriov: Mark NVL as SR-IOV capable
Message-ID: <20260514174253.GA2260881@mdroper-desk1.amr.corp.intel.com>
References: <20260331152259.58270-1-jakub1.kolakowski@intel.com>
 <20260331220744.GD183713@mdroper-desk1.amr.corp.intel.com>
 <827126ad-ed22-4f2b-909c-b21c8df8925c@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <827126ad-ed22-4f2b-909c-b21c8df8925c@intel.com>
X-ClientProxiedBy: SJ0PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::8) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM3PPF208195D8D:EE_
X-MS-Office365-Filtering-Correlation-Id: 051b1410-6285-46ff-29bb-08deb1e03b76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|11063799003|22082099003|4143699003|56012099003;
X-Microsoft-Antispam-Message-Info: 7Iz0Fa1fhe/VUhtdNzoziN6tKhO/ppUG/ahQU+6a3h67tNksHdCk+NNVgRdqgFYrYYS5CVouh/F9slSsgkoAovS8GUgDViSNVrHYDIv7pRShFA27GDVqfZNlpBUJYdQBa2CEp2hOJKabaSoXlYcxtcP3vvkOK/fRnc7z754S+/hz7cxeRsopOYXWqWrzsuHX9e9EjBKitLy2/f2Td2Qm3P5ghRdViTs6YxgkfyW/agqoXfLzfDxxG22Oz4g0ZPLMM4UxGc/h5CTnmzlsMgXtuy88uXmvtWpybycI2OIJyyIOXm/oWCRF35nQ5OnZYvULUYXMA9+TZUKi7hYhkkL01tSPzRdxdeIxUTDFR7xaCXZfVeEpOst9AIwobsRIANuf6Zg0FF/AWo4xV80HmBcY4SKG7ybNcCkhZAtP762DzapDVxgVSEz9faHGGDS95CQfTzFSpF4h6u5QS3WCXOhULy4Wi0LuTC60HOMzz96gjUzHwfyg9UqJI+mDS+O3TFChBxjAe/hCQHPahQUZSElpg3FEmC3KhZOFSeaDp1bu2S1/GD4Sh0xci9jgMxwziZCz3YZhjDR+99PL+OEq0tUCRCvJWjclbiqgVX4XKBMmkzH3AakTZG+yRAna10+o0pFbchw5OJURd3U29gQtSahR2ll/yI3IO7lojmYEKkKYxBiKElvhqeRX2xoE45QkW+F3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(11063799003)(22082099003)(4143699003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vHefSdJbe7pnpr5xN9xB0hWnll92HC2Kpn9yNut1I+mpGO2h+TQE9miSE/?=
 =?iso-8859-1?Q?kdYXH/epAYWCq5XNzSFTHrS2W+X7GfCcRkJuRUmOjxOvJLaIVQGQlTyFgr?=
 =?iso-8859-1?Q?za332vAV8sqx0YNg55b/xcD9zxaaIqVlHB7QtlOjjJW5XEw717kfsmkMTM?=
 =?iso-8859-1?Q?Nh0dMjbIcEinuk3fngVuVw7WTqcF8P9LJxH9U1WpVw/Lqr4HWuC2KnrNj2?=
 =?iso-8859-1?Q?YQPUKo/yjNt0mW7svRmgadC5fvfryNF2NoO6DCT9KaTkPxWR9n+p3zfIrB?=
 =?iso-8859-1?Q?pEbLwdrZiPuT0FPGX5mvMVEpgrTik2tTe5HX0x+FJ8wDx9njJUzpVuqnkT?=
 =?iso-8859-1?Q?dwKVNfnDba8OHePe20suMUgtaqePxxTZbY/0/m97RsGoPvY9THetw4/Zk/?=
 =?iso-8859-1?Q?RWlmMRlQU53yEm1NQ+FjL+3LDb9EBMpqz/YeOPU0OtmCrm+Xxh8HFcCgnm?=
 =?iso-8859-1?Q?hh+vsEosd2hIHac/h3LUwLKLVLymGjoGPlH0uQT9LGkYveAr2nJv2xXrbH?=
 =?iso-8859-1?Q?pdwkCD+pAa6fhoAGbLwJV1BH9dS6AXbXbmxsvA5v2pAnPUdUR8/Yizhg6w?=
 =?iso-8859-1?Q?SKtgQUwaUJl3HMZSPCgHyVW7CGuzPVMv0DRpOhn6SNfBQrZZbmxfg1wfLy?=
 =?iso-8859-1?Q?VQ95KeB6OYV1yHQg7hBOGa3+E6LJBWMtP/q7UJz22Y6/3xXRIXlbDZwpmX?=
 =?iso-8859-1?Q?FCLGLIvql8w/OHIhiSAHi/uU0dnUmB5O0M/9UFEZ6rhIBi6MAvGDMusdHN?=
 =?iso-8859-1?Q?JtIrSMvl5x7WikxOOGcUa//Pq3V8uIxbhtCrmnCfB5El9h5ZKekdV4EKA1?=
 =?iso-8859-1?Q?QYjAxqx0QhENjVdMM1gBalzkB7as3BZ4AdlY8/DeETy7KEoj5OQUHyoo6s?=
 =?iso-8859-1?Q?w2wDHQbWYQKc+OGu7XaIl8dKN8UDibu4cU0ZEkloNArKbe8o/WO/guH/6L?=
 =?iso-8859-1?Q?qRr4HFU+V2kT0IOV/v3BBsNpHObIBY0QaL/YFSF3ykCf1Q7VGuAAzAeuIJ?=
 =?iso-8859-1?Q?l2SwB48ME6LrR3CA0Q7kUr/7X54n1GeZFrwzA0BeFKS161CqFuC6dSc78X?=
 =?iso-8859-1?Q?lEiVK8zcibZGPZeFuJsTFPpXf3sN+HFxKrU+OGL1YSyhshv0rpll3nXj+O?=
 =?iso-8859-1?Q?q2yEfZqOTmRBUZl9ON7TN2rkjiS37TABXfbBbD1jvuFP5O7BZH6ZWXNSTc?=
 =?iso-8859-1?Q?aPfQzv2Gtk12XhWX6dVfEFmVr24dWYarNO1GmAZ+HtPK7KTSE++6kI22nx?=
 =?iso-8859-1?Q?XyiSzE1I39PwtEAgF3YBGnH+JSbyt3taZ2cu3ebkBdEo5A3urUmUjEQY4S?=
 =?iso-8859-1?Q?mxQoeLXLznEvK7TV4Sswwn7ag8NHaSk6eoDU+E3keXlj1/X9ZlRjPqVGxE?=
 =?iso-8859-1?Q?NygcAAXdkRDaD0JVy0kfXGmIuQfH1B8gmx+MAOhrxqvKDw0xsb4b5CQWuY?=
 =?iso-8859-1?Q?ohQGX3ubhjIuMsNetA8pBeq22w25uMQIBHWewXOf8ZGCCIxtw+45dgnO1g?=
 =?iso-8859-1?Q?My0d/Hc138BjW7jhbmliPCACUR5f81ovsx/agM+GHoNtAiJM0dR6aczJ/H?=
 =?iso-8859-1?Q?RvjVnlDbIZ2T1tw9bnoVnNYdP847uelbwIDlGbks8mD2mDiRB+Ky/kQuxt?=
 =?iso-8859-1?Q?+dOrLiRCQsljJa4Z99UaRFMRHtJSmSACIFheJkOne6yGT2xuBNMw4FVlUU?=
 =?iso-8859-1?Q?3zFZp/rV6cjgYTVD7FmYUWH9EAnIpBY8NYanppm1kF9NT8AKQCr0aqg/JN?=
 =?iso-8859-1?Q?ZriCWbf+77L1qrwnScgqqD7YDmBrZw2Ees9PKtwD2N1XD/hN06vDITCn7l?=
 =?iso-8859-1?Q?00SuTt6Muar9FGnvyUxncBf/rShAiak=3D?=
X-Exchange-RoutingPolicyChecked: hUWKPcXWsvTtYjCFTSkCIBY3tHZhE7mc4kM9oBpWH+qkstl+gyuoMTQ4+fsGZ+xDsTBdJb4Reu5c1R6pR4RmZv4HB8n4h/abDv/gyA8zwH0UgM2nH6rbLjsq99eqnOxn0qk+t1jAMfmzZ42xFwVbbNADWawqg3DGavGPjKw2utFGwXQGw0XlqUmM9SqvVESDkMW94sBjRxzzvNeQW96f8NI8UlBjU3q6m8O7Kfz50bmzTi35oXuUeFSn3PL8pPF5bm9BsXFxrIAoIiwAYQP+kwcL2MKKM7+clwnOueHu9NVPCcbWJWJlgJZuBXgUxHmxjKSEjlhUb4HzEVprlR1KtA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 051b1410-6285-46ff-29bb-08deb1e03b76
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 17:42:56.5129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67voJFJmAGll6rQrYG/1j+Z5zDhbF/gHum74DIkxavO5LHnfN6+qRQ+LNhAzXVMtlyuxYO/Sad0LokpvwzfQoz+mRYmkLuS0y0b6FrDeL5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF208195D8D
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

On Wed, May 13, 2026 at 02:08:51AM +0200, Lis, Tomasz wrote:
> Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
> -Tomasz
> 
> On 4/1/2026 12:07 AM, Matt Roper wrote:
> > On Tue, Mar 31, 2026 at 03:22:59PM +0000, Jakub Kolakowski wrote:
> > > Enable SR-IOV support for NVL platforms.
> > > 
> > > Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > > Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_pci.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > index 1df3f08e2e1c..e7d7f0b6b998 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -443,6 +443,7 @@ static const struct xe_device_desc nvls_desc = {
> > >   	.has_display = true,
> > >   	.has_flat_ccs = 1,
> > >   	.has_pre_prod_wa = 1,
> > > +	.has_sriov = true,
> > Since the structure field is defined as
> > 
> >          u8 has_sriov:1;
> > 
> > it might be slightly more idiomatic to assign 1 rather than 'true.'
> > We're a bit inconsistent in the handling of the other flags in these
> > structures as well.  Anyway, it doesn't really matter that much, so up
> > to you whether you want to change it or not.  At some point we'll
> > probably do a general cleanup to handle all of the flags in a consistent
> > manner.
> > 
> > Since we don't have CI setup for this platform yet, I'll let someone
> > from the SR-IOV team give the formal r-b on this patch confirming that
> > we have everything in place necessary to flip the switch here and start
> > allowing SR-IOV use.
> > 
> > 
> > Matt
> > 
> > >   	.max_gt_per_tile = 2,
> > >   	MULTI_LRC_MASK,
> > >   	.require_force_probe = true,
> > > @@ -481,6 +482,7 @@ static const struct xe_device_desc nvlp_desc = {
> > >   	.has_flat_ccs = 1,
> > >   	.has_page_reclaim_hw_assist = true,
> > >   	.has_pre_prod_wa = true,
> > > +	.has_sriov = true,
> > >   	.max_gt_per_tile = 2,
> > >   	MULTI_LRC_MASK,
> > >   	.require_force_probe = true,
> > > -- 
> > > 2.34.1
> > > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
