Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9016CA9ED0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 01:00:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B25110E4B8;
	Tue, 13 Oct 2026 01:00:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258F910E17E
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 01:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791853231; x=1823389231;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6/p/x1nOPcJOwj0gCwnoyoT8b0tVAK2IQlhFbsJqfh4=;
 b=OkoOU9Bc7fjkRYHoeYdCYCW/8ye4frmcTxWKvDRx/Bs1rIWU+tMfIwRT
 QxXEgGcRXRemUjkcWbGkFFWPzvMdwiTkj5jonVYb7CkBW8rKqEOW+3hLS
 CC1UT5ycLRBmuylsXhdXhULFWkjk60TmgJh6FS5xE6k7DFL0mg0shVc9Z
 rlKvV7kbN7cD4YD1g44pWVg8GxxDH8bajvssHn0iHVng+HpRUsKCInSid
 SrZfMALCRnJuJzRNG/czQFEd8wpfesat5qvHJ0pCrFUiW07+Aewhu1BHb
 nXymU0UyNpqBS/yjfRLx1WD5T6XQ8JXfyslcMMe29R6FsUelfoV3nTO2X Q==;
X-CSE-ConnectionGUID: /CeHv66hR1CDahtB7oMNYg==
X-CSE-MsgGUID: HEU1HqezRqesfiTqQnIy8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="579394"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="579394"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 18:00:31 -0700
X-CSE-ConnectionGUID: tlz1X7PHQMyIeaczHbw5iw==
X-CSE-MsgGUID: 55xJZC3MRSyMAhRdszvcGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="1219761"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 18:00:30 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 18:00:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 18:00:30 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 18:00:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggOtwaRdGBGgX/DkvBafpM+y3iL5DCn/z8lBooxAXeUO4pnQzXMkmXg9dvpwkfoHicsrjeOSR00UpC8G9Wi9yL0W/fEvjV7lQSCb3Kouh+TIlhtK3zO8HV9pT/pWeVxFdo7vUSHOMKdJC7iFR86Kvl7x1uCHokJKbKvIRGbsXwEv+9I3+TfERqwQ5xF0oxW7W8nhv1Xt49KKzthcRQlWqqgfmf6OwTIrjsyvlZGaaCCqBhtWxaJZZQH6ixWAy/+uMC5v45uJ4kCafNmZVCuVSZi+5F7XhrJ50MHjP1br3W/by4DPP/csHZ0otk2K9VVjMD/H9iWbxxk6qDUJ8TRCDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCeBsoXkwTmnqSuweYNB5FBNZiCjHDjQGSji0iTPcRA=;
 b=CggG4YW2HOYGqepAq4rGoxdyg5y/9FgJn+czlo7iqzKJeN/3n9amwpH1p8QPNbvJfm0s8pzsj0c8y4W3v+2JymePMiTfFqE7dAVNQsSg/Lfz4Yl1QTLx9CPDjTtMSiLWQMjsAYWOKm/15OjQ6pe8R5L8GoAbTUNUneHX9B4BVz5kdpq13qkUMSa6tExK/v7ecmoeqpTwowONdSto8FhGmyEZ6hFdTFB/6TfLbyghMImYIIjnpbTtsHFJVo+QGCphbpxuZawtrowVlObN/bVM71eogb/pq0g+tZpNJDtEP2MsJVpva7d963xwqNc3fLo0nZPmzTBksRIDKg/CLBPo2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by DS4PPF6EA6DD735.namprd11.prod.outlook.com (2603:10b6:f:fc02::2d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 01:00:10 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.015; Tue, 13 Oct 2026
 01:00:09 +0000
Date: Mon, 12 Oct 2026 20:59:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH] drm/xe/hwmon: Propagate all hardware read errors
Message-ID: <as2Ci8Vy9iTAN9r4@intel.com>
References: <20261012110648.253748-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261012110648.253748-1-karthik.poosa@intel.com>
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|DS4PPF6EA6DD735:EE_
X-MS-Office365-Filtering-Correlation-Id: 28e15862-dfbf-4c55-5e86-08df28c553c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|22082099003|10067099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: YIR4jM4z/NV+4MBsfQtsKxNnkCDjVgqQSMtrmkdil8UBoz1mlFjdT+pFetxmRqreXvRQ3EZiMMfV0Pysi0/Vl3EFuzZvVxX90fzUdY3sIN8qOMRXlkJKdyWEGuw8tgT/70JH36d+uZIE/snr6rBmikhrBRY8CprBP9tHk6vIot7zSUPWCZuEE5SI8JMfap8tLC80W7V+xCvDnOEyMkuyvfIxufmnSb/+1zVjC6GodwY3oF4UqwjlmZzcEFlg3q7q8uQfzYyPPJ8GlqMJ76ZCRdfE+87aAABGIw4TaMOhPmjrV+q6z3FYzHP9efUvhXPqpEL33wPR3G2d+2VMCq8RlnxBrJwKnsCc1sLxk/606v061LDAjfXO3hCjspsdy5gL+Wtd1eja9U0rEOBh/s3aa4Q9POrYbtNRnFcTgmRVcACvCih+xIy9ZPdk67x/wlmJUSQHCYSl2/63Fv7OHBJ5KgiN1evOA3R6whmaxVC8q8oUqshIpH9vgvJ/4hnlhwp7B1smHcT4mi6lFnFeobOAYyYTiwIYVbX+8xxbmRYyGDC97A8D8UBVYgO6Q73aM3EFYMvFol6V47EJbhMhkJr8SWlov3lctV+0LU9vRAJY4Qg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(10067099003)(18002099003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KjwKa4yD6BdaPlmug/VZMXhEGB7JaOWs8J0BagxD7bPmRmxwMcdfo0o218xh?=
 =?us-ascii?Q?Uvy9FvnmtyHJrBDoYSUpQv4w6riFP2BIR4lCbSUTPCRLoFcY+5XZdts6zpm4?=
 =?us-ascii?Q?M/ouHxQ7D6OoVuSoG4kzgyOKP2TXmBWTd26dXBlLZ1idibylUjmKYCXxDtCQ?=
 =?us-ascii?Q?AZVBKyvdUa98aHVhkR16Ej9qZlMSjDXHpPoFHyY+ClUEDySSwcQ+UyvA0zDy?=
 =?us-ascii?Q?CrstrZ96f86uIkeSpCPD217QuhMRb9YlzizzlsJYqmYB8D4OyZM3kNqsrVwb?=
 =?us-ascii?Q?mb8tEKDgYEQAu6egU0LtPz/EFwEA+sLIWsl11z7vV5vBZv2R82MBxtHUBGH3?=
 =?us-ascii?Q?9cmy4Zjby8fl5UUxWSRVSJtnYsrpldJqcsufJDedlW7atBSaudZHYn8nJYKu?=
 =?us-ascii?Q?c8QAne6A6RFDdNJ0xCbpQqchgRyJ74to03pAZVFhn+AwauxIkUzpLDYGo1EQ?=
 =?us-ascii?Q?zj/lN1cx/KdAGUZ1YVpcsYwXqHSpjz3OVNAawRNYjaU2G/0yi0LpkzOulnrJ?=
 =?us-ascii?Q?hePQa9S/jgXrRGEqi3N0M6wjLPJmBBCTGDgs6wAkFuZl5UMPxQo+CvWxz04f?=
 =?us-ascii?Q?UD17BA0debfoqlniyETP0dnaWwpDgXArMGfi+EDzQgj/BX8DPJEJG9dt5MKr?=
 =?us-ascii?Q?Uaa9YYIiZ4CyQKbIz7Tiz4/7sYxuMRM+AnVXcO7heyMxGjvgtT01TJPqsh7S?=
 =?us-ascii?Q?1onzI+74xjcwNLFrLIE7Zg9/1lYEYcD+Xu7mk5ywwyEd04MO0PNSg6BftC/9?=
 =?us-ascii?Q?sa8Pw+GS12yvF/9Ia+ob5tLQb8D2EF4H2ihP2Kt2F9kRkfzxm/h8mdhCqPtu?=
 =?us-ascii?Q?F8qTXnEZlKrv+KgEPWWLHJ09mX0ibNngLS9twJ/ccw7r7uEiPrfPbQYzz/Ln?=
 =?us-ascii?Q?qawME73FXohY+Cye1i618qct3AGKxf1U1qBqKP+X9xJGvQAoEHG+hPqfX/IK?=
 =?us-ascii?Q?wSc37hHy7azk4Gj/bARuHQ6dD7ts6DBd+8L2m7baRcNVv8jgcnUrfMuBl219?=
 =?us-ascii?Q?ZJfSr23+dzSQczEwJJWkkkrusF+qqCTCXUydZyk/YaVN9T0VTb8K3v3jDXkA?=
 =?us-ascii?Q?qFCQ15U1Yv/A2mKBhM3SeVo0hlpxUdplvnnqhW5gidjJY/HqgS2i6/ykbHT3?=
 =?us-ascii?Q?ckPG8R0Ig9R20gXTg0k5mJokgJvJJN8aQ5wptsRoHxdwq/LwZS6Vym/5E5Cd?=
 =?us-ascii?Q?25sqfSbb7u3+6tpB13oyqHF4WmgEUNVlDh8N+zQSJ4nbO/lgLFGfh5/aaaAh?=
 =?us-ascii?Q?C9BkqFWNO90IYfdqwWckytfSiG4xYxgHbWdpjJXpghMmNN0Z6YbCS6nNPllv?=
 =?us-ascii?Q?VnLlA/hpho2wdsgJZI0yAVowYiQ25NzSc/tuj49waEOd5xhum0797l74DlxF?=
 =?us-ascii?Q?+33HzTwB3xqSTXlCx/FtygctZyuUnwL9ldQV7vjJEUwtk7KWIzl4umoflGfa?=
 =?us-ascii?Q?l0Ma7QnVQksJJrbctPrp4QYQ/fF24KiDqhvwiimO6Dz+U0kCdtNmbuPR9NG8?=
 =?us-ascii?Q?cWRV/C75Fxeuc627zvdPU6jFgvZgEy04hAUrof29FswkmEtYD3Fy+j6Ofj2U?=
 =?us-ascii?Q?PssWhERVsjIHOWnadM4zmNum50MRE4EY0uKg9tpwmVZqW0ka0wfCkKuiwhha?=
 =?us-ascii?Q?Je0mw4HU2ZyQPiPhKWO/NHQcq8ZuuFFPY+MivLOk/nShn6TzyQVp76mdP+hR?=
 =?us-ascii?Q?WMLSdE+V++UixZ8+E/yW9dEFzRLGQ1rnjLMr0fdfXKpokaeasbH3B3hYM9X5?=
 =?us-ascii?Q?Jd9oTJQSnno/h8FSB8TwoZub0xkCraQ=3D?=
X-Exchange-RoutingPolicyChecked: Qu0kZMXUSD+/xnLIbjTjat9F4CXsAFUUOQCPSiuU7hD8TiLdN9EJWLzhCK8ggX02T/Fa7ehB3svVziR2d7rIw/A2C8BmOgxdOi9lVf1q1KEW2IzlqG2m6AXJ6YkURc8i7qLPrvaYnaUM2PVaoi12TSQzX2PAHn4BNL+5Q+uCvHoBMGWkxYlmI2Vi0VJkc3Dbz4QPlCYO37Mj1VywB8mKu3qyJ9hIawTNoggA9ezB9VArECno5NKbisn1gNHVO20M54un9uAuuRbN/GmcHbrYkCSJ9uSMfNO5RW+ZmZFUPHUGI6T1cGXBhuDijbbZwDn/9uzzEBbDM5KazqXtpkqRhg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e15862-dfbf-4c55-5e86-08df28c553c4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 01:00:09.7085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujOWbX8wB7uDremuL3DlJGmmZ70FsfnNi0Ym+d5iMsWbIpHlUZcXyQa3qFylVC1ztajMoyvMrwN82CzeofwNJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6EA6DD735
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

On Mon, Oct 12, 2026 at 04:36:48PM +0530, Karthik Poosa wrote:
> Propagate all failures from pcode and mailbox accesses and fix missed
> return-value checks found by Sashiko in
> https://patchwork.freedesktop.org/patch/758843/?series=174898&rev=6.
> 
> Fixes: 7596d839f622 ("drm/xe/hwmon: Add support to manage power limits though mailbox")
> Fixes: 0c5405d3aa4ad ("drm/xe/hwmon: Read energy status from PMT")
> Fixes: 25e963a09e059 ("drm/xe/hwmon: Move card reactive critical power under channel card")
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

Please add this as part of your re-submission of the other v10 series for the CI

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 47 +++++++++++++++++++++--------------
>  1 file changed, 29 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 768566648bc8..fbcc04341e29 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -381,17 +381,20 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
>   * clamped values when read.
>   */
> -static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *value)
> +static int xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *value)
>  {
>  	u32 reg_val = 0;
>  	struct xe_device *xe = hwmon->xe;
>  	struct xe_reg rapl_limit, pkg_power_sku;
>  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	int ret = 0;
>  
>  	mutex_lock(&hwmon->hwmon_lock);
>  
>  	if (hwmon->xe->info.has_mbx_power_limits) {
> -		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
> +		ret = xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
> +		if (ret)
> +			goto unlock;
>  	} else {
>  		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>  		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
> @@ -423,6 +426,7 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
>  	}
>  unlock:
>  	mutex_unlock(&hwmon->hwmon_lock);
> +	return ret;
>  }
>  
>  static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channel, long value)
> @@ -445,7 +449,9 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>  			ret = xe_hwmon_pcode_rmw_power_limit(hwmon, attr, channel, PWR_LIM_EN, 0);
>  			if (ret)
>  				goto unlock;
> -			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
> +			ret = xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
> +			if (ret)
> +				goto unlock;
>  		} else {
>  			reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 0);
>  			reg_val = xe_mmio_read32(mmio, rapl_limit);
> @@ -502,15 +508,18 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>  	return ret;
>  }
>  
> -static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, u32 attr, int channel,
> -					  long *value)
> +static int xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, u32 attr, int channel,
> +					 long *value)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>  	u32 reg_val;
> +	int ret = 0;
>  
>  	if (hwmon->xe->info.has_mbx_power_limits) {
>  		/* PL1 is rated max if supported. */
> -		xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, channel, &reg_val);
> +		ret = xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, channel, &reg_val);
> +		if (ret)
> +			return ret;
>  	} else {
>  		/*
>  		 * This sysfs file won't be visible if REG_PKG_POWER_SKU is invalid, so valid check
> @@ -524,6 +533,7 @@ static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, u32 attr, int
>  
>  	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
>  	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
> +	return ret;
>  }
>  
>  /*
> @@ -546,7 +556,7 @@ static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, u32 attr, int
>   * hwmon->scl_shift_energy of 14 bits we have 57 (63 - 20 + 14) bits before
>   * energyN_input overflows. This at 1000 W is an overflow duration of 278 years.
>   */
> -static void
> +static int
>  xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> @@ -557,7 +567,7 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>  	/* Energy is supported only for card and pkg */
>  	if (channel > CHANNEL_PKG) {
>  		*energy = 0;
> -		return;
> +		return 0;
>  	}
>  
>  	if (hwmon->xe->info.platform == XE_BATTLEMAGE) {
> @@ -569,7 +579,7 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>  		if (ret != sizeof(pmt_val)) {
>  			drm_warn(&hwmon->xe->drm, "energy read from pmt failed, ret %d\n", ret);
>  			*energy = 0;
> -			return;
> +			return ret < 0 ? ret : -EIO;
>  		}
>  
>  		if (channel == CHANNEL_PKG)
> @@ -586,6 +596,7 @@ xe_hwmon_energy_get(struct xe_hwmon *hwmon, int channel, long *energy)
>  
>  	*energy = mul_u64_u32_shr(ei->accum_energy, SF_ENERGY,
>  				  hwmon->scl_shift_energy);
> +	return 0;
>  }
>  
>  static ssize_t
> @@ -611,7 +622,8 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>  			drm_err(&hwmon->xe->drm,
>  				"power interval read fail, ch %d, attr %d, val 0x%08x, ret %d\n",
>  				channel, power_attr, reg_val, ret);
> -			reg_val = 0;
> +			mutex_unlock(&hwmon->hwmon_lock);
> +			return ret;
>  		}
>  	} else {
>  		reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
> @@ -1391,7 +1403,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  		}
>  	case hwmon_power_crit:
>  		if (channel == CHANNEL_CARD) {
> -			xe_hwmon_pcode_read_i1(hwmon, &uval);
> +			if (xe_hwmon_pcode_read_i1(hwmon, &uval))
> +				return 0;
>  			return (uval & POWER_SETUP_I1_WATTS) ? 0644 : 0;
>  		}
>  		break;
> @@ -1410,7 +1423,8 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  			}
>  		}
>  		if ((!(uval & PWR_LIM_EN)) && channel == CHANNEL_CARD) {
> -			xe_hwmon_pcode_read_i1(hwmon, &uval);
> +			if (xe_hwmon_pcode_read_i1(hwmon, &uval))
> +				return 0;
>  			return (uval & POWER_SETUP_I1_WATTS) ? 0444 : 0;
>  		}
>  		return (uval) ? 0444 : 0;
> @@ -1426,11 +1440,9 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  	switch (attr) {
>  	case hwmon_power_max:
>  	case hwmon_power_cap:
> -		xe_hwmon_power_max_read(hwmon, attr, channel, val);
> -		return 0;
> +		return xe_hwmon_power_max_read(hwmon, attr, channel, val);
>  	case hwmon_power_rated_max:
> -		xe_hwmon_power_rated_max_read(hwmon, attr, channel, val);
> -		return 0;
> +		return xe_hwmon_power_rated_max_read(hwmon, attr, channel, val);
>  	case hwmon_power_crit:
>  		return xe_hwmon_power_curr_crit_read(hwmon, channel, val, SF_POWER);
>  	default:
> @@ -1547,8 +1559,7 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  {
>  	switch (attr) {
>  	case hwmon_energy_input:
> -		xe_hwmon_energy_get(hwmon, channel, val);
> -		return 0;
> +		return xe_hwmon_energy_get(hwmon, channel, val);
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> -- 
> 2.25.1
> 
