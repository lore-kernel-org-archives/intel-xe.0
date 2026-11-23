Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D979606A31E
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 19:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bYjBM631;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=dVcnhOon
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC33910E122;
	Mon, 23 Nov 2026 19:16:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A46210E122
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 19:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795461383; x=1826997383;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2vOZvLhDNER24WxR2NzN9wlZ4xq0r4E91+9c4DR7tkM=;
 b=bYjBM631cnJx5W3EDixxtHs8yqgrDYJD3OggM9HnloLIAxTqcd+bWBjP
 BmL/TbWTPUWGQNXXzACKDTJgVQ375N3F7VJncbsM5I7Oi9BnYe3cyiD/7
 CsH/CZ1lO6bFgMg/Tpt3grNgYzTPEdmonX8xVX3x8ZjUx35XXgCWRY3Ba
 Lq3F3vyhS9kzu6rFTW9dPhOpaRd8MGzPggy9KRlcF2gr9pODRyYM87cmd
 TusCx1Ft6NkwimGvG6gR4L72Fp+tLWynmXqGSy+HfH7r9gf+5ID8sjkYx
 OoOA5DNF7dzpTtpPtrzUVdrMnSItsX1yBWuytTzwMnTSRb5G+9xD2I5ps w==;
X-CSE-ConnectionGUID: abgAJKDmTZS/EgpRtBr1lA==
X-CSE-MsgGUID: gGGRiYNqTGG99KnoP/keqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4123737"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4123737"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 11:16:23 -0800
X-CSE-ConnectionGUID: Q6edXFF5S1ergiwfMfpzTw==
X-CSE-MsgGUID: nHRZzoU2T/S5WJp/smJlGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; d="scan'208";a="13161040"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 11:16:22 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 11:16:22 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 11:16:22 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 11:16:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owBYjb1rs8n4pqp83QkyFxT1AN1Sq1jM0igsCa/rx/BHv9FGcc30c/eoAWaWwnH5o4MEeXF26ugSRWu5tHflqj2OC00ispG0sXHyJ/kCQJ2l1kgMm7STtxBVEOwboubxJrdoKYXKPlo2ElQpezhW8//Aceveb+pmdYReRVNW7E/yXz5KeLt9YrJ8ctmJqj8V2aGlO2kqEz/+6voUCnfoqlB/kSls1DExU2Zf3+VFLKLaAIECpU4ykuHcoh9934oLg+KMdKraRp/6gCiAn/XifLPopofY0u0VyxiMwSjDG7/LMvJqtUSHWjqZDgILP3m+lI0FS5kYjjvwGKx0sCpGeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2AH01lzkFj1UA8iej+QnDM3/kEGqNyO5YnY/DQB4G0k=;
 b=HotAw7Jxy8rLwKJO+seUhGKZK2jXSXhrwB+LwfmSj98RTChSTf1LJgJSnwPk8sNp0zQVANWmdYsL61cx1hhOV+T8f4smWPt3uWeyLEYC5S0SjFdxf3Xs9n5fgvAj9j7yL65d5SJhjGGzIxnOwIC8uHc9GaA2tXRLxeVszskA4dlvBAytyXQqKr2O3qQ+958FY0woHTb7ibeUWV+PoMzxk68enZVGgTH3K3tq+hvBFR6p1LFfgnr2a1z/f2iygZc/urEWFKjvcsfbDAvDFmKH4sLCM14a9crCx+vYWFS4zshD+W66E3jUtmYu4cWrvswCPDmJ+PgupFIb8pgEU0Xmgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2AH01lzkFj1UA8iej+QnDM3/kEGqNyO5YnY/DQB4G0k=;
 b=dVcnhOonms6CT1FYYOgtNYGMdpmCef0vlYPRC98I+iH7ic4t9g0LfvHjHU5JoDfsPG4835ODxcieUIxMbRLMBAANlAm9/vzScjTtw3NKtEI7n89BxlgAD4qPpKOBPUEMunq9KYNjfvQlbaMOWwZcFN7CUrwHSvfUO1jx+1Rshhs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5990.namprd11.prod.outlook.com (2603:10b6:8:71::5) by
 PH9PR11MB016272.namprd11.prod.outlook.com (2603:10b6:510:3eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 19:14:29 +0000
Received: from DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899]) by DS7PR11MB5990.namprd11.prod.outlook.com
 ([fe80::133c:5eed:3aec:b899%3]) with mapi id 15.21.0639.011; Mon, 23 Nov 2026
 19:14:29 +0000
Date: Mon, 23 Nov 2026 14:14:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe/ras: Drop SIGID logging for sysctrl errors
Message-ID: <awSQkSBPmv0C2Ba3@intel.com>
References: <20261122153015.877434-4-riana.tauro@intel.com>
 <20261122153015.877434-6-riana.tauro@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122153015.877434-6-riana.tauro@intel.com>
X-ClientProxiedBy: BY3PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:254::15) To DS7PR11MB5990.namprd11.prod.outlook.com
 (2603:10b6:8:71::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB5990:EE_|PH9PR11MB016272:EE_
X-MS-Office365-Filtering-Correlation-Id: 19509e81-b0a6-47a2-a3d3-08df4995ff59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|11063799006|56012099006|4143699003|261026140227099003|261102123227099003|261022105027099003|261021123027099003|261028144727099003|261021121427099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: 5MQ5tezyg+kJet0Q5JDy87JcIM0dVypm21nRGSwY+lIwYNUTi0gyiVN6Tss9YdclrYPSfm9BbB/1B2Fha5G8C71fVKpqsptVUrBdGQ6J6o4TbjylX/qxJwXeLZZbCqUIeZB4ez9EHOjDdfDlgr45sdKN/9yS2/+cC4Z23U0Y3VUfHXpv65Rtlvgnl+xu01cF6jfGIarQLAUrAtKoqwtLt5Gs501oVPdMHjOVJSvpeyiDDCeDXsz52qi87hqAWDXAKs8xDTjzXgDjmeEZbioyaylsyIj6m4GGri3ybAv6Tzk0zy3+z7GQHSRaBPH3homAxfKYkS068lYstbNUCLrSABMWyXVSWV+6BG1kkOOMcn1IhOi+DvFhih8AjOp+l6Vhb7JTRyxmvDjilbfDWo5E3AZgAMqunX2mrlhYcySkF8ICSYvkSDtI1+mOYRL1oc6GBIG5nQjE6zqdE72vUvbJkZq6YmnlPIeI07SCsMhmoNtCp1FLXx59wirkvHTDJi+cUN/Er+EerkSC0mh9YGZ7TMvSNCQ4SC9iOt9MgoUc+OqlrLLw+MP4K/qTeon3Vcg3T2gBsXYJXjfrsH96cgrK3qmORZ6mtgzgFgUxzP8+jIlB12a9WCgVvb3GvxYRl8yGLQEyYg6gBa2f72eXwVFvSj+z0O+7pNchJv8J34/kJQM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB5990.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(261026140227099003)(261102123227099003)(261022105027099003)(261021123027099003)(261028144727099003)(261021121427099003)(261009223027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nMf/krvV9feB0zy8FZ2zhGwA3NVaHEsZTZbJY1x8YUCHFPM/tTugUPtng26O?=
 =?us-ascii?Q?77Q2MkB+5VDiJP4cEZPsnt6ygkQYvgaSLQW4j2GdJ3b+0m0COwbFgJ0nsNIE?=
 =?us-ascii?Q?J+UQK4VUXEFaQO4ag4FcfJQP5wUQAYDPxT9Xxgzyli/Xt7pi9rTP1YacS0QS?=
 =?us-ascii?Q?zVVm6KCMw910aeCz/i6EMHLmIj/sIfNNVREU9voGSdUC7+UFMsZpw32BAduT?=
 =?us-ascii?Q?1SqKI2iQhwqQmo73rlcy5yaekmWzGi3nnSJCwUhvg63RqHqn0y8hGMCwwYPF?=
 =?us-ascii?Q?gvImKQd1HEyQGmf/AVcZui016C6TvQG+uHRb8kT1WpXRwpZpeNfjCjXZdX/N?=
 =?us-ascii?Q?ah4R3t1KQIEeadrkwXSf5BEc4LtbZ0sDb6bfxmio/qsMM6HaCfeinp3/ajCd?=
 =?us-ascii?Q?lkSK/tXes9NnjosAXPBBq/6sQwGwMB+nYgkoUdzJZPn4aIrKOiMTnCnATNtm?=
 =?us-ascii?Q?AH248Tmr6nD4UmJ53AkgWlsa0F8uRumLbAwzdQOslIB8BF63+Os5c+0jAD5U?=
 =?us-ascii?Q?NNuIO719yKcs1Ae24uj8cHjrV/s0Vo/mIpZ4wuwHU0RsdwHYHm+A60V6RdZ8?=
 =?us-ascii?Q?bq0RnkJz0QLpv4c+vtOw675xedBPxr63RoV/msjs6LtQPWf04BJmjUCUIisH?=
 =?us-ascii?Q?RAlokrVj1UmSvGWU4MNL63Dg2iImY6adLGfSQIS2bMTQq6+C9IldI9tNSy5a?=
 =?us-ascii?Q?ifLXvB1Nlreijqg3oTM0rGV4UkqoZSxAw5JJ/O3+qSrkZMuELFXVgITgWy10?=
 =?us-ascii?Q?nI2mSrZZBxD+sWuyqEXAHJzDa6n9O1xgifj6/xB9dvwjAKsaVZ5YRZA882uO?=
 =?us-ascii?Q?lvxCzfygCjevDIhbl3VvoKG+ohLHfHAB89iz1aIdDEzZb/qDSNK3+lyaHu4j?=
 =?us-ascii?Q?R+bK6rt8Rjx+0Pe0uoLFn9QgfximCITGjtWDTGnge5lBYSRnEgFlm2pQSYDO?=
 =?us-ascii?Q?58pkKvTok66KJ3KDELZ2VwbZQ/O9KH3IzwGPQgQYZkcDJxgKpqnjWvA4Ngsj?=
 =?us-ascii?Q?egOxD0blwWS6fx0dZWKF46zKxm48XhVTNB62GGLkAYIO79hsDxQ42qEDLGFl?=
 =?us-ascii?Q?dK2GdyA/puwpMQemRfj8A0UEKRAzJNwJZr8Iuv52MHfXHtkLYG23msZBiT34?=
 =?us-ascii?Q?da7f0nm2fdfsW+s2PoOzhbMRGRhk+h2sfjmktDHdcMkVeJzYN00jc2Zjj9qx?=
 =?us-ascii?Q?/HaMADN6vLOe6MjpiSDxxCJmVA4Gt4p2/bp1lZZG7JJwzb4LLKZAWYusj90j?=
 =?us-ascii?Q?ciNb4EnFVPCGgQ+D3/cmijITb/TGoUvTvH+oXmnK7XdTOH7O5cSOoff0ZWKX?=
 =?us-ascii?Q?T+L5mB8Li30P8LuN3Fps2tFJtM/jGN3NygQba+PUpvGa5GG7Lo98yK9nD5jq?=
 =?us-ascii?Q?4q2g32IDLw6liSACDW2SEuuhfz0Nnrsmj6wTu0c0hALM4drvth5KimPkm5sH?=
 =?us-ascii?Q?Y7IKzUbS2G42wcgIYzsz3bbXvrsP4zzwYzwm6UufCzaUuX2jnM0klLoqQoNR?=
 =?us-ascii?Q?Wvtx9mwhBK6b/aIEZ4+Nph2Na+mu1ZFSCjckFdHTOvN3m2J+YisAEYSzvMlq?=
 =?us-ascii?Q?RLrAYnEZ72XlQHF0hYvZpoQ/vEcVq+W/p3trRGg0fnyMcVbp7CLR+yUE0aZ6?=
 =?us-ascii?Q?unBLZ1k91X0l7uX5qjEXT8ujKrf4vyYh4X4thEfyzHjJt2u7w1/sv5BPP9YS?=
 =?us-ascii?Q?tSFSM5efo307FUEdddyJR1Ykb+tupBDaIdSRVvOsioVx6C0esT89uvSqASy1?=
 =?us-ascii?Q?CVl2W+ehFA=3D=3D?=
X-Exchange-RoutingPolicyChecked: PnMFcrqIDycP+LEnrKBL3HaIfib9s/95Jx5no7INDzYYlb71JmSiMQOifD5qrMmUv5nANDylhuyQB9J1UfFGi9ZuN6WCDvHhSeLJOM8PmIYWXRrHCFC1u4U0opo2t2qPODKvqrVJZTDDPyEQLLjmrZQH/A/Bbt5gXR+xzKTTCc/KzfExgnwJOEv49uvmLkDrCHwWXFp2WvfI8l9rnOg6nrPguTEEPhsUGTlMAma+cEtsnAzF6dV0nMjpUXZgzYMCyJ4r9Mg744nZKioklz5KbwPPJdDr4yIwwuqMLp/nhfNlsZqjmsdVsE0giVgrkAN1jOomJOVGk8IsCm/x13EbMg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 19509e81-b0a6-47a2-a3d3-08df4995ff59
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5990.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 19:14:29.4987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGpGKaa3ZuWHtcP0Tx9r0VZQCUvrCjcgmGGb8l52d3m4jSodC+LfcuaxsQtWBBknGVTzsagDsLdpR4udQs6Vbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB016272
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 22, 2026 at 09:00:18PM +0530, Riana Tauro wrote:
> The sysctrl mailbox layer already logs the failure with its group and
> command IDs via SIGID. Drop SIGID logging and replace with plain xe_err logs
> to avoid multiple CPERs.
> 
> Fixes: 6d8ad0217f9d ("drm/xe/xe_ras: Add support to query page offline queue and list")
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: split patches
>     add more detailed commit message
>     remove non-functional changes from commit (Rodrigo)

Thank you

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushing it soon...

> ---
>  drivers/gpu/drm/xe/xe_ras.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 07c048149da6..f8c1d8a97fc0 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -277,21 +277,20 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
>  
>  	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>  	if (ret) {
> -		xe_log_err(xe, SYSCTRL, ret, "failed to send page offline command\n");
> +		xe_err(xe, "sysctrl: failed to send page offline command %d\n", ret);
>  		return ret;
>  	}
>  
>  	if (rlen != sizeof(response)) {
> -		xe_log_err(xe, SYSCTRL, -EINVAL,
> -			   "unexpected page offline response length %zu (expected %zu)\n",
> -			   rlen, sizeof(response));
> +		xe_err(xe, "sysctrl: unexpected page offline response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
>  		return -EINVAL;
>  	}
>  
>  	ret = ras_status_to_errno(response.status);
>  	if (ret) {
> -		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
> -			   response.status);
> +		xe_err(xe, "sysctrl: page offline command failed with status %#x\n",
> +		       response.status);
>  		return ret;
>  	}
>  
> @@ -421,15 +420,15 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
>  
>  		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>  		if (ret) {
> -			xe_log_err(xe, SYSCTRL, ret, "failed to get page offline data, cmd=%#x\n",
> -				   cmd);
> +			xe_err(xe, "sysctrl: failed to get page offline data %d, cmd=%#x\n", ret,
> +			       cmd);
>  			return;
>  		}
>  
>  		if (rlen != resp_size) {
> -			xe_log_err(xe, SYSCTRL, -EINVAL,
> -				   "unexpected page offline response length %zu (expected %zu), cmd=%#x\n",
> -				   rlen, resp_size, cmd);
> +			xe_err(xe,
> +			       "sysctrl: unexpected page offline response length %zu (expected %zu), cmd=%#x\n",
> +			       rlen, resp_size, cmd);
>  			return;
>  		}
>  
> @@ -459,9 +458,8 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
>  			total_pages = common->total_pages;
>  
>  		if (count > total_pages) {
> -			xe_log_err(xe, SYSCTRL, -EINVAL,
> -				   "Pages returned exceed total pages %u, returned %u, cmd=%#x\n",
> -				   total_pages, count, cmd);
> +			xe_err(xe, "sysctrl: pages returned %u exceed total pages %u, cmd=%#x\n",
> +			       count, total_pages, cmd);
>  			return;
>  		}
>  	} while (common->additional_data);
> -- 
> 2.47.1
> 
