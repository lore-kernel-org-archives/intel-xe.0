Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41DCE784B8
	for <intel-xe@archiver.kernel.org>; Mon,  2 Oct 2023 14:35:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D070D10E2CC;
	Mon,  2 Oct 2023 14:35:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472FF10E2CB
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Oct 2023 14:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696257312; x=1727793312;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t50TOmqqfhsTytQZUecpfAqDn4FheLh4oAdjbhrKhWk=;
 b=nvzjwc/nfcZQDQqh4u8D/nlZf0DQzIRnRG9LuxqExRXq13z6Czw39ihH
 AePygpDr8TKX/xBLVvOeokgidt30iHdy/OYJeUHwYNBztqQ/0xSjpnRGg
 6FvW55Yj0B60pn4wGv6yruYPRWAGsbpP095Wi7fN/VnwvIoF44OyeWATy
 XKjol8DmEscwKB6ZHVuJ6O1BwMHfCKHQydRwFBFxE3rCGNEJQjmwG3/vf
 6JZrTiYIMDd02+o5R1caxt1fjtmEG7uOhAxXltx/RHZVMjT2h7OjEKq4b
 VihnRT3wqNgGZzb8qlOReye74hQGBHQI8VYUHt8YbJpiuehgqcVNlZAdV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="379936594"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="379936594"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2023 07:34:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="1081646385"
X-IronPort-AV: E=Sophos;i="6.03,194,1694761200"; d="scan'208";a="1081646385"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2023 07:34:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 07:34:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 2 Oct 2023 07:34:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 2 Oct 2023 07:34:50 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 2 Oct 2023 07:34:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6aWBMqtPXpiunY+unJrNjc1Y5LSr3xWAGbHaRQ5cLNM58vZ642Fpz/+SeSGiRHUcQ6JLof9wFKzZgc7V3MMLRhAhNpIwlTl4azSuw7oJ8jqrXX1KGkL81HCXXlHcs8qbEcIVVTqMuViMplxMGS9sdZqzObUjIGrkeKdanONxWoC8EckIyw62pw1WD42n2Bzk1FFV+lX6pTgiqegGnj2FbH9ABrDYahq14OKjbwmaARjj5Dkflb3yQZdg5Eg9InIlPWaRZvL9j/7ZOa35/SXw5+7oPQ1f1mNRllAH+y+z4b4HVYI/7l0Gjg+1m9qzLuRlbGM9FqmrIDPiyWykBxu5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAk5wq+WJ+ju1poUAgDKdf69ObnIbx6QOu2MAFO3PWw=;
 b=hWojGfO8EYknu/JBkG6rbRwHXba4JBUvTmHUQzPUuAuBNX4l6b6HK7bvM0ruoWexztFbLT2O0LhHR6FmVELYB9DBY6yyd9V8GwDJgwkMYiw3BtwLuoUAX90I4016Rlw2XkB6S1xlIviz7BW6JEPKH/JCj/4bqKEGTl128i/9FhkneZG+XoC1s+1zJNbNGpWCcXmo/poFzrK6Of6sTUISpUoH6XCEjBdz3GgpoUu5tlzOudLA1riEd5zGrwU+7jIzGf3f0FjDLweouhWqA02XlrtASVZ6Trbzb3FJEgrMXhcMCyilBFzLHCTuz3y8a+r9QsDQ6fYPEhV3Y/aBx7a7/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA2PR11MB5067.namprd11.prod.outlook.com (2603:10b6:806:111::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27; Mon, 2 Oct
 2023 14:34:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Mon, 2 Oct 2023
 14:34:47 +0000
Date: Mon, 2 Oct 2023 10:34:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <ZRrVA8cjMi4lo6De@intel.com>
References: <87leclguc9.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87leclguc9.fsf@intel.com>
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA2PR11MB5067:EE_
X-MS-Office365-Filtering-Correlation-Id: 702b40ca-5764-4d6f-b620-08dbc354ba3b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NwOjJ1ozLjRq1UjQA7FQyQFOlsLnsIYpdWoR0pCmsVJIluGk/l2ZMmcr9XIqPWMA7OReHJrt23tYhC+7UBENn5iiFnWctA/qasU5ZFw/8opo8CC2roVsitSOUCJFGxTj3hmZpVIp1PrMDMVCR+QFpBENMvRHzIDpEQQnVzBIMun0+Ya2g6YSsgRuRyBzA6j8g+Bw2bc1enXhrb1FtGQrJZljsnkWRQsVPfoHdaGvaoV8pdHD24U2KX2qFqqRFhegSu+mEcr/JpU2xqSkuQygYqXoqw5ZUmvMpfLnU11zBdaNpsPvpwIeUGVASMqFEd/jJ4XTHeXCPKNfMUZ0O9Wxx3SpAWW97to8ZG2u5eCGavYxjE+czXubvNbDsfEFzRTLPC/BD7D0ZOZxySRndnhs0ywoUo767yeZsi5strcbO2ZD3OmtgG1KfIp+CuF42oAEFQH5mEuo6N5/E6Mq7y4pSkc37iAC3jT3IdU89WLdR4nb+tkux/DPXwRGJYKqApx55Fv+UmADXlLHV5PfQMuLJh9B5gUoyNBAVOzkCsr4fyc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(346002)(136003)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(8936002)(2906002)(4744005)(44832011)(5660300002)(6862004)(4326008)(26005)(66899024)(36756003)(41300700001)(8676002)(66476007)(66946007)(2616005)(316002)(66556008)(6636002)(37006003)(6512007)(6666004)(83380400001)(6486002)(478600001)(82960400001)(966005)(38100700002)(6506007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?suaJdHBIRsyXUgfdGLM6KC5j/Wh0hNVisPJqP3Tgdg0ywu2xnibLNT8kK/jY?=
 =?us-ascii?Q?o1xImkoXZbdWhc673aG0C6VgbHyEwxHpdMNYID07VUNuWjH1j/TxaHcglqjJ?=
 =?us-ascii?Q?+h2IKQDw00taxTvGeUhFpOmhl+VIjb9mbeNERCL2IsBuQ/s/aDmlZG581L32?=
 =?us-ascii?Q?lAB20W741eCpZLwHvC5t9a3BycYyc3Yy7PMhrwoZ9Aa1WxAcy5o/QoAzDaMH?=
 =?us-ascii?Q?14ZvZc1g+8hyj9DnumCl7ky8exxEnyV9ZDzl3OeMdHkm5mXAGiiW11SUI9UK?=
 =?us-ascii?Q?yzW56pGRM6QGImZUN8dGxh77dNZ6jnxzRhawUR9XLnvCNHHA3aNwyvpdY9v/?=
 =?us-ascii?Q?KzE4QV90X5Yw+7sWn3KZ+l83yDn5Dj1Ms2IJ7FZmRB2elS7W5vpYvygrVavr?=
 =?us-ascii?Q?iFuzdvPeEZ7syAKp71KtbzBEbJaDzEOTz+NTbBtVtd50ZMQB2F7Vfr1a51Fc?=
 =?us-ascii?Q?D6Z0JQOjQ06V7L1pknfuxt8J6vL8oE3aeKIKWD36acC6HKBbvKM/0i/5Jyo7?=
 =?us-ascii?Q?A1zsiWoiwuL0TwVMqmMGzo19pAdH3OVYE/t1mRV4vya+T8jfxKgysu57RRqP?=
 =?us-ascii?Q?bHkBUxH7Ta1crnxn1hY99FAdWveCUs2/uOswNTtWofjqoqrodwNQrg0hDV99?=
 =?us-ascii?Q?WWPBEynPjudy9VQf03EynY5aoPcfvPsUsYgOTkIsKEgbm4SXFLKU6UV5ix8H?=
 =?us-ascii?Q?nVuAlWXvl9aQ4HrKE3199cOO0JvBkaEtMFYnCHBu6U9AI5CM3WkXIX8b7CDW?=
 =?us-ascii?Q?Dktvc8VQhz+T/9l5VSTqrJ4l2xSSag/F9960rrTgoUSThOe5k03pq9PZPTP2?=
 =?us-ascii?Q?C1a1KUBFGeJY8woi/KCjvqSHoEfc5/MQ+NW+CE5gOeGZtCH1nyLOIzN0wogn?=
 =?us-ascii?Q?N3dK+MtKpiLl8picKY5PvAu7VTMnun1lHxTPhk8/yv21uNaQHl9+yhYYbnna?=
 =?us-ascii?Q?CQ1Lmi0EA0Sg5pQXruQA6y/CXwkXlIsac65id9F+cE0QuiWrDsG7jgBEQCWx?=
 =?us-ascii?Q?6OmTpSVEa9MC7hfPL8Ic5d0TDO4u/ZJb+58oDX8a4UiHSyOCv0UI9e68ocnh?=
 =?us-ascii?Q?Kt5HfUZDxnCWkh89FQ4VwsK8MI/nMb9CkWNt7nBVNaxBlCORwJg53qOcYEg9?=
 =?us-ascii?Q?r6TUfYn1G1J3JlRCi4SVSMw9OgCE/UXF7nvJ3t6xGcNUR/HFKP96Kd1WvCbT?=
 =?us-ascii?Q?0iB2E0yjCBMW2Ooic0oUvDTEyA7cywjvMTLO3d6Mjp4zYt6nUBbRK/0nvDd/?=
 =?us-ascii?Q?w8L6+Tr3bxtpoMTXNWjuUpy+IWCWrU4pyj20EKpdZe4WVu9YlfkEVs6nuuOY?=
 =?us-ascii?Q?hZz23DEyeFvhW9j5UPfNWG7SB50hXBKRZt/GEw7yVw/rC98HNvMfOouhmPuv?=
 =?us-ascii?Q?bv3hvOCKrCQQiZcHs+U1A7xxzEjaATXVyDAuHpEVCkCJ5M2qxD9Mx8jW50fU?=
 =?us-ascii?Q?3i8bxiZe1G6HwY3sCwhMnYJGjC+r2vzb5aNzbJYd7C4Zw5EcHoj+53rOEX/G?=
 =?us-ascii?Q?eWAukaCHMhpPayBs1ev4AL4EFGzf0CD4Ndf/CVlX1G7aCiCRD3d5Rlx7MCLO?=
 =?us-ascii?Q?sG7NFt0QGcR0pGm9z4qn4Ya5mfmYzoyYlyQwMId+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 702b40ca-5764-4d6f-b620-08dbc354ba3b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2023 14:34:47.8428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4PDK8AsWSXknfGcTV2ZRdRPeWhU+zgcBThzwFCPXN1CJBSNZgnwfFnhbEZ/t+oIt/Vusf/LsbbvvrpOoMw/+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5067
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] separate i915 changes from existing commits
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

On Mon, Oct 02, 2023 at 02:03:02PM +0300, Jani Nikula wrote:
> 
> Some commits have slipped through where we modify core xe and i915 in
> the same commits. They'll become a problem when the commit order is
> modified for upstreaming, core first and i915 (display) changes next. To
> that end, I split them out [1]. The commit messages are dumb, but act as
> fixmes.
> 
> Rodrigo, can you pick this up and push out? There's no diff to current
> drm-xe-next. If you need modifications, it's not a big deal for me to
> redo this.

Great idea! I just reviewed with git range-diff and force-pushed.

> 
> 
> BR,
> Jani.
> 
> 
> [1] https://gitlab.freedesktop.org/jani/xe/-/commits/xe-i915-commit-split-2023-10-02
> 
> -- 
> Jani Nikula, Intel
