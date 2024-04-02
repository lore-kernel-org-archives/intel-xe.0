Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB0BC6FD1F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 19:15:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF7810FFAB;
	Tue,  2 Apr 2024 19:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EcqSy9lv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF7110FFAB
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 19:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712085343; x=1743621343;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wlr59Jp7/bhJhQDcUCezmE5LSWwW3UiKkyXxNTWbH3I=;
 b=EcqSy9lvDT4Iv4xnx44zgyq+rq9b1fN8DL6cGObVMbOnAQqjGEPYwO/G
 lllbhF9xonhiQiHcltITpmRRjQRQYbk1LlzfCCfyLVDO0X+moJ3xSD/qv
 HF6i4DomPIQ22qkWISalLkjWn7UxHa+ytIee7P87SVqy9RsS3cmN4d+UB
 dSl1xhm1Ozd7wZaTJRhCkIngUKjcdGYXu9qGl7ZmeydutPwSKvEzWV0dG
 7vxqrEJm+JZa0vZKAy2ivDBg8wqmUCDxGKnka2OVGaTgLgytCPB51gB8i
 rr4a5N8jiIUxzo6zBU5YVjcw58ASZNGx1T+vTmddDaeEJFE7blWiq918M w==;
X-CSE-ConnectionGUID: yPOi2XxiQ6W3QAGtToePmg==
X-CSE-MsgGUID: j0tdukzORdaOUMIm/Lsdpw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="18004779"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="18004779"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 12:14:49 -0700
X-CSE-ConnectionGUID: E5G+PuyNTOyKdTxCO4w2pg==
X-CSE-MsgGUID: Wvs/q29yRTuJTOFprY94Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; d="scan'208";a="22865406"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 12:14:49 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 12:14:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 12:14:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 12:14:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 12:14:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cI6P2Fm5qLlDadvN+CoUzWujff0GOkU4QsOr2DfgN7sMFiMviwIY1x7+6g1rcV15IFlbFt6Xl8XdRF3Zs1LdQ3QaIaed/yDKlDyrpjLDXTq8s5EeeH7ysL4F0u+nqR04zXRkhevEPeEpDi6EoXqI7ETsBpqBGNvbJNT6w+8HLo+H2m/SLN6NKrTWj1VjUUkSTxreH4UP/HyDCZubhHH5JMUwGVkBOEszT4sZQR2RzKh2cxK+9jxsxkx6xgVb/pjNZICKF/ggEMdfcO3TxcjeAFocWjX20Qi4+pdc68wnRIrnrEJb0LTLsQmJzpGjGiOo3M02i3nRogROvT26PTlg2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zt+NmWo9VrE6SADuQs4O7CLU9BIWjwM0pWIcvHQxZUU=;
 b=kycsIIifMqlt9oCZlImqgDwQrOiApn1MZpmBse3QnmqXdgug3OfTR01Eul8PbOjvFGfg65rTN9/dZ/SBD3pkUioQGoD0kNE6/vNYka0pmw3/WeuMjNjn08JrWo5Hqq5sNoAwemIs+heUMDfmaBUTo769wVZtHo5TbJeqIVsKNSuFbexyuPIHzbR0QQsZOvEiYBo8FhpMXS0EWOStnKXOn8GeV020QO57IbnkCPzOwneHJQO1Zyho59UiMJbKclwoLTYLF0oHFM8dJmlyB7Lo1uZqxTpUBPvn1HI5YxdlZnmHKqUe1TC087joWmvtsv/7JdFmFZ5d3XvyaZNBUmOhNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Tue, 2 Apr
 2024 19:14:43 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 19:14:43 +0000
Date: Tue, 2 Apr 2024 12:14:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 09/11] drm/xe/xe2hpg: Add initial GT workarounds
Message-ID: <20240402191435.GI6574@mdroper-desk1.amr.corp.intel.com>
References: <20240402124724.1238122-1-balasubramani.vivekanandan@intel.com>
 <20240402124724.1238122-10-balasubramani.vivekanandan@intel.com>
 <20240402154520.GF6574@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240402154520.GF6574@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BYAPR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA0PR11MB4766:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y7Zs3EO6zrb7RA6rQCJ4Ns2gbrheJ3Mokwko83S/Or7ldOzsqjE79KSAkmDYnPmsOWNTZSaTzF+5DNUR0SfkPy7QvqV54sZ3Au0VNO41Mz/ADqX4GVIrcVkUKbQmCS6KjCCj6NnMp8b2FuowNnP552/PP6axP8rk665HR1/xMHkq0H8Nu+P/wUPNwh/+YThD5hM6zyUCEGhvgoasS7ty9I4Kcgqrh3julzjWQC1+G+wIHUoPcyeOk/w6XkV4MJnNl0E8PmivAAeykj9RMy2iyHPQcxuK40UgfpprNnp3H6kaRxTIN8eJV4GCawsyW5hBADeIEVhQYPpJDlcyVxGb34dVepCHXBB12BQQL1V3Ip8xB7aQfPws5ztKcxloXTVEsRffuEJvekNMnuCtqXxKDZoHnP8PygiTHfhjDcBlGCC9eAPo82PEf1ATbG/k/I+H8plsgYlPZPUVgpNdaWLjjSeWAruRy/HuZEq/FQYnf6vKI8f/AJQZ2czqpIzdF386PC/zStvHTub6V0UBKlXeYBxg2ZU1x0GEYzhbcTVuW4CJvxzl3hbLPkpP7o3K/JHdgK31EtrRrlDL0vSy1VtHkH9r0yKjnLGglTA+9NhQUmFmwI1VNGJkgIS+G1ZDgLQ6/oXnkThLCYyzQk0BwdrDaBoOCpqaZPrXDSCktfowXaE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vmivdfxpjp/UQibYwe0qs6lagIYkOVwWBJfz5dKZ8aTU3sXyuOKA/iXqpLuC?=
 =?us-ascii?Q?tcxlrZMccMTPcXga88cRByLkraUuMw989gI28AK/vbgMyNYn1P7FSGsQKbF0?=
 =?us-ascii?Q?Gk2dXy0Misp+K2Qdpi4GBxRB20KxvBrnTn9xEVtVKwn1ObPDRcTxbWgQ2k0M?=
 =?us-ascii?Q?OqnSqu6c1920YI9o4E5L8YZdDj7Edlp8rBuerFvsEcwq1bXJwRzDqgOcGfb0?=
 =?us-ascii?Q?dVZioT2RYZTcyqQhjWkG0nGvk8MLjhtS6y4sLMOnIoDbCUuqSFVBUwddkm5M?=
 =?us-ascii?Q?yb+fWvaHJtqU7x8exfYY7EKR0dSOCqASkwes84LDC9Ex4t6LhPLLY4S+TozY?=
 =?us-ascii?Q?StF1ipHV0mb8GaSLZWkFI+enzI0nLemI9MnznxRX9TRRHRm3NyaeEfS9u2BJ?=
 =?us-ascii?Q?mYcldaVK9GzUYvuUOfJspi6eYyeQ54lxlh6M9DUGQYvroSJKN386DN6p8oBc?=
 =?us-ascii?Q?v9Av5rxizx/7Wgk2E8WM67tCDsXrcTJ24o6EJpkJz89g0DlU7z+K7Yyvz44b?=
 =?us-ascii?Q?47CkQJg4AUSqaqw5+jtO7b4DMQoyvBIo00Tmf0I78L9FNTWcRzj8Un0d1XvY?=
 =?us-ascii?Q?Ew3zHQ4a4xZw9yxQ5wfXRbN0bq3fYts+9GjZaUausQYzWUFlfKDlYmYlV616?=
 =?us-ascii?Q?gNREzvFEiDBlFFMze56FfXuKJFWl495ucXfzm/y/PuminU2VuHu8BnCQJtHE?=
 =?us-ascii?Q?sGj9R+l9kND+hQMgt+5YLrn81EHdTpPI3xbFttLRnR+swL+bzWZ0enW/Tvmj?=
 =?us-ascii?Q?dBRErnhKnYjCQPj5/B4SDGRndqUqwI+Q5xJMIHs0dnM2yRehRr3kyeUl/XTk?=
 =?us-ascii?Q?br3zwluPCgGEpkQrXj80gX4Gw/ncJc3bmb6/o1kc9SoJFpqhclLWeJXnFCsL?=
 =?us-ascii?Q?Bv03wc5lHUaIuDJhDzTVvrg4gxKfYsvoaR8fM+wJA2HDK7uj2jAJGdWw8lgf?=
 =?us-ascii?Q?ArsmgvzOnrae6dPibKK4YzlCv5bGWFgulJFMxcf0oCGUUBSzbCA6FVMFXDOr?=
 =?us-ascii?Q?+MWvzMLlvH7T6ehvhYE5UT96LwZ0b1MkVV2iy+B3qJR3KeB8irvMhaW8s9FV?=
 =?us-ascii?Q?XaNek6r+O2pIcXRxN6CkNPDQlZEMSQ6NO0YLG0k8SMgztDYOEJZJbmI1d2so?=
 =?us-ascii?Q?D4hTDIaYAaWRnnicKzalZ97SmPkF+KgoLvDlikIz66+eLSD+vo0Ih2EGNg7H?=
 =?us-ascii?Q?DJNggDIJny8mKfnpcl/JjAb6DybNL/QBD93ZPQWSxkWe2DE596p9xMTP0RRt?=
 =?us-ascii?Q?RxiKwsZaBggVCPePfnjmnSAl+WJs6q9GizdVA99RhXix0hLOo+EBECU+Uv1c?=
 =?us-ascii?Q?0586UDGiaoB9UWo02WhNAyWp8UxaJRkqnq0j6n/Hv5CGlcQ7Xn+jR+xiAqn6?=
 =?us-ascii?Q?ZaukkOJYQshOzQiDgHt7uAO3NjzP8U4vVtUOmKEOLlMNvloZDZzhyPMlN/JH?=
 =?us-ascii?Q?5WhCkMQZ18T4nguSXOxKQo3fS2RFZZWjgrojWSA7u96X9l2GS11j1o0/qPKu?=
 =?us-ascii?Q?+U+fqEMIVJwER/xUXSEvcZxA6SxNrFQuqEYrvUdtIhgMbCvwqqAJpAZ02iun?=
 =?us-ascii?Q?KAcgIVh6RSgVkkU2YTz9OrktjdK9nIez5ybDbOFryw0S7bcE8zBzU4Kmhxi9?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f65c0491-f813-4287-1f78-08dc534926d3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 19:14:43.0575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVfFETUKECPhUbXPFY/D0mxZcK/XpeyqJfQkCrlMDoivwwrcECznz+o8f3QuBJohGfNRmmyN7OWpTLTVLxvLbo8E3mv2BbDUfhci/Ag3b6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4766
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

On Tue, Apr 02, 2024 at 08:45:20AM -0700, Matt Roper wrote:
> On Tue, Apr 02, 2024 at 06:17:22PM +0530, Balasubramani Vivekanandan wrote:
> > From: Haridhar Kalvala <haridhar.kalvala@intel.com>
> > 
> > Add the initial set of Xe2_HPG gt/engine/lrc workarounds.
> > 
> > Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> > Signed-off-by: Clint Taylor <clinton.a.taylor@intel.com>
> > Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> > Signed-off-by: Dnyaneshar Bhadane <dnyaneshwar.bhadane@intel.com>
> > Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h  |  5 +++
> >  drivers/gpu/drm/xe/xe_reg_whitelist.c |  4 ++
> >  drivers/gpu/drm/xe/xe_wa.c            | 63 +++++++++++++++++++++++++++
> >  3 files changed, 72 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index ea75c1f0ebd0..17cc9b6c9536 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -74,6 +74,9 @@
> >  #define WM_CHICKEN3				XE_REG_MCR(0x5588, XE_REG_OPTION_MASKED)
> >  #define   HIZ_PLANE_COMPRESSION_DIS		REG_BIT(10)
> >  
> > +#define CHICKEN_RASTER_1			XE_REG_MCR(0x6204, XE_REG_OPTION_MASKED)
> > +#define   DIS_SF_ROUND_NEAREST_EVEN		REG_BIT(8)
> > +
> >  #define CHICKEN_RASTER_2			XE_REG_MCR(0x6208, XE_REG_OPTION_MASKED)
> >  #define   TBIMR_FAST_CLIP			REG_BIT(5)
> >  
> > @@ -354,6 +357,7 @@
> >  #define   THREAD_EX_ARB_MODE_RR_AFTER_DEP	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
> >  
> >  #define ROW_CHICKEN3				XE_REG_MCR(0xe49c, XE_REG_OPTION_MASKED)
> > +#define   XE2_EUPEND_CHK_FLUSH_DIS		REG_BIT(14)
> >  #define   DIS_FIX_EOT1_FLUSH			REG_BIT(9)
> >  
> >  #define TDL_TSL_CHICKEN				XE_REG_MCR(0xe4c4, XE_REG_OPTION_MASKED)
> > @@ -384,6 +388,7 @@
> >  
> >  #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
> >  #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
> > +#define   WR_REQ_CHAINING_DIS			REG_BIT(26)
> >  #define   TGM_WRITE_EOM_FORCE			REG_BIT(17)
> >  #define   FORCE_1_SUB_MESSAGE_PER_FRAGMENT	REG_BIT(15)
> >  #define   SEQUENTIAL_ACCESS_UPGRADE_DISABLE	REG_BIT(13)
> > diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > index 3fa2ece7d228..e674c8ad230e 100644
> > --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> > @@ -63,6 +63,10 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
> >  		       ENGINE_CLASS(RENDER)),
> >  	  XE_RTP_ACTIONS(WHITELIST(CSBE_DEBUG_STATUS(RENDER_RING_BASE), 0))
> >  	},
> > +	{ XE_RTP_NAME("16020183090"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_ACTIONS(WHITELIST(CSBE_DEBUG_STATUS(RENDER_RING_BASE), 0))
> > +	},
> 
> It doesn't look like this workaround applies to Xe2_HPG anymore
> according to the latest workaround database.
> 
> The rest of the workarounds look correct, so after dropping this entry,
> 
>         Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Oh, and I just noticed that Wa_18033852989 that Himal just added for
Xe2_LPG is also needed for Xe2_HPG, so we might want to add that one
into this patch as well so that we don't need to follow up with a
separate patch later.


Matt

> 
> 
> Matt
> 
> >  
> >  	{}
> >  };
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 74b33a3845f2..a163a764d25e 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -459,6 +459,55 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> >  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
> >  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, SLM_WMTP_RESTORE))
> >  	},
> > +
> > +	/* Xe2_HPG */
> > +
> > +	{ XE_RTP_NAME("16018712365"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
> > +	},
> > +	{ XE_RTP_NAME("16018737384"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
> > +	},
> > +	{ XE_RTP_NAME("14019988906"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
> > +	},
> > +	{ XE_RTP_NAME("14019877138"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> > +	},
> > +	{ XE_RTP_NAME("14020338487"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
> > +	},
> > +	{ XE_RTP_NAME("18032247524"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABLE))
> > +	},
> > +	{ XE_RTP_NAME("14018471104"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
> > +	},
> > +	/*
> > +	 * Although this workaround isn't required for the RCS, disabling these
> > +	 * reports has no impact for our driver or the GuC, so we go ahead and
> > +	 * apply this to all engines for simplicity.
> > +	 */
> > +	{ XE_RTP_NAME("16021639441"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2001)),
> > +	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
> > +			     GHWSP_CSB_REPORT_DIS |
> > +			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
> > +			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> > +	},
> > +	{ XE_RTP_NAME("14019811474"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> > +		       FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
> > +	},
> > +
> >  	{}
> >  };
> >  
> > @@ -580,6 +629,20 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
> >  	  XE_RTP_ACTIONS(SET(INSTPM(RENDER_RING_BASE), ENABLE_SEMAPHORE_POLL_BIT))
> >  	},
> >  
> > +	/* Xe2_HPG */
> > +	{ XE_RTP_NAME("15010599737"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
> > +	},
> > +	{ XE_RTP_NAME("14019386621"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
> > +	},
> > +	{ XE_RTP_NAME("14020756599"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
> > +	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
> > +	},
> > +
> >  	{}
> >  };
> >  
> > -- 
> > 2.25.1
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
