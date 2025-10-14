Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE1ACCD193
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 16:53:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4EF10E1FA;
	Tue, 14 Oct 2025 16:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EapuD9pz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F65A10E1FA
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 16:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760460791; x=1791996791;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cMozegsQ4930kxPu5/i/buiuQX9l7Fd8fNu3LjhEPvs=;
 b=EapuD9pzYssjc+5JndQhFny4hfyEH9sMQk+fImymQllxXgAHEeWN8vGp
 IzvQAsxRlUgiS6p4ekqLaCZ9HkKWOscbQQC9zUu0DCrjHwnDIFvUxOISB
 GWfM3Zjk8Ga1oqnCZNqEAeC2t5vRXrxFYygLTAufMjjRVhmMcyd+lAsFh
 ogLBitklVPiT/cqlaRPR9miuy3oETQTzsTfjDhgpBxgdqQ8KLOEdYlS3F
 h0yC4HC25z+QCOEVQ9EfQ1XJ8xgjGk/CdBBMjpl4ciK8TehvTXHmSvnf/
 DE4vNH/9krmuwNhHqk7cgNRw8ACfEG/KThLVm26FKOZFNgHD/Erg+fYOT g==;
X-CSE-ConnectionGUID: iaxlrKm4SkSAz4LffOpL0A==
X-CSE-MsgGUID: eHrqx2kLS9yviaIUG+667A==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="66280113"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="66280113"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:53:10 -0700
X-CSE-ConnectionGUID: 4VFP+axRScCrJiGEDhbBEg==
X-CSE-MsgGUID: 4U8gfqcrTOqNlwnjUn5V5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181877624"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:53:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 09:53:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 09:53:09 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 09:53:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xPWTGyEjHda6urDh5pB+HmYgKvxsKt8CsZCN++SSLq7EO1FaGBcVN2lSiBqCfM/Cv3ZT7+tzegDRs7rL1zp6CFji1YbsmYLk67VR6Q/6XMRZ2+tTmyEF5ntbFbp5iMhXF/EDLsxUMsycuBn7TNa16E+8PLbmZImCabW2M/jg61Y87iIkt4sZX5eq5l0LDQZ8b7u3V/Ls3FAMmQh8yAOwBY05p7pIao/zzYWk/tCR7FOg1j2uQ0m1QCmN4mT3a4gno+1KpOjqpJoT82mvwTGQvdAJN9yc1Cfcqr7G++JLgdVHEgXpnzSsd3eO+6nlXReURILNIOL1p00xk3IeR+aAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnsJBEzo6BNjOY+JqLRZlf/FqOIupg7qW3o/Sf82NUQ=;
 b=w5OQ3KEKI8ISvBjVLYnis5RhfiFsayEWq9V7VPtaD87KN3aQlsGPAzN3bk18CC4YhTk5qVNFEmInuTtyM5uaHk3RUesAO9lZNrtxiK5ed1jjUHmMY+jKde1bylOm1JepuIy93WRpda5YNJMfYPnA/9pa25CrAfqLQ0bJj2yANPMmdQKPdyPc3FgCY8ZHLGk+gaJvY3rbGVecUf+u09awHyfeiBzu/Il9oL8lzWOUfe8ZK2r3ZXdXqwZqOOXPrCzBcD7P0khxNqTN0gQNLrwxAPWlGXvnCiDN+YrCIjPmupc+WPwGBi/8CcKWhBJS21lXAHnYL65gVYWFYDqcMhDXWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.12; Tue, 14 Oct 2025 16:53:06 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 16:53:06 +0000
Date: Tue, 14 Oct 2025 09:53:04 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 05/23] drm/xe/xe3p_lpm: Stop reading the CTC_MODE register
Message-ID: <20251014165304.GS5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-5-bfb74f038215@intel.com>
 <20251014164050.GQ5409@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251014164050.GQ5409@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0212.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f2e33ce-03a8-48ad-6779-08de0b4225ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vNx8dQcObBpATWBOLzwUBmRq/M4Ey5uOn8ID506PRZ0zXEwj2fSM4XieTjKL?=
 =?us-ascii?Q?FwcDPdxBJUNuOz7cxYgFeZZWal/n1xe2SHM6KhHW9eP+7II5fmx8gDKQPilc?=
 =?us-ascii?Q?c6yj/etj5DVmYXX0od2JIvxtJIa9KyWEkIyP67pdBI9XPoA2FOsNoRTdvINQ?=
 =?us-ascii?Q?C0iu/72tujPR32T4edjbyP2Spince579T4OjGjdOhR/ww6ul+toKoX2HAdv7?=
 =?us-ascii?Q?/wNOhIYxZ6HPRlTCK5KN7/hiaq95RNEc54FMVQHx6CbKoFEYnET+cj5DeUx1?=
 =?us-ascii?Q?EJkg72Vl+ckIufOn0uvRKaNZrIEiX4SBi65ut4+6gIDTsMMjzPkemjPBsxew?=
 =?us-ascii?Q?ZgGuDgwgKJi9UR0JJUSc360bFKgA4NTkd9feGEGgl1Rg47CDja7AsUjU+glv?=
 =?us-ascii?Q?D/6Hggitbw0+HKdwm6jTT+n8iZ8QyDTMvWBBIZwKgOqF8+jwHmltQWkBC1sG?=
 =?us-ascii?Q?ZbxaU53btAp8ikxjdI6/YYS/d4il78/dnlfDLOJ3D3VufpBgWlwCLEdqzMgr?=
 =?us-ascii?Q?1vuoLelIdlaC7IRJC4D310zZzm+F9B8nxRNusqq+dN4PQtsUnLCb6Iz7INgD?=
 =?us-ascii?Q?UudHvoYzX82/Vv4m8alhpN5i7uGv6RFSk5orKzZI6PD1vPBfHJg/Wke4tOj/?=
 =?us-ascii?Q?0GThiOIOyeAwe+vvA8YNGXX6IcMKaLZ2tCrusD5dbdOjzQi8TOWCAgivL92M?=
 =?us-ascii?Q?/SLyUgxXs83dgnrJnVtEFShaptEsEfe5RUOZxDtgVliI9P5IFhV78jaic95J?=
 =?us-ascii?Q?rWsTsCyWLugH8CltQuCyIwfE8IVl0THYBvcOWH/Gaea6X/zGLRoVNY5PFzI0?=
 =?us-ascii?Q?hjmfJ151ZOFPPukk8JptxbH3NOSkwYqopgLSK3c4kJuWXx7uYBNl/vBI11Aw?=
 =?us-ascii?Q?HlieZEUq7p8fUoFbgMh1qAUHCAEIgj/DeoenR58WPPRK8+0wUitZT+h6Yhzu?=
 =?us-ascii?Q?0J0OURAKwx1im821CXhlwyNnahWJcsjwpS4+knZXQljFZ+lpKdxdbxDT6YwV?=
 =?us-ascii?Q?vMAkQz+MWlDKjL8BrWc/9oWD+pY6hjYP+rAM97ypOejkHjWfEzKNn74z+BLS?=
 =?us-ascii?Q?XsO1be1E5sc8mlXobO/44tAn5HdecLR+MF94LzuIyUoI3GMhrHi7GUpqMf5G?=
 =?us-ascii?Q?NjnT5c0KPSV3rRSajBXc+uPmNueLcR2MpBach266Laqpb9gnMozywu7GnvJU?=
 =?us-ascii?Q?Dnk4W2267atZG/pOwH1vg8iDjGsqesPOo0FF9FnUdjJEAT1KZmUxjzcEJ8Gl?=
 =?us-ascii?Q?7jmeT+iJlHhX3FvB3lyB4EyYl9kB8Gizw7dPvPvn58ROD2kZY4+GWNVYciZC?=
 =?us-ascii?Q?LTzOL1AwyWq8wytIM8UyXMWV9SXDtwj1Tg25grJSS8wk5nGRsCIj2lGfrUNs?=
 =?us-ascii?Q?pEVyFnkIU8aQ8KFUgtB3nEES1O7G06oiWOwfuhzEuUE53a7i2Q57HjdjcXMN?=
 =?us-ascii?Q?Zwu0JjbFuhHqf/qMBYkYAUA1paMVFbit?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v8FixCCHSJN4xATMaux2RCEArkmDbI4e+WDVimko8ANqDj1G/aZolNXbaEb0?=
 =?us-ascii?Q?/ZJYiBRQ/O15K6eRVtiMOo657LZ3n4n2t4gIcoJogeMAXcjglGgNMEuyZNus?=
 =?us-ascii?Q?Kzb/KraBFyCOZEBBnqlf2IVHn3ivdMJOazTdT01p5vNcbTMXzh2nlP+NV57h?=
 =?us-ascii?Q?ehFmHhhtRwSn8nhoLEzN7euFx5qKtZ5DPowme1rtBQEIg1KXdx/06vi8dyIn?=
 =?us-ascii?Q?DT7ddJKdgL5apEqmF2BK9l7gNEm0BcldPINAjCwEzTUSNX7XJ/X8aeNtu777?=
 =?us-ascii?Q?vXiSKUMR+yCkr6doOUJG7IbVAqDjrRtyfzuBBrSToSCG8Q1GwKOqBTfXL3D5?=
 =?us-ascii?Q?WvcV+MZ5mDY4INpDCw6m6sfs3M8ESxm41qVNtx4qlDMkCrzYRe4b88CU5aqS?=
 =?us-ascii?Q?if2vVX+0IenOL+HSc18xtzaAWqA/1p1DpAktPpmsJKQ6lhXFmxmWEyqiaXN+?=
 =?us-ascii?Q?1pnAgoVtu9xjz8Mj3dy0U5euHEsXb6Hsd609Wx0F/Rq7VJHX/PdrKqAw73dd?=
 =?us-ascii?Q?I4dkjScJ2AMFB5ZHWFwtuwOyLxe0BuYZvnJIixrTVWe5I4MLR9ATLohzM4DW?=
 =?us-ascii?Q?IgfaG50eHxfZS6ZSs/FDN5ml5Z1bzHBHifn64ddYBNjfiZGqzoLAVMJhBYPE?=
 =?us-ascii?Q?YZGoOdCAiaxiYUfb64/SKh79V6tU+KP86LtK6c7ITf0hHZt4mb+Sv0k7IDtB?=
 =?us-ascii?Q?ZcpD8hqndj9q4wCEVNiBAoIDK2DX4C2/oBb0euVk399gD85lMLWpcJF+8/Iq?=
 =?us-ascii?Q?DQBo/S/k9efLq2zhuHKQjxuDFaiCtUcXIA1TbHB8fHUU3/Z7rAi8ru9grNM0?=
 =?us-ascii?Q?waazpwc+kBCCd1u21tvp/LmgSCRgp/cMYv5QuzP2Gk0RKR4Eq2/4fG0J/HkA?=
 =?us-ascii?Q?iae0W/WEk8Qof0Cu9vbde8rYYk8C56pW/vMLtj6+4d2PQpUchXXcdF2QxsdP?=
 =?us-ascii?Q?Dlkm9DZa/XbzkA0OCVmXbkfWRYu608yqBTd49vm/ihrkvAA9Tf1/IIOPwpJ2?=
 =?us-ascii?Q?gNX1xR6VNmL8js7MJam06UErBwabSRuDVYWGBtVbSq8qlZzUFQL1ZiXMOwpw?=
 =?us-ascii?Q?i5jxhBD4qE7B2ky9OJ9PrvkTIUaIB0Sfcy/dV5C3WgunvBVSiBk/xttxVrG9?=
 =?us-ascii?Q?Q1ey3wlkZLzRtt1pDHzgpKy5w7c+GZHrkdMmBq7u7u1HIUaE4XhJAiunC2b1?=
 =?us-ascii?Q?+kcL+QBtKzR4XDYsLokoNswM/SF0YWGiV24J6ZGbGVk/i65n+yEdkU2DCnfF?=
 =?us-ascii?Q?7vH8H6oHZcVgZr9QxpjZs+yAQMM/9iK0gsKhpPAYeKIKCpa30QXjxP86rKkD?=
 =?us-ascii?Q?51IZQqmUXYnJXWm0zQv9gzSV19mogwNqs45KWgxhYCsF92qp6GQL7AWzozko?=
 =?us-ascii?Q?1M9REbCmlUGKcKARp3fKXa85vk3oONMMYpiqEQ0V6QzARzKL27rvxHp5Z2n1?=
 =?us-ascii?Q?IsYCum4DDYOtbhluxaZkaPburyYldUAu5uFPLKdUqCTNtZOcGqpCBV4A7aaj?=
 =?us-ascii?Q?TPUaonNmv8v4a7MXcfKKuDyBJwiYYD9aJnJZ+cXsqJHZ3JHc4+wJRzfTu4O2?=
 =?us-ascii?Q?8DjC3B0XgbzygIcbHLRWxoA1e3B8LKE2skVImgsTptsX4vGlPWirbP5/SOXp?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2e33ce-03a8-48ad-6779-08de0b4225ba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 16:53:06.3222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzA7IXv7i/pgAccDcK1eVXyDOoKnkM+wmPhd+Ewbb9dE0q2WbmRTeEsZTe0jt6K0JaJZ3F/zX35g+s1gqsHea5V2Lgj5394x8KkiDf0JnRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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

On Tue, Oct 14, 2025 at 09:40:50AM -0700, Matt Roper wrote:
> On Mon, Oct 13, 2025 at 08:24:37PM -0700, Lucas De Marchi wrote:
> > From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > 
> > CTC_MODE register is removed by Xe3p.  Stop reading that register on
> > Xe3p and later platforms.
> > 
> > Bspec: 62395
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Actually, based on Shekhar's comment I took a 2nd look and maybe this is
a case where it should be a GRAPHICS_VER check instead of GT_VER.  See
my reply to Shekhar for details.


Matt

> 
> > ---
> >  drivers/gpu/drm/xe/xe_gt_clock.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> > index 4f011d1573c65..26052710be8a7 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> > @@ -57,6 +57,10 @@ static void read_crystal_clock(struct xe_gt *gt, u32 rpm_config_reg, u32 *freq,
> >  
> >  static void check_ctc_mode(struct xe_gt *gt)
> >  {
> > +	/* CTC_MODE register is removed by Xe3p */
> > +	if (GT_VER(gt) >= 35)
> > +		return;
> > +
> >  	/*
> >  	 * CTC_MODE[0] = 1 is definitely not supported for Xe2 and later
> >  	 * platforms.  In theory it could be a valid setting for pre-Xe2
> > 
> > -- 
> > 2.51.0
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
