Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D8CC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 01:24:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2A9B112F1E;
	Tue, 23 Apr 2024 01:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZfzb+JL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3713112F1E
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 01:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713835454; x=1745371454;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=L8SGQI5GFPXZIJ4JWYGzo6Mb811OyEAVJJs7Ib1Vy0I=;
 b=lZfzb+JLBZ2T8QFdEG8FX9DJtyCHc9I731ywOm1TjXdKMLS2xxR0QQcS
 HGuAqUw2PueYwMC7Hf0v0eM/6ClUSh7cx0y+bFB+W3Rm8QNmr+moPtMn0
 UJhGk0cUGmgcSYFn+RTkCDehkB9T9e+hTJBIs0JDivcF96phtuC70UBUN
 72CeTPmQEapYI6cw/BtO+pUfxE32t8kHqEKKEnyvJ1pNXrKy1EnlJ0O7X
 IclxfrevVEBGg4O2ftomtEhXjWXC8M4OWOea9KD8ON6UztygGv9t4wm7I
 yaniTTp7ez9G2S5/Kole2YvBeFJhAhMxxxJIWC10vPzKZfp16avhOmV3I w==;
X-CSE-ConnectionGUID: 6CcJCMjBSk2Jt3QjpOunOQ==
X-CSE-MsgGUID: t8VeSU2IQCKCWLwBc2D2Vg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9268288"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9268288"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 18:24:13 -0700
X-CSE-ConnectionGUID: 4GjozPh4TmyJ29LboIh4vg==
X-CSE-MsgGUID: JnfxQSLvTXWg9W3626pmgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="28716831"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 18:24:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 18:24:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 18:24:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 18:24:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 18:24:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBxcdmaNwuhdcqeBMCvREblLMQ90O+23pqrv4zD5bUw6CDX9ZFk5F4/YjTX/5ki9QtnVNFEu83ljCxRwGeUJK6YSghm/E9CQGxE2VwvaLv80Gme4tQs3BEswcTkFCqKZemkRJAN8Z0R7/qkMLbc03rYH4Wf/uYvOrI8O4tk2AI9NZRYFMLbpYMEsfIeNzFIhf9pSeYT5iNkFdT6taAnUmwF3dmAIjaVXBAKT5D1UDowkaSobZZYCBkR7Yo7CzU2xVYHgw23DYVzpqxmLpOCK+cLzKCoxZ8eXheOYvtnvDGQBmIBSCt+P/i8MH0Mg5hseA0WE2EJjGvCvxcOnI2QTag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqmqASEl2n7Rq+MyLdOrrV8KEc4auU5VGr+Ph52kBdo=;
 b=K50zK7WOrreeZLHh0yqRXQ/2YvgEpbBymm3RmVaQjUevZeZPBOM5ytk8M9LyM90mKxDQ3EpRkCtwYZRnCrdU4ZGD1zsEHhFRl/PaDqKz2bAGy+H00y/yBRbh31atSZKpHOeMIkitVM8fdQ8r0ClwCoKyoMUUnHXLARFPItiZUtDvwN0kLgZ9iTZ11Lfaai1z5bWsgrn5BHwRwedDhqvivSL/jn8YnmolnlJGrzvon4JJ0quY6nh0Pm5WgsbTHcgRyjMm2DtpwAzjvKFCk97O8Pixopyw8KQG9ystCOYKlcEdFYcLm38xBE1WQCCEMo9XjBldYKxAgvw9sjUyxbb4CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6504.namprd11.prod.outlook.com (2603:10b6:8:8d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7519.21; Tue, 23 Apr 2024 01:24:08 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 01:24:08 +0000
Date: Mon, 22 Apr 2024 21:24:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: Re: [PATCH v6 3/3] drm/xe: Add INSTDONE registers to devcoredump
Message-ID: <ZicNtTSq3cH6L4PM@intel.com>
References: <20240405182326.72157-1-jose.souza@intel.com>
 <20240405182326.72157-3-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240405182326.72157-3-jose.souza@intel.com>
X-ClientProxiedBy: SJ0PR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:332::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: 367e3c61-fdf6-4e1c-4493-08dc633412cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?nvMHq7MrLUsLUjgVUN5EDWnVgOD1dk7IOPmqfLQ5TFDr6ThFGK3PsDtm0o?=
 =?iso-8859-1?Q?D9cnhw3oDymX5pOnKu9jgKRqxzUwXNO8GgnMMqWVXb3E4B2Swgh460MOnx?=
 =?iso-8859-1?Q?+tVCfOHbYmglmLja3ZaR3ow1MXzHmogm2zhA4ZEXh4NIlDC8y4E0Yg8wMZ?=
 =?iso-8859-1?Q?7CAnSBRu5yLeMk7blvtQoDc0QKCyQ6I4lUgg9/5wirn5zxU+/oCpsKnNP4?=
 =?iso-8859-1?Q?EORRDgrneAcHyCV8bCEN2lq9o5XNKbdjdWdWkrr48ZctWlZ6At4jyuC6QZ?=
 =?iso-8859-1?Q?e5U0QqeST4gc52yY/hPkjzoeivalzByQRpTZ+YCxePnIYLzlsCCpWvDE5F?=
 =?iso-8859-1?Q?SqGmMp8XusvOCF0rLWxY/cRLsKMAPIqExDF5ZIocztZzqRlghiu99FZLa0?=
 =?iso-8859-1?Q?DoMf5mFGn0rNEk0RqWtqjLqY5NLF2bI9Yyt/sdSZbOMPUlF08Dk0f5GqL8?=
 =?iso-8859-1?Q?zy3fofNECO9zYm18/pvGa8SMfj9RZTgqGiL9k0OW17Z/hFVskCjH9IIt1+?=
 =?iso-8859-1?Q?cfu9fFQh0YDSnOCTUGERw7iL3p/Sp5MSmXjMXg1FTABCMw0loLrmVu6Zya?=
 =?iso-8859-1?Q?sJpHixyGjW8OhUbxUQMN/FCy6T0bSXLo+LqeZU3rgMwef7TFpvabCOn47C?=
 =?iso-8859-1?Q?c/OqveW1ASSLJqRQgeBxS6nOLkNcDYa2EnQ79FVSpp7cfQWxcBmkH1gRv4?=
 =?iso-8859-1?Q?imPVgkFOMLJ7sv78mMOK1/YE4B6eLrBG6tEYpXGUjJRlaO9SMi5I0Olvwm?=
 =?iso-8859-1?Q?NkGjRZhgJGWwlDWB2d+lxhWkPHTbNHz2dnLwhlYSp/yFKzAvjhnCeuuhri?=
 =?iso-8859-1?Q?yrkiHbh8lAHe/6lkc51+WJLYvKj1XDZI3pzvyvjG2fLHYo/JVoY2ZrDSgY?=
 =?iso-8859-1?Q?6QiOuz2o93N3c8Bw7FGujSLTpMrKEIWMM7PKwr55cShUraHI/6I1zk05YF?=
 =?iso-8859-1?Q?XUW2ehyU8FQbo4H4ZD1NoImNqtYlR6AP5SS1sBWEiIUpVKLrNljwWRmc0E?=
 =?iso-8859-1?Q?jIXzNyfJ9ez6KUrXIoXYQ4vHBTdeXYCNuRl+TD6h91CNucFBV8xiYFNx39?=
 =?iso-8859-1?Q?D4LSmF+7cYqFtzQwhwZzoENikx//2k097J0h3zD+q16HS3vblVRfbhBqVD?=
 =?iso-8859-1?Q?X9NdXVeHf5O9Komlh14oPvEN03k9+MXrGSwrRNf7SITnsGqhuWCZol2aFi?=
 =?iso-8859-1?Q?66TSTBk9wTCPuxNkU2+7IwmXRA2eE3H9tCPq0i1AsaZYWQs7DAQN6JgU+G?=
 =?iso-8859-1?Q?0FyyLvvFU83s48qnhjK7pFybX54I42nmEFwHAAjeJLy76ZI2u9N8WZo7li?=
 =?iso-8859-1?Q?8Ki8+fPV7k8VKLb9/6lE09EyMA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DkL2rxfSSJa6qu4pI6D/KsD393Qif3S6VeApNYh/MEpr4El9x4zWJT9B2f?=
 =?iso-8859-1?Q?IvyvwbndYdcoUk2ZU1UrotfPgKoNZTfigssb32SkBXoDorhw5MuWI5oFyl?=
 =?iso-8859-1?Q?MJQtSHVv2rSn+tQPKL+32ErThSsQEweCYpymb9u/t2QIQkAa7Z/3R/qkQ8?=
 =?iso-8859-1?Q?ytU1m1oGNzXb9TvXZ5L6In73qiyTcuMhFrbZQp3JzcN3U/gBR6UvM8Rl00?=
 =?iso-8859-1?Q?SYzQ4SO3WVaF1QDNlOhIckR+xlQ9FlnBNrpw0Oi8p4nbDpuHMVo+NPUtPf?=
 =?iso-8859-1?Q?36eT6/+YxBGLi/6NvFk0BrritnE+sqjqAdyxCDSgo57S7XE4mwOR+EZGZe?=
 =?iso-8859-1?Q?fNAL3TFSpLvCWsDMrm1BbBw4Yj4oBqb8R8fIqWYwO8ce3MtOMR7P2sP9/h?=
 =?iso-8859-1?Q?4Qd8tub4Hp1ep2Ddxnx5vg0FhNqLHAFkZvv5ELiH0qfi7srvLrrPrX4trK?=
 =?iso-8859-1?Q?RBeg8X2Fr0O2qLMX5JL2YrV5dlxkDcO2a2LlV7hsE6XCCP/nXnT8maAl4K?=
 =?iso-8859-1?Q?G8sZkTcilB4HQ/tQLL38E8frRBYuNNANFCwvMgAvUq/La3mqxLi123jXnl?=
 =?iso-8859-1?Q?HhkmbpueGDa7ICoxH02o6czNUKVFqf05XwYzCSQHsisMAfoTkJdCJHtoL8?=
 =?iso-8859-1?Q?zRG78+CuMrJ41qgPcnWessnXBhsfoevfnHnirrlNWnHie5HV5dpMuFHtg6?=
 =?iso-8859-1?Q?dRqHhYs1QFj52p/f9peCkE3D1V0U4HFEl6iF94X5VaPPz/Ea7Eu3c5y8eM?=
 =?iso-8859-1?Q?RWh90PddtfCd7RyIJsi9J9QNwD5nMe58kQbMhYEs9xgiCCvqwKOknCnmDq?=
 =?iso-8859-1?Q?oG+ymZZCg80/owHJaj1SEPLoGpAYH9w8YYnU9YR8Lgcy8ekKcj4M1Ox2H9?=
 =?iso-8859-1?Q?VCoL8WeunDp+ZGZa9R2xZPVFUxsmiNWAYd8v0rEFeXp32pAEQ0syk+4klI?=
 =?iso-8859-1?Q?nHy0mOK6qdz1CPYWbIG2OU/8P4v5Zebp9ptTuVmN4isqNHkZBFvZJYdWMr?=
 =?iso-8859-1?Q?+X02Fadc8F9hXmaV/ejSvgAOzUl8OS91K6tdWDtyD82zZL+bNZxDIYROdl?=
 =?iso-8859-1?Q?qUuorY7b+zFvpEkUYegMqcusdMI14cScVcxNMlfHVvusG9WJfJGs+Jybuv?=
 =?iso-8859-1?Q?LJLD6+WGKl4iVG7qqhGNe9Yt9Vca5/nHhm92mU0+/1X/sLWuTivyLQrNM4?=
 =?iso-8859-1?Q?b1LbDG9jPXsrOJIYPh8cjaDd2BUAWHm/yJm23y7vbYNkHKCXY94Tn89VID?=
 =?iso-8859-1?Q?RmDzVe06cXAHjc9egXssJnu4s6qzkrozBmNGoOxsEuUT3cKcSKSJvib2+/?=
 =?iso-8859-1?Q?r2g/uwybnLGNQsflbovkdqtyC+gHJtPX0yIScbZbU+EW65TssQJmQhSdIB?=
 =?iso-8859-1?Q?w/cL8Nwswf3rw3saLyLIPnkrYxfDWYJSr1K6AbTEnxnOLh5E3qgjjFYVvP?=
 =?iso-8859-1?Q?tOgegl7QaSEZVsugv9f22EhUsu5em6yZr8VRx2yEPBqZ8WcGoH6frguC3+?=
 =?iso-8859-1?Q?U1NPMNcHTnck80nmzoBk6ymot0RCDN+QfyKdFRYLVVgeiXn8+7UCedgboX?=
 =?iso-8859-1?Q?MUnAaCRIr9FUhDnnyunNn5ZfYdzPnyQXtR7Zni0WpmGNt9jwcMNe6jMG8S?=
 =?iso-8859-1?Q?bh4VOqRt/UztbkYNqke/Evgz9qqI7xLO+yvOIQNBZrW+4oPatCnD42hw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 367e3c61-fdf6-4e1c-4493-08dc633412cb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 01:24:08.6992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9xzlH7TpVL223CgU42wGwsD5lpBCrOXnHfLBoEL44qjq7w0lH+Rvh/BYwv/byYKhSn1pSlspYxPKeQyT1EPKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6504
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

On Fri, Apr 05, 2024 at 11:23:26AM -0700, José Roberto de Souza wrote:
> This registers contains important information that can help with debug
> of GPU hangs.
> 
> While at it also fixing the double line jump at the end of engine
> registers for CCS engines.
> 
> v2:
> - print other INSTDONE registers
> 
> v3:
> - add for_each_geometry/compute_dss()
> 
> v4:
> - print one slice_common_instdone per glice in DG2+
> 
> v5:
> - rename registers prefix from DG2 to XEHPG (Zhanjun)
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h |   1 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  13 +++
>  drivers/gpu/drm/xe/xe_hw_engine.c        | 128 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine_types.h  |  16 +++
>  4 files changed, 158 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> index a08528d9c76b2..98d830013e96b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> @@ -65,6 +65,7 @@
>  #define RING_ACTHD_UDW(base)			XE_REG((base) + 0x5c)
>  #define RING_DMA_FADD_UDW(base)			XE_REG((base) + 0x60)
>  #define RING_IPEHR(base)			XE_REG((base) + 0x68)
> +#define RING_INSTDONE(base)			XE_REG((base) + 0x6c)
>  #define RING_ACTHD(base)			XE_REG((base) + 0x74)
>  #define RING_DMA_FADD(base)			XE_REG((base) + 0x78)
>  #define RING_HWS_PGA(base)			XE_REG((base) + 0x80)
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 6617c86a096b6..04f9077bacc57 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -94,6 +94,8 @@
>  #define   FF_MODE2_TDS_TIMER_MASK		REG_GENMASK(23, 16)
>  #define   FF_MODE2_TDS_TIMER_128		REG_FIELD_PREP(FF_MODE2_TDS_TIMER_MASK, 4)
>  
> +#define XEHPG_INSTDONE_GEOM_SVGUNIT		XE_REG_MCR(0x666c)
> +
>  #define CACHE_MODE_1				XE_REG(0x7004, XE_REG_OPTION_MASKED)
>  #define   MSAA_OPTIMIZATION_REDUC_DISABLE	REG_BIT(11)
>  
> @@ -111,6 +113,14 @@
>  #define   FLSH_IGNORES_PSD			REG_BIT(10)
>  #define   FD_END_COLLECT			REG_BIT(5)
>  
> +#define SC_INSTDONE				XE_REG(0x7100)
> +#define SC_INSTDONE_EXTRA			XE_REG(0x7104)
> +#define SC_INSTDONE_EXTRA2			XE_REG(0x7108)
> +
> +#define XEHPG_SC_INSTDONE			XE_REG_MCR(0x7100)
> +#define XEHPG_SC_INSTDONE_EXTRA			XE_REG_MCR(0x7104)

I believe you have an alignment problem here    ^

> +#define XEHPG_SC_INSTDONE_EXTRA2		XE_REG_MCR(0x7108)
> +
>  #define COMMON_SLICE_CHICKEN4			XE_REG(0x7300, XE_REG_OPTION_MASKED)
>  #define   DISABLE_TDC_LOAD_BALANCING_CALC	REG_BIT(6)
>  
> @@ -327,6 +337,9 @@
>  #define HALF_SLICE_CHICKEN5			XE_REG_MCR(0xe188, XE_REG_OPTION_MASKED)
>  #define   DISABLE_SAMPLE_G_PERFORMANCE		REG_BIT(0)
>  
> +#define SAMPLER_INSTDONE			XE_REG_MCR(0xe160)
> +#define ROW_INSTDONE				XE_REG_MCR(0xe164)
> +
>  #define SAMPLER_MODE				XE_REG_MCR(0xe18c, XE_REG_OPTION_MASKED)
>  #define   ENABLE_SMALLPL			REG_BIT(15)
>  #define   SC_DISABLE_POWER_OPTIMIZATION_EBB	REG_BIT(9)
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 669753f0a9c50..1864eeedf95fd 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -18,6 +18,7 @@
>  #include "xe_gt.h"
>  #include "xe_gt_ccs_mode.h"
>  #include "xe_gt_printk.h"
> +#include "xe_gt_mcr.h"
>  #include "xe_gt_topology.h"
>  #include "xe_hw_fence.h"
>  #include "xe_irq.h"
> @@ -770,6 +771,57 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>  		xe_hw_fence_irq_run(hwe->fence_irq);
>  }
>  
> +static bool
> +is_slice_common_per_gslice(struct xe_device *xe)
> +{
> +	return GRAPHICS_VERx100(xe) >= 1255;
> +}
> +
> +static void
> +xe_he_engine_snapshot_instdone_capture(struct xe_hw_engine *hwe,
> +				       struct xe_hw_engine_snapshot *snapshot)
> +{
> +	struct xe_gt *gt = hwe->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int dss;
> +	u16 group, instance;
> +
> +	snapshot->reg.instdone.ring = hw_engine_mmio_read32(hwe, RING_INSTDONE(0));
> +
> +	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
> +		return;
> +
> +	if (is_slice_common_per_gslice(xe) == false) {

do you really need this if? I don't see equivalence in i915.

> +		snapshot->reg.instdone.slice_common[0] =
> +			xe_mmio_read32(gt, SC_INSTDONE);
> +		snapshot->reg.instdone.slice_common_extra[0] =
> +			xe_mmio_read32(gt, SC_INSTDONE_EXTRA);
> +		snapshot->reg.instdone.slice_common_extra2[0] =
> +			xe_mmio_read32(gt, SC_INSTDONE_EXTRA2);

do you really need to allocate the MAX array only for these?
perhaps unify them in one array like i915?

> +	} else {
> +		for_each_geometry_dss(dss, gt, group, instance) {
> +			snapshot->reg.instdone.slice_common[dss] =
> +				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE, group, instance);
> +			snapshot->reg.instdone.slice_common_extra[dss] =
> +				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE_EXTRA, group, instance);
> +			snapshot->reg.instdone.slice_common_extra2[dss] =
> +				xe_gt_mcr_unicast_read(gt, XEHPG_SC_INSTDONE_EXTRA2, group, instance);
> +		}
> +	}
> +
> +	for_each_geometry_dss(dss, gt, group, instance) {
> +		snapshot->reg.instdone.sampler[dss] =
> +			xe_gt_mcr_unicast_read(gt, SAMPLER_INSTDONE, group, instance);
> +		snapshot->reg.instdone.row[dss] =
> +			xe_gt_mcr_unicast_read(gt, ROW_INSTDONE, group, instance);
> +
> +		if (GRAPHICS_VERx100(xe) >= 1255)
> +			snapshot->reg.instdone.geom_svg[dss] =
> +				xe_gt_mcr_unicast_read(gt, XEHPG_INSTDONE_GEOM_SVGUNIT,
> +						       group, instance);
> +	}
> +}
> +
>  /**
>   * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
>   * @hwe: Xe HW Engine.
> @@ -784,6 +836,7 @@ struct xe_hw_engine_snapshot *
>  xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  {
>  	struct xe_hw_engine_snapshot *snapshot;
> +	size_t len;
>  	u64 val;
>  
>  	if (!xe_hw_engine_is_valid(hwe))
> @@ -794,6 +847,28 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	if (!snapshot)
>  		return NULL;
>  
> +	/* Because XE_MAX_DSS_FUSE_BITS is defined in xe_gt_types.h and it
> +	 * includes xe_hw_engine_types.h the length of this 3 registers can't be
> +	 * set in struct xe_hw_engine_snapshot, so here doing additional
> +	 * allocations.
> +	 */
> +	len = (XE_MAX_DSS_FUSE_BITS * sizeof(u32));
> +	snapshot->reg.instdone.slice_common = kzalloc(len, GFP_ATOMIC);
> +	snapshot->reg.instdone.slice_common_extra = kzalloc(len, GFP_ATOMIC);
> +	snapshot->reg.instdone.slice_common_extra2 = kzalloc(len, GFP_ATOMIC);
> +	snapshot->reg.instdone.sampler = kzalloc(len, GFP_ATOMIC);
> +	snapshot->reg.instdone.row = kzalloc(len, GFP_ATOMIC);
> +	snapshot->reg.instdone.geom_svg = kzalloc(len, GFP_ATOMIC);
> +	if (!snapshot->reg.instdone.slice_common ||
> +	    !snapshot->reg.instdone.slice_common_extra ||
> +	    !snapshot->reg.instdone.slice_common_extra2 ||
> +	    !snapshot->reg.instdone.sampler ||
> +	    !snapshot->reg.instdone.row ||
> +	    !snapshot->reg.instdone.geom_svg) {
> +		xe_hw_engine_snapshot_free(snapshot);
> +		return NULL;
> +	}
> +
>  	snapshot->name = kstrdup(hwe->name, GFP_ATOMIC);
>  	snapshot->hwe = hwe;
>  	snapshot->logical_instance = hwe->logical_instance;
> @@ -845,6 +920,7 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0));
>  	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0));
>  	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, RING_IPEHR(0));
> +	xe_he_engine_snapshot_instdone_capture(hwe, snapshot);
>  
>  	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>  		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt, RCU_MODE);
> @@ -852,6 +928,49 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  	return snapshot;
>  }
>  
> +static void
> +xe_hw_engine_snapshot_instdone_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
> +{
> +	struct xe_gt *gt = snapshot->hwe->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u16 group, instance;
> +	unsigned int dss;
> +
> +	drm_printf(p, "\tRING_INSTDONE: 0x%08x\n", snapshot->reg.instdone.ring);
> +
> +	if (snapshot->hwe->class != XE_ENGINE_CLASS_RENDER)
> +		return;
> +
> +	if (is_slice_common_per_gslice(xe) == false) {
> +		drm_printf(p, "\tSC_INSTDONE[0]: 0x%08x\n",
> +			   snapshot->reg.instdone.slice_common[0]);
> +		drm_printf(p, "\tSC_INSTDONE_EXTRA[0]: 0x%08x\n",
> +			   snapshot->reg.instdone.slice_common_extra[0]);
> +		drm_printf(p, "\tSC_INSTDONE_EXTRA2[0]: 0x%08x\n",
> +			   snapshot->reg.instdone.slice_common_extra2[0]);
> +	} else {
> +		for_each_geometry_dss(dss, gt, group, instance) {
> +			drm_printf(p, "\tSC_INSTDONE[%u]: 0x%08x\n", dss,
> +				   snapshot->reg.instdone.slice_common[dss]);
> +			drm_printf(p, "\tSC_INSTDONE_EXTRA[%u]: 0x%08x\n", dss,
> +				   snapshot->reg.instdone.slice_common_extra[dss]);
> +			drm_printf(p, "\tSC_INSTDONE_EXTRA2[%u]: 0x%08x\n", dss,
> +				   snapshot->reg.instdone.slice_common_extra2[dss]);
> +		}
> +	}
> +
> +	for_each_geometry_dss(dss, gt, group, instance) {
> +		drm_printf(p, "\tSAMPLER_INSTDONE[%u]: 0x%08x\n", dss,
> +			   snapshot->reg.instdone.sampler[dss]);
> +		drm_printf(p, "\tROW_INSTDONE[%u]: 0x%08x\n", dss,
> +			   snapshot->reg.instdone.row[dss]);
> +
> +		if (GRAPHICS_VERx100(xe) >= 1255)
> +			drm_printf(p, "\tINSTDONE_GEOM_SVGUNIT[%u]: 0x%08x\n",
> +				   dss, snapshot->reg.instdone.geom_svg[dss]);
> +	}
> +}
> +
>  /**
>   * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
>   * @snapshot: Xe HW Engine snapshot object.
> @@ -891,9 +1010,12 @@ void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
>  	drm_printf(p, "\tBBADDR: 0x%016llx\n", snapshot->reg.ring_bbaddr);
>  	drm_printf(p, "\tDMA_FADDR: 0x%016llx\n", snapshot->reg.ring_dma_fadd);
>  	drm_printf(p, "\tIPEHR: 0x%08x\n", snapshot->reg.ipehr);
> +	xe_hw_engine_snapshot_instdone_print(snapshot, p);
> +
>  	if (snapshot->hwe->class == XE_ENGINE_CLASS_COMPUTE)
>  		drm_printf(p, "\tRCU_MODE: 0x%08x\n",
>  			   snapshot->reg.rcu_mode);
> +	drm_puts(p, "\n");
>  }
>  
>  /**
> @@ -908,6 +1030,12 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
>  	if (!snapshot)
>  		return;
>  
> +	kfree(snapshot->reg.instdone.slice_common);
> +	kfree(snapshot->reg.instdone.slice_common_extra);
> +	kfree(snapshot->reg.instdone.slice_common_extra2);
> +	kfree(snapshot->reg.instdone.sampler);
> +	kfree(snapshot->reg.instdone.row);
> +	kfree(snapshot->reg.instdone.geom_svg);
>  	kfree(snapshot->name);
>  	kfree(snapshot);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 27deaa31efd31..9f9755e31b9fe 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -211,6 +211,22 @@ struct xe_hw_engine_snapshot {
>  		u32 ipehr;
>  		/** @reg.rcu_mode: RCU_MODE */
>  		u32 rcu_mode;
> +		struct {
> +			/** @reg.instdone.ring: RING_INSTDONE */
> +			u32 ring;
> +			/** @reg.instdone.slice_common: SC_INSTDONE */
> +			u32 *slice_common;
> +			/** @reg.instdone.slice_common_extra: SC_INSTDONE_EXTRA */
> +			u32 *slice_common_extra;
> +			/** @reg.instdone.slice_common_extra2: SC_INSTDONE_EXTRA2 */
> +			u32 *slice_common_extra2;
> +			/** @reg.instdone.sampler: SAMPLER_INSTDONE */
> +			u32 *sampler;
> +			/** @reg.instdone.row: ROW_INSTDONE */
> +			u32 *row;
> +			/** @reg.instdone.geom_svg: INSTDONE_GEOM_SVGUNIT */
> +			u32 *geom_svg;
> +		} instdone;
>  	} reg;
>  };
>  
> -- 
> 2.44.0
> 
