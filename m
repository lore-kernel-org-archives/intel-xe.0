Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A756C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 17:21:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D601610E025;
	Thu, 13 Aug 2026 17:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eCXR8OzE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E26610E025
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 17:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786641689; x=1818177689;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4W7eSHJCrZGNpODH/Dxem6E04J0pp2CbKI2glGqK58E=;
 b=eCXR8OzEEGdul7UwDX6VON/sGIU64DzFDWw713t+7ipjZ25o+Fx+YLIJ
 KszvO7RzxYrZkRPTFSTUXh5050d5rhEfywYM63DgDNxvnOvVcr7bdZy+h
 mBqaFdCDUyB7khenbONu6l3Zs9flotAYtYR3VLz0WZPAbn/pBKKLLAdy0
 C9Is3i2izi+SIph/P/cvUiEH7UJ8dH84iFwaf133iBbCTJQtzYHSscBMI
 wEjq2bznhrDieDlD60XnoIV3xvAxT1c6i/tr3z/aBARwCpT1EuAaaZDe7
 aBtSqsUSBE1cNSeCFMf/JuGVydlSy29cDtXgjyYiXCvxvP/ampsvSCe/D Q==;
X-CSE-ConnectionGUID: S+yBNbxMTiaLKK8KsS8aJQ==
X-CSE-MsgGUID: Nm+DmYGfR26aP/CgvN0Uzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87350227"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="87350227"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 10:21:18 -0700
X-CSE-ConnectionGUID: KwLaqZ8IQJmKTPNgWZ+Pog==
X-CSE-MsgGUID: hVq4ldmGSKC6wj2FxRkttg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="262678602"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 10:21:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 10:21:17 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 10:21:17 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 10:21:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKmeVV2zZ1CEbEzlf0Mi012/rRcIo6DLpjp11szcpdOVMs1jjdqEUjnAGVmXiv0T+ZbJdAxKuOeLIkQyPseGqAJRmfV8OADSHWBptz8Euj2NYF2U+kQKEvEGtCI6M02X8KBrFXvBG+3aso2UhWkeSCy8Y+Lcy13NVbNmFigtJtmfzVRTl3k9vUWoO7S+UsvvqasQ7hYG+Dxk+GCCs9n9LSVY2cFT+cKSPKkT6EWhUpRrsoo1DuQhG1lK6KyNRDXBcsO6s5wSWcR3S7Kof8XrNs1FYFMBKazJaB/LJSbCtcpBo3azT5mSuxZ7MHbdBwRUcWL9TfHS1sH4UeLz2V+PLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5/Ykq6urLVmG95GpNKjFhuZ+r0Tiwo9E6B2jPWEqjY=;
 b=ZSrwgz49Ryww7MZZOR4Va3hTFsZqqgwmHm44eyNn5SX1bX9RHBoF5TC2Je67cfSUpsg8gZGCgjR9GSzTVko0Xftsxob2GGoN2umJdSv6CYLAAJNRnlWOrRVQaFqLkZElfNvBgt4E9nwpfEb/cGCq4YTvLJ7u1Pk0Ox7Fo0O6FgdMWcUUwHZbONS9j/rAEEMXMutQzsLBfSCKf1Rr3E/IHlqnixOThG6t4T1f/m0lZKOyMhGJm6jfDAn0ByJtAkj5CQq6jsCM64lAiq5vRsz7V7dPhmxlGKynKtNdgYQq/gEB5IhQCO+FIB5JFr9+S2rEJHLnisMEUAhzAmdVRzTAvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by CH3PR11MB7389.namprd11.prod.outlook.com (2603:10b6:610:14d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 17:21:09 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 17:21:09 +0000
Date: Thu, 13 Aug 2026 13:21:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v4 32/32] drm/xe/pci: Report 'cannot re-enable' error
 using SIGID
Message-ID: <an39AapaGfiNZP-8@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-33-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260812191450.11690-33-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::15) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|CH3PR11MB7389:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df43f64-5d47-461d-e707-08def95f4406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|11063799006|56012099006|10067099003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: 4Jw4ANenGVKrI/1xQG1CYpkhGvfq2QKT8TvUE4yaTId/9NtIhzkLm3fB16lybEIDrgg8b9mb8z2IQkIJtlGPQaWyIoVjJP7x9cyCdH11Go3EblppdfGFSKypcE9QORgaN4evvs+BNWWmvnSzLLIh5owBwwNeNKW+dYhuf3+xjkeDK1UOTbhvOrEG/NlVb/LvXa9vHmpMwjwyAkjP33pZx/OX2qyYbIIXrtCYhrmeFkmSyu2BDflFATjk9P9g2fTGKVdhKtam6pKRuFuRm1s9Piet7tPl9L2iDkQmAw0MMqfFpSUovhBFfncmNsAXg6M8yF8HXEImSz6j66FKoR2FkvM95H/MRdK1wzf81fX56M7lTxaAocvuxpy9a48Z6WQO3Zuv4HBqv1a+leMXxHxZ6KyiOVzzmFanVMyEkm1cpdYEVIe71jY6jqNOX4b92xtvThnvPA/aRBu1SL2gyBnMdjdYQQnsKOXIPZiMubnICoyIJD/XM4rPY5+oYMdMpdz+7gxkSF3tAVWPXUHrKffwzF2eTz01FzkpkC6o1GOeTTM9s/7oAAdl/mypZg/179LYQvlcbTeRduuazz6npGuEufJRC3nP9mdQOp9QnLC3+YrNoLrtrdqt1uIOu58MoRWwGu+/jZipT5MjSNhK3zIclHNh63Dbz34b5Ce6uWAY1aE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b9+1uIU6sJub8kw2woF2nhVrVZd4s2SezqImOEoc8UbNIiEMTvUxzp24b1bi?=
 =?us-ascii?Q?ghdyxLUShHxSK7iPBEnzT9w9cq3avWYonm6iJBSBaMnbll4uWoPqR6H8Sopc?=
 =?us-ascii?Q?i8sTG8Q1z39R1lx/EfC64KVULSEIWGDNne+cOUwzRAssvdzIScsgYdBet2aq?=
 =?us-ascii?Q?O9+m3xHdMDTF+l0/bWuJT5VHiXZ0vT6j5U+/YP4hA9iaopOgi812ekLZRHpI?=
 =?us-ascii?Q?IXPNpxqeQ0wtuLRcTP0w2KwDufFhlASGeaEQOFYxReyKLZHmxevNQMEzdaP8?=
 =?us-ascii?Q?N8kFZX5SBW7DGmphFRWLnUUCj32a+OWtQgnIlchoT2SWZ/C9R92HM4TmVeni?=
 =?us-ascii?Q?LZzoHw9eIB0rCjNhxSss7cD/Fqk3tKIAYie5Bv0auVte4/VLhUa41ZvQS/hd?=
 =?us-ascii?Q?mfoevITQXzok+LtfSBIdI7BpYd75hYHzrF8YOjlCIAF9wexxj9ktiA49j8vb?=
 =?us-ascii?Q?QSVKCYRq3ACOLbuYH5QmgfDQLVn7IOxuE7B2eOF4BEOJEqP0qLwEe4Vo2wOZ?=
 =?us-ascii?Q?PbvSX41koNG+wcZGAgT+ce72Knz2yDx913gyQrbPwc+kFhsF45Pu5bYGx/OO?=
 =?us-ascii?Q?s+JYxiT+ocLQjE3s1YZC3mnFKHvm72gwYse44iN4XOWS6ihpMyPdFeuO8e6+?=
 =?us-ascii?Q?ZWyvYe2+opbsf52nPL7pX4H523vbYGhKQ+daQ19dX1bhCjrFbe8XHPzgd3dz?=
 =?us-ascii?Q?4Ui2i3b3/yH30/6aP33GuPUOdetO7iAGaHktx/r6CssJnDYlqaGJNAiNU41O?=
 =?us-ascii?Q?jUkTFvi660KgS7+Cu9yK2CPYb8DMizTjDyMpswQ3FcSDPQWcZULnSodep+Xf?=
 =?us-ascii?Q?ZfHGiDbWxrxBPGqpqxBQISBKy+njLM09ogTK8RVxISIG51KGpnYeN2hIjWRx?=
 =?us-ascii?Q?MUwHedkqm3j1z8BWg1PqBWcW8Gcdtf9jhzJ3YUOi3HJh6uFRyyztzrERtXFS?=
 =?us-ascii?Q?Ar8//1IHbk4dvezfw3uUUloIpfECI3XIlZT2gX9xD6BmxfTRWgTLehiALbHa?=
 =?us-ascii?Q?QYVId/Ou6p+DNplOM+DzIkFJ2zXOE+adwgPKKkln/CgVlHMwTqtPbHXM8pms?=
 =?us-ascii?Q?AjLjqPWbkcN/+E+aiQoC+OrCOqOTohD3jSSFZZ1qxHIAHw106WPj3ZxUEMrT?=
 =?us-ascii?Q?5hBNpUndlR/IC2ES8PeOP9HsyXNfGZkgq/gE8DhJTXpLa/6GXhAYHUX4wIqa?=
 =?us-ascii?Q?HYxevRo6TMMPHwMsxTBjBAYeGAWorGq1luHP2RKxQQIudTkvaO1r6fshnuIT?=
 =?us-ascii?Q?Swk4YQ9b6lZ6NP5n5I2Gu0ZkjnE4WphEEXYVkqyB1x4d7crTWf6bzGuOKSt4?=
 =?us-ascii?Q?nhs2RJhmLGeTjb8KELM6GgmylTl0uzDEiWvXY14ZM19saPdr694XBE+vSZTD?=
 =?us-ascii?Q?mFRGXYZewRaJpaOXmZTSyioApq8uDFhjlkgXg3iwtj1sIqRMdLgAnteNfrxA?=
 =?us-ascii?Q?gMLwP7B1GKRChd00X82ZQWdpD8eo/qMxTv7X8wZsQh2MOG3ioZIvCzkTsI5Z?=
 =?us-ascii?Q?a0nanXeao5qqq24biV7YSf+zxGUZWfSrYx2B+b0SVaaIFU8I3PQ+lE9JbWNF?=
 =?us-ascii?Q?hYa75IP2uiOoSzASxuttaOa2HNDvh1uygMa55Zol1VHYShlEABV3e9qlWnSu?=
 =?us-ascii?Q?eFqUuXambxrIjmqqZtyFj3gBplaq3YrgH5SSSbFmyYFf2NWOV2MP0j1jwIBX?=
 =?us-ascii?Q?UvElww74oCB7WGYrqjRG4MtQfy0q05sgBKOeafRKrzyp6AKpibyhDDNdd1AA?=
 =?us-ascii?Q?cLkdXEgqPQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: WY/sOxt5tfy81T4pcnnH37BbCzltjIN49xMWURBmlpxQLGovwzhtqQgs5upCzJYIPCoD9pcaKSj086J3AbmptU228a/MD3q2K8h+cMOxiHABz3iSs7zdtKTuzY8vp7HEjqrWQlYgZ/RcGVWNSI0bFcmNLQJdf8NOx5Pi4tSBou8iSMQr0SgZerCj9Bkg8CNg5G+1N+jdopl+VGSl6YiWq5Gi4GkAEIkKhK42bPW22w3RiDucY+BT3td/NhDJwM5NgNfrKnQw0hAojMyuE7IAH9O0xBZewcZjrsCBFk3ovXw6XIOGUKBpV3y7Lro4yEKZddNdX7gz//jnqopcS/CFJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df43f64-5d47-461d-e707-08def95f4406
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 17:21:09.3527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1wY9r9o8h/kPQjYds6vyU+dGOp4+CURMjI4hjcTlQzcslk2LGvOqZUfm0zMyzBJSQN5Znk0FXqbCj2jV2UiE3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7389
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

On Wed, Aug 12, 2026 at 09:14:48PM +0200, Michal Wajdeczko wrote:
> Report 'cannot re-enable PCI device' error using xe_log() helper.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci_error.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> index e41af2ac7f23..fb965f52be5e 100644
> --- a/drivers/gpu/drm/xe/xe_pci_error.c
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -7,6 +7,7 @@
>  
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_log.h"
>  #include "xe_pci.h"
>  #include "xe_pm.h"
>  #include "xe_printk.h"
> @@ -90,13 +91,15 @@ static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
>  {
>  	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
>  	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	int err;
>  
>  	xe_info(xe, "PCI error: slot reset\n");
>  
>  	pci_restore_state(pdev);
>  
> -	if (pci_enable_device(pdev)) {

this looks IO_BUS more than SW... But that is the change for the patch 3.

This patch here is great.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> -		xe_err(xe, "Cannot re-enable PCI device after reset\n");
> +	err = pci_enable_device(pdev);
> +	if (err) {
> +		xe_log_err_fatal(xe, PCI, err, "Cannot re-enable PCI device after reset\n");
>  		return PCI_ERS_RESULT_DISCONNECT;
>  	}
>  
> -- 
> 2.47.1
> 
