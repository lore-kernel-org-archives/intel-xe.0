Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB01CCD193
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 16:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A3E910E666;
	Tue, 14 Oct 2025 16:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWN0kIop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0157510E666
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 16:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760460058; x=1791996058;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zS8ePbfP50PtN/1QusjQf2yumYW0IlBHK6NwiFcj4nI=;
 b=NWN0kIopWIDWDGDQr9GSIxYSNlCPcpzXZPTE2PI2TGiNxOW4e7siWuux
 PimOZq91Ko2Hq6viQjTnN19PtcCctSwMbyNlal2NfqCILehkhxKbs0s7V
 4cRbbMczV0SdDa/2ylRyfQJaE1BXip/3bHeLpe3fQogmS0mNqyDAO0yq8
 C91jgNVCuYG+/gk9ujrm1KF1iFtBGhxxpYa7gtQnMNMIJHhFld1ned1b5
 BzqQhfngmDSb1MdZix+EZqfCkbpDfTRV48bRxrUCYFyjTRexKj2HlGB9i
 N8smkYPD2mFq9kuvFVZgYeenM/wtcDCWGxdY9m75TGdUsJEfmqOJ77zFz w==;
X-CSE-ConnectionGUID: DTo6UyFFS6eDAgTFHcA03Q==
X-CSE-MsgGUID: RXAJkaRmQqqSmPp4jGUC3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="65247226"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="65247226"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:40:58 -0700
X-CSE-ConnectionGUID: QH6EOGopQVW928Odd9rCfg==
X-CSE-MsgGUID: 0OWVXSFsQ1ygd8MdxWQXdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="182719719"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:40:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 09:40:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 09:40:57 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 09:40:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tykaEbM/kIWZI18GNRbn5nt8Edou4NSlPobcmiN2Y3cRW/BsW1lv2FU+teEYKE121Tzd45Ii8pHPHGQckS0+9BLDSjGHEjVX7BYmMHIhpgVC3IT0yHpJICgMZnjcZVZm/sGEi1biZXkpoTU802PUrBvJUu75sIVn3s29+vY4SURiGez3UmYQWG6VD2A6j7PpU+l3xgbDXYyO9t7HB64g3p2v0t4MUK+jV6decuzsPZnoGYbzpuQo+nKHM671567AbRJMAEopLCNRIpTQgjohazDeBm2MxcZdn4NCj3p8J+5h/udhDZfFo7qs8oe9c7HATBGH9Wrp0MgFOH7zQqH4hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5Yxq0chshojZe7J+Wu04D4lD99MAYvsiIZl95esarI=;
 b=kOOp+qLkTGS/6edK9cfzAYH9yG9BpOsP3gzCiWAxKj+e4hPMq2DMW8q1t7PizY9PHyLGUjiQxQQ7GtSA4Rhea0lRr8Cbg727DGaClsseSom/6iLNQ3V1zPGClhArlk4N84rDe9uz+sV5so1LrjuE6qTFPRg8fgWE9x89buvncCP15h+wqwuA5bhEAXv9WPUD9d4qHsD/ey/hb0zbVu9OEhAQyOW41ZC6Vj6yY6Ri2dx2Qs+3kOgbN7r1fDNsHdQ9Nb7GXZVYDeP0KSzXBCfCu8E8yVoyLTwmGyBteeNMZ+pCsWMMCsnjuzs7wluQgNorEEIByVbmx//hwGfR56t0Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6605.namprd11.prod.outlook.com (2603:10b6:510:1b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 16:40:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 16:40:53 +0000
Date: Tue, 14 Oct 2025 09:40:50 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 05/23] drm/xe/xe3p_lpm: Stop reading the CTC_MODE register
Message-ID: <20251014164050.GQ5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-5-bfb74f038215@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013-xe3p-v1-5-bfb74f038215@intel.com>
X-ClientProxiedBy: SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::26) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6605:EE_
X-MS-Office365-Filtering-Correlation-Id: bf57158e-58c5-495a-af10-08de0b4070c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GxPB4/awfZjrZSMZ6Tod0hXI4/0GDdbFKLZejGWg25nAz1Y7sBAYgNNyvRur?=
 =?us-ascii?Q?6yFIxmID8hRluXShKHbQtEn9KlTGYVOB99l0+co3FKDqbGO0xxVXiZ0ho/VU?=
 =?us-ascii?Q?+YqaCuVnrMime17j8qietMitvalQD7J7EQRR5S94AxRreOER1lnimYZpC4d2?=
 =?us-ascii?Q?Bt+B0Nw4MlWnSfmgarCJcSWJCXxKPE7Eh+UeKiE6AJ2Rjm3P/Nvl9AB4ABWn?=
 =?us-ascii?Q?xTDDNs/TpJGl3ID01UKyhfUQmscXO9ufBzLpQixEGoUkPr/tn2S7rXyKSDMs?=
 =?us-ascii?Q?rb8zhUeIrGo7Rg7V2aKJQss1U8jf30FFE5dNFVaUMxgFdzC1BE7c9+XPlkGP?=
 =?us-ascii?Q?wJoP4oQopIxe+HDRZ2u5PmanBg/hFYPGvHN4MUZ7dZiOLekDL70SZm9Fn6Wc?=
 =?us-ascii?Q?vTxu7WiJ5cNZQ+h9qpVWMKsypa78ELiFNcFswf8lwkPjCYq5957OV80LCcee?=
 =?us-ascii?Q?KBZLJpRkrRWyONwLzVn1+fVSsJKyW6q0aLWKPD5PjORtO5xsgBXcHOA1zbUO?=
 =?us-ascii?Q?nqjWtoo+29RrX05S9PGNg+iHWX9jgYKAySjiPGDb/sJJh4PGWBy42CdQvGAF?=
 =?us-ascii?Q?bhy1YCnao1gH1nmRXjjLGYuYWbMLVXadiYAIl3AJvYzGe2S+3OTwPNk+CTJr?=
 =?us-ascii?Q?3Lw7FQ0evKjW0kVBf9SHPWVz1Y0kjqYatGJVLK0Lg3Om9TX1836vRmTmMHKF?=
 =?us-ascii?Q?9qnXiArO3v8oSFwDU26vdSnxqwWpJBxCB8N0coIzuk1EqjqkhiX/ARFA22IC?=
 =?us-ascii?Q?iA7NwuJVBz6R5l/zjBzNXyNdaSthcbwLrt5QE4hgz4TlvVS53WoSF/k8aN3w?=
 =?us-ascii?Q?zNpa8M1e336ZXMGJ14bdYOCk8X5NGcCVNx1jcEC6Hcj8evnj4bOgjfEbVSEm?=
 =?us-ascii?Q?Iqp8ryuMN8WpEappOIGAHOHlnduPmKhOdpGNE0uE7NLykTEMN5pN0yZ3DpEH?=
 =?us-ascii?Q?RWlkE4/P7bvy+6/VEWfnXH/FtZwHqo2h1L+DL5DKisKbFSp28IyIp9/6Ifnj?=
 =?us-ascii?Q?Uk0c95ytZINjZj5hUKtc6kOTfvasY+h6bepJR/hPifEQ/3JhUiHDP1fqoALC?=
 =?us-ascii?Q?rQz5vVQeDegKgQb8oxB+lW1yIEMkc7Q2WwtQRXuuFNyxi8FdebrBweUZDgm1?=
 =?us-ascii?Q?eqZwrW2kPiTWOcIPOEncSZibtPYdX7UD1vsIjkaE/dGgYOoGsfywL3dvydtq?=
 =?us-ascii?Q?TeLWLHsVtY4ptjGVVyqdlkiN5z7aq+kYV3psgNqgpHNgijnx4RAwsSJjMLc6?=
 =?us-ascii?Q?iqv1Fn56jz1+cY++5TlkaGUy9dY7UdEDLa46QntIuDFCw4/BEV2HJX07NSpC?=
 =?us-ascii?Q?VtBtDN9WCcYem46vDi+BfUZahTacpuDdzoUOKitPsNqvihGykKk+2J+gvgQn?=
 =?us-ascii?Q?1ktA+2GWsJoIstKpzhUdl0gn2YN38DOqDnWowPWSlrY2uuZwLjVOEvYzzwfh?=
 =?us-ascii?Q?u5E2gpz6OCj32xCExSvFvGjpmP6q/oXd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qUXrouPD+XFy5fEgBVhNEuW78PujGAdpxn+w0zM2fSYXO9CWrLEWaPgeydPs?=
 =?us-ascii?Q?dNpEzMMrF+gNbEBFoWVUbm3y4RqwDsJU8YdszwaR7p17rbhjp69b3pXTbIx1?=
 =?us-ascii?Q?SZey3907xFOPQNaCGvayJs1ojxTy5eIgPKEFdigtDReHR2LMoKj+Qv2PHkB3?=
 =?us-ascii?Q?YdagvGZ+aGOYe1IGi1ErO8HxwOk7aCBanO7rfsarFIdmenXDZMwOgXPEfJwE?=
 =?us-ascii?Q?YZV47cLHeYzmKz1IVIU1JkwMyaGKJtaXWFfFsigRTv4PJm9I2nPX2Ss+w37U?=
 =?us-ascii?Q?AlF5ZBLzxVrfVUAJ7wQL9WbJ2PLyuV6ko9i8QK4IGclyPDlBLsOdrHazzFCH?=
 =?us-ascii?Q?1FPj2nQE82wumww9bu+qVnZJRmhm/1wd2YQSwJgWb7UUl0VjFU+mnhpWZFir?=
 =?us-ascii?Q?pjtBhbaDsZhS74FLImmuNzVE0Nm8EfXaaefcjZjYaCinMUtkrjdU2M9QJeqr?=
 =?us-ascii?Q?dCiXfwNi6Zbh196OjOHi/ogiD0HyYw6Sz+HkSAu8wdylfYTkvNE9QUQP4/DX?=
 =?us-ascii?Q?mFWtYf/O6tAJo2rAwJtcVL+fJdYASAGWGRgsPL8OD0R5pWt0pivOjA26cZE8?=
 =?us-ascii?Q?JcbF+CWlx/+eiwwinsmFAMJkGcnGyAgp+rp6k1r1t3lXdH+cZzokWHcCtae9?=
 =?us-ascii?Q?cpQwPGmjvj/UDwilUDfpbFUhVXb/YS68FDA/1WA8MVSKFTYLSQ6+PwJAF/1X?=
 =?us-ascii?Q?PwbNFH5i5+Zf1lmBW2nyV7Ce91sn4yybmJiD7iAv2AQc45Wu9cdkyMMEpmQ/?=
 =?us-ascii?Q?u/m/lu5IhaHnzZz/3wZAMSsoW0z7mhVvAD0a/5nO63hTcW472jmuv7ghmFug?=
 =?us-ascii?Q?t1JX9M0GDadM6cLxN5hiL4VUe9PHN2q0HTqOTYPbktawBBEvq/Sx4DC/NcCC?=
 =?us-ascii?Q?pzqooTQkZxxgHzK2QxgNIvHOPZVrcVHipf1IX7yEudr71xJBV9JkbtWBPg3Z?=
 =?us-ascii?Q?+3d8wd+2z2U7OSgBni2glBZz4v8eRgvL1g5CuusU28DwQQWQhJkgjLo4ng64?=
 =?us-ascii?Q?MV1K+Gowen8HzHhRzDg/18/f8yIZnOPG31ziKJ41j34L8dTVPfwClAXYo0m6?=
 =?us-ascii?Q?PmTcCSNm9wjY+vNApKIhRaOSktWsQhi3VbGJTJmUjAvI8/poh/Yh8OQ9v1Ni?=
 =?us-ascii?Q?F9ALpIk247i+JbotRpOm2WHPGwqXrFuNY5+wK6SVbfF/aPAMPQYIIktPQdQK?=
 =?us-ascii?Q?svTPdGHvDjP7F5uF7e7nVEh0/j09gCk2DRq+Yn5Xe4D/FsoZKYYrgGq38Uf6?=
 =?us-ascii?Q?vxDmGC4p70lN5akqOTV80+RYOBm/NIH4spkkSR6P8yfbPeX/W5fmdHTCN61s?=
 =?us-ascii?Q?fhx9HKmrdSc25IkYjN9BPnThxrI9nRSqgtcex1nPfrRuy2ECC7iT2dtoD9wP?=
 =?us-ascii?Q?rPn74pcV6vWtmdZIi/1DKlMD8Jk0IZhx9uVPTQ/jU1+WmLTddUmp0Puo4w6l?=
 =?us-ascii?Q?Wc+0mS6uP+SzGVNiK4sVVJ5As5IiLdUS+2FdxYOkiMlt05SaD+A3ZU9Ge36A?=
 =?us-ascii?Q?Hoye8TRoalbkf1Twis/OhwvufMD9H5vvkjyPyzbW6ENMqHUdEHaMIJQBWd2o?=
 =?us-ascii?Q?XvBDHUmE7K0tvfUH0+uQOzbihbDx05ryYZfl/KfN/sSyH358pI6xfJ6N8Oka?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf57158e-58c5-495a-af10-08de0b4070c8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 16:40:53.2752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HFh1DIhATfWpqheAr8ltlViQM5uLZtbGwg1u2zSRt3YmOhPmdD1Qjt3xwngNyL5BbhEXtSbBNwOladylozcgHzVbwArcEmjqvbjUInPGjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6605
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

On Mon, Oct 13, 2025 at 08:24:37PM -0700, Lucas De Marchi wrote:
> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> CTC_MODE register is removed by Xe3p.  Stop reading that register on
> Xe3p and later platforms.
> 
> Bspec: 62395
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt_clock.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index 4f011d1573c65..26052710be8a7 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -57,6 +57,10 @@ static void read_crystal_clock(struct xe_gt *gt, u32 rpm_config_reg, u32 *freq,
>  
>  static void check_ctc_mode(struct xe_gt *gt)
>  {
> +	/* CTC_MODE register is removed by Xe3p */
> +	if (GT_VER(gt) >= 35)
> +		return;
> +
>  	/*
>  	 * CTC_MODE[0] = 1 is definitely not supported for Xe2 and later
>  	 * platforms.  In theory it could be a valid setting for pre-Xe2
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
