Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C02CC54FB3
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 15:06:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AE2E10E72E;
	Thu, 29 May 2025 15:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z70OelYq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28ECC10E737
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748531203; x=1780067203;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JYefvGZMof07wfbbucpcDiyw/wfq3TCYlbbNY0Om2bQ=;
 b=Z70OelYqCwlY7Q9Zhm2k2Zs2jQimh3JhsobKMihyobPUWqxwaz18Q404
 JZAStsZaWPyPyUwUUk2HL0E+QbviH7orYaHjnntHtb8E7xQFlq6iwT5jH
 gnoSvfA0QjUJdasHvhBgsYOBzIi4DcIIPK7CFhtQ1bCkK18mSLg35vgMU
 Q8n+nXInPt6r/jX0VltjsezTGto8AmpWF984tclrnE6JHhwR6FxVN3X1D
 z24pz/RpKSCu83RXLZQxMpw39U8sw6uwfSz/hBsdaXVrykknKf1E7Pc37
 EvRpm8q2sZxK3kHEF6uXgHMPyH1EEQcZURy/5Xzs0zaMqrE29KK/F4oAs g==;
X-CSE-ConnectionGUID: ZFtKTqihTpuRjU5OrQ1AJg==
X-CSE-MsgGUID: HFaS+a/LSP+YYjsTyDSPNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50702219"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="50702219"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 08:04:02 -0700
X-CSE-ConnectionGUID: iRH4Y83jQVWh3QwaNsZCzg==
X-CSE-MsgGUID: ZKAY+i79SPG5IpqcqQP3mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="144570535"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 08:04:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 08:04:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 08:04:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 08:04:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hkf4juJ7+WA3lPBmPYcb22iFOetyNhWi+75wrRoXcb6bh6bJVD9ycV2OjhfWQbvh2eAYY693JNxHlzC91Bk2316UNof8R8XXXuaJy+7QhcvreIxDyj9QH4MmtMRf+SR+LmD52J//deYsdLJurI0CsqixCWo3wA1HYpDoj/mlXoCBbDN0Wyjz7j9qCen9QrJI8vgADlSNLGrbNnomybhklpEa2eYCMupvSziZX8K+olca5SUaflkCd3I/mEvxv9d+7Qcf++Dc4EbN/Swfaeqe+5fh4hwcwxtcUIfFpF9vt1K2cW1E3agjn2RpOZ/89n+sGPAglGrLXd4oZ9Ogy/9ILw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UY9Ns9ar0LbpgGoiZoGORxbQ4s9B9qrH56C3bdfughQ=;
 b=wkhHMvocuydnNLPag5ghdPfWMIDv9TKQm6kmhbq6A6I5hpf9M7Y+TF7+Kwl8nT7InOrx2sIB0n3kEql9NS55p+jpjgS/pYzrRU+qNgsopLOWmnJK2FXk8NGwVfkKj+i1beedMJ2nk4i7pwOb2c4Q6x891ux2xi0aoRAlZqfY5boWyMVICoZ98sndEy4l0SWsJjl65r9w349hb9It/AmeN5payu1qSgOKVg3PfUwqKPRMDcbDofbgd461nYB3fErOk0oOM7X4S4AAcC2cWwj3GRRsZWHQnYWbazkQARJ0IPmbyphoRzDPY9Tel0OKgkTn6uAy+1zLsuTV7Q+VynZ8Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB8318.namprd11.prod.outlook.com (2603:10b6:806:373::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 29 May
 2025 15:03:59 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%7]) with mapi id 15.20.8769.022; Thu, 29 May 2025
 15:03:59 +0000
Date: Thu, 29 May 2025 11:03:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v11 6/6] drm/xe/hwmon: Expose power sysfs entries based
 on firmware support
Message-ID: <aDh3W58dudaAmK_f@intel.com>
References: <20250529103430.2348053-1-karthik.poosa@intel.com>
 <20250529103430.2348053-7-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250529103430.2348053-7-karthik.poosa@intel.com>
X-ClientProxiedBy: BYAPR21CA0022.namprd21.prod.outlook.com
 (2603:10b6:a03:114::32) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: e7a6a4d6-8d69-43bf-ce98-08dd9ec20a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2As4LYka/rgV4X7RyX15b8+XdLtSDZriqSGkL3ymRP4L1Cp/qzRoWxyk7/Ok?=
 =?us-ascii?Q?zYn+uj4f6Gr8f1TBGm5Z3EJy1arMFZEunt3FhI3zTIAA/AcWI8SDjXvNgtNi?=
 =?us-ascii?Q?PhoI4BXLiFoiy/viAQxB8Dd53b6AW/PH+/+iRurQU/E7LyoPKzA/486FKsCW?=
 =?us-ascii?Q?WUQ9pyfm35B1V7ehMyFSJ/CmU+RiyK3k00EmpPImffGc74BHAeOTl/ds9+Co?=
 =?us-ascii?Q?ocKASiHAcTUoR/vSeXCoJtZ10hD6IVGY6M3TfQSgxQIq5rzDWNlF5NBse1sY?=
 =?us-ascii?Q?tr/e5S0mqxPVHFeuMoCAql/nRNTMk8t1AvoZP9aIXIBsUhVIY0FGMCMc6gg6?=
 =?us-ascii?Q?HghG93R/uo2N/5W8sIUw8byGcyy3pTlwd2vg6dBwomMLZWP8B8x36xrm8aTC?=
 =?us-ascii?Q?RfxSn7N1ePj+BHrYwCbQASY9HaetHP+F0sy3KVK25DTaB7Z7W7S6/HieKueA?=
 =?us-ascii?Q?09vwg5cwPCtwWuBA41DvNlU43zk2dz1ynifBJXIoG24I/nNtTP8K0c6UlCpF?=
 =?us-ascii?Q?cc5aCNlTUs/Da8ti6qE8vPCtmgHmnqVQKhv58FBpWxQItSRkv8QrA+VNlf8p?=
 =?us-ascii?Q?Qbs4QmR/dYSSKlHkiEi5Vb/75MWZeoq4G7gjbbt9uMfDemszGmUzIGcJoXGS?=
 =?us-ascii?Q?BkHYRhOCpwk0fVkl49HW22pOXuw4BRXI6yL3A/63S5CRpO95S9lFcy+cDi2I?=
 =?us-ascii?Q?MKlqRXJfmA5faB5T1I8nId2O+OMxcuqUDmaAmENfhEQQzNyflBZNg88JHAm+?=
 =?us-ascii?Q?M0uPR3w/EVTLPYolWxV2NwSgzTDVvoGNAwziwVCEBPRjApP2BYuLIh8SRr3M?=
 =?us-ascii?Q?lW5ibd99GNR0woScFNxLlb8GXJR4xcgtThEjEDv5SfmcWoUE/KIFElmVZLer?=
 =?us-ascii?Q?gYqIkXYKtUHorSiKJh4g3L4LkXQtHllUzS8lbNlhX/arzpoOf9OpMOQ/Yy0/?=
 =?us-ascii?Q?M6RKSWXIVdiF4GqeDAt2kWUlAKsaowAdQWcLcfCxl6TaeeB05sPKpkhU6quM?=
 =?us-ascii?Q?Odyoloj4+bq5XqGHOsOZJqzzVdWj030pJWq6XMC4hyQr9VR8SEV9BKeKG9WM?=
 =?us-ascii?Q?ur4c+UU1XAOaNbrhJBjYPrbcw9uKezQKGpNCOjf4gT4j9xWcavdzxA6JZpU7?=
 =?us-ascii?Q?+8+5c/45UFlraY/zt/QPHXS+C1e1dqvRLgkGTGGFZwmYihjqWSO0Ocp7CJbv?=
 =?us-ascii?Q?nvWWsAZ2UcECfL05yabNAjTycxBAs5Wfoy14v+Es9CGnuJmNWA2vZg+yxVEy?=
 =?us-ascii?Q?GfNf60iU9/F6ZwhnO85sVHh7DstZU01uOwXLwcpUHB9scUwGWF2QRFftkNpv?=
 =?us-ascii?Q?FNwiHF6u/pd/LNo01vhwEZG6OFvFucH/lDl2DSCYFmCPsAo24FxZL/v1P44Y?=
 =?us-ascii?Q?s4+YDpz6ZX3/AjfTSBlzP5XJnC95lY6yMKqp+B3OUm5wq7Ysl+bE0309/s/3?=
 =?us-ascii?Q?Om6J8ZVyKeQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TEfZyxhn8B9Qh81gfzNyGuT3vlQY7X9hkHDl+NY4XfRBY6yF21foiKHzSfyu?=
 =?us-ascii?Q?AD8dZnDM4bkC1WmhnDX3Z+1h25cgAb/pM9Nx+MltU+bfWRCDYPcMq4Ezv2Ef?=
 =?us-ascii?Q?49DXLWl7I0ppxzA4au2z4vesyoOLaunIYJGHdwcg2q7aWwxSnsut8rogj17R?=
 =?us-ascii?Q?PoZwqb9b/7mmxGU1klYXJog+hBfn818yS1wJw0yOKN8NUaSTEgxBnOQQIcgw?=
 =?us-ascii?Q?zi68ORYD7vhSAX17k6JdSCFCYJU3Bp1lKrna7GLnbv2kf4H1JmHef1J1RQfD?=
 =?us-ascii?Q?1gCDAjOdxZ1pfZtk8BNM30KMVktRAxoeGWjg/b4GASZCozhXpePgI+sIoLua?=
 =?us-ascii?Q?5Trlr55qd+a1A9AAymQJoGS9+x3daJWh2hyIBT7vUm068pjI3qTVZMGk5KVd?=
 =?us-ascii?Q?mblAv0sTLwh6YuXKkhEW7NZhPI07FOiymO7LbCBUdRye4J9fGYzWcdjRN2NU?=
 =?us-ascii?Q?5H81G8o4nuT/ikgPvtVCmOgmO/Wc+KP750L5b2e12CTQEjXLsW0BG5lDIsV+?=
 =?us-ascii?Q?qjhut3+ZtoKrQGOzlYAxufl5o5HMIC6ylHI9sIZGHorQk8eUDad7Tebko1fk?=
 =?us-ascii?Q?W5eneoLgWd6RXMdWQbqo7aQtQ4y9lGc/AGgsMvyvA/Ixj0gMqjITQPrptfhm?=
 =?us-ascii?Q?yB8V34I//bTw6FaXSfhIfH420ehBpW4vVvhWGE+sB6F+xs7W8rxXTddjCWXO?=
 =?us-ascii?Q?47/l7kzzLGq6TXZC8ZWtlDSwmu5vIw+RXTR2NQlkc1hmwbyZ7YOtDFYmlVtR?=
 =?us-ascii?Q?vuA/Hrp5K4M67pNhonbj9x5PJS0JB/AJWY21sG8vDiop9yD6OQQWJcY34FyG?=
 =?us-ascii?Q?+UBvKVGbeFiZACD7Hk3lXb77IQ97dHOhF95z/oC9tfEAhmdvz9haCEzoDCbT?=
 =?us-ascii?Q?c6AoAJ4VfPOVcF5ukQfIINz5drDjaQxeibyXje91RQoPQB+gBsnat+QCzpeu?=
 =?us-ascii?Q?YBfIvZCaFDe2hX8r+6mTrdWydekCWhYdlYKtF8vi+LCviWcs04KVzKF8l93m?=
 =?us-ascii?Q?yqrnqVrFlnyF+q469/IdiOZ9Bx4X9Rf5szvBcoWdcljoOrGFjH4ATUt8iwRC?=
 =?us-ascii?Q?8hWVlCVz4t0o4B3tMiC/IxjuNZJRLpy+IZ4d86skose4TutuVq8SUSuCVvaH?=
 =?us-ascii?Q?q9mw18PAV9gqlfVz4QqjT1gRRmEPfyGq/UDB6vJQSOXEIWZF8uPhdtKEVDkf?=
 =?us-ascii?Q?CXPu/P9xkpnvvy+W5oYL+4QKt2GKvg4v239j1q0Wz07tSKZRt8DzvAOOp1P4?=
 =?us-ascii?Q?RdS36FKJDAyyhlHSbnQE7jPs/3DVqwxDRn6cLv0lfL8CJNxZANkkskB7AKn1?=
 =?us-ascii?Q?lZjKkAjcyab2otR/H5eLFJRi07hOniv+wfUD83mGap2xFn5DWe6XrrWAQG8S?=
 =?us-ascii?Q?haiabzUJFvTaNNj/P63FPgbkbZbiy3hyFzoZ1RP8fOiDdOSOpn8xX+tni+rb?=
 =?us-ascii?Q?N2TsB8Z4uPQt3wCKtNclf84mZQNB2HgIyxSkGy9ZOX68Y4FBn0lHT1q6iSr0?=
 =?us-ascii?Q?KXHoaliXom/CRvRk3/TFzEccBTQr/LWSeg60vyx66IGEYt7ahf+R1R9zE8C7?=
 =?us-ascii?Q?e46gFqPbyqwH4HQ7wDnWuoAx78OBLHB0b3nSRBRI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a6a4d6-8d69-43bf-ce98-08dd9ec20a58
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 15:03:59.2860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: covIHJ18CmmtkfUgoqzABa+meiGd7NGDOMOI1Fd32zF5MUi6sBtBSeds4Y49wnxE673m1Qkk1rI0vhct+N+e2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8318
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

On Thu, May 29, 2025 at 04:04:30PM +0530, Karthik Poosa wrote:
> Enable hwmon sysfs entries (power_xxx) only when GPU firmware
> supports it.
> Previously, these entries were created if the MMIO register
> was present. Now, we enable based on the data in the register.

First of all, please ignore my previous comment. I had missundertood your
changes on last version of the patch 3.

> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 65 +++++++++++++++++++++--------------
>  1 file changed, 40 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index c57c613471c3..25a89575a629 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -296,18 +296,12 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
>  	if (hwmon->xe->info.has_mbx_power_limits) {
>  		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, (u32 *)&reg_val);
>  	} else {
> -		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
> -		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
> -
>  		/*
> -		 * Valid check of REG_PKG_RAPL_LIMIT is already done in xe_hwmon_power_is_visible.
> +		 * Valid check of these registers is already done in xe_hwmon_power_is_visible.
>  		 * So not checking it again here.
>  		 */

With below block gone, we could even remove the entire comment section to keep
code cleaner here. We already know that all the checks are now in the visible.

with that cleaned up:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> -		if (!xe_reg_is_valid(pkg_power_sku)) {
> -			drm_warn(&xe->drm, "pkg_power_sku invalid\n");
> -			*value = 0;
> -			goto unlock;
> -		}
> +		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
> +		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
>  		reg_val = xe_mmio_read32(mmio, rapl_limit);
>  	}
>  
> @@ -652,17 +646,20 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>  	int ret = 0;
>  	int channel = (index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
>  	u32 power_attr = (index > 1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
> -	u32 uval;
> +	u32 uval = 0;
> +	struct xe_reg rapl_limit;
> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>  
>  	xe_pm_runtime_get(hwmon->xe);
>  
>  	if (hwmon->xe->info.has_mbx_power_limits) {
>  		xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &uval);
> -		ret = (uval & PWR_LIM_EN) ? attr->mode : 0;
>  	} else if (power_attr != PL2_HWMON_ATTR) {
> -		ret = xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
> -						       channel)) ? attr->mode : 0;
> +		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
> +		if (xe_reg_is_valid(rapl_limit))
> +			uval = xe_mmio_read32(mmio, rapl_limit);
>  	}
> +	ret = (uval & PWR_LIM_EN) ? attr->mode : 0;
>  
>  	xe_pm_runtime_put(hwmon->xe);
>  
> @@ -806,24 +803,20 @@ static umode_t
>  xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  {
>  	u32 uval = 0;
> -	struct xe_reg rapl_limit;
> +	struct xe_reg reg;
>  	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>  
>  	switch (attr) {
>  	case hwmon_power_max:
>  	case hwmon_power_cap:
> -	case hwmon_power_label:
>  		if (hwmon->xe->info.has_mbx_power_limits) {
>  			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
>  		} else if (attr != PL2_HWMON_ATTR) {
> -			rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
> -			if (xe_reg_is_valid(rapl_limit))
> -				uval = xe_mmio_read32(mmio, rapl_limit);
> +			reg = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
> +			if (xe_reg_is_valid(reg))
> +				uval = xe_mmio_read32(mmio, reg);
>  		}
>  		if (uval & PWR_LIM_EN) {
> -			if (attr == hwmon_power_label)
> -				return 0444;
> -
>  			drm_info(&hwmon->xe->drm, "%s is supported on channel %d\n",
>  				 PWR_ATTR_TO_STR(attr), channel);
>  			return 0664;
> @@ -832,17 +825,39 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  			PWR_ATTR_TO_STR(attr), channel);
>  		return 0;
>  	case hwmon_power_rated_max:
> -		if (hwmon->xe->info.has_mbx_power_limits)
> +		if (hwmon->xe->info.has_mbx_power_limits) {
>  			return 0;
> -		else
> -			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
> -					       channel)) ? 0444 : 0;
> +		} else {
> +			reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
> +			if (xe_reg_is_valid(reg))
> +				uval = xe_mmio_read32(mmio, reg);
> +			return uval ? 0444 : 0;
> +		}
>  	case hwmon_power_crit:
>  		if (channel == CHANNEL_CARD) {
>  			xe_hwmon_pcode_read_i1(hwmon, &uval);
>  			return (uval & POWER_SETUP_I1_WATTS) ? 0644 : 0;
>  		}
>  		break;
> +	case hwmon_power_label:
> +		if (hwmon->xe->info.has_mbx_power_limits) {
> +			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
> +		} else {
> +			reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
> +			if (xe_reg_is_valid(reg))
> +				uval = xe_mmio_read32(mmio, reg);
> +
> +			if (!uval) {
> +				reg = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
> +				if (xe_reg_is_valid(reg))
> +					uval = xe_mmio_read32(mmio, reg);
> +			}
> +		}
> +		if ((!(uval & PWR_LIM_EN)) && channel == CHANNEL_CARD) {
> +			xe_hwmon_pcode_read_i1(hwmon, &uval);
> +			return (uval & POWER_SETUP_I1_WATTS) ? 0444 : 0;
> +		}
> +		return (uval) ? 0444 : 0;
>  	default:
>  		return 0;
>  	}
> -- 
> 2.25.1
> 
