Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7F4CA0EE4
	for <intel-xe@archiver.kernel.org>; Sun, 17 Aug 2025 16:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD79F10E199;
	Sun, 17 Aug 2025 16:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJbmfGJB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5368710E199
 for <intel-xe@lists.freedesktop.org>; Sun, 17 Aug 2025 16:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755448132; x=1786984132;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vSbfVrk17V9n1MnX3lQaI4ZodxD/ADCPfe0mvjDVhvw=;
 b=CJbmfGJBBJf8Yd0WC9sVabKcwuAHAJXAQ7mxbD4hUXSMlFZmj+KTdQm2
 kGcuvskqlWi73uDFY37rI3UNq5OPFqpciTWGKcMpV2FTrEv3vi2SzthQV
 Wtj1L9ydvPvv8A39IAp3UBrwPIUHNu4ahRpRUs9xscnlYER2/V7pG1aaR
 UGfJDRMTmccGWM0R9TkGEDCZ/WGehEf5e5nJR50Ln3OEBSMFUxadES3Ua
 oKTn0VJRxqg3xkclMtRNFX2wPAcImKwgEV23or8wt2Mbj9bTEE2dQ5Lnq
 DNL+pJQLMlN0yKNPLyBSvWU4416nYgOqS1lIq34j0BgUP3UeRv5LZKjWM g==;
X-CSE-ConnectionGUID: hC22IizWRvOepiJNff/rJg==
X-CSE-MsgGUID: iW9+nWCOQcmSjg2P7Fnx0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57544264"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57544264"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 09:28:51 -0700
X-CSE-ConnectionGUID: GSylRG/uQYKcwKFFVpa6ag==
X-CSE-MsgGUID: cE9KxDitQ32rhLWcZNCRBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="172737638"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 09:28:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 09:28:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 17 Aug 2025 09:28:50 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 09:28:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPASq/QMCiTT9Ncx5LoSR28hPCnFWY63wRQzV6WSVbInfNxe3i/SZ70d2hGEz8B3kYcD0e2TEmx1Zpi/ezv/bgmPdaN3V4J2dJ17/UK8xpQLEsWBxDvptH1ayMgOAoIUsJUk24kVKUWbzqVUIPm0P3MMVUuRgv2wXfDsVi3OxTWXsgX0szDG4SsWtEkisDE+gqB7npJj9WziMviAF6qS2hnoW2gHSCK+eSdaPcyMtKrgW9q1bBiBwqlG95tYjNZtEbiRM/Mai5N5H8b+YYRn3+frA/lFmg1WS7qNNDwMBgRtM/y0H/Fo48J4T/9ZqpTl7yaTJGz/yBx7f2poyHEN0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WZo5u2ay3y1p4Vamf+Me/M+oXO0gZdbP/eYjL281BE=;
 b=y4y9AUvPUDCaJyb68Vg07NbajBzhu61wztKJacdHQWxJ1DAqb9qGem7AUmOaSYkS2a2itSskg70aWWh56ZMhDaX5a7ZmF1b+Qo/Slo4diQwU7nuZpVU6QtBHyyqpnYG8y4sPNGQBxNn95pphhbHPnPwIBOvBj52ejAtRA7FrkWPXD3g8oF8mwK87keqJB1Q9E9YciqtmYu/wnz4YXeTc9QR93g2sL6c3xNbdRKpWP1SEyRbpj6UEQ9Q8f2fjqX8lsFpQxMl0AtoD9Jq7VAQFkLWigjbxtseE+v+c/XfARMRNyX5jzloKEFrGqHotpKMJwKIZSNgN9PPEPSvSWma16g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB6837.namprd11.prod.outlook.com (2603:10b6:303:221::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Sun, 17 Aug
 2025 16:28:47 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.9031.021; Sun, 17 Aug 2025
 16:28:47 +0000
Date: Sun, 17 Aug 2025 12:28:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2] drm/xe/i2c: Introduce xe_i2c_present()
Message-ID: <aKIDPDLicQvIEgI0@intel.com>
References: <20250814091845.1356135-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250814091845.1356135-1-raag.jadav@intel.com>
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW4PR11MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e5de55-ca74-4e5e-9060-08ddddab2457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YESijm47Uwlqgl0dRz93ujd4CTxp+i8RFl7w4KVC+ijElr+V50l656LRCY8N?=
 =?us-ascii?Q?fAP0XN/QRxvOEzGVL8R0NSBzV5RD4sJ3mJMNhAPaoQiAAZk9qyOl/zPlX2m3?=
 =?us-ascii?Q?M0YF05BvwCy/nxPk2T+51LE6w7P2jXyRCwn2H5LSQx+3amdCS8weqmfh7BeN?=
 =?us-ascii?Q?OO5/GSzBXwrKv1iwaOxeGvuAjGqpBqpgmwsom52fbxO0bdQ4Qurez/lENFgP?=
 =?us-ascii?Q?R+YsiF4cKGT5SCYmNU0D7QQZPD+D9eG9rUoEsbzHT2bqmNOcb/BUdhlZuQm5?=
 =?us-ascii?Q?3UlmpgtakX3pU7qOT/36IUixnbLgpXmH2hK1oDcrgU+IoAgViJaWX+Ynuaum?=
 =?us-ascii?Q?en92SR4FZhctQ3aHMbFBKQQnOe85Ckm5Gw4bxYb+WpeTJHzyeuTrkSuOjcAN?=
 =?us-ascii?Q?9Mvu67Lu8CV6MsihFdUj54lJ2jcqF6jkdo+702BzTSCF2FkjI7FFk85mJK25?=
 =?us-ascii?Q?60tB29FRMss93tGpoaq5kco1dQ8w9NPQzi3w5K8K9ezOcZaomD/KjGRV4wF6?=
 =?us-ascii?Q?6t52sbTsJMWXbgaJHW/RPxe6rwskS6J1UJWOMQFW5TxygTjFeddXSk2fS6uU?=
 =?us-ascii?Q?2xcQZPpr2ne78rP9sxwVJylM+839yHtCAgNyK9y5n6KxadsugrQlqALTdwFT?=
 =?us-ascii?Q?S2jseOB1IIRqw8c1/Ze8IFVtle6SXT4sZCD9uRAC64AWkjHbNvwo/zoExLb/?=
 =?us-ascii?Q?M6GFCMIsZtDGeo/reNCdNQCOmIp11Y683JDhC1XGkv87IYs1pzOsDUFgdPK9?=
 =?us-ascii?Q?QMwNrjc6j4Kr+6EgRhJHtcd/T0ncHnm8ma1f5LTNtcjQthhQyo0BMw8JyIME?=
 =?us-ascii?Q?YLhhnz0tdPJpITSZXVlrI5uqZVNx/VEPYonMrtlowgQ9RdknFy21xMsrJeyS?=
 =?us-ascii?Q?+y2cuKn7MyIhcMBYMA6hcaBiGZ6cRXNtnvXiSMTMNnPz9cdcwXWIrH6gPvqm?=
 =?us-ascii?Q?CXCPQW7ijDfPV9B7+A7DYJRA1PURxgDTloqsSoN599f0qkuc5zBuYXtNlH9O?=
 =?us-ascii?Q?FLOLPoC5vuXv/DBdFQYLK6S3FIZeew6GmglANnaUwE6KAlxz6kpTLTVYx/nT?=
 =?us-ascii?Q?zVvPbsBkQVcQToN2NV5H+016ZnJhMUj3kLVoNH72PAgbRxXHFs9iLnhBGWue?=
 =?us-ascii?Q?nlctUo5ykHkMnBbDYtjrjbXI3wtwLOnEKXWhJhssME0d648YsHcE6EFOvkzE?=
 =?us-ascii?Q?N5m42Q/dKFrhS9JreSLfDfh4gvOPZXWBXRdBpbVmW2mZZbtyBjoeQyIWMju2?=
 =?us-ascii?Q?GE1sVnhW1yBGBLV1XVjQoJPv0VMZJhxJilHtrLLcQEPyYarZPB+Gd0HI8gV3?=
 =?us-ascii?Q?0WHmSl+ouNQmq8Axu+RyqrBFV9dtbk5DOsVQ3ttYwM6O7seKM5RdDTHNSvOU?=
 =?us-ascii?Q?Ee8XPq761lu23Gjwm3vPwWszM7+B5pzMIoJR7PSe7W/vesohit+jONUUufFV?=
 =?us-ascii?Q?d1xEtWTmAvU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LSd1oatoa5SRPEvIeRPZ44Rcv4opc4OlsrGq/54N7JwvPoME5cIkfCxfar54?=
 =?us-ascii?Q?8Pzpnrge19LYK/b/qMePmqsr0HTerozu+vTtslm9UiNvqjG9Smjd2Nbc9V05?=
 =?us-ascii?Q?Psj9k0cJ0BP+sPta3y0Z1Jj4t/b6lRYtKbbsuiOk7+CZ6RcLSYT4zki9or5w?=
 =?us-ascii?Q?VBgoql8BCpp4Z9NygEOZss867neRDlsytwgHvEZjFuCYFPi+DpnrpdzOhzsq?=
 =?us-ascii?Q?O2/F0/Cjx7lfKr806weDgxdqYhbwQ9t7pvJLn6v3eINwVyOYjh26SDLru9D9?=
 =?us-ascii?Q?Xc9N5ZyTcZnfhs4Y/4q+JpjY6xSP6gicRXguthv/xrEr+zjN8EtjDFOMKgwg?=
 =?us-ascii?Q?xYsKLBBZEZkmDFj9s/43ZHgloAfVf5smhHY2aimXJrNzS3nYosyNQWCo8hOk?=
 =?us-ascii?Q?qcjnMdZ1MPVEzP1Gc78tJlrM+Z9fKLoMbSCmwto6YkopKKCbZRgE9j5upxw5?=
 =?us-ascii?Q?qcMqwiB2+eBiSQz2CA38wW113jmGWZvT9X6UdRI5pHoRXUOwYp1qd09yqBsw?=
 =?us-ascii?Q?7dqIgfQLuP5yZoHVeCxsyCW9AbjET6QdMQnaJFzoMpzWdbQ/LZRKBpD/gEah?=
 =?us-ascii?Q?OEffB7nLL6OA++WF3KULukpFz+vLWMYIoa7yqfs9fQdUVNbIHHkxnEXNeGzG?=
 =?us-ascii?Q?Pq6UYz1DI4enRvRTO0LDUe/THvU7DZ13AyuclNluNKjowvUWtLKBv8GsDcTJ?=
 =?us-ascii?Q?+x+71MZHt76d1bofd/oa3s2E+W1xILrxtfquuwSD8Tim86RGsrkCB21cRIOp?=
 =?us-ascii?Q?du5fRnG4DTFqR8SyWSALyip107rRMqEaA/e1GWbm3EtZzjWDBBp68M+nkR51?=
 =?us-ascii?Q?oAbdKIcdCNLOxyLTM9QiaX/NXFvEe+u67/fpZ/DLezyKIFA98rlNwAG3ZlMo?=
 =?us-ascii?Q?olruO+5MigheUPFBPEvARU6uI3ZFq2tAWK6Pf6j1hX3WHagYYTWWknKp+wQH?=
 =?us-ascii?Q?QUc3MgLpr2AXa7WsJW9glq8ZSOa8++ETMSwKUTRKom+XPMpue7iwUFVehkT3?=
 =?us-ascii?Q?gioJOmk380TrfvnNtcbos4d1bqJ6FFeViyd8cKvJPzj/vaBwuwYwGuLG92iB?=
 =?us-ascii?Q?UN5I/Wm9gOD2Zav5BPNLrdz+ban0PRMerf2nMlTRaYFyt1mgnDg9Xrc0j8qG?=
 =?us-ascii?Q?ulJNs1nBjxzwbxg+i+8F+b07HaIA+4rASwMn00U1yBn4yogCjUvHS4Nv5wD5?=
 =?us-ascii?Q?FZwq2a6sIQwMGPDTCdKmOZAfztBJO2Aq8teqNuQ1UP/moRvOswfF2BTWkxUY?=
 =?us-ascii?Q?V/PS70F1mDiDsxvng5MSTNZ6eqcGaJpg55bdA29WLwiF1HTnTYTQgIWNk62d?=
 =?us-ascii?Q?3hlx9OGCedUgQVC7MqchoCkBIVl/+y9DkaT9YTdLEDA2Deg4aPjuLr3bxg1D?=
 =?us-ascii?Q?EGVThhrO60SfjapviZm08vwqYNZ/zskd9XasOzJo83mhyk0ePpQYcFy3QJKG?=
 =?us-ascii?Q?NYIlvdIPYEJZp++i8MikwGIGQ/V+/T5zQVDG9x1SgaBZ+vDEK/VgCao6H0vr?=
 =?us-ascii?Q?67nLtw5NQmzGmZeTDXAMRatuPYciczREfarRgI2P0pCtzHfmw6S3F28SabWr?=
 =?us-ascii?Q?le+/aBp5rijWlzxL4uXnIR6GxqPOlGgHj/44JWdv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e5de55-ca74-4e5e-9060-08ddddab2457
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2025 16:28:47.7479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXfVwl5JnP2fRNs5rveivWmErkfkrqNwXsQiJraxULBRIheYQx1J+GehSJIKTaqyfo6VVnv0Z6FH0LhSELj+og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6837
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

On Thu, Aug 14, 2025 at 02:48:45PM +0530, Raag Jadav wrote:
> In preparation of wider usecases which require checking for I2C
> controller presence, introduce xe_i2c_present() helper.
> 
> v2: Doc fix (Riana)
> 
> Suggested-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>

pushed to drm-xe-next

Thanks for the patch and reviews

> ---
>  drivers/gpu/drm/xe/xe_i2c.c | 18 ++++++++++++++++--
>  drivers/gpu/drm/xe/xe_i2c.h |  2 ++
>  2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
> index bc7dc2099470..044dda517b7c 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.c
> +++ b/drivers/gpu/drm/xe/xe_i2c.c
> @@ -146,6 +146,20 @@ static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
>  	fwnode_remove_software_node(i2c->adapter_node);
>  }
>  
> +/**
> + * xe_i2c_present - I2C controller is present and functional
> + * @xe: xe device instance
> + *
> + * Check whether the I2C controller is present and functioning with valid
> + * endpoint cookie.
> + *
> + * Return: %true if present, %false otherwise.
> + */
> +bool xe_i2c_present(struct xe_device *xe)
> +{
> +	return xe->i2c && xe->i2c->ep.cookie == XE_I2C_EP_COOKIE_DEVICE;
> +}
> +
>  /**
>   * xe_i2c_irq_handler: Handler for I2C interrupts
>   * @xe: xe device instance
> @@ -230,7 +244,7 @@ void xe_i2c_pm_suspend(struct xe_device *xe)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>  
> -	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> +	if (!xe_i2c_present(xe))
>  		return;
>  
>  	xe_mmio_rmw32(mmio, I2C_CONFIG_PMCSR, PCI_PM_CTRL_STATE_MASK, (__force u32)PCI_D3hot);
> @@ -241,7 +255,7 @@ void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>  
> -	if (!xe->i2c || xe->i2c->ep.cookie != XE_I2C_EP_COOKIE_DEVICE)
> +	if (!xe_i2c_present(xe))
>  		return;
>  
>  	if (d3cold)
> diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
> index b767ed8ce52b..ecd5f10358e2 100644
> --- a/drivers/gpu/drm/xe/xe_i2c.h
> +++ b/drivers/gpu/drm/xe/xe_i2c.h
> @@ -49,11 +49,13 @@ struct xe_i2c {
>  
>  #if IS_ENABLED(CONFIG_I2C)
>  int xe_i2c_probe(struct xe_device *xe);
> +bool xe_i2c_present(struct xe_device *xe);
>  void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl);
>  void xe_i2c_pm_suspend(struct xe_device *xe);
>  void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold);
>  #else
>  static inline int xe_i2c_probe(struct xe_device *xe) { return 0; }
> +static inline bool xe_i2c_present(struct xe_device *xe) { return false; }
>  static inline void xe_i2c_irq_handler(struct xe_device *xe, u32 master_ctl) { }
>  static inline void xe_i2c_pm_suspend(struct xe_device *xe) { }
>  static inline void xe_i2c_pm_resume(struct xe_device *xe, bool d3cold) { }
> -- 
> 2.34.1
> 
