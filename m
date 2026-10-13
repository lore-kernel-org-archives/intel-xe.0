Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B65CC6B12
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 18:30:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2AA10E21B;
	Tue, 13 Oct 2026 18:30:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3386610E21B
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 18:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791916223; x=1823452223;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Sows2lTiteR8IY2kpHkRDR1vbsGBXMJNdJM3UEjKh7Q=;
 b=ZWQ0hhAEENM8WnwFobULLM1/caK/8vp84AxNoF9vTECf5nhrvRbFsQbB
 JSGNBysJE9dbrrPexnOlVH6s+n/BTCerJb180/RkPHt4RNJafW//Nn/Qx
 Y+Om1jpqhKfRxzrOykHzBhAlILWnRSjJg1w7+Ft3BdnPfwxh1cryikveD
 9y1Dxe8MbcaYR4NJ6ncpENKVhSywtAICproKnX31O/gIVy7TTfs4dw9RO
 d4X9BLXSNT+/edxezOdX7Ou+MmvQEfRGzhOAhcK/bM5abuXH3Yzil9LyK
 6dkqP83wIW2R3AgmHWKLNa9NfuUiJ0YuqEADxWjsAKPsRcBA2hQ8ueGKW g==;
X-CSE-ConnectionGUID: FVeTHtViRaawWpTtfdjGNA==
X-CSE-MsgGUID: vmvCGanBTwO152LbKBg9TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="755091"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="755091"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:30:21 -0700
X-CSE-ConnectionGUID: lXoIU4TsSuKWrIFVxGlCJA==
X-CSE-MsgGUID: jLTo3vcaTgS1vFnolAyJfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1233597"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 11:30:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:30:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 11:30:21 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 11:30:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r0UBc7iir1dbcguAd+0NZV79mBgT/BP+Z2pvJs+DWvAEksOvfzVkEAsT5aWVE7TM8PsIAlIQyP0oz0UQfgL8E/Jh4kdVohz3w3/4rhCX/nsm8xgoBk4BjrMlFBK4q/abpf4ck9Dt1ygs9P2eqWRdA9hgTGCPQj6IXcERm/qiP2RNlVaJaWctGlqqMyivfrhsEJC9In6A4zhUYH9Mp+q/TuUq2zl/kNgF2PEBK9mA7f2vMDvOe19vlAfezTB8l+/W5STMoDzyF1GKHZ8nDbGo4HIWsIPAhGBftHIsVKBMm+e0SdYHOJuF2tEI/Ee5cc9JH7qO+qzUpLT1U9rRnVCt2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tE6yx2CJOAkEOjrQX8kAUYna/3tZKBMxW3dCHcz6KCc=;
 b=JhaIMQxRybewZIf0uGd8V2EaPaDw754f0PCJ5OzPU7k8BKex+clm4VsF3o5SVi9gsoQsMx+HjZw6DI6+t8kBsCs1EPRQKaL+sMgqUJhQpym6DgwrxswCxDm5m2BajRlSixQPpNqQpCDls6THnzy8DZZ6rd8wgDB4WaV4w9uIQBv8ltzRTd7L/AuxqE9MJJdNmw58wX8LILvG3OFHP+lHgMgxgYrCVZ4VdzW4rXvOIk1briZcUSmfu6LUK/pYMjjhRdXOALBvqonKeUBx0OrgDjPBBZ22QWzI9oqe81rzyzat3P9Yp83w8TWfdgGxlVUBhgzaiYeVbuY9bn/XI18YDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5)
 by CY8PR11MB7314.namprd11.prod.outlook.com (2603:10b6:930:9d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 18:30:18 +0000
Received: from CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8]) by CH3PR11MB7180.namprd11.prod.outlook.com
 ([fe80::70dc:90b2:50b4:31a8%7]) with mapi id 15.21.0496.015; Tue, 13 Oct 2026
 18:30:18 +0000
Date: Tue, 13 Oct 2026 14:30:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <lukasz.laguna@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>,
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v5 2/5] drm/xe: Drop xe_device_set_wedged_method()
Message-ID: <as54rBt2Av-CAYDW@intel.com>
References: <20261013110439.181447-1-raag.jadav@intel.com>
 <20261013110439.181447-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261013110439.181447-3-raag.jadav@intel.com>
X-ClientProxiedBy: SI3PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::7) To CH3PR11MB7180.namprd11.prod.outlook.com
 (2603:10b6:610:148::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7180:EE_|CY8PR11MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: c11bf22d-304a-45a8-2a29-08df295807b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|22082099003|18002099003|11063799006|4143699003|261009221227099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: u++Ff1bAPEwAapJ4GiEY/4lE/IYIWp4qwlj/nRJSNsutNnl+RcuuRv1+ixlG9feY9RI/DopQgEg1xSn0SxpmEbXthmlXBpWpP62gjiFNQrKP0gC0BGDNw+gYKFoh51ponewcSy3mXFh2J7YIBe3MEhujx1D7CfkFKEziHpruw1hxv4Dvqx/9qIIFs01Bu5MyaprghkYx+nIlsawwQhXJM+lFC8aN6lBWblgbIDmxIR8x/E5vCCDkOm6t4U/G0psaamVuaAPDGoXP1NLRyumsccEZNn16wBFo82YxeL3bg5tDXxJ/xBmFTV0ZP8RaTTF922Jioy2P5Y8tfqFtV9/RYG9yzv3qnobKnAlqwjzlOyPsXtZSC9fUOLuiMYW+5culvWLhaXfrVGWsLNva3sRctjcfb3mBWHu4xOzhOkx+6qX4xPkkq/mw5ENEyYg45O0oou/oFDNirwEqjv80xffChlMRFEoohRz4Tkg7mKY0c8yhj2vWqjn5y8M9wiwCNe5HYDQyCiZMypLUlJWNP5UbgmhqDXEM3/Hj5aIkiZtc15yOmGF4GIDQ99gHPIeF5o+zZqHGp9yrZdK4j1cXnJ0zOMzJWRgUNVrm9ydCdBAAWBKPNLplpguholA6aQdu9ixp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7180.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(261009221227099003)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IP/GKbtEfUSt0t8lZUFEbZuvhV1u9O0Suy7WM3umpvNs91pAN92eq/qzOCsp?=
 =?us-ascii?Q?U3HT4yp2h5/3cTdyRPLu5SixtKFxBwovEQrVBt3arkvwtz6t7/aIElxZiwOq?=
 =?us-ascii?Q?09m1lU3uOedIIyWXPJUlYkZucC8FD7DtJP/QcIzc/Z2QbZE6m1ub7BXLtVAR?=
 =?us-ascii?Q?iiauCkSCEL27S4AiWJgjv7B50WB8qtIIV9GzrY/MbuOGxmbeIVE4nA+IeVvj?=
 =?us-ascii?Q?vVVEMuCoNiMhdCgtuRZsYINxj1XpNsU3RTon1gamxaTIuEJGGazpBF/2J/v2?=
 =?us-ascii?Q?WuyS73G7a+RwssGnPtl9/J90TbwkNii0BRnMo+vgux8AwS2JwQKyL3Ed9o9a?=
 =?us-ascii?Q?rBqpljOVag3IuLagqrZvQv0DCgW+L/hWzH5LG8VG5M532GWGCe7hCS4VulZb?=
 =?us-ascii?Q?DB/OzMKIam2jVBNCFa5UMyQvJPEi8wTvRg4RE7ejTQq15pkX1qgnU3/OF+JO?=
 =?us-ascii?Q?4td1UgUWdbEFzcXIhDfMu5W+toeUj8XT5uQ4/TthRbThtuvtu5w/9jBFFL6/?=
 =?us-ascii?Q?0hNlzHGlUd4AAxkff2BlrLnCCRGig9YEpvFX0JsiSO01D/sy92ROIKtTLb4T?=
 =?us-ascii?Q?KevPdB7gyXTG3jIVNbEUmtnewmeJBJk9rVD7E+rtc6SH+VFNp4R2Ag7Z7c0p?=
 =?us-ascii?Q?Rou2tqgOZ12bEteiVh7o21HxfrVl5IKtBEpKTMAE2bkEOU4GyfZWBsFk7Gt6?=
 =?us-ascii?Q?7Mb6edM30v6QmRu780XFXvAVr+UYPcR/fRu2ttAqG8tf4ymyCXkFMkHC7j8x?=
 =?us-ascii?Q?HVOsLuVQ0BflwBbMw9yj70jJE1xQMip5sfD2pAyCg4rw6tA8X/ew7I1nUTpK?=
 =?us-ascii?Q?UReEi4IgxmaVTrySnUSD3rGyk9RDg9iVhhRbHA/jkZXKAEn3QHJjuNVNPIzf?=
 =?us-ascii?Q?IE8l+077TPjyXlh6JmLXpldZ74KJOoqa4844U+ChPFhD5DLgaJIl28GG5T1O?=
 =?us-ascii?Q?Q9KgLk2+/SQTRE/S1C5UzpJ4hlq3vphNW9zko2Bku6GMCk2q9gQg7qWpLrB9?=
 =?us-ascii?Q?kz0rrouseTwiihulC3TYyDt3Yanv1oLNqjP6ol+INR4kwi2pAJvgUe2mRvut?=
 =?us-ascii?Q?6MfYePSh6zmgdJ2iE0moKa+oWZHLyJhboTcjrAXNpt9v/uQ7c3jnvMugHzWZ?=
 =?us-ascii?Q?2cmhg0YeDVg+RBXqg+JFOqayddkdFM9NoUJFPGU6g4Drf+VPKufiBDIsEu/m?=
 =?us-ascii?Q?2af01VWEMGrbuCpkrGywzIrCQN1X0CP9yEoWUNrAzh6cdjazznXsjzXve8sK?=
 =?us-ascii?Q?dd6MqieaFDjdb8FUgEbOndd2xJDOJzKCjWye2ifaHZ46ibPZjrjU8qq5DP/M?=
 =?us-ascii?Q?YJD4zK0+kmEu4MjRb9iilKyMqnNye0pdtVUDULATRED2zX17CGZM5jjvV5ul?=
 =?us-ascii?Q?uKgjC0QL5xXHn67GxSAjAnG6+yUDZt5O1527RPJx4BG8DCNEivZQTxJpfE6K?=
 =?us-ascii?Q?XyvSnaM14gEhq7QdKVlx9ABAxdr5DGWV3yM0+LkU01g/XOZOraYkpxcz2FPA?=
 =?us-ascii?Q?kuepZfeU0F6NZYd+vwkcgLyNbmoEJZtpRnCccp97mSBU5DcTdQL8zCPXj8Gc?=
 =?us-ascii?Q?fvYi53lDY6ilIuuEmLnrqu04jUeoVZ95/roDDLOyOwV5W0/0ruG40wa7KV9O?=
 =?us-ascii?Q?nRD4mxattujGqh9wOFXcQ8ZFAiFzmxkcAqdlDNVG/D4SrMX+XyohxdSZyIOx?=
 =?us-ascii?Q?6hJW5MDF6XFVuhqG0j8JUomvZzABXmfGt4uOvAG6ouWIYHMH9ZK8oPuQ4F5Q?=
 =?us-ascii?Q?2odYfhAY5RiPrS3QLKvLc95LX+/Ro6g=3D?=
X-Exchange-RoutingPolicyChecked: yJsSH0phwybXOd/eBTPcfXpXgVFnwwaSTx2kToOnvglj3P6mJG/KQOmoOgr4IgLO8AG2iwGJZiOjJjF5agC+L3AXd3toXLjHFKUO4q+r409US4YHwEycC+T/WudBZwsyySkpVze524AOntW9BAZNnbvOwg1I6CJq2Im7waFGYHNyJtRNmgrD5zQd6KREuaXoIqAYrhdzElFaMax1YPNRnUmFn1mQjuWmi9OilwyhH3fIg3+qtwEZBns7WTTYY3K92kTvr6qgR+ORUKNpzGXarmE7ns7ruMYv2s60vveQsUk5qxF5bUBwmRRDiXN8Lwh/CcQi6qUhUkuF0jkmpjpK0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: c11bf22d-304a-45a8-2a29-08df295807b6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7180.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 18:30:17.9359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NMTVlJeN9yggtxn6w6sbo417BvUleUeROhmMQ5J91kDmfYr/WvEp3Z5udKl3aDOV+briPfRL6mEk5HX230/sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7314
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

On Tue, Oct 13, 2026 at 04:33:54PM +0530, Raag Jadav wrote:
> Commit 60439ac3f235 ("drm/xe: Add a helper function to set recovery
> method") introduced xe_device_set_wedged_method() helper to allow setting
> preferred recovery method before wedging the device, but also introduced
> a flaw where the previously set method can be overwritten by concurrent
> racing wedge call. This can result in unintended recovery method to be
> sent to userspace and possibly failed recovery.
> 
> Drop xe_device_set_wedged_method() entirely and pass the recovery method
> as part of xe_device_declare_wedged() argument, which places the preferred
> recovery method on stack and avoids this issue.
> 
> Fixes: 60439ac3f235 ("drm/xe: Add a helper function to set recovery method")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_amc.c                |  3 ++-
>  drivers/gpu/drm/xe/xe_device.c             | 23 ++++------------------
>  drivers/gpu/drm/xe/xe_device.h             |  3 +--
>  drivers/gpu/drm/xe/xe_device_types.h       |  2 --
>  drivers/gpu/drm/xe/xe_gsc.c                |  3 ++-
>  drivers/gpu/drm/xe/xe_gt.c                 |  3 ++-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c        |  2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c         |  5 +++--
>  drivers/gpu/drm/xe/xe_mert.c               |  6 ++++--
>  drivers/gpu/drm/xe/xe_pci_error.c          |  3 ++-
>  drivers/gpu/drm/xe/xe_ras.c                |  3 +--
>  drivers/gpu/drm/xe/xe_survivability_mode.c |  3 +--
>  12 files changed, 23 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
> index 8ecadee6eea3..b7390a4ee3ce 100644
> --- a/drivers/gpu/drm/xe/xe_amc.c
> +++ b/drivers/gpu/drm/xe/xe_amc.c
> @@ -160,7 +160,8 @@ static void xe_amc_work(struct work_struct *work)
>  	case AMC_ALERT_OOB_RESET:
>  	case AMC_ALERT_CATERR:
>  		dev_warn(amc->i2c->drm_dev, "AMC Alert: %s\n", amc_alert[alert_reason]);
> -		xe_device_declare_wedged(i2c_client_to_xe_device(client));
> +		xe_device_declare_wedged(i2c_client_to_xe_device(client),
> +					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
>  		break;
>  	default:
>  		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 22ae10958d7f..0d9ef4f1ab9a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1378,24 +1378,13 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
>   *   firmware and restore device to normal operation.
>   */
>  
> -/**
> - * xe_device_set_wedged_method - Set wedged recovery method
> - * @xe: xe device instance
> - * @method: recovery method to set
> - *
> - * Set wedged recovery method to be sent in drm wedged uevent.
> - */
> -void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
> -{
> -	xe->wedged.method = method;
> -}
> -
>  #define WEDGED_URL	"https://docs.kernel.org/gpu/drm-uapi.html#device-wedging"
>  #define XE_BUG_URL	"https://gitlab.freedesktop.org/drm/xe/kernel/issues/new"
>  
>  /**
>   * xe_device_declare_wedged - Declare device wedged
>   * @xe: xe device instance
> + * @method: method(s) to be used for recovery
>   *
>   * This is a final state that can only be cleared with the recovery method
>   * specified in the drm wedged uevent. The method can be set using
> @@ -1411,7 +1400,7 @@ void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
>   * snapshot capture. In this mode, GT reset won't be attempted so the state of
>   * the issue is preserved for further debugging.
>   */
> -void xe_device_declare_wedged(struct xe_device *xe)
> +void xe_device_declare_wedged(struct xe_device *xe, unsigned long method)
>  {
>  	struct xe_gt *gt;
>  	u8 id;
> @@ -1442,14 +1431,10 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		 * it available to the user for debugging.
>  		 */
>  		if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_NONE);
> -		/* If no wedge recovery method is set, use default */
> -		else if (!xe->wedged.method)
> -			xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND |
> -						    DRM_WEDGE_RECOVERY_BUS_RESET);
> +			method = DRM_WEDGE_RECOVERY_NONE;
>  
>  		/* Notify userspace of wedged device */
> -		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
> +		drm_dev_wedged_event(&xe->drm, method, NULL);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 80bda9b548d5..9f35370c0851 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -264,8 +264,7 @@ static inline bool xe_debug_page_size_mode_is_mixed(struct xe_device *xe)
>  }
>  #endif
>  
> -void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
> -void xe_device_declare_wedged(struct xe_device *xe);
> +void xe_device_declare_wedged(struct xe_device *xe, unsigned long method);
>  int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
>  const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
>  
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 4e0e1bc040c1..00ce8e9872ea 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -543,8 +543,6 @@ struct xe_device {
>  		atomic_t flag;
>  		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
>  		enum xe_wedged_mode mode;
> -		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
> -		unsigned long method;
>  		/** @wedged.inconsistent_reset: Inconsistent reset policy state between GTs */
>  		bool inconsistent_reset;
>  	} wedged;
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 524ac56bdcc7..2bbe0f20ff8d 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -340,7 +340,8 @@ static int gsc_er_complete(struct xe_gt *gt)
>  		 * declare the device as wedged.
>  		 */
>  		xe_gt_err(gt, "GSC ER timed out!\n");
> -		xe_device_declare_wedged(gt_to_xe(gt));
> +		xe_device_declare_wedged(gt_to_xe(gt),
> +					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
>  		return -EIO;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 4e047cfaf603..f35ae3a532ee 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -992,7 +992,8 @@ static void gt_reset_worker(struct work_struct *w)
>  
>  err_fail:
>  	xe_log_err_fatal(gt, GT, err, "reset failed\n");
> -	xe_device_declare_wedged(gt_to_xe(gt));
> +	xe_device_declare_wedged(gt_to_xe(gt),
> +				 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
>  err_pm_put:
>  	xe_pm_runtime_put(gt_to_xe(gt));
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 37899fcf5b22..28ec83bb8100 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1462,7 +1462,7 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  fail:
>  	vf_post_migration_abort(gt);
>  	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
> -	xe_device_declare_wedged(xe);
> +	xe_device_declare_wedged(xe, DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
>  	return;
>  
>  queue:
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 7ce73489c35f..e2a0b989cfc8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1453,7 +1453,7 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
>  	if (xe_device_wedged(xe))
>  		return true;
>  
> -	xe_device_declare_wedged(xe);
> +	xe_device_declare_wedged(xe, DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
>  
>  	return true;
>  }
> @@ -1780,7 +1780,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	}
>  
>  	if (wedge_device)
> -		xe_device_declare_wedged(gt_to_xe(q->gt));
> +		xe_device_declare_wedged(gt_to_xe(q->gt),
> +					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
>  
>  	/*
>  	 * We want the job added back to the pending list so it gets freed; this
> diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
> index 32700c19a1df..934be933d57f 100644
> --- a/drivers/gpu/drm/xe/xe_mert.c
> +++ b/drivers/gpu/drm/xe/xe_mert.c
> @@ -74,7 +74,8 @@ static void mert_handle_cat_error(struct xe_device *xe)
>  		break;
>  	case CATERR_UNMAPPED_GGTT:
>  		xe_sriov_err(xe, "MERT: CAT_ERR: Access to an unmapped GGTT!\n");
> -		xe_device_declare_wedged(xe);
> +		xe_device_declare_wedged(xe,
> +					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
>  		break;
>  	case CATERR_LMTT_FAULT:
>  		xe_sriov_dbg_ratelimited(xe, "MERT: CAT_ERR: VF%u LMTT fault!\n", vfid);
> @@ -82,7 +83,8 @@ static void mert_handle_cat_error(struct xe_device *xe)
>  		break;
>  	default:
>  		xe_sriov_err(xe, "MERT: Unexpected CAT_ERR code=%#x!\n", code);
> -		xe_device_declare_wedged(xe);
> +		xe_device_declare_wedged(xe,
> +					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
>  		break;
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index 79ce0c671549..fdecd3e0b9a9 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -86,7 +86,8 @@ static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
>  
>  	/* User wants to debug the error, prevent reset */
>  	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> -		xe_device_declare_wedged(xe);
> +		xe_device_declare_wedged(xe,
> +					 DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
>  		return PCI_ERS_RESULT_DISCONNECT;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 7a85735c57d5..fe16a4106060 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -321,8 +321,7 @@ static u8 handle_core_compute_errors(struct xe_ras_error_array *arr)
>  
>  static void punit_error_handler(struct xe_device *xe)
>  {
> -	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_COLD_RESET);
> -	xe_device_declare_wedged(xe);
> +	xe_device_declare_wedged(xe, DRM_WEDGE_RECOVERY_COLD_RESET);
>  }
>  
>  static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index 45d44ebe288b..ca031576fecb 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -446,8 +446,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>  	survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>  	xe_log_err(xe, SURVIVABILITY, 0, "Runtime Mode enabled!\n");
>  
> -	xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
> -	xe_device_declare_wedged(xe);
> +	xe_device_declare_wedged(xe, DRM_WEDGE_RECOVERY_VENDOR);
>  
>  	xe_log_err(xe, SURVIVABILITY, 0, "Firmware flash required!\n");
>  	xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
> -- 
> 2.43.0
> 
