Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4D2C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 17:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E2110E43F;
	Wed, 12 Aug 2026 17:26:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YbPlZq7I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E752410E409;
 Wed, 12 Aug 2026 17:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786555604; x=1818091604;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6hBLGoN9959fB6WLZ8uEto4ZfLvHifNI/I7sWq/ZZa0=;
 b=YbPlZq7IzOQy1cqkbqbinLc+pLFgQRvsJbaeKPAj8Wr4DPcdCtZHsKuN
 +JXd8IA28nS6NCiSMgmjYwlsVbTBlnAThp4e54Wx1CXSxsT7Dn9MAaxMZ
 LEWSQDKCXVp1jqCYSzl69tm3RarvCulHDtYUZjBN22r9/roqSJZukexLx
 /AsLkierwLUfie8slHOCrQhsh31ZNgZIUHqDIttY7yxO++yFLZymNb/vS
 b+RcO/lAEGmvm6L/mmMdnNd4oPSG2wb1XSNxfTBRvdpfebeEbgz0Imj08
 nmsS9TpN7ADW3FRN5EM+JuLGB30jW3sG1lHN0T8sKMarVAnV9lI4v2RWO A==;
X-CSE-ConnectionGUID: UcwTdEW7SbKq8nT54WJpVw==
X-CSE-MsgGUID: WiVHW2AsQfuNdKMZDLHD+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86997608"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="86997608"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 10:26:43 -0700
X-CSE-ConnectionGUID: h1vOOqNDR/SvGv5t3DYasA==
X-CSE-MsgGUID: 1f5ziodLQtCknt3CzyN5dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="267560303"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 10:26:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 10:26:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 10:26:43 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 10:26:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sphJ4kB+Dn1GVFWd8XWS06MvUJWE0sXZxEjjYN3iIM1Kc3yFt8jhnV82V8OwUxjRVega1ut484Ld7bKPE7O7VCPR6H9qVA62zfdZz90IVwmx4PO0TwS2ez1HlD3E62zEKZSUjXjZxi8ccT3jmfUJCtYsNWeG0EvhRFiNiGqstgwWJnmEWMpiNLC7M0+ADKQRLwlFyutTWPalItuv/4OH4UdjerTAiLBQNAJPZ5In3VgWBv5Ij8psYvobGOvi8iWZCUHipOEQnAXtb+/EdApGvB8rO74pGIiybJYOiDfdZe0g96xBmdXLn7nZFUhMC3sC29bnYdNgAN+cvmCNdnRPNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNjhHy1x5lMrFV4phc7s3KohVFtZH2l9E0dyZUJcs0c=;
 b=lLpdHVyAOk9Mms+u/ZX9okM9J/X1jsvmvO2Ko3QRvOZjslXIjVmyK0irKgt2BLjhfJXIJvSnhBEMldOx5IXmXSfK1K3U4U2CsyCcAIz8u4tIODClKM0r6yHHhspPc1guV9i/BMJJZwqf02RfRZYSEGOWd9rXFN7HG/+uyB/8bgbRcRdWEkrnnktD10LMMOMfbaLItGIKYbZ1Z3Rs9CUAeVjI/GwLJT3AA+JILr3AWNokdL2eAoT7IQbK/mrSb2inFIuunMs5wSNJ0TAGE9rTX6ttUzpvXWqM781djD+y4pIESyRRMLexduNuFTpwegabeKWHwbV0VjBba+u6npGdTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by SA0PR11MB4526.namprd11.prod.outlook.com (2603:10b6:806:96::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Wed, 12 Aug
 2026 17:26:35 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 17:26:35 +0000
Date: Wed, 12 Aug 2026 13:26:31 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
CC: Suraj Kandpal <suraj.kandpal@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/3] drm/i915/lt_phy: program DDI_CLK_VALFREQ with DDI
 clock frequency
Message-ID: <anysx7B33SpyqkBR@intel.com>
References: <20260811175844.2613721-1-suraj.kandpal@intel.com>
 <20260811175844.2613721-4-suraj.kandpal@intel.com>
 <6710db81-c507-4abc-a5f8-6f2678b9f780@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6710db81-c507-4abc-a5f8-6f2678b9f780@intel.com>
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|SA0PR11MB4526:EE_
X-MS-Office365-Filtering-Correlation-Id: 11054c5d-d996-4af1-c67f-08def896db5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|56012099006|4143699003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: jA/URMomCWQVL/BZeMrnD1L8gkMY0V/v9hmUjZ8h9Mii4nylzb/iuvYXhlbiUMtfpekV2CNrGpinjxAhyYgfT6pz9EDMUA4ZqFSAkc/bCUyBAJK8cXUt/g6rcXBxjty9lw1ZOJnLDWniRX+hFhIplBd7gBLGb6g1fY+3K8KsbSiollDw/aYJUxU8dVIqTJvVIdEFwxlAmG4IbbcMfbTKZNJu60JTGF7GnEfucB6F21H0UEXVUxFSY6BdcWiZvp9laAtkq5YOPMtvChWIWFjI1nWJ2EATzY4QZHHzTc169hktODpiXZ1Foxuu7llPZ003LlrX1wXolqq3jgxCWDiIAQiX7dQLETkPgj8uxLyD5nEaEBkesNG0lrBLNiEWPmmFu/QP61p/LxfMk6LhEEq/mTVbAVoNU6nMvKe2++DZiFeXHoIJT6qLd2obTo309YWJJYSHpLXfVtrnQyVNhTEgwz163z+4nq/VDXoNIP3gPkA1e/suOjgzzjlLiGHzTmZUGtUCAw17ScL42YhL8LiOoO6aEOIvxSQx4+TCTve3fRaQN/cM8rFQr93sqGR3c+Feg2Xeib9E3J0w3NJF4tZnQKZeTq0ACuSEZe9FEP9wW9I1Kz+zUhUIAsiLl47X4T45uJsFOA/fLKnRwDUF6VxSHEWd9cCDtVS5fv0ON+RT5GU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I/ImgrzHy0+/JCF8j3ERVZOSkrc2gpvpNf9flF12gPxX4vzibfME4K4T41GN?=
 =?us-ascii?Q?ZEkGy2oW/nCZOJuLw8TEBTYVCZpi56Ork3fTA/TnVxN2rpgXGTeRToCJPED3?=
 =?us-ascii?Q?51qChSmmuKAb77XH8td3DGbd4LZ/Tdoyu6N9t/9A7apEvhayZYZ8d3WeOWEZ?=
 =?us-ascii?Q?6vOBBVxhI9/geHJ8dfh+2uxjByau2WnQ/vx8kR29ZQ7WDapAtieserd93YZm?=
 =?us-ascii?Q?8BpgHcV/aUBSsyCTU5Goyh2qIjG0LuZlD4xJtOeflHnj/8LpKvrmksZnOR5z?=
 =?us-ascii?Q?Xwi1maGn4yA+Ps35C4x3PKbwxwGrqGtijvOTtJhIjVpydfGzYWYAiJd0eRb8?=
 =?us-ascii?Q?Y7GG/dHNQ/jz6V+W3NOwneP7YJi7AylWDtPuevc5HUU1nOBSsvi6s05JtMWr?=
 =?us-ascii?Q?MOoeLq60mN00wbpKUkGIcOwttUFdohEeL40zWYBKLP9BaBwoWPY8r0wj1xVq?=
 =?us-ascii?Q?V5j3K/XTR53+iySdyPMIsaPl6iWVeWDmjD2HBUNgwVIe39oeWMdjwsQVHIgJ?=
 =?us-ascii?Q?LIvJq6ygoC5dk0xpIWtNvqeMDNprXCXKQVxURr7GdOmKLqWapCSo6UjKTF/i?=
 =?us-ascii?Q?D9LzbbZQ6TJBHYgExee9yU6wUnJ4x++GlBVxMH8VDwB8rV5vsn5huNLytxaL?=
 =?us-ascii?Q?nMyZwAUQ2MnnbvssBBieglgKth6WFYQR+DErwXnzuIj6ueW66Tp70o/+fOUJ?=
 =?us-ascii?Q?BjGy2Usn3DYJcAIuY5T2h4ZOfq5rpS9qwoF5lVjAITEaC3ApVu3hFeSJw9yv?=
 =?us-ascii?Q?gpXjWzuL+vB7bLF0qKv/pHKzyoqiA2/w+lGAwumESi+LoU9c1umffhAaGUH8?=
 =?us-ascii?Q?/wLYtCE0/UjY45zMhTa8+sDHcNyITo1qWoE+Ixt8albyorNBCwEb6EgPlGFl?=
 =?us-ascii?Q?Wx+J8jU+eVYUi4TlILSRBoMbUEKaCHgR1PuM0hiyboYUsVIb2dvYVXebnkGm?=
 =?us-ascii?Q?erXFOat2rcwMvexVx+N47b7YngjMPdatlibJUe6hI5lAAW7127AbifUPe7SE?=
 =?us-ascii?Q?G985KAlj36bRmYQ2WQK0K0OFEoaJJiVbHwRsAmiE6Nnvd8OL6U7lKAXynZC2?=
 =?us-ascii?Q?4jWsI9wMwxL82hx3mzeKd+70BIdCkphDfgGx3LmaJlIZ6pK+LuokgQRuu6b8?=
 =?us-ascii?Q?tyk3lSg3VyL1ZbsCBx1w5UGhJ8/0wWb5OTT7q6yo0GzpfKfL3/fh9Nk2Vz3X?=
 =?us-ascii?Q?toDw5GwK2OJxKtC037BcpsgSpjBfWuRTRrPJtNc8z1DKlhUWKzqU6mAXH0L0?=
 =?us-ascii?Q?55veTOBOJBdNbgpFIZkb2YcQe6YYO+4Tjam4es9EXhMH7OsE+Ah9fz23vn4f?=
 =?us-ascii?Q?sP4nP2CMObvYACvhwmE/rmupTeH59LuHIw7MhhXLwTF2OBM6CkbcI4HVU9/Y?=
 =?us-ascii?Q?cV6FkXdL+uouqruWaSHzsmFwEaKVcOqCX7i4R8JJyV+/cfy4/fdT8cJsN0oY?=
 =?us-ascii?Q?7Jo+rhJEKcuA//g4wNWkASv+WFtUDrUWLLOdmjxhxO6a4Yiw8j69TQGVVctr?=
 =?us-ascii?Q?NXWCD61epq+r6C0HvtAMgymzLSs0Bw9k9LuSBBFVHJJH6DPALrpwfNFgRnS4?=
 =?us-ascii?Q?M7xHKtTx8hqKDgEtlA6tvoo7hMIYhtnFYzFeFfjK5krH3UivhsoTfM9gUizd?=
 =?us-ascii?Q?U/m5d230I3iYYCVkag/GDnlk/fqIvG+450gEBW0iMzZLifFOrbBQHZm31Jsk?=
 =?us-ascii?Q?vmt8mSY9x7bwIRvU3xVp36KbyuCatqgRTu7HBos0IQIZGW6RLNgntRG9E6sP?=
 =?us-ascii?Q?WOlIbVHgkA=3D=3D?=
X-Exchange-RoutingPolicyChecked: aUGeLkyGdKhHI0WPRTD1WJqsBzsHR+K8PTHPF9MjOLpYoCQzJ93A0a2jpj2wnyO9JZh0A7yUhrih0y6SWtbANFmuCB/JknO2ZMZV04KwMqRbv+Pn+bk3xZIhu236cDyyfY70jBte6GojUQY1nBIiDY5ISWIy6vfdRHWQl0WimYpYVl+5kILHlfqDUV/mhNi9WMLHet4M08qrx6n5NVYc5sh7W2Ej+rM2GZy8x+RJNO+A0+Y5bdKuY2Z6wEoMHYl7XbYDBKLzkDsw7iCAdauJbddZlvXrj6CvWzr9Qtr4nspDxc6kaM6NZ6c8a2DUtDfaDzTIi7hPgHVzSdspJ8nPdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 11054c5d-d996-4af1-c67f-08def896db5d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 17:26:35.2645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZtdT1GWJnnYUvgWr+oIfEVOkKnZGSr7k/vp5vFDnPacQIc8bCB2yP2wTEvTZm7M1CNs0ry1hOyoqt4/CtHiWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4526
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

On Wed, Aug 12, 2026 at 09:20:12AM +0530, Nautiyal, Ankit K wrote:
> 
> On 8/11/2026 11:28 PM, Suraj Kandpal wrote:
> > DDI_CLK_VALFREQ is programmed with the port clock, which for DP is the
> > symbol clock computed assuming 8b/10b encoding (link_rate / 10). For
> > DP 128b/132b (UHBR) rates and for HDMI FRL the port clock needs to
> > be modified.
> > On silicon DDI_CLK_VALFREQ is a scratch register with no
> > functional impact, so the bug is not observed.
> > Use intel_ddi_link_symbol_clock() to write the correct DDI clock in
> > kHz
> > 
> > Fixes: 5ec58d714935 ("drm/i915/lt_phy: Add .enable_clock hook on DDI")

Next time, please be mindful about the -fixes, stable, and customer trees
and keep new helper in the same patch as the fixes.

Thanks,
Rodrigo.

> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> 
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> 
> 
> > ---
> >   drivers/gpu/drm/i915/display/intel_lt_phy.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_lt_phy.c b/drivers/gpu/drm/i915/display/intel_lt_phy.c
> > index 8fc6d230493f..86492651b01d 100644
> > --- a/drivers/gpu/drm/i915/display/intel_lt_phy.c
> > +++ b/drivers/gpu/drm/i915/display/intel_lt_phy.c
> > @@ -1976,7 +1976,8 @@ void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
> >   		 * Change. We handle this step in bxt_set_cdclk().
> >   		 */
> >   		/* 10. Program DDI_CLK_VALFREQ to match intended DDI clock frequency. */
> > -		intel_de_write(display, DDI_CLK_VALFREQ(encoder->port), port_clock);
> > +		intel_de_write(display, DDI_CLK_VALFREQ(encoder->port),
> > +			       intel_ddi_link_symbol_clock(encoder, port_clock));
> >   		/* 11. Program PORT_CLOCK_CTL[PCLK PLL Request LN0] = 1. */
> >   		intel_de_rmw(display, XELPDP_PORT_CLOCK_CTL(display, port),
> > @@ -2023,7 +2024,8 @@ void intel_lt_phy_pll_enable(struct intel_encoder *encoder,
> >   			     lane_phy_pulse_status,
> >   			     lane_phy_pulse_status);
> >   	} else {
> > -		intel_de_write(display, DDI_CLK_VALFREQ(encoder->port), port_clock);
> > +		intel_de_write(display, DDI_CLK_VALFREQ(encoder->port),
> > +			       intel_ddi_link_symbol_clock(encoder, port_clock));
> >   	}
> >   	/*
