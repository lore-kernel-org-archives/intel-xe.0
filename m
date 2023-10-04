Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF033E7B616
	for <intel-xe@archiver.kernel.org>; Wed,  4 Oct 2023 13:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0ABA10E119;
	Wed,  4 Oct 2023 13:37:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE58310E119
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Oct 2023 13:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696426662; x=1727962662;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eDRZ7/FgwJHbISBfmqEcc2yW79M8JUHZp/TxZwsPwEo=;
 b=h+TSx95SPIeB1O5bolXXwVN7QYHwqo8fe+b3YlkdH6EzK+fk3OJCZz2J
 66frBMbO7+HXdL87H32vLlygkwXLwpEJd8hPjL0GY+fA5UA/OUgLJMMDT
 cJ09dVNXi233Scbr9+cNbdUSlMuvJIw7t+WALVp7YPm9Q7aTDPL/EsD8D
 yzuGaRl86KN2TAny9VXQqvgi6wCeZD2YsbyyieAg6TKmvLFPG3piO4LDY
 1dT6GQNda9Z2DwiknpudxnkxMMM2kp5lqryEQHxLJ+L7V4Fpx352YINy4
 oFswaZz68Bc+NinInnHpEj1WSSqIlEZBIYytXtb/UAlyYQWKIHeY3HeMV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="4732935"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="4732935"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 06:37:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="744978332"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; d="scan'208";a="744978332"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 06:37:40 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 06:37:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 06:37:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 06:37:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 06:37:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LyoIvLVY3gzffj6h48EDCzKKgGk25acTBcQEk35vmM5ut8ASY4G3uQ4ffMqvjrjTR+xSkHOyssF9DmAg0NLH0oDsIY/1l93RDIBjlQpnfEp3TJ1zDpL5LvVpI1bUCGF9DR7sPsQhLU8bAm5CreGhGbT7FM5cLbbFVz3kpgreTD6QdRlR6bHEKz8gEHa/p9fmxQwr2UxItz+GgE0jduz2vjWQLZ+k3XtdP5+ANTEgj1ZWCdwnph32OLtVNbGDI8Bmpif0/xrYO3lXoiYQKJXYUrgIi2NHBSOjI6UVtJhJ6nL8/sFg3l6CAjE47rKIl/bQRzlBUU1DCmCWw+KUxDCWfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zECiEFRIdJzKfL6pGQXETmA57tLGTkQTD2MaGh2rRVQ=;
 b=lWqOD5Ju4cCbSQUjymP+bNfg133B1eB6xVbdccqTwfWoV03dqanHReupAJs4TuF3fqggMWuCPkyZ7QciRyUH2gb8x54vewzX+KtTqbUxbTABozYoEQ7QQga0h1ZUvTe4LCki0Kqvrj/3nqE1wN+u3K2li/u+9biBKTQheiiIOK0tMbqioQnENBHovMTQvNAUIZYirPTdhqwvX7/r686JEIn9OMmFDkaaD+fV4PEH+GmvdjDEVT5Y1xRMQK4RWM1DMr76FlVd3Tqv6rJOm8//zzsn98nej/TcvB2h39Bjx8gLhtvnFypHtvbAz8cjR+wyJXVW9oYUI9uh4gH1wo8A8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Wed, 4 Oct
 2023 13:37:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.029; Wed, 4 Oct 2023
 13:37:38 +0000
Date: Wed, 4 Oct 2023 09:37:34 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
Message-ID: <ZR1qnvcWDY40i0vD@intel.com>
References: <20230926212056.40881-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230926212056.40881-1-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR13CA0172.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: c0a2ba29-eb10-43d0-a616-08dbc4df12ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +eAhyG6FRGO6a+UOR7/cIOALdHVmGqQAdWJfOk9iGKcTB/Df+V8gmhA4ghKpyjZLAjwyBQTdo3oKQJdsUzHNf7881h//8Dre3xsnSkwOQDoFzd6GllM77PqacIucAJBmRNUmBeJOhjLwFErd3O+fywAUw7wWP/zKvezxorD4COjOsMYCvkU+ikZgbN79PWaCAKS8CXFxxAwmXDGDSzbNwhIOkzeV86GfDEbTtee5b2QxHLHyOLWj7ftvB/HRRqzewv4NKmzg/lv/qvRom4PdQ5LLU16xuRvBwko2o+NBRDEgubGzrZTUVvY/So4/roj6aOBpY/u+WhYBxoQOosbv0uP4RAUAm6UPUMtW39CdSMIQPS7OUTYImycz6ZoNDzRuV8ycEw2eua/bntP36wPAEMzQWDydsPHy3pd7MI8cJfYckW3DCV81/V1X0hTmTSFsQ+1f2L4QzrvhrE3iJ/ty4FgQTB3ftnms2eBa7gJXC5NtK5HPXZxDcB0hl2JaDZy4rw8rmNWITh8EO+wwc2R4OkoxCYje66KB2WCzBDcrNk9k7n9ccfI5bkW/IGDgutef
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(6506007)(6666004)(478600001)(6486002)(38100700002)(86362001)(82960400001)(37006003)(2906002)(83380400001)(26005)(316002)(6512007)(2616005)(8676002)(36756003)(5660300002)(66946007)(66476007)(6636002)(41300700001)(4326008)(8936002)(44832011)(66556008)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KOxP4KkszUeNDVny2QNpQWoAuV1muuAMlhgFN41LpzBBTg3nr47SRnQKeG7g?=
 =?us-ascii?Q?PNWvm/71lVh2/Zp8zoMefoJlytAC887zJ+oh8Ij94f5hS8BbjzqaYhJ6pHSx?=
 =?us-ascii?Q?BTV1p5+98v+PozX4JYy0o1ic5Rvsckr0JB2O6ekFgVDagk3wBcuV1SYPNNiL?=
 =?us-ascii?Q?sCYzTtt5I23WxGE83VdWXgd+V5En1LsiBHiHS4lEC2zEVWtX6Gn4ExqQIRPs?=
 =?us-ascii?Q?WoudtpMQaBRam8z/sgDMgd2fzt39Ue8lpy55sIho/l7Bbsjozq/jb7zDj34/?=
 =?us-ascii?Q?mSBdpiXnF7gncIhZF9mKiRYUxN/eyb6QuljlD87oD6ZGT1tlUMvUjykJYVbV?=
 =?us-ascii?Q?e6920q41PYar4BpCz6h64tAWNkGOAUBE7tfu2S9RgAZYeO9pkdzfFJTXeNXB?=
 =?us-ascii?Q?lXhprwGvs0Xyu/ail4d+HK3/WSZelANjya41vbCcbKc6ovagWHfUH/INFQzv?=
 =?us-ascii?Q?Ad6/uYRUEFOLpjafBI54lOKC6+fihnGwJsxBaQG9y13OBQMg1s7CqpQMXFpk?=
 =?us-ascii?Q?mS/xiIK++7L31hLeIaRSdGAE+LL10fisytTvre+CmYvriC9NgyYsEeMTLsaA?=
 =?us-ascii?Q?6g+71m/qSAMlCTega1CI+KxVppauEF/0HwV+9HOdf949glAx1rnbSn8GW6Tg?=
 =?us-ascii?Q?wtxmlTdrpDNf7S/mWI8soewQfEp9L4V0gkAuhZ0PHo14N09IE00Thb6v3yXS?=
 =?us-ascii?Q?TYH4rJx6jQxf2L5zKD5JSPxwFilfZ5I9TU2SYZVWR4jUeSazH61bnLArpE5F?=
 =?us-ascii?Q?rd1Uuki6gSLeAOJbs9ZfxnUkF5q0/Yg2kqD8zURukjPhqiWsn8VI8zf5m0fz?=
 =?us-ascii?Q?oyyEmZ4HPJD3kjgBeNoADA2DMVoDeJr9VKqrq4++bWjkZfU5jO0hTdT8G8GJ?=
 =?us-ascii?Q?PKkQ5wYCgJdi9jzVFhIRiZ+WydMJSRpFq2j6O8PmzHA61qbSftSVTq1APES7?=
 =?us-ascii?Q?MYjc31UEhIM4v9LWSWE4yKXyqmzui5OtIKcHn6R69pFVBuf6OWXwwCJ4N/YR?=
 =?us-ascii?Q?5pEUVdIBzJUoru9WYXgZBSnhpEmw6Nh7DvebeRE2R7JtaPGbWwJm9P+kOAc8?=
 =?us-ascii?Q?bfBYRPxgwE8XdytzFxfA1wJvCAASlrpCAQluU96OnYzg0VL6AMbmfgzCFbXJ?=
 =?us-ascii?Q?VJAeIDIrX9I1L8HP472OmT5Akz8zoRhsWiNC/YXZtBteUZG5A17EhY4x4lFq?=
 =?us-ascii?Q?Tu6Vm2J3s5cpghUV4xthrheuaKHb3svakig1puYQtVARdAu6NqqDC+NPwW1a?=
 =?us-ascii?Q?wyuVUX6dMzjELImh2VgjWF2S5xxakH3jv/Pqx+nIoDX0KF9RUuvOFJRUXw/N?=
 =?us-ascii?Q?g2C5b1sK+BjkcEWO1DunJyNs9Z73yLtdhPl8RzGV9Q8vJWh3LAGRs0Hne2/e?=
 =?us-ascii?Q?z00hXrAuGKe6zRnh7uZin+hZBi4lD+d51Rsm/TOHye1SMC3RoOmXgfd+US8f?=
 =?us-ascii?Q?XFFxo7u2+dpPu0IYdH5BH3W5hrQ9lvbA2ECv+IYxZltcfjmys+hmi98iP2L5?=
 =?us-ascii?Q?I3KhQfgeAnKVyW88imR04Z81INZXNEvzRJ1smVHXCka37F/fe4WtdGHwJj9A?=
 =?us-ascii?Q?00x1MaKOfXP6WtoHGNi6vOZRD5kgIahbf7o7KZLa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a2ba29-eb10-43d0-a616-08dbc4df12ff
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 13:37:38.5458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ciVFbRO23+sO3W+KYCZIODXSQ167jATEEX8gu+KDlnhZIe2W9OjWxbb9RH2XdtJp4sLXf9Z3bSNUC+IeOJ2qDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8700
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Print devcoredump to drm_info
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

On Tue, Sep 26, 2023 at 09:20:55PM +0000, Stuart Summers wrote:
> Currently the devcoredump is available in the file system
> for a user. However 1) CI isn't currently set up to dump
> this data and 2) if we try to dump this during the driver
> load when a failure is observed, the driver will be torn
> down before we have a chance to actually read this data.
> 
> Add a quick routine to print this out with drm_info as well
> if CONFIG_DRM_XE_DEBUG is enabled.

I feel this is kind of a duplication of simple_error_capture()
that I thought we could kill... at least that has a more specific
config: CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE

I mean, maybe the right thing to do is to kill that and have
this one here, but with a dedicated config?!...

> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 17 ++++++++++++++++-
>  drivers/gpu/drm/xe/xe_devcoredump.h |  3 +++
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 68abc0b195be..aa41d8e9b602 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -78,7 +78,11 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	iter.remain = count;
>  
>  	ss = &coredump->snapshot;
> -	p = drm_coredump_printer(&iter);
> +
> +	if (iter.data)
> +		p = drm_coredump_printer(&iter);
> +	else
> +		p = drm_info_printer(coredump_to_xe(coredump)->drm.dev);
>  
>  	drm_printf(&p, "**** Xe Device Coredump ****\n");
>  	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
> @@ -102,6 +106,15 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
>  	return count - iter.remain;
>  }
>  
> +/* Print the coredump locally also for debug purposes */
> +void
> +xe_devcoredump_print(struct xe_devcoredump *coredump)
> +{
> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> +	xe_devcoredump_read(NULL, 0, 0, coredump, 0);
> +#endif
> +}
> +
>  static void xe_devcoredump_free(void *data)
>  {
>  	struct xe_devcoredump *coredump = data;
> @@ -192,5 +205,7 @@ void xe_devcoredump(struct xe_exec_queue *q)
>  
>  	dev_coredumpm(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
>  		      xe_devcoredump_read, xe_devcoredump_free);
> +
> +	xe_devcoredump_print(coredump);
>  }
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
> index 6ac218a5c194..ba0c2a7b71b4 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> @@ -8,6 +8,9 @@
>  
>  struct xe_device;
>  struct xe_exec_queue;
> +struct xe_devcoredump;
> +
> +void xe_devcoredump_print(struct xe_devcoredump *coredump);
>  
>  #ifdef CONFIG_DEV_COREDUMP
>  void xe_devcoredump(struct xe_exec_queue *q);
> -- 
> 2.34.1
> 
