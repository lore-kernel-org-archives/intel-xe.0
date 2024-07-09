Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD46C2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 19:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A3B10E643;
	Tue,  9 Jul 2024 19:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LCOaOe5c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138FD10E643
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 19:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720552365; x=1752088365;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=joCp44M+7GJwunV+5eyKX/oE2K58D2/VKZ5S+Cxf5uI=;
 b=LCOaOe5co6dknydMiGWvEuLusoxUtpWC207Dbm96ZENpMWTVGouKfc9r
 khFxKr2riMzh2Cs+XoCq9fQaWtLargsiHy6/6mHrHqQIPKgYipOVuSlyj
 yhy5XLte5Wq5XkJuC76Eozjk9+rKFX2b6m/EgxSGNvkbfRGrjE3dptZb7
 VA/Fxs854dPEdBm5cfKqUL+CtvIzjhBdH7LxqggDFkUTcFrBNmsc99atU
 Ke4cAA/TUCLpk1GNGONQ+Ryr9xGwAig/cU3F9kxuQzqb+i/QxNmPxD+mg
 O81S9NZIU+kM8rxVf7Fnm1CXCqfctUhnRtCNXDWm4mohSO/J9gZKYrCFx A==;
X-CSE-ConnectionGUID: Z8xV4j7cRZu+p9NVnbAvaQ==
X-CSE-MsgGUID: WH9sHXTURf2vuSlxsHN0mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="29229027"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="29229027"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 12:12:45 -0700
X-CSE-ConnectionGUID: 3W86dnmlStybXy7oLgo5ZQ==
X-CSE-MsgGUID: hjjgRz6dQ1C8mhqlAh3aqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="52360053"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 12:12:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 12:12:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 12:12:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 12:12:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ad20TIIGTBH/VsGZS8Kw+20lukUgX/GURMIcS7paBZ082XvD4pU4YyVVM6b0ekfFm9yuZQMxRLFdK9De4XFli6Z3NaA78iE3rHF19Ac38wc+BhL8lpnVYQrBqmFIbtNJDaTxHNg4MOa0OU9oiVEDCczoDaids2XhDDSKXCMrHgRh+O+AsGcnlneI2VRalazij1udxHe4RuKEjLmEx/MjM1JCdclFjlGMnvi3TvmA8odnUkR08P7RLPyTLTD7Vs5tthLxqHdib1OgQia1VyGuJuDYw3SkqXYrkT7kGOL/yMxW2J9l6REtF5noHXAD3mIb0RSPZDkcBtEQkU83w5jCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2U8Nye9mioaMIqQdn3nzxY0IMLRHru+qM4uxI/sna6w=;
 b=J6Rp6qS3xkKStiJqodUJE8H4J5BhNKhcZN0fGRbvSVWGSLMKhBx3G8z5BM3PJRKbRz1rjIfEKJN+j8oYoXfeRPbJkdRJJ3LK/AbDs0G6G3zNbglTGP0grtsdTkON7B+fDqcIg0Lt592EPhQgxqRKntV8OU5BwQqwivxFh00ylOFRMn1lfj/CEp3ndv75wZyzLY7oG4JGm+yZ+vzR9njdNcAj9jcK5JJ6bNE75AjgESY7e4eXJxfv3Gg6G1pATnXJHcCaBW337mABiXqEWEedLul45C7tYUz1+wWZR/7PypP/yXa25wWuRxTcClYVhmZsoVYGq6lLLW8+N16VUHsAMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2859.namprd11.prod.outlook.com (2603:10b6:5:c9::14) by
 DM4PR11MB7184.namprd11.prod.outlook.com (2603:10b6:8:110::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.36; Tue, 9 Jul 2024 19:12:41 +0000
Received: from DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095]) by DM6PR11MB2859.namprd11.prod.outlook.com
 ([fe80::4063:4fec:bf76:f095%3]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 19:12:41 +0000
Date: Tue, 9 Jul 2024 15:12:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Suraj Kandpal <suraj.kandpal@intel.com>, 
 Arun R Murthy <arun.r.murthy@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/display/xe_hdcp_gsc: Free arbiter on driver removal
Message-ID: <Zo2LnVCi-g-JKytj@intel.com>
References: <20240708125918.23573-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240708125918.23573-1-nirmoy.das@intel.com>
X-ClientProxiedBy: BYAPR06CA0028.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::41) To DM6PR11MB2859.namprd11.prod.outlook.com
 (2603:10b6:5:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2859:EE_|DM4PR11MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b7630b1-fdc5-473c-a61b-08dca04b1a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nJBzYeL7xcRwE1HFinIBCGUfeP/n9wsU6PlqJ/LdAm6bzbdsVDBEp6KaXMrj?=
 =?us-ascii?Q?Fxa9Xa+MV7emSxgce9snfaLyfR6OTbKDDnZ1OiJzhPmhAuCyr8S7aGi8JB0i?=
 =?us-ascii?Q?xL3hIe6Ofw61/QFSDW6pPj0T/bGmEy/5rNBF0WGwh0bv88aw01c3DK1FUn4F?=
 =?us-ascii?Q?EtIeeyWEuV0wd1ht4+1UDunTx25B3krWzP0gjQpRnan6jvVXO4+t6MIrXar9?=
 =?us-ascii?Q?NjyktR1gUjSXOLhCeq4f3U9/7Nf1fnNdXMhFxOBq3Wcr09KB3mjzBvLzY/AR?=
 =?us-ascii?Q?+7n7ownJELTdrol99S+4HYpDdCdtXIm19nVedq0FdJcY+0P9dZzSQXbbf9e9?=
 =?us-ascii?Q?09YiRTiQVlgdCLCKGilA8siKeZoQMAd4S3kJl7ZGTYirq3IMafBbokJPsux8?=
 =?us-ascii?Q?rvavJ4nNQB9ao3OstEfsab1qVAF1dW6Vs51LjYg+/bnTrYkx4cupFTctNKkq?=
 =?us-ascii?Q?/W0YRDHCU0nZ6XKPeiTF/RedyPZvukspz1Kg9JTOmf0U/5Jva01oJXgfQXGg?=
 =?us-ascii?Q?7RuWNHLDNX35EdDG2j8WVXCCmVgyhcVzcnJm33itw3GFVhKQP61Npt0Qc25p?=
 =?us-ascii?Q?x+35w9N9aY670JHg5P8kX++nZNYtYyr2gPa5IEt1TnsJTQO84RPrfnX2t8Eq?=
 =?us-ascii?Q?Uq1EWlOmSxmIJ479rGw4p3ceepZRi60u81MWdD62RcNlV+8+ZT5dgfg1c+sN?=
 =?us-ascii?Q?Ix4YCQmFgLxqR4IlsMsqbfAmttLeXqdz3TN1Dbib4iqKFHARGyNLITzXthC8?=
 =?us-ascii?Q?KeRGQeTLCgRb+Sp1SLDf5X77nXrfcYNrvFZbhiIgkbHTuOsmk1DV3zBJrapH?=
 =?us-ascii?Q?7dDt1X5Vs00jdCDso7t3pUWgYhkEgs3ZAPcojkYeqE5GP8OAa2z2RM1T79I7?=
 =?us-ascii?Q?4y0HiH8/8Qc9LMm+hkOABDNZmpNgp/LXq+MWqtEiWYuL0hjeSETgTErr2row?=
 =?us-ascii?Q?PD2GedzJeppTF8AwSU45ZY8EUWTLJEluq4kb4uVtbtHpIo9ZoNMywbqXIPg3?=
 =?us-ascii?Q?u3joKeVApad8UGRUxXMYwOAzCrtAeeuo80rXJTZ7EnqJWAxoHWa444eQqX9U?=
 =?us-ascii?Q?EQU45aDvytJbM5NJkonkSzdk9Gc1auw0AfXI2fDyBvkWPfKZ97ArNQGcJApD?=
 =?us-ascii?Q?fZwl2B4tOitEJ71RuXbwDRfnIjgRUjIvZZt0heZfqsBuwSKmCQF67RLyGuuX?=
 =?us-ascii?Q?f889Obfv0kVrMhk4iAQG9hKqGbgfDkOIjwg3NRuU1OZodlbDEt8+dMdWqVIm?=
 =?us-ascii?Q?moSoo3OEMbTkxR9/nda9nyO0sCck5IBhHZfI8ozadEqhQ+DGZa9gEp7CoJAO?=
 =?us-ascii?Q?1tue1cVicbkPg99/hPh2vgxgw7W6drSOFXxcbHLZbANeFA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aCe7OzrWfsHpfCCaGZkkOMLRtRBISGO6FR1lDovJ60lYQ6AI7TxgqJR4tfAj?=
 =?us-ascii?Q?aBtNJwwQg7YIYAyNDHiwlMtj38qygPiS81cEjbMuJY2FjolRhmeUUnPHQiwB?=
 =?us-ascii?Q?m55JZ2n6oWTerVrgOZkqKCUOa7d/UgDxusCvTk9a9X3Du8Zdkn+ZLOXo9taZ?=
 =?us-ascii?Q?z9LWNWtouEZza6QWjzqJaKnwRy5xUwpX+zqNnmQH+fTD4WXh6ChbVTLCyp3q?=
 =?us-ascii?Q?p8PWLG34Bz7++RWVqXRswaRVGHAu1IS08svI+D8s2yd4Eula9X9KullX9naP?=
 =?us-ascii?Q?ZSJBlOsY279QMExKRPIKSzPqIh+yEpXjtH1GJAHcVOVoPWhnzlOISzsgDj8Y?=
 =?us-ascii?Q?LBcr+lqaMXcNoNPjhpFFDg0lQYJQzNarpamDph4yvwK8IXCxLS829Z6TkdZk?=
 =?us-ascii?Q?CZFZr4H0j4MQAWHkxu5nyvNztMaF9PTmx5ggMd5ugCxQecGmIn6DNW4g5iFX?=
 =?us-ascii?Q?XEzkfiwkHv7KyTvceujMcj7kQFpmFbFUC9bFaA5iA/UxpUVX0TJQ8l6wkv8I?=
 =?us-ascii?Q?xJDA3pqbRqsDBtk8PqrrZpSfKEqc3uxZqQsKY/1XISLAqAsm9rWa+UPvpaO8?=
 =?us-ascii?Q?frLhuzQnh1i+DgwA1cqfnREyR52Qt4imhdc+5eznhJCl1imvlprC7sdpBJ+o?=
 =?us-ascii?Q?zeb3mpZoanBp7Pl3bJ4Ar31wRCFSc8V0Ev2KzyzXw70IBOyo44Jdf9R5Lxn1?=
 =?us-ascii?Q?FldPhXaiIDucMzfYntAfAaSa0H3Bp16A2J/80mTsZi4S90bMBJGevFvaVE4h?=
 =?us-ascii?Q?u2yGLie3AqgsYfUlIioYCu0Xi47Z3wy+lip56z6cWpWTKslcCE/3+/1PGBDn?=
 =?us-ascii?Q?IyT8Wti+Lepz1VTIGqP9wpEQWW/vu6Wh7LcIVOBVLjCktWKncVpCShAD+Opm?=
 =?us-ascii?Q?BnYBGVS8FzXPIsMn+bL88Xpj25RnzTLDsGcsGKZhcZd4urx2yuQmHgNhAv60?=
 =?us-ascii?Q?VQat7TyewYNOwXKkVWzB7PUmysamuIrQ4DjAlVSTOADnZHX/frJXCTPt3INw?=
 =?us-ascii?Q?tQey+zdALn4OMJEdutzehesrhe+/PDCHV8fEdrS6Xtb/gn6Nl6zDONE+MrEE?=
 =?us-ascii?Q?xcBYkaMqu+7pIHVY+attM+6OnRZ022RK4Dk5gckD0zEYvCJBUvnbZK9vziyS?=
 =?us-ascii?Q?9eNn3EeRnvolUSMXAw/IZzeRE21ooT2A46N0IYe6bgGVDLyJfTL+BSsFvlRY?=
 =?us-ascii?Q?3GTRGZdJi7TFQ1nHqyGlMDtSoz4biFbj+4+jUkwQ4aMotQ5+Z6MemJXjT15g?=
 =?us-ascii?Q?ntKHELuFs0oAPr6Vxsv5mYVFMa/j494JIXOrIQTYSK6DohIt0TQWKxpUH18x?=
 =?us-ascii?Q?Ct67hl1squwHStFaOkW15vhtVSb9+3cq398PBakC1q1d6PnBi8xuAuwxVnw1?=
 =?us-ascii?Q?FpeUAI9ZZv7aqbCdG5QgafR1dGscCy67KFAs5p8h+m/MP6js4/cdKqSCusT0?=
 =?us-ascii?Q?Epdnoarn+XeouwTxNjklI7x0JATN8X5ZWd2G2LAT+SsJtUzNxatuXhua47ku?=
 =?us-ascii?Q?Fxw5QbE9Y8trf6PhvDg22JAyN3Zhnv3eIuMD1euqFY1H+5cxP7LEP6Q+MNhR?=
 =?us-ascii?Q?u00jnjh1R7A0/T5J627aFznFqAu7W7X7CHhRBlz5tXw61GkaUNsRv8Fj/6TO?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7630b1-fdc5-473c-a61b-08dca04b1a7c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 19:12:41.3025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XNjYYxlwzu3eEnb9R3Vioi8f/QGcDpIGS/W8MGs6k0HnzEex2A83OD1QASSskHnc4ehAvAnOxlgx6IUBExkVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7184
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

On Mon, Jul 08, 2024 at 02:59:18PM +0200, Nirmoy Das wrote:
> Free arbiter allocated in intel_hdcp_gsc_init().
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Fixes: 152f2df954d8 ("drm/xe/hdcp: Enable HDCP for XE")
> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> index 14b8b4278317..990285aa9b26 100644
> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> @@ -160,12 +160,16 @@ void intel_hdcp_gsc_fini(struct xe_device *xe)
>  {
>  	struct intel_hdcp_gsc_message *hdcp_message =
>  					xe->display.hdcp.hdcp_message;
> +	struct i915_hdcp_arbiter *arb = xe->display.hdcp.arbiter;
>  
> -	if (!hdcp_message)
> -		return;
> +	if (hdcp_message) {
> +		xe_bo_unpin_map_no_vm(hdcp_message->hdcp_bo);
> +		kfree(hdcp_message);
> +		xe->display.hdcp.hdcp_message = NULL;
> +	}
>  
> -	xe_bo_unpin_map_no_vm(hdcp_message->hdcp_bo);
> -	kfree(hdcp_message);
> +	kfree(arb);
> +	xe->display.hdcp.arbiter = NULL;
>  }
>  
>  static int xe_gsc_send_sync(struct xe_device *xe,
> -- 
> 2.42.0
> 
