Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C481CDB465
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 01:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AF0610E3C5;
	Thu, 12 Oct 2023 01:49:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9255410E3C2
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 01:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697075350; x=1728611350;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AEaazfmz5vaY5lQM2d2yb7vtRifzzJdaRyGwQT4P0lQ=;
 b=i+5OMgGRJH+Hl6O+NGcCk08qiJlyPS5wxutbyOAGMl4y9MQJ7VR+8W6V
 RMeD6U9pyFzmbJptAf21fwQLqs8jzxoaAsunSt748TzwyjM7rkabTPyE/
 tX9XnPfz9TRPpGtb5A2JAFh2ieqycOXf847wOkxk++8TO6IWopeIfSpcQ
 jZ/6iMD7iA0RjshDd2gFPvVSVfqLJrDcGf+DpUYyWPECebJumxviLr6KW
 ygSwuTDl4WvMwdbTXlcRDCjg2Bqa9l3e4E1FoyV5j/gebVDO8/X9JFydn
 7lEQa0+/QKKqYk85r0SgWPGTHx6zyWXUezuQtAKQ+N2svyxGarDVnNGgB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="384664339"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="384664339"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 18:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="844802341"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; d="scan'208";a="844802341"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 18:49:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 18:49:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 18:49:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 18:49:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 18:49:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tms5n2faZu/XJEP+Ho0X+9S/URH5uB0QBzDnTGIj0FJx8DhkuCOvnfkwMtOFk07V+Px3wIzVsv7zrUkL2OODS1p9KKja+gD1NSzY9z6kchUMAK6oblTpWj6JD7VqBuS7loq8ma/gtP0QPQflg2BIiyD6TI05XhNcZxysQrYMYLWASfXK8pOEi60zkOkCZvqUw06TTeYJDC6Ag+XlvmT7Nxial+gVPfUBfV6P/8Ljyh688CqHr/3duL6E2UIeDZ22g6h1cHWDVTlLUUKX42GTrC8lIlQrx3YFW3ATyfSDBBQ0DEpuY1sgQF3BGLFolpRUa1WMym6kNLYgAVtqtuO1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCLngmP0bUbZWlTLsKmRL0/DwnpllXvpGRccQPZffPA=;
 b=fyYfLsArkMh4K+2XLliLDb4fEwhdv4dx3P19YfL16SnpQ9YGuAKajDKGih0Ef/MieYGLpMghoYlOyZzRJMKyxw7VfO8193zDxELgI8KQ61CdyhniyHyAwzy6yW1jAkXAQ5y899MfmakSDopPv0pmj3P0y0bBYe7fe+LDb7qnn7HKv64XsUzH64St2j6wpvG0SUCgbq2r+ameU7mzgs8IxPdMgMYYH7beLsbZr65psbSmfVNFaxNgYBLFWTrNZZr0CTsmVpQeJuT0zKlWdGLGFbp5NryjC07gKKpdnz9jlYgHzOaN7xgeC9X91ucz5eNs01rS2omJPruDsu6BM6mggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH8PR11MB6926.namprd11.prod.outlook.com (2603:10b6:510:226::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.44; Thu, 12 Oct
 2023 01:49:03 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6863.032; Thu, 12 Oct 2023
 01:49:03 +0000
Date: Wed, 11 Oct 2023 18:49:01 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Message-ID: <20231012014901.GF21382@mdroper-desk1.amr.corp.intel.com>
References: <20231011051418.2767145-1-shekhar.chauhan@intel.com>
 <20231011142518.GK5757@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231011142518.GK5757@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BY3PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::18) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH8PR11MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: bf498b69-df05-4820-7e1b-08dbcac569ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xVwer8z0ipTq1qjo7RvKoRjLKdgiy522/EMirqIAWfOsBtYdF6VIJ/CsyzAmN30YVunVUH5dQaO2cyfleMvScA5nyu1mo5i6lct1HeKMinZTDpenWj86vVHaMCtBkK4ZKE1CDRb3ogvnrxsruB/F1nBdGhPghx5jV+xRbzGbw//Tqux90XprxEw/XvslJnN/c+Zl+LRse7TvM6M05ZxEvegEPodjfO6J2t8rXuT6kmaGlOfA2JIsbJP5LMYe2VCCnzEX3ElNM50HtZqYMylrT9ct1Zet5pbP/GtTQQZS9/OURA9Zbv3/sh6TjPLvjA5+NHUpPfvcGiW+IO0qSAtr0yAvNzOfh1/TmJmuYW1FtO2j8bSpD+qlHme8AJrefl9QmX3KC0WYAVfjQSY59KnC3yaBQOA2AnIKVflw9Q239P+Hw1dd8kV/iiIGTte4i0GLsM9XYze79VTMRzTog8mNdsbBPK5JQf8Eg9Klm5Mz0jusXoC0Q+OB0YIiEpRVkWn06jLYONt3DT+QZClzgp+iCzaB6p7SLxRm0EX65m+tMXk2k4BL4aAgTSEmxR08m+53
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(396003)(366004)(346002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(1076003)(83380400001)(26005)(6512007)(82960400001)(5660300002)(66556008)(66476007)(6636002)(316002)(8676002)(4326008)(6862004)(8936002)(38100700002)(2906002)(66946007)(41300700001)(478600001)(6506007)(6486002)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f7W73cTEevm/Giug6s/CHte499CX1SFMrvT9L4DxeE5euLG4qCk2wRrJOTpU?=
 =?us-ascii?Q?q7yzIhiF7B//bvUpPwEKIyCYWDMgPA6gm84d65s/n75WOMvZEJpmK8Bo7ras?=
 =?us-ascii?Q?l7g5Zd/sKkx1Ra/FI72gv8v2EIBXOVPqtPYoPIJutbgpjWRqUf9fPlF5xs90?=
 =?us-ascii?Q?urrVPVoIc8A3rXPFD5LQhFnVJ8+Ddl/9VsyKOmy4PzrQYXn25FQExHu9tE7u?=
 =?us-ascii?Q?a5IfuUtrxkpc45eBsekyK+wve4mMQdCVsU/nx3eH7BwUHcpfJPSJAGlJaqQM?=
 =?us-ascii?Q?LASWcfWwac7BlQujII9ltwhUtl1wScpJQLD/++rzAKA2e2NdJyqNnzhKE9+u?=
 =?us-ascii?Q?lQ/+awSwPYZTrPKLM833CCZ/QUD+Glqj+qojlViT3ERn+/LB1qugqIpeqX0O?=
 =?us-ascii?Q?fM35benUvKfOx+GIsq0D14DYTjhxeuUzM8Ppczj9icqvLIr5Ar47ThlNvITM?=
 =?us-ascii?Q?sDgdhnAvhVPxYAVjYdXHldtX/fAiyrZ00B9A4kQ/kFi/9snba1+bVPdclkBf?=
 =?us-ascii?Q?iGUWTxU7xEOtwaTPHuy8EtTB1nfq9pDsKza8429CV0+5MraDRzMKNY3MrM8G?=
 =?us-ascii?Q?Z5KeXwLltr+UEeWfwRl0JP5EOFzLRZHIDNdnaZ+EPwX+nRwWoSnj0F0hL1BQ?=
 =?us-ascii?Q?5gmfYLhgEmEK4S4ayhM1c7QjBPxGfMtx9zezbvg6GaxPz6uiOy2Pz11Nt6Lp?=
 =?us-ascii?Q?GgMNZ3NTpyhO2sDtxE7ENS/0tcdzdq59Orz9PRDHH79lOc5Xtc0PRQsQKsJz?=
 =?us-ascii?Q?jWRaJdQnL/ox5XAGPhz8SnVnDtFRk8zfGi4ex6yzW0NOuviydalOG1Rbwtg5?=
 =?us-ascii?Q?nfNlG0dLzUfQtU4NF9azMnWckQdyJnCDDGs7zVpwUKfM/1jW+ygkGQQvAa+b?=
 =?us-ascii?Q?wkXiRpJWHwgbaqDF8bKR0jvQWL5ePqgKH4N5UKZZo5xCN9HwXDebmUGcEY7k?=
 =?us-ascii?Q?YNVX+1M2l6I/w3x8wLJYmjRbxgujnuFnn91f7ARKX2kbi0iQaYvDL9xrve2L?=
 =?us-ascii?Q?tRG5m09a0w/nA+z0zO430jOR0k1eNw+09fZ6bI3rj0GXPcL60/ZRfn5SvEJd?=
 =?us-ascii?Q?9PMIcvRCHZqEZx/MSfhgmIjnGCroIetwlEM72YFJFUZcu1T38OPzVwl7b+gp?=
 =?us-ascii?Q?5JvlkgIJoZ7h4qO3VeYiYQmDEXoPx0S2lTMdU0OyHHHf90BdIuEPgRCbMNHZ?=
 =?us-ascii?Q?X3DQi4EK+a2quWOAs9iC2pAjQdpvizYCq9z+F8VcS/JdK9ddLlSnvAnQ+gsg?=
 =?us-ascii?Q?xocd/Pn27/LgzVGJLYUpe8yP18AxoNpi2SfmtJRmlm/ClsTfP1AZ1SvFzrTJ?=
 =?us-ascii?Q?Ivas/IGPILqG7TNKU719LvNQH397W9aoo38A6biOnB3F+0Iq0/HyBXEEx1iP?=
 =?us-ascii?Q?3jYT2IpDf3JOIfZHOHl79CVmHEkPbPAS8GMxKBUMBaZ+o0APTzz6+CcKw1mA?=
 =?us-ascii?Q?7wE4PtY5pMUbBzeXR0ws8Ueye+SMx5hxeiTc3qOSgRh2W359d4lDC8SD41XN?=
 =?us-ascii?Q?v4GIowGNYBLmR3T9v/mXo/6JWl2mQL+hjKXKxmkYRQmhnoHmGGM39PUrKBbi?=
 =?us-ascii?Q?zfFSH9AtXBZ7sXf92wmn8QLlVmc+CkOMZKdx/AbNEITRrvYPA1db5PiVNG9w?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf498b69-df05-4820-7e1b-08dbcac569ca
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 01:49:03.6847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: huAmy4klqqpVCLX8GEumWXJOjfq+eMn66I9Gk+DLht0jLezNPkO8ng45U/NpR7R/shNeuJsAf+dX/6Mi5DT90Zkovl125B8/fGwEgZPyHoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6926
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add new DG2 PCI IDs
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 11, 2023 at 07:25:18AM -0700, Matt Roper wrote:
> On Wed, Oct 11, 2023 at 10:44:18AM +0530, Shekhar Chauhan wrote:
> > Add recently added PCI IDs for DG2
> > 
> > BSpec: 44477
> > Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

And pushed to drm-xe-next.  Thanks for the patch.


Matt

> 
> > ---
> >  include/drm/xe_pciids.h | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
> > index 29f07a00ac0f..8253219abc62 100644
> > --- a/include/drm/xe_pciids.h
> > +++ b/include/drm/xe_pciids.h
> > @@ -138,7 +138,11 @@
> >  	MACRO__(0x56A5, ## __VA_ARGS__),	\
> >  	MACRO__(0x56A6, ## __VA_ARGS__),	\
> >  	MACRO__(0x56B0, ## __VA_ARGS__),	\
> > -	MACRO__(0x56B1, ## __VA_ARGS__)
> > +	MACRO__(0x56B1, ## __VA_ARGS__),	\
> > +	MACRO__(0x56BA, ## __VA_ARGS__),	\
> > +	MACRO__(0x56BB, ## __VA_ARGS__),	\
> > +	MACRO__(0x56BC, ## __VA_ARGS__),	\
> > +	MACRO__(0x56BD, ## __VA_ARGS__)
> >  
> >  #define XE_DG2_G12_IDS(MACRO__, ...)		\
> >  	MACRO__(0x5696, ## __VA_ARGS__),	\
> > -- 
> > 2.34.1
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
