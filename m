Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FF7D2FEF4
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 22:30:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4278510E210;
	Tue, 27 Jan 2026 22:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YaEovgrb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888D710E210
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 22:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769553045; x=1801089045;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AujhPyi5CvgVnw9fpq2lJVacflV+vhV16pyRoGrIRp0=;
 b=YaEovgrbgrQ+lApdDW9r2baf73R8j7ZgcVvgmIsHEiWm8z4S1AD44nAS
 V3ZYVjR0WYGdou0nnWetRxDXYtOQ1UCpyAHywKXcFaOa/afJ2KXYmzFMA
 O5MjgcvOK8DZQQRjXAKfH6shYjYUBVW23zMSgS4jC545jCsv/zclcAHx1
 dMKjvN78uokVfeZOkLxL45Ru3Yuk/x9GvgKgb/9SJtLZQOSoRdnT4m9Sy
 VcNJZVuFNpettRp+tdb9kE/MFWMGuMPgosyq9ihSOO+qY2cH7ZxRfIIP8
 uPc5keLBbOf3h8Xee2dzElj0pgV/3W+01KAEdEavgFK3cLfIjfx7wfu0C Q==;
X-CSE-ConnectionGUID: BAr+lyh1Tu2inAB2xN80gQ==
X-CSE-MsgGUID: wQ4HYTPEQ0OzTa0HWankaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="88338665"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="88338665"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 14:30:45 -0800
X-CSE-ConnectionGUID: twiwkr83QGiFgcwxvvVYng==
X-CSE-MsgGUID: bQpNPu56QYSvtSHY79pFnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="231051459"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 14:30:45 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 14:30:44 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 14:30:44 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 14:30:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/w13SI21myWFbe6SzW5Sg1Cli1QuYhfmwLi9OF0px9eolVkLkj6UNDuX9Q8Emf3EkhzQhtUepq1qZTJZdy4E6L8nOIRy3qoNA+DqgX0NHD0JJFL2zZdJ50EopDM3SzQFl14DGzG/4DOp9WLjBKt1UnPHxGj5n2hcBkPzjcR8wzQOqUoXmDXZF71QNTZQwNyUftm8VDWb5zCU6z1OUpQHQp4RHsmdpZ/77bNO9K2MhtSG1TfjYYgsLGf+sj8AQo+jatYCYlCSlSfosaccGcqazzEotPqqNj30T0ShOQo/0BV7A/7mYG8+Iv8XTkwmO6AzfYUOh5AW7Sn9gpJnOmQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iApU2+OhXkW69Gf7tiZS5pdb+h7wqafMm29dN2E1zO8=;
 b=kYlEeZfbAfPyA58VXHsJnIU3BE4spCGX9jwamSt7usevnJBLuLfOOmVM/KI7NOaD4j7Jc2g3Dje3i5ed1ERsI8XIzE56Ds/d3bx0b5j7h8T0cAvNnoL959+RdrbajqPq+OFvUx5Kh5Em0FWMfilIPZxLN8DbU51j/qi7UEaItaiMWyorRB5WAAeI82Yhd2vOlV3+wlGNS9cRtLmBRJQ1lUXrvrZkHnlxL31Bs+AK0sUsUmIz6QrxK6BAcczYfW2ptcjWZUXVrV0Muu8NZTUcun/1QR/YqJMhTmJ6ei7q/7hevTrsUjxAZjs4xQYAZQ4CkxIf4gtiP5jJWvjcz3hayQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB7647.namprd11.prod.outlook.com (2603:10b6:a03:4c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 27 Jan
 2026 22:30:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 22:30:36 +0000
Date: Tue, 27 Jan 2026 14:30:33 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Apply WA_16028005424 to Media
Message-ID: <20260127223033.GB2174980@mdroper-desk1.amr.corp.intel.com>
References: <20260127144340.1396752-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260127144340.1396752-2-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: BYAPR07CA0098.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::39) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: 15867e72-dbf3-4f4a-9d37-08de5df3b0e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ByFHM2LAzxjLgInPAqY8wqlyQ0/4r1ja/NFb8x/l1PCfaR+ll2SvlqQoTNFr?=
 =?us-ascii?Q?LVAqiSwcqZ24EWA8pOFPfasxfZY9Ti2P1yeTM+iIu5GqYcAZEOwPO+akXZGH?=
 =?us-ascii?Q?OxWjRPT1XBIVnJzxYgHPw8RRWqprzFTNlKHRPI4kbs9glzU5QM6Eea76KsGU?=
 =?us-ascii?Q?IcZU1obaVTH8eE7F/wFUABYAZHz4porDnd1PhKaDwMH1OWVcMtGQ1+oOlfgu?=
 =?us-ascii?Q?vvWE7ox9j1Vc4TqcB1pJRHl+IGoNKUQsmNpC3gv19idPXYPuN2YwloxMCYJC?=
 =?us-ascii?Q?fkkWSgDkL3xTvPrA5d6SJBb9+xd10xTJcaGLvHez9gvlbbdyfaLdwALDOe+H?=
 =?us-ascii?Q?Ycz5fUNB/tDSpLhC7tI98vuz+MfAv72189jFcC9u6evkcjz2tjNJ96DmY6Vl?=
 =?us-ascii?Q?EL7TVdGMjcM+pyR41MIG2/Om32PeBx2JD5O7wnZ8u/GDZ4zTl/Zi5kzPuJFH?=
 =?us-ascii?Q?hTdJlSj5L9EbEFLpXHba+c+xKmiLdnSHaKToyrui434mxJHjnpUCl4KsAkKr?=
 =?us-ascii?Q?pVWZZ885NHQsx6j0UROE3C6rqla8vxw5FfdXd1z9bz984wq62Fn6fWeWJnjv?=
 =?us-ascii?Q?0Jp6o3ZFXvEzD93gZQ0weWqyMHsT9iiAAeLTaX01evRzd5kMdqFpZ5iKY4cE?=
 =?us-ascii?Q?ZYkbUIBLGckUjgtVw/sWgF/z+Woz01c0qU3cE098qUrdh4elvPIj7dKOODh0?=
 =?us-ascii?Q?9e63NeVZMRgHVepKTBa5BUFs9wFOwYsat0VM5ZU4s0ST7fYAXI6v5sCltQgw?=
 =?us-ascii?Q?YE+J4G16dkzYHeTLsJxvOH3D6DOM6z0QUoG4z408RT4mpkwUjxlZ8/OdkGzx?=
 =?us-ascii?Q?k79hAyPkeYV/3Qr6zkHvqUpp8y35jCKfEFo12kcule+l8qpAYO+6DSNrgpYK?=
 =?us-ascii?Q?Zpw+Sfj+ZBbqHPs+YSKXPOV54O+2IcXqHwCmcGyhZyBMuqqZq2TkgqXDVFou?=
 =?us-ascii?Q?q+TTIyq8TQ3BqPjho6rAmxDHIhnlrk8iQL+BN5BvACYavkmnKjrM59ww6Ws8?=
 =?us-ascii?Q?FLCVgXuS2/3wdSCTEqXNCWmGlpYL+c0JsnoQbBL+D4Pmx16bPG4y2R8KPoei?=
 =?us-ascii?Q?hpwyTu6w771Q0t4vlHUCdAI+IWRZZqz1AsbOra7pfLh9odYzV9HVgOPzdKmT?=
 =?us-ascii?Q?tDoj6YaAC6Ok3C3gV7SU4NZrHefy7nvR2L4Yq5tiyT9nQsBgPY1qcSIKDERt?=
 =?us-ascii?Q?Nt+LtXDxRhBYSaGI5JtRgcukGtAp92B7ZzopubtYbOgb5AYato5IIjSOtt80?=
 =?us-ascii?Q?dMnASaoF6FHc50zVhwktK65KPUzQhUrBh0fkYX1wzvASdgm/tAjpGVbax3hc?=
 =?us-ascii?Q?LXx0psso8EBV0YS3ucAmhOciXT7yoxmNd0VHcF9buKKxh40u8Xn9q9ViZGJu?=
 =?us-ascii?Q?b3RkgfiMA6+N0ALmlFyKP0sNwOXB0MOXWwNLW5kyzGzOkQdWNGaXnAKa/gFU?=
 =?us-ascii?Q?FumU+rJzhxmGJmNwVR4dpPiRHYs/URBmhM7kvHWF5DtTVnM76v6MCN0g8TnX?=
 =?us-ascii?Q?0lJj3oCBI6D4Xvybal2YNiv0JwWusn/pcRB5K9noDj0sBxHMzpkNU/vvUKep?=
 =?us-ascii?Q?pWLC4LNvLN/djZUy38Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h7eWWob7YMWP5RI859k1MN+c1WpJYFhTDv3zFSWhzXi0BikQlFN8STk4YKRL?=
 =?us-ascii?Q?Azl4wqHlCv9LVefDd4Yh/L2m1NiWp0MuZhCTLtTuRxOVIjmYwzHYe87GhNiZ?=
 =?us-ascii?Q?IFkUh0jPPcDRiV5d/j0/y4cS1NiLBcPgTPGvBNh7BdSLA0qkDaSiMgGBFUU3?=
 =?us-ascii?Q?znosN4QtNioihlFIQQQzv/mUO4GRlCoB9HpPUJb118scwjWHAoyuVcW5vTgN?=
 =?us-ascii?Q?6N4BzYz+DShKoxwqX+rkadXH/5phmWNb+3kmPCIyS1h4IZ7WcdXjqgt96hf4?=
 =?us-ascii?Q?irPHXnUg1HPizIKwVuSEIPIYcE1rSP+8+7Rp7ZObRa3HCXU4zwDEycgCttPo?=
 =?us-ascii?Q?hHYrWGfsaAgLG+ap/1VLKU1Pk2EW/ixTzyRcCnPU4CZNmAO9sXAwFefHonHD?=
 =?us-ascii?Q?aF3G5dtPGkUg2lkaX83CshehOQ0YkiWrB/iH9oL529g/Y+ApY0Z5gK3OSwlB?=
 =?us-ascii?Q?t0bZtPkKFp4fZ5kSl7m3eo7dcEYjg1kmMdLSYGHtPOgnrsu+9jVMBUnqyTPo?=
 =?us-ascii?Q?tJ/45djQiQ3TK8Gz6N45BCpAdeXezlqeRjs7llAkHL0Js+ChZ//Q5S6LCUu0?=
 =?us-ascii?Q?cu7xUXEJbpJB933OSP07d10BMDMCr/3MYqy7yohKXR4TFtwAyaRjlWC0Gl56?=
 =?us-ascii?Q?8W22xv2SXTmJpuf+W7q/3tKPuxb3BnYhOrfNGE3J3YJjqVOcRw4DX5lPVqYN?=
 =?us-ascii?Q?gjjMB9NbH85p/FR25nqfH+YFzB5UYMod4NAAgB/WMA0a6ZHygTt8jY4h+LPY?=
 =?us-ascii?Q?TdzG14ui7tZqxtobV6rW8JsZNFGJjTfKkfu0aXTe/u3+FtpxlJORfkidkXYj?=
 =?us-ascii?Q?vR729rgnsVS7IYhAcKRIPVQp9F5MOIZ4O+OcwamDTBw8u9+H6Xf3CWq0C3Vq?=
 =?us-ascii?Q?+lWBPjCndeqXNDWu1ymtoYM3rLlSEuJ6KLJwFfuSlHKW6B/xMIJXlK7sfJic?=
 =?us-ascii?Q?pKqd+iIMqApsQR2g45dpcbmH3u6Ul0prz54Fd9jH5tDspnqqgWKyormxuwm8?=
 =?us-ascii?Q?iCvXRFtjkWyebbuBxJEeICA+3lAAtGTWWIkN36Fbue00M1ohy+Jqoop7W+Gw?=
 =?us-ascii?Q?Z2YodmRWMqc8mYVACb0V3dlH7mJFdlw7VMVORG/gDStfuhp6JlWhe7JbSfvT?=
 =?us-ascii?Q?T0G5jV7EYYHvL4Z0bcHBJjzBCx8pqqrpoOFrtOm3trndC5nPUQPjFGKt8Dt8?=
 =?us-ascii?Q?z70Mh9sh8Q+Sc6+oLPO7A+3/c4x4fyLPwskqT7CVWdFXG7AB1e/Lo3IykyrF?=
 =?us-ascii?Q?QprOTk070+XVroSSAb4O5QnUXW3W7bUch7wDkjAnRRIyySRNJwArLEWFW2A6?=
 =?us-ascii?Q?+EIdMujKHocqg8xE9JksjFrDcFLcS5c67Z/Ko6oyXTRw6EM13UxWyiDo6tRC?=
 =?us-ascii?Q?4CbWuxPapa2IiA02oVy6P3x51lZuwxNtYcChKXBXdAqHNfuwNKl/fAWh+N8J?=
 =?us-ascii?Q?Vmo6QmnLCoDdXFYgN3m0byVPs20pqYJr2t+vkWmE+FFDgYxjFr7qgLS5JN9/?=
 =?us-ascii?Q?IVHw2ORMVa+YcFTF+T5FjvWesC44nr9XBk9qfHyPpOZQZSPVGKc9Y4E0jLn8?=
 =?us-ascii?Q?/6a2jgi+/m7XTWO6leJVwFVYN6wYqqX9jcCTF1LtSrnbzAi15hliz6M3Tntw?=
 =?us-ascii?Q?xQTzfV3wsD5KED5iEMRzDlHlksOnji+PmMuHZLzufoArfOz+qowPOolh4X6V?=
 =?us-ascii?Q?v/+37ggERv7Km2kg5O6jcsLaumu2DAkopAaHn/I9/JumX88ajRSRFjhPlDtA?=
 =?us-ascii?Q?7f07MH/ux+qsasww8o0/6RBkkH9JCzA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15867e72-dbf3-4f4a-9d37-08de5df3b0e3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 22:30:36.1390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4ATpFMzyQK+TJVV0mo5k+Mzmrplr/+rPNnFRbUxtIxawkK60ged3dsIdIrHjv+2CzSjCJtVt+1Tu4DzcQT3BCJiZye91cKUU0zne8CsXO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7647
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

On Tue, Jan 27, 2026 at 08:13:41PM +0530, Balasubramani Vivekanandan wrote:
> Apply WA_16028005424 to following IPs:
> Xe2_LPM, Xe2_HPM, Xe3_LPM, Xe3p_LPM
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index a991ee2b8781..32d4993c0d69 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -306,6 +306,14 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005)),
>  	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
>  	},
> +	{ XE_RTP_NAME("16028005424"),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 2000)),
> +	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
> +	},
> +	{ XE_RTP_NAME("16028005424"),
> +	  XE_RTP_RULES(MEDIA_VERSION_RANGE(3000, 3500)),
> +	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
> +	},

We don't have any other media versions between 20.00 and 30.00, so we
could probably just combine these into a single entry since we're
already combining 13.01 + 20.00 and 30.00 + 35.00.

We also probably shouldn't put this in a specific single-IP's "section"
of the gt_was[] array since that's confusing.  It looks like the
graphics GT's version of this workaround was also already added in the
wrong place (it got added under the section labeled "Xe3_LPM" even
though it's for Xe3_LPG rather than Xe3_LPM).


Matt

>  };
>  
>  static const struct xe_rtp_entry_sr engine_was[] = {
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
