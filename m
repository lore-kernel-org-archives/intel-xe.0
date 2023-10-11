Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF946CD6E79
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 14:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94CD510E884;
	Wed, 11 Oct 2023 14:25:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7D110E884
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 14:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697034324; x=1728570324;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=j1HIMlVbFgFxHO2J48MZmGZnJ3CLnykesaXRcYXloo8=;
 b=Il6MAbcs0M3UR2FrMULa4urzk69sDQ3LvVAXl6mEooDVGACizVm+bj4m
 lno5ScfQNDa8/6QehJTZjhS4MQ5qCIajPTIbiJ+bO+MmPaAz2sP4KYZE8
 u9ivVTOdeEwg5q8xIW3TBC1aGSxkT1UdZ6TMlY0SZUZGkR5/ttQOsZIsi
 2c+Tvsu+4ihrfPrjh72s2Zq7oFpplG/f/Luml3tI6p6+h6fB5PG6UCOV6
 qiiUu5lFVuP62Z8Kz2jDbv/irzflE34HPvwDDN0dFf+blBHEKjPLxapvu
 squ5MbAOTrReNYE4nvnF3goeOQIGe6LG+yRbLJ1DLwySZEgVQMUfQe3Uq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="383539226"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="383539226"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 07:25:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="757584690"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="757584690"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2023 07:25:23 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 07:25:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 11 Oct 2023 07:25:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 11 Oct 2023 07:25:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 11 Oct 2023 07:25:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1R7OZoUECIcHY8rHobg/U0ol4jExxQ8pBGoNlJxT4UFqm2kZwn6Kn0YYRwDtPjVLxOLBKOtzoE1xJZNtKQyAMMCVf8JJdQvA7lm7lmsKEqoDpub11NotygisoZwsOZ3ly88SKgXoClJnQcbH3tW+xhvIYPHVJx5fZuMOZwdAnF+iloiJvq1FxAdgZ/AEHgvP6bILenkxvX78bBv7JJA/HZXdudaAHfvXUzOGr5AdAb+zrReTuCGWLx9Q4fiZTYaiTGx9pVgshJnGnJM/3HjsEsNvMpUD69VU+lWkCpQDU4LQGIlIFp3mja0/JLreERu+AWnSR97OWX4PzVk7YyVsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ep/+7JZQm2APbw4DGZF9O7WA9Kkf9nBaNGgGTl+Kyso=;
 b=d858ruuRjrj8hLhWF6rzK2PwLDI9EL1SYqUGOPuwEW1Ds2g/AaZV7oPMBhPE8weRKcirFDXhRV5SUCNcFXvsaefxCcoWL4/abB32D2EsjpxNsIaJlIxk0rLEljJQ8JvFkI/JT+IPS3bwISSS4THdqBWf65QiJvWhwv0FoJ1Qq0I96gnma028hYjN5i4jwpueucSsbTqA6st/Z5uVN/DaJDYlqEL8Y4+WoQJipuHWz03uvznYPHqoRXj/Rd1GsO5YwpEA0BxSTJcHwivqq9bRYn+5VQwh1hb/aVgOjmiG6UGUDeKSMWbfh1yN543uzJpOeU5yl/8j1jZphiuWKVmYxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM8PR11MB5589.namprd11.prod.outlook.com (2603:10b6:8:26::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.44; Wed, 11 Oct 2023 14:25:21 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::f957:c15a:9c34:71db%3]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 14:25:21 +0000
Date: Wed, 11 Oct 2023 07:25:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Message-ID: <20231011142518.GK5757@mdroper-desk1.amr.corp.intel.com>
References: <20231011051418.2767145-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231011051418.2767145-1-shekhar.chauhan@intel.com>
X-ClientProxiedBy: BY3PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:217::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM8PR11MB5589:EE_
X-MS-Office365-Filtering-Correlation-Id: b2280b70-6eb5-4f20-d8f3-08dbca65e663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +P3/4mBHoqy4/r0cGj7GaQxxd5TA7OSIPhTD9CEQ5f0u02qkSV3cCED95aMUimeZjZiyB/PhDyU9NjSzXbLZU8Bdt/nkJzUDfetAfIroaLYrx1Fc2PO20oRr4MXiQyVJ0Vqq+1hNKl8hGo48xO5HF9Xn3RLzvbd3fqb8DiB4IunRiTpe6U24ZZegIglAefLjfy1wa/1WfPY9+9g1NflD6VHBgVem2uSMs5lZaHccSV20gTtCm8bkV34TpOTmVBkKM2tK+M2T5IwzolB27uyB1PX9oS7waFur3PzCCMksB4qfcA4PrAOwxPvfCLkfJK18dJMBGdAJuaoE/JQ0rmH9GJfixxuGZhRQKf2qdm1b4u85DFxRPwOoY3UOfBNMej1dq+KvfeB/obTWFXHd0EXwdxQuLY2QBY9MS6YohGWKwuZaZdHO6e0t5TpUmQmuIzeGPVG5Z0xZznmXJWPG2kbNvv9KrDD4DWeyAUHJQl2QCk8oLt7Gjyx+wbPfHH0hxiR7WcQYRPDdjA8IJ+sWiYWTmmlJ1Q+hj65IdRRFHV7+1TgK6mhhyzwIv8VHPBLnxKY5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(6512007)(26005)(6506007)(83380400001)(1076003)(6666004)(6486002)(478600001)(8936002)(8676002)(6862004)(5660300002)(4326008)(38100700002)(41300700001)(82960400001)(2906002)(86362001)(33656002)(66476007)(66556008)(66946007)(6636002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5QE148c/ZanJzzFpIgU74FMoOxt8c74Hpjz+xkA8pEK3Q5hwP2fy2xiooApk?=
 =?us-ascii?Q?fIL+AtwaQnfOrgJJPfkQMOxC5KswWZMby8isCaUix3oBlJc2/fkynuAhVgYL?=
 =?us-ascii?Q?2cEmdQCgnYKGWxxP3xUGBy9MNl0Xd53E3E2fzjVJ8ORr088tjVbk5afDelOM?=
 =?us-ascii?Q?o8FieU7eEMCuATbsyEAUdZmLkCgGtQxHxn1nupMH0ZYQGv9o2R90ce/e9WdN?=
 =?us-ascii?Q?ZC+tPiBc1nvb3x9qf+4A7JXVN7leRNxkXXesBgOO3bz7dPEA9ynex4fDq7Tg?=
 =?us-ascii?Q?N8qJPT/EzSkccRwfb+6KpCGRtLKy4aQSerqn17tnzcm32GN8qxAPo8i6jrWr?=
 =?us-ascii?Q?WC46H9zL7n7Lzu/kMCAYWxlJ7pbaCUxapjm2xFyLSAvXsZRcy4tpXOh2woE7?=
 =?us-ascii?Q?Y77ru080/pVt1rTPVLRRiFa7rZecFiQhF+cAGZ93N03KLdMX9JnM6s62Y6f/?=
 =?us-ascii?Q?w0+bE2AtWE/41c5NDXowkI7PCqCKcOpDZzixpGUirI0WaTjvdblOl+u8ZIvO?=
 =?us-ascii?Q?X/L+VZ2fBpmVGLZv1r6kcwfpztbuXFp+YXuzS7ADZkd7JT3/dbQsosLP7i3x?=
 =?us-ascii?Q?14HBuUme4FTdJwUp9WeVcz540e1o9dx3Cf9iLIXZx3ILAt93VoCEKzfNLHd0?=
 =?us-ascii?Q?Iw+/YyOTixnZm5bjqL5fACMqPcKLKqJwqdW4efoJgpAVME+eWYe50Ve9ePAi?=
 =?us-ascii?Q?pKC0A9RvMA6c65Z7XKTkjbDObRwYFTlK+RcJq7cSz+PWbD+FB8vyXM3tvRUH?=
 =?us-ascii?Q?oga5LBtaB2Ur67rBGxNDL7mry0klWgAuyGPjihQ/0wheLSWQV9QK8y/U7T37?=
 =?us-ascii?Q?ILqoz+e3CTRvWlDWHC9qsn2b/UA0jb6kpEK+ozY+RK+Xg71Bpr5rkynR7PvZ?=
 =?us-ascii?Q?AFstRa3hfnAmV+RUNvmrfuT0i+FWNovhDiQCUjWsr5tqIA6j8rz/os2UJL7+?=
 =?us-ascii?Q?49W8AaOGBk7DPu3TaIsSl+w+bWm3kLTG5lqkTg862QnbjoePk3nhTXETzSKN?=
 =?us-ascii?Q?0I4x+p1kAUXyFtHFErOcL/OammGq5luhahtyL4OV2BV4+rmMLk4Tzu7x1HEQ?=
 =?us-ascii?Q?EDr2Sku+VAZb+x3PUHHqeoLEQy6LRkwwnxqU/lrrkoxlhHQ7AJvJBAXqRG5U?=
 =?us-ascii?Q?Tj/GIBWfK9r6rMUIHXNTz5o0rlqFT73q5c0WEWNXxO00H90Z1FuQh1CpJzm8?=
 =?us-ascii?Q?VR6EdUxUebxK/WOtZB1uflu/Z6AdStgplhyblyqUmgoCL+pweCEQsMwqVdee?=
 =?us-ascii?Q?tm5snm5pbxPIfFuSnjHxnmigjzrJ26lcXMGm3DEme00hrLtYxuIGRiSaDcqK?=
 =?us-ascii?Q?B/NRXxVrsSFosdz5bJrKeHm4x3uUIqSC3bvxOAYNuQRAK1BCr8iCxaEWQXTM?=
 =?us-ascii?Q?3F/31+yjFBCDOZsEjC8Xb/Uz8DD4DPnXzkJ42LGNaHe0c45imTR7KwbgVh35?=
 =?us-ascii?Q?9nf9rJUsbsXJYp6K647zE0YSIdVwaTFX3Sf+MOJ4YF6EjCHN2iz3k74c5b6z?=
 =?us-ascii?Q?8hKT+hEJJK7WMwDnrQXtV/o7mOu8mUhm0hyplcXp2yu93N+Sz+c2aHQBI2Gc?=
 =?us-ascii?Q?BZ+6Y0gMSJRGScEQW7V6Jk4y4YY/gB+oEcPmetzslPbgk7lHcShOAZ0ZvFO6?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2280b70-6eb5-4f20-d8f3-08dbca65e663
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 14:25:21.0059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/qD9agEc3Ssc9NJGENTnoQgkd+uwWwElTC0hzszPtno2NT4PpWVOWNfYlU1vhEvC9vrnXNFJIszJEK29AVcgH7YbC8xXT4RW3xMZBZi04o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5589
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

On Wed, Oct 11, 2023 at 10:44:18AM +0530, Shekhar Chauhan wrote:
> Add recently added PCI IDs for DG2
> 
> BSpec: 44477
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  include/drm/xe_pciids.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
> index 29f07a00ac0f..8253219abc62 100644
> --- a/include/drm/xe_pciids.h
> +++ b/include/drm/xe_pciids.h
> @@ -138,7 +138,11 @@
>  	MACRO__(0x56A5, ## __VA_ARGS__),	\
>  	MACRO__(0x56A6, ## __VA_ARGS__),	\
>  	MACRO__(0x56B0, ## __VA_ARGS__),	\
> -	MACRO__(0x56B1, ## __VA_ARGS__)
> +	MACRO__(0x56B1, ## __VA_ARGS__),	\
> +	MACRO__(0x56BA, ## __VA_ARGS__),	\
> +	MACRO__(0x56BB, ## __VA_ARGS__),	\
> +	MACRO__(0x56BC, ## __VA_ARGS__),	\
> +	MACRO__(0x56BD, ## __VA_ARGS__)
>  
>  #define XE_DG2_G12_IDS(MACRO__, ...)		\
>  	MACRO__(0x5696, ## __VA_ARGS__),	\
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
