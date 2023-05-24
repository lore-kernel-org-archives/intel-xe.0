Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7D9C7EE23
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 09:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE92310E5BD;
	Wed, 24 May 2023 09:07:28 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C718E10E5BC
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684919247; x=1716455247;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mTGnLbcRfgNdKrPbLiMcAkbsXiZkpb1RoRMbURQwjsY=;
 b=ZnY2bYvnXkKS+OD0jtKJJXMhzW32ZsNiPSardP9FJhkPzWrv07Z/XvHO
 yfemqMUA/bzAuW2JRKvlCPpAm6xWqULW7yGy3SSmoIYRsODPyAbKR1NIY
 Udm99liLciLwJoCV+aFmpusY/8GgL9PnMlwLIZCETo2Ctfu1JnXPu+pWk
 ZXpXdB53q6tkJKPbtkDcP9bxwurrlkWra9Mf9qpY4TK1UMBv4Xp1rXY72
 tWC2KrjfxqWos7UY2KNKHZegc8+cDmNJb3F6/3AJz/mrOUt9UIUlaslUg
 LLYvwUg0Ej0V9z06SCSMklE+t7PDQ/JbdBviNaL1bmglExQwgu8JpJwDp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="439861713"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="439861713"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 02:05:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="950925559"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="950925559"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 24 May 2023 02:05:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 02:05:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 02:05:01 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 24 May 2023 02:05:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIj9MNW++yeYr+iWFsH9QL+ru33psVMEbAA1tCkEZ0KCajyK3tTZVCpX0adK1nmMiegNGkNoZSxYFCYrGjkIWaaaZHA9N4ufjpDMzEBskpzczyNzn1lr53yoYdCcHjWshZjTdFr4yRCcrmcPJ5QR5LYJc1WZJLm0JP3lRj+SFMMuKKZDiuMKMupQdPPK6/LopUl8zPgHqz3OoUlpdPfX/G0f7fiNNGOALHQm+nN8lzx5ocy7iN3cw5HVWXM3DruBXG8qJ71GTBBYZmSBdj0kTjb/kzPTvFr78+5zp2OAOCZDdBKneHiwMRZfgTPrpuzb8tniACOcB3TqZcuK0e69Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ya6EuEL3Q9eDytgaVgzDRLcXrgx+/7h1atfk1QyqmYw=;
 b=G8fYIvJH8tg8iDsC/3l8HAYmND91KjDaMJtCRAop4O7405Ku8w0vIUz962zCTGhDxvzEL2hJeGs3V/VTHFqk5/ShzbiM/aUxR3ObDEc/XyZBgp/laCi7NJAIbfyQRmzhON/FmKG6A9LRLrLw7UBORHu0NHH4BLyiWdNYeEwLfMjhmJWEwW3vWFqJ9LwYZVmSOzjyuBlbtU+620b1+xca2We52vbuU6mgmJNyB+jjEt8nAlSiLBE1dHtOlXe76N17+wytSLKe8P85oLaAvpnOBpM7bA8eEft3dBVLYZT2NKAt14cXXK4/pQtIH9Zuc1wi1R4h4L+AGz0+Hbb+hEMtgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CY8PR11MB7289.namprd11.prod.outlook.com (2603:10b6:930:99::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 09:04:58 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::b4b1:f52b:901f:8c5d]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::b4b1:f52b:901f:8c5d%5]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 09:04:58 +0000
Date: Wed, 24 May 2023 14:34:47 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal@hardline.pl>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZG3TL2NQko3finrY@bvivekan-mobl>
References: <20230523135020.345596-1-michal@hardline.pl>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230523135020.345596-1-michal@hardline.pl>
X-ClientProxiedBy: PN2PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::26) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CY8PR11MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fb52412-fb4e-4924-da75-08db5c35f2c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rC21/T0yapJWkHk8zBuOiH2Vf3LZBE0jQJj8DGpq5+qXfHKXQpvSUGtuk6AAq7rzp4najq9WcByjOuEUz9sOCpjugprcGWN3qdiQd3vENbSEjYl28a5+4qYeTisUbEkzKqM/ShV2xI4XU3GMDf+WjWAynyilRdeSHXN4D8/eW8a/G2RLZbU0UJIf/klS20FEJ/9E/X+LcGI37tHm/A7bFHpwyh80bzTESs4aWvLenz/1BgabGMyvdjyFBk7DnwihNhklaNfGc6OuoBt59WbW0UdOQtXuAPg529Tsx2Mc+j034eL5q8FWPwxQTrNrlD8fiKLSU0sFoT/xSIiUkGGaqsPl1gyDO+zdwMY+pM17Dhpz0OPasrr1Sw3OHh/ff4sne+hYw7iBlRA/h8WEjkxLSM0hp1H9zAIYdOAuU4FgFDXBqqxehsc3HodRQuwkSgoLG6f3HocalDf5gzCTa4s5RK1q+OJtjgTRcj4ehb5WMMdT+uyC5HhQc6CtbI+jtAcxt8qvyol32yMbhVZZEqJxBr0WnjDOgaljMbU+ldbZvwi5RM258whGoLs2E+Y1FjVt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199021)(8676002)(8936002)(5660300002)(26005)(186003)(6512007)(9686003)(6506007)(44832011)(41300700001)(107886003)(53546011)(83380400001)(38100700002)(82960400001)(478600001)(33716001)(86362001)(66946007)(66476007)(66556008)(4326008)(316002)(6666004)(6486002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzN5MEp2UXNRa0h6enYydGtSVHFoa0lFdjJ0YnRUemNieXRyeUIya1IrSTRW?=
 =?utf-8?B?VktQc1Y5d01OSUhMbmJocGFleUdDbmVzK1JxWWk1N01pYTZLSkUrc3FXM2hm?=
 =?utf-8?B?VUgwWEU0d0liOUpjRGwxTDIvTjNGbXdkVFdhVnpaSCtDZmFQbDRyN01VYk1E?=
 =?utf-8?B?S290d1V2ejFjQThhNFRIUkpYNGVWVWN2VWZMS0FtZ2tTcEZBdkFIdVZ0akVu?=
 =?utf-8?B?SnhqaUMxQW5xbDFOOS9vZExkczZyK1o5Y0E5WXMwZ1dpL3Z1MTlONExIeDZ3?=
 =?utf-8?B?WFh3cFBNVzdtRmpvYnZsRlkxblNrak5jd3NjSkVQeEFoZy9mMHlneXd1T3VN?=
 =?utf-8?B?YVRVSmI1K3JTWlhYWTQxYlpKN3FaamdoMFdIYjR3R1d3NTdJUUNPUmNSeXFi?=
 =?utf-8?B?SUVwdXlxK2NuQjIzeHRQVm9WZlhLOHk3b1VycHZuUUp1OEt1SEZPWFR4WUI5?=
 =?utf-8?B?dDBOdkg1S2lRTmNZTFFDZTQ0Mzh5M0V0aTJhVGsrN3RQYlRzUmJSN1VRSXV1?=
 =?utf-8?B?dXhleTRadVJrbCt5akpkOUZ5VVFpazFpMTZ5L2RtWVgzNkdPbXVDT09oaUsr?=
 =?utf-8?B?MU1XME8xUWh1L3hZdkxWVFhLdkROKzNNTDNWcG5oN2NnWkt4YkNxN1RONnZW?=
 =?utf-8?B?UVpPK2ZnWmZFVnVzODhVSHVuRVJPckdKMTB3aTZvcWpVV2NWTU84Qko0M2Jl?=
 =?utf-8?B?VEN4Q1gxN0oreEhYam1CZjYyQTlyd0VoeXNhbENUcGJmYVJkeW53ZDlzSUc0?=
 =?utf-8?B?WWRlZi9Rb0RxZW1rMGxOTFdDRVdTeXdKcDMrTlozT2c3eVljKzcwN1hPQUZU?=
 =?utf-8?B?RFNmQmllM2NDMWpIVDhMcGtaam52NDZTSGkzcGFOMXVrbFUvOGlVZUdrY0pI?=
 =?utf-8?B?VHpHdkJ5c0JmMEYzREM2ZWpKL1ZscTVuem1mMUZqQUVndUwyenFONnArT1Ir?=
 =?utf-8?B?OExyakVuaEZ4LzhYVmNUZ1A2My9rdCtxSngzU2tYdVJKMUJxTmd2VjJLTytl?=
 =?utf-8?B?dVNLVGJjdjc4Nm0xdGpvdWxucDBOY0w4Rnc4YTZkRkthWms2VzMxeVNUYmJr?=
 =?utf-8?B?Zy9jYnRKWmkvZnVpVEhVbmV0SFE2OHJ5RjVUMkJQUHkzZU1yUlgwek5VVFg0?=
 =?utf-8?B?YnJEbzdVS0RFVXQvTmVjYWsvWjVwS2oxak9UNFpoTW9EdU51VGdNTUt2emhR?=
 =?utf-8?B?YXp6SURnbS9JZ242ZmF0NE4yK0ZYNi9OVnRmbWthTUp1VWdzUmZiQ0RCUGg2?=
 =?utf-8?B?RnovcFRHZlFPNXVqc3dJVjdvYkhMVUtLQVZhNDgxSFcyMVpWZ0tOTmtpSkhM?=
 =?utf-8?B?c1QzQUtKamhMbE83UlcrTVN2alJ4NEJ6Y0xtV1JqcWZIVE03NGYwMUxycnFH?=
 =?utf-8?B?UDQ0bzBHNTRVNGpvZC9hR2U0MFJYdzNPTEVlc1lqSng0TVV3YkRYalBEaDJH?=
 =?utf-8?B?T2ZLcnRzY1ZKMXJOZG05WC82MUhyUW54UHVyNnA5cVZhV1N3VFU3TG56dnov?=
 =?utf-8?B?eFhpZ1VUdXNkVG5kSVRlMTlLNm5EV3BERys0YUZ1bEpmdGQwQWdqekR3Ump5?=
 =?utf-8?B?ditrM1pIaUQrRHIrN09HZUo2Z1dicUVpUmFvLzg5c2VzNlJuNGg5Q2s4UWp5?=
 =?utf-8?B?ZHJiM01ac2RlVGhVNjAxekdmWHN0Vkc5ZWllVjBnMW1NTkxjSVpNQXVvQm9u?=
 =?utf-8?B?ejBORDJYZmhyMkxzZVhEc0tWVTRHZm11OWtsMDEvZW1yYzhKS1gxeUZlOXpY?=
 =?utf-8?B?cVNKVzFXRFl0N1lleDBBWWhJR3oySUtxbDFQeHYyVWczOFJkbjZyOU1DdDYx?=
 =?utf-8?B?Q1ZQZjEwYkRKaDJUbEltaXhrQUtxRmcxODE3b2pvdWpGVnBWUjUrc1F3dnN4?=
 =?utf-8?B?RTNzaGl0VkR5OStDaHlaVzFOWUx6U0NySVdndExlaHlIU1FIc2ZVWFVud21l?=
 =?utf-8?B?aGdWU3dLM0NBWFVOR01HWFhOaW5NODUyQnlnb0k4ZXc3SitmOGxYR0thanJG?=
 =?utf-8?B?WUN2eHhxcFFWN3piSG15OTJtMlhIYVRjNHMxd0QzVWFDWi9zdjdoNDJLRW1L?=
 =?utf-8?B?TlJOM09CclBvZlVpNTkvQ2Y2bXk0L1FjY0o4S0ZmNzJoT0Rxd1pVYWpQYmFs?=
 =?utf-8?B?dHJJS0tnMmJBWXlxdDE2UGk1N09hR1Y3NWxtQVQ5cWhUMnRjMHd0VWZvanRX?=
 =?utf-8?Q?CnwwE8/UG9S7ZIs/+aHzezw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb52412-fb4e-4924-da75-08db5c35f2c5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 09:04:58.2068 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u/pRcYFRrV3YgpjCaES3P0YFv92sL9XennfALxiNVQ6JFeoyuOxEJiOxe8rIl8WOpRFDQhGKKq0i6mG5cOZKWd+B7E8LQSIhjCaNF6rPlsE9Tf0CU2pl26ie0iYXh+lw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7289
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Fix uninitialized variables
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 23.05.2023 15:50, Michał Winiarski wrote:
> From: Michał Winiarski <michal.winiarski@intel.com>
> 
> Using uninitialized variables leads to undefined behavior.
> 
> Moreover, it causes the compiler to complain with:
> ../drivers/gpu/drm/xe/xe_vm.c:3265:40: error: variable 'vma' is uninitialized when used here [-Werror,-Wuninitialized]
> ../drivers/gpu/drm/xe/xe_rtp.c:118:36: error: variable 'i' is uninitialized when used here [-Werror,-Wuninitialized]
> ../drivers/gpu/drm/xe/xe_mocs.c:449:3: error: variable 'flags' is uninitialized when used here [-Werror,-Wuninitialized]
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mocs.c | 2 +-
>  drivers/gpu/drm/xe/xe_rtp.c  | 2 +-
>  drivers/gpu/drm/xe/xe_vm.c   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index c7a9e733ef3b..ec82088b73f0 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -373,7 +373,7 @@ static const struct xe_mocs_entry mtl_mocs_desc[] = {
>  static unsigned int get_mocs_settings(struct xe_device *xe,
>  				      struct xe_mocs_info *info)
>  {
> -	unsigned int flags;
> +	unsigned int flags = 0;
>  
>  	memset(info, 0, sizeof(struct xe_mocs_info));
>  
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 0c6a23e14a71..86fd1025b931 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -115,7 +115,7 @@ static void rtp_process_one(const struct xe_rtp_entry *entry, struct xe_gt *gt,
>  	if (!rule_matches(gt, hwe, entry))
>  		return;
>  
> -	for (action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
> +	for (i = 0, action = &entry->actions[0]; i < entry->n_actions; action++, i++) {
>  		if ((entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE) ||
>  		    (action->flags & XE_RTP_ACTION_FLAG_ENGINE_BASE))
>  			mmio_base = hwe->mmio_base;
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a0306526b269..109a5d93be89 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3262,7 +3262,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		if (!vmas[i])
>  			break;
>  
> -		list_for_each_entry_safe(vma, next, &vma->unbind_link,
> +		list_for_each_entry_safe(vma, next, &vmas[i]->unbind_link,

This seems to be an unrelated fix. Can this be separted into a different
commit if not already merged?

Regards,
Bala

>  					 unbind_link) {
>  			list_del_init(&vma->unbind_link);
>  			if (!vma->destroyed) {
> -- 
> 2.40.1
> 
