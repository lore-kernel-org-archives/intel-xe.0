Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2E8C48260
	for <intel-xe@archiver.kernel.org>; Fri, 16 Feb 2024 19:53:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1078710E1CD;
	Fri, 16 Feb 2024 19:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wes1cnzM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934C310E1CD
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Feb 2024 19:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708113181; x=1739649181;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FHmx7FjJvmuDjrNxP3cZa+IizOrXxmuU2qY+ixFntzI=;
 b=Wes1cnzM/64YDoyLX6Yf8cG3wk0ChEbYLuFhfgbe1wUxiPxJa/rOylO/
 QJdIZjBtheMDg9Y7jwSstCWOmsd1v7JClzU6MNzxWTRfJtxlmbTufE9dE
 n51uHV/sTAS9gBbPv1LPDYhCSpLgxk340yJetf/cE5yDDmraXv3d+VOQx
 fBDnGcq5i6LiKlTrrjgjXIYUSfMCAUs3pbJePcxPkBd2xZZ8Twk1Del9Z
 YeEmL3rIAzgiSBQhU7oNbxQYu2EtgbgNA1Ug2YA/Xtle9Bv1Q7sLDFJir
 DfVkcwKMVOLEjtJtbylqP+8xqebmimMSk6f6i8twx06jZdh67/A5sm4Y3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2122751"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="2122751"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 11:53:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="3984051"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Feb 2024 11:53:00 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 16 Feb 2024 11:52:59 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 16 Feb 2024 11:52:59 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 16 Feb 2024 11:52:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eH2hpcdp4BLwVCB3pi85AkKfTTwxPkePumTybTkPgc6wXhKCxqo3G7SD9OEOdwhanffqdUwX4wiP+lWFCG9X8GZJNfdwOZHAhK0I5/TBVjBewec/NGO7FlWH4s0TLfRt61AMbB/tPQbabuDXTOfa0VxD84dEM8bR1og15L4GbXid9RGFc3bm+aHs4FUlhFsP/ukWjepMmhF+glfdqteXFa23mO+EW//nQNA7vnulDQRFcUXLcmKy2BG6lZ79lZwEj2i5nf6pqiWrOC8hYzsv62nUlaEsngfiUiAjTisSbb7dKnF/w2I179R51+aTY91t/YJGBVtBZyCO8ZjERS5qGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EumLEeZUT9AY++mf2WCz5E9awgoGk4KW93rxW8G7G0=;
 b=IIq5FENs3C7GiXa+zTfBv1ktKnV4Meb4nKoXEfb+C5K2nk4F7+YeWrC73C7MSwGW36UwEmmH/muCuxTbhtC8993DC9hvuRDb0Mh6A4D1XF7aQLENXmnP+hg1TPQ9pSyKHvGjmkq4OO66V6NcKoyes3lqsBbqjvqGu5yfd2jYDWJu0i89SMX/iAu2HkTNMrUAFwsIRJbrRwtzKAzTCk6sd1AWQ9GQ1y+mNp7RoUcfcP3kiK6GkDwC0FtXA4kDKmktPg9cXr/nI7UyJIcPbSxQldGcdlky29ZLwnChRwOcWMI9LHSfXNBMaS58si8nZZUOw5Lxil61N1FjnN+9Rhkm2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB5767.namprd11.prod.outlook.com (2603:10b6:510:13a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.41; Fri, 16 Feb
 2024 19:52:57 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::e8bb:5354:3889:6092%3]) with mapi id 15.20.7292.026; Fri, 16 Feb 2024
 19:52:57 +0000
Date: Fri, 16 Feb 2024 11:52:54 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <joonas.lahtinen@linux.intel.com>
Subject: Re: [RFC PATCH 2/2] drm/xe/uapi: Expose wmtp as engine capability
Message-ID: <20240216195254.GL718896@mdroper-desk1.amr.corp.intel.com>
References: <20240203060534.6839-1-nirmoy.das@intel.com>
 <20240203060534.6839-2-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240203060534.6839-2-nirmoy.das@intel.com>
X-ClientProxiedBy: BY3PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::13) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB5767:EE_
X-MS-Office365-Filtering-Correlation-Id: be78de41-3245-40aa-9890-08dc2f28df11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H/nRmUnoFaj8OT56bl7SVpmAmU9lkbLjYTd9eXpRezCQ363GM687xJY1abrCeDDwrdO9XeNRel/7xvUkac9acbzXwU2Z9iDi6FWIbm+2Y0AeNJyrRrmSMmFdjRl31ZsFPB0GcBQUjKCnzYtNLHXm4qjY51MJxu5ZeSClq2aMyqMUjVpCsJj6FWtmDYn6DEtj5aUEZZW6uB/8vjz8FGaNpGaXCalasO5hQnRvADUmaf+vgr6Z/YeLKHbA06PQpVyGcFoLPUNZvt18qb+YUJDCwxxI/IPAC/jxBnM0uTSUGX3ccJri0NZLvqQHTmWvsOcMxKilFs/hgvpBW5PRH964g14uswJpnx7/5QtwrD3TKhjV7dejECg79R4ZyDfDNHIAI+MsxsTulDYom11aiHoxg0xdPZ875r4EWA8VfwUrPrDCmQomA+fFyMHcXOPRuLWCgcJwwOB5jEdwDQUF8LymiKxLc/rBfr7vJ+t4H22OvVkMX+/mYMjcSYFJh9xr2tGYOKH34JXhV8Kzq5+H+yFgcC4AZL0stOBkBvjLm/tGQnR5ovEPlzwV/jhQaFk4k65u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(396003)(136003)(346002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(38100700002)(1076003)(66946007)(4326008)(478600001)(2906002)(5660300002)(6862004)(83380400001)(6486002)(6512007)(82960400001)(6506007)(26005)(316002)(6636002)(6666004)(41300700001)(8676002)(8936002)(66556008)(66476007)(33656002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5wj06rNCLko/xPr7D9OQD+kgSDbecBIzQ522Rm2oLI2rAMnZg0OYrEgGdUhI?=
 =?us-ascii?Q?+KJOOaae+bOb9rCWU7PsBSOiI13qCsqdnQFgSD3zmJn4eaqWbxvw/ojUjK/P?=
 =?us-ascii?Q?dLdw7Hr1IBFyvhjK7YcwC3ESSv0NRge0928m862L6xEr0/9Mh/ddHsqI6LzE?=
 =?us-ascii?Q?jnBrdtJ6H4TT6LHsk2Ud58LxIzsTg5jUcQq7Wuy/AYC33tjUE9+NhZTEoYaz?=
 =?us-ascii?Q?N7aZh2nThyl+/rUrb7VoP3Bv4EGyxWPA4sKPbjRUi9t6G933i87s5lIfw+eB?=
 =?us-ascii?Q?kB9o7VVquF+84hbHM/K8BIeLrGWXUSH3ObJen+TrO0UKULamv8X9AdXw/CsE?=
 =?us-ascii?Q?O9vmhexQJ34Gwi90TEEAho6haAXpNoE3+Fd6HMxbxjpRGLbZ3tjqLx8Um51A?=
 =?us-ascii?Q?ewp5JuL+VFLOqrq802dUVSHTJs6aBjB1rzm3pZa04vustb9XSKh6yYWNaEGL?=
 =?us-ascii?Q?R/69KoaxCN6cBOCf1sEs9LWO2XW6JFZYGVTTGfXQT7DthLX0kpg/jo/IRprX?=
 =?us-ascii?Q?x0zwXZQ/pmSxv+L74ClQVAkRFfdh3VtLKHkUvOyFeB2owXS+ye9yUgcvn0DK?=
 =?us-ascii?Q?1bRPoKOIxBD7nDwsU99/Kwd8GNZzBJ4YezrO3RcYdB4Ow14faegPe2t0LLC8?=
 =?us-ascii?Q?vj3aw2XlV3J84qGsWryQ1fXWFcYBdNopqp5stlLbzpMlakYEn9xkSgxlFaZ6?=
 =?us-ascii?Q?jClNL+QuWJFdmZYxXUGCJGDYhrRZNsRFCelUpbx9VWasUI+/9A+ZAEaMPg4w?=
 =?us-ascii?Q?t0H0aj1IkVq2J6HjnQ/eNBTLaofhaIs8KoLhrPa4j5W/25S7blyAz7LpA//Z?=
 =?us-ascii?Q?BK7ZtoAxnSNB5yxb7sOjADyFzHq+dxYAsU5Ntoy0wgcqk88g7TW3tCj0l7cI?=
 =?us-ascii?Q?ays+OT3Uq0suTDzh8EAVQh1JJX3uQnba2+qArm3VmmJz7yo/Yzw813Q1ImCW?=
 =?us-ascii?Q?djmAbOFXh059oNrGod3EewwWeU0jTo43Dg4LMowciUAkn2Dry+GCtM0JFoYB?=
 =?us-ascii?Q?CXJ6o/6XF7ajUQwpxFjxz24kBeaAwRo9eE56uct3Ozk0EO+muMWsPMF3Rl3B?=
 =?us-ascii?Q?uKG0ofAcxkTKBspy1re+9y6c5L+lTqyU5taZx/VuDjZkEWIUNwU/TklOpfOF?=
 =?us-ascii?Q?vyThKg9R8nL06Em91TfEXT60pehg8M2aCZhAMQgIRCpldbFTM9pOixl4kJaM?=
 =?us-ascii?Q?isnEqR/ak/FA9TdDK2HnXDonQBpUcSrlm3rE/gAaMwnICIgndqJ90lfkUBvr?=
 =?us-ascii?Q?lMlRaKvijLy9uWGoKDEw2m7Fv4koWinNMq9qNo6IQ8p1NCrT8ktxg5qahxCU?=
 =?us-ascii?Q?g999UAfmf5CIlLuU4kOjkgatESwoCQqachKNAPAWbk7TI0YnFzNmvGary+IH?=
 =?us-ascii?Q?r1lgx+TW0nm4W+kttJ3fZolkMXBU+ouOY/pdCyzmj43eKHH/L/W9N8GHkLQL?=
 =?us-ascii?Q?IgVzw31k1vzL7ZgAXEKaCLverO7qwqGdJ/kFXYP1e6KtYeXHVQWv8gM5zCt3?=
 =?us-ascii?Q?GQFrYziXHfYq61vZ3iNxud2kNpowjpoTjorLlUb+9GXZpIOTR+N+q/3Ggfhw?=
 =?us-ascii?Q?f0E+xx5Eqcd/yiZPZqkxOKQT0y/X717GMhe9j9bK2rWGR/1i14Wme+KgGneR?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be78de41-3245-40aa-9890-08dc2f28df11
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 19:52:56.8502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MqusB5VSaggEa+h1X+bpbEIEedVF1AwxtGwDhLGHFia5kd/ZXCF64XtEq0zalujdry4+vL7ILYLTXeHcT/q+AzfjLRE1H3xpekFLNg7vCp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5767
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

On Sat, Feb 03, 2024 at 07:05:34AM +0100, Nirmoy Das wrote:
> Add capabilities to engine struct which can be used to
> expose various capabilities of each engines.
> 
> Add wmtp as engine capability which is retrieve from
> GT info.
> 
> Take a field from the reserved for that purpose.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

We'll need a userspace consumer for the uapi and some simple IGT tests
(e.g., making sure this flag never shows up on the wrong engine types or
platforms), but once those are available,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> ---
>  drivers/gpu/drm/xe/xe_query.c | 5 +++++
>  include/uapi/drm/xe_drm.h     | 6 ++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 7e924faeeea0..10981b46c56f 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -215,6 +215,11 @@ static int query_engines(struct xe_device *xe,
>  			engines->engines[i].instance.pad = 0;
>  			memset(engines->engines[i].reserved, 0,
>  			       sizeof(engines->engines[i].reserved));
> +			if (gt->info.has_wmtp &&
> +			    (hwe->class == XE_ENGINE_CLASS_COMPUTE ||
> +			     hwe->class == XE_ENGINE_CLASS_RENDER))
> +				engines->engines[i].capabilities |=
> +					DRM_XE_ENGINE_CAPABILITY_WMTP;
>  
>  			i++;
>  		}
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 50bbea0992d9..5dac079e64de 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -247,9 +247,11 @@ struct drm_xe_engine_class_instance {
>  struct drm_xe_engine {
>  	/** @instance: The @drm_xe_engine_class_instance */
>  	struct drm_xe_engine_class_instance instance;
> -
> +#define DRM_XE_ENGINE_CAPABILITY_WMTP		BIT(0)
> +	/** @capabilities: Capabilities of this engine. */
> +	__u64 capabilities;
>  	/** @reserved: Reserved */
> -	__u64 reserved[3];
> +	__u64 reserved[2];
>  };
>  
>  /**
> -- 
> 2.42.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
