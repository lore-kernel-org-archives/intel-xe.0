Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02074E7FDCF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 19:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D8289FD4;
	Tue,  3 Feb 2026 19:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kf0+QmnA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C8389FD4
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Feb 2026 19:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770148369; x=1801684369;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JBWD5Z0IG+zZbRdFMn0Ge95n6kddOJJb8FfLuFpQMFQ=;
 b=kf0+QmnAGSUZ0kR4gLKNirnyVrU9hQHDfqTqagE2+EFmri49+H7eeiZx
 K6ScQlwNeeoKmYWOsgnMqbi1c+h47lJfPnbzt9DG2Y4j9vN0Dfd7DthOB
 5Cye2bhxYaUbStb7icyCj1Nbd8oAfjAx4eNmVnByitHa0b/CjuWoM4ghJ
 MRDSiAZ8EyfM+qUsOpxXBes0AGKDG89SWW5eoG3zKCcy6ZGNr3dIK1Mr7
 oGYg5fHVycb+MskshQyXqybUVkTpMXixxJALG3tD0+c5lM3v9NJ/Xd3+O
 +Yi/j/dtda66YkeR9ZTL84XRQ4q8L+qRamRw1lpSMvphy3IWjj2NJIoQJ A==;
X-CSE-ConnectionGUID: X2dkdzbMQvWHEZQ2T7ic4g==
X-CSE-MsgGUID: x6VglfZbRZuec9sViGhrxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="81643681"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="81643681"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 11:52:49 -0800
X-CSE-ConnectionGUID: qH+OoPGOTgGHy4JkUKgv/A==
X-CSE-MsgGUID: 6WKE14rpRHaTYULMroVI0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; d="scan'208";a="209620426"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 11:52:49 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 11:52:48 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 11:52:48 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 11:52:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rb2Pdc5WdVF8Y7aPhaoUvxB3KPr1Nq8GVpVCd1f2+J3fcL7ciewKkuoDVyugQBSgX3C+ZEjweC+9a5vRuncTfs/DXt78OLCUO1KeDKmzIcBeFdZ2dvpIsfdV+iH6FO5i2nJq8CKFdo6YnVi5M0hHhjHxNX61YKEmq3btADlQ3nmNkHWMQ6nvdLXkN8ceG4GvdWLWEOAz1hhCiXuYyW6M/wJeIQydxwtEc2K5uVcMTMQoSzGbgJcHtj8sSYKHTky+ob9HfWIfi7NU2sI5gfVzdR52JLdJCV7OOG+d2JG2Lm/dgmIdg/SvDukkBCJeNX+A9wKpSnEDrNj1FGxaPR76xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MXt52oXz0eftvdvJrDQ8fRbhGdNJzMKbHSJleBnJu6g=;
 b=ODY9s6aaN7ZBQQORdQH8W/B9Icihc9Rh8Ch6m5fltKfQfkRq6BWaXxaf2JHrPfrW0wEIpVxCQiafA8jAex7KCbaYfJtSkmxxtdkYtEVYYvLjFGZq6NEGCq1LEQrMroVIBqu2JFYFLzNO9KAihtUA5UAhsfdFw7VSlouJxS0fe3bZFuDX2QvaQ7g7UcJ37jxP7nWUC9qyOr0CAOb4OB3Q2aSI5k9L6vw/E9UWaIYbTbcqB7GHQfAn3ChvShv8ojM7m3gAwNGD7l8X/YPE7AaL6ZRHnbqFqnkDLJbMMeE+BAlJ67mjMB9CiRo5OclEscojdCyZnTm5dTsYvkCJ8Qv6IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB5184.namprd11.prod.outlook.com (2603:10b6:a03:2d5::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 19:52:44 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 19:52:44 +0000
Date: Tue, 3 Feb 2026 14:52:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe/configfs: Fix 'parameter name omitted' errors
Message-ID: <aYJSCAepz3ORravX@intel.com>
References: <20260203193745.576-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260203193745.576-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::16) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB5184:EE_
X-MS-Office365-Filtering-Correlation-Id: e435a2c4-efd6-48b1-899e-08de635dcc33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XwmQDBJnvhQU9VM6MozCI6ufQxOwtpBksH+NCN3m5q3plPhY46Hw4GFIs+70?=
 =?us-ascii?Q?lJteoSOG47otaP9TvMretoHsCCI5L+oAj7xJiE84iSEpd3riczTCntFl2S7n?=
 =?us-ascii?Q?Au1tcS3ln2ydLLF3Pnkmc3ZRUVsu+FYDmjOvWoyqqOBgu1ztGTX4fGEx/w02?=
 =?us-ascii?Q?dzhL3U0r72AAjLkNflVfokn5qB9Z2nJkwCtkiL6Xb2H/Xo+/AdzPwGPGfzkz?=
 =?us-ascii?Q?McTrY03qg35788EDvGqpRjcNRkiLXjdyAH+F08MGVAoHy7ZO4hxZxLzj9o/j?=
 =?us-ascii?Q?Qt72E5wBFAnL0qw8a7bl2FdFwIPxdYcm9NszqK/dlthn2OsmPcPkR8wXoyf1?=
 =?us-ascii?Q?tB9KOIIq4Iis5fCRY64pxg/MxZido7zCF5F/Tpc9l6BhUQYHwveGYgOik4cH?=
 =?us-ascii?Q?Uf1HSCdxchBVn6MigzE9gZn+ouCr4J9fQKwYdxiPAyUxL+N/EHZkOUf5VT8O?=
 =?us-ascii?Q?Vpeah4DsIn1uYysufIgbMmmq2+vetO/o8iaMQ4TRWQjFojwXvE+fdBJNcJJ9?=
 =?us-ascii?Q?bdknDqcF9+pbsNn3NAZvwGt9RjabYyR9nxU/GuDYUz0AT9Tn29R1fdXq5nOX?=
 =?us-ascii?Q?wwBDg3MSUd9b1HyzdbYxnnKFrwqr8DjGhFyNFDPC2QNFih8UUFIJ3Fzkbc2a?=
 =?us-ascii?Q?rQ+JUHAHFykPE1u1EStd7KAfxcMnK3BUB/sTqkTkJ0pdDZWAZ7AzlHPjZzTK?=
 =?us-ascii?Q?Vv6jabsrIPCZ67rmS6ErFFNDHYykTna05ZgpW3bF01dOMlHwefPLU/BU5/O0?=
 =?us-ascii?Q?nSVVzI079r9QfDdquFDKeYdi4O6+dS6fC/xf41raW0rHwwP6bWfPxIzfDrPm?=
 =?us-ascii?Q?W4M/TyWRv0b2okgUAq1yoVEv09IHPMKiV5laBpHM2Bi0Q+MbeooD49rl7BQE?=
 =?us-ascii?Q?KBhSe2kESPZ+/EUgUad+2aVMo3fTY3wt+T3dS7T7faIzIAX7mNQ44QQPIghA?=
 =?us-ascii?Q?4hfaS0dJyXYB/XYUIdmOouC3r6f3Dhzq9matG38tS4V0Bunhln2QgCaG38rb?=
 =?us-ascii?Q?MNG7+kDShrdVyYoRi7iChK0jR/AJEhy0yk+S1aPvlsyBC1TPjy6/4Qan/OaP?=
 =?us-ascii?Q?27HV5IvA9hxJ9bbrwqcM1YMtV2796nKjRcg5rC7g9x3ORKrq00QN79PsT131?=
 =?us-ascii?Q?GdRCnm3pAbQGSZBYIusIkvo+jCzkoxzyCKYb/byMfOmh8F2dnLRb4wi/oWe9?=
 =?us-ascii?Q?3YcvTZ1awg7zdXVNPnzaVTrOE9vvLwHpgB9t0XrxO+eSfBAxbkftfI9es9/0?=
 =?us-ascii?Q?NClK0zAcvaekr1ifeY2J/JZejnMxcaqogO+ySswBpFGzJsKv+HCaHLh1WhSE?=
 =?us-ascii?Q?QRzQ4doP628d5/nydpCGBi0QQHM8b9TWq79jDTBP4zeKUrHsF0t/tAjgPk+a?=
 =?us-ascii?Q?VFikgBN5XgQq0l6bFNAZn/bkC+dgnSSWSfWZ/0cjS1nY/jSQYudZ63L+kpxp?=
 =?us-ascii?Q?f4KN7WXaawWIylhzO8/zvxtOCsVIYz8GnCRh37W3cqHOy6wL8lINXNzMagKU?=
 =?us-ascii?Q?Z3WrqOrvIBVJkwFeMrzl6Tk7BTcT/zVeWQAL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nM7VJ2sjRRUouIfnPAltBR8SnRz6/DxiMR3E+P43xlEDRItwQ9R69fFPQcQQ?=
 =?us-ascii?Q?J6E4oXCbOn3aKP8bw+/rNClOp94ztHLHciAF8+TaB20t3Ti4ZzrZ8VlUPi9+?=
 =?us-ascii?Q?+lh34srScM6C9wDJ6FvTkVXTxZ9qdm/i9qZl2aeOioGvfRF5HpzBTtznjTbx?=
 =?us-ascii?Q?ejSOOPFybFZKnoE40hsW4qP5GVOel7b8/XVCfRkuHuAFXoRACu2OMP1UKXbI?=
 =?us-ascii?Q?r1Rc+lvEUO2A0OUgo4+x/rdKwzZ1UCTNsiI+xyHTVtRaEXkQRX3Pa2lAPfsu?=
 =?us-ascii?Q?tBAjfLPe5sI6TVkmsdjyNIub3QeIjzVNbv+XFKoWABO64bHLDz22QWLGove3?=
 =?us-ascii?Q?/aymFw2LtweW17ANWa6JagsM+ua3DP+DUeeIweWjdpI+5Am8zAdV7SCpeH3R?=
 =?us-ascii?Q?N/Ostel6w9ZJCPxfdl9G9RTieOpJjISsuC3DOOq38w1HyEl9jX55/VaChIWK?=
 =?us-ascii?Q?9jELffaVx52afXHVDbEz8cBWrVfWTW/U67gJgWwLLMyhEob3XNx2KOT/6yln?=
 =?us-ascii?Q?JgO5zQbG8frA/mmxwPcwf6Z3uf8wBTTmtLuqsHeukjpKHNQ+KlfPxkAbCRUj?=
 =?us-ascii?Q?SVL56tP13WuSXYrToFg8nIqOK+KKHwzuXDHWSWbAP2Oh69LUvUfnT1kmHIhW?=
 =?us-ascii?Q?FGDVj+1NVzDv2SmNieIgfMI/r38QQ3MdU9dUTHgUAyd+WYrugsw2bJ2O9lLZ?=
 =?us-ascii?Q?t3+6pSL3obzhKNpHeK+moPW5s35cXr+Mo7t2r4zPAnrUy8RW7AzvXcjiUKer?=
 =?us-ascii?Q?kSdGwu3+1FTuQN71SGJL4+K2GwAiXTlzfBN/vrezj6U8VuJj1+nO3Op+cO/8?=
 =?us-ascii?Q?rOO3//xJlt5iYHK1Io+qBxcjbCWRrS9ZmL5P9sDz9oxTvSwd+XWTXFaAbmCh?=
 =?us-ascii?Q?s/7DkdtC6A+Q02sBeFAh6rPAolg3MLj94RvUBqmyNLJGJ8mpF/I5eOKDxLk5?=
 =?us-ascii?Q?lihHoznuJY2QI/Wr11OCy1/IT0/BoaZBcooCYcD+PfLJyhIOuljIYmWn6Vra?=
 =?us-ascii?Q?/xfp0+FgNymhXUpqYhpgDOxItETfqVYXDhWXA9Jsjs2eo25CXgTr9MnDOB5e?=
 =?us-ascii?Q?YqowaQAi6f59GPoPTwpRb8Pl4CmvD285znoAxc0ggF62T3OINNWdD/iAOmpt?=
 =?us-ascii?Q?+UgNiydhby5V9FVNkgW2dCkRIE1Guv8yiDsPj0KsF0zOBgCuNqycfID5I9at?=
 =?us-ascii?Q?SEtIPU48Mf+n4OhR8gP3YVBJwlIDgaou+aBAR7APoPnN6wZC8oiMuowpcjJc?=
 =?us-ascii?Q?opcbl2vTKYKRSFHNOLJLKOaZyTfxA3VLmmv/e4QS6ZbcvDP40mRyH2q/RDSk?=
 =?us-ascii?Q?IVRPVXLuGWhsUEsQ1FFqKJOhcA22gscwmZL2Kvtd67g/f7wzzifYMaehvv/C?=
 =?us-ascii?Q?MHbcHsehJ6Y5aimY9uyGZDHnH7hIwnIeKsQ2a6QMw5o2evU+slY0nl2oWLwf?=
 =?us-ascii?Q?Vwc0sDL26eaViZv4qeOVT/Qbh9dbQdE7APaM+lL6H41vNI5oMkPK/4tZoN1L?=
 =?us-ascii?Q?3jVNQWEWjS9NcEJ+SJY4JICO4vEsqwvgk4e4/3Ev6IXZaLI/vJVWrQLEqVSI?=
 =?us-ascii?Q?onsin0uK4gUqAco5gP4UmD26CceNH0yYuvXP63rglxfgEr3qO7aVEX69KFcC?=
 =?us-ascii?Q?IIu3t1t9fSa7ZkiUpsSY04IQnUVkL0fXbbV/bQd2R4sYKJpXdTJ29oW0cMBQ?=
 =?us-ascii?Q?qDuqvOOEaNCuAdb22Qh1feIehSd8DER5wzyU9vsadfK3F3MXnynqCW+omtfa?=
 =?us-ascii?Q?KQHieXO6tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e435a2c4-efd6-48b1-899e-08de635dcc33
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 19:52:44.4381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XmLVrhlcDEwxAJoaZgrTlNwgr3sEnjWgpwkx8TCzKqBqzW7aSko7LxLvuH6y1vFfWIZdtiIMsM4LBvWWQCUdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5184
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

On Tue, Feb 03, 2026 at 08:37:45PM +0100, Michal Wajdeczko wrote:
> On some configs and old compilers we can get following build errors:
> 
>   ../drivers/gpu/drm/xe/xe_configfs.h: In function 'xe_configfs_get_ctx_restore_mid_bb':
>   ../drivers/gpu/drm/xe/xe_configfs.h:40:76: error: parameter name omitted
>    static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
>                                                                             ^~~~~~~~~~~~~~~~~~~~
>   ../drivers/gpu/drm/xe/xe_configfs.h: In function 'xe_configfs_get_ctx_restore_post_bb':
>   ../drivers/gpu/drm/xe/xe_configfs.h:42:77: error: parameter name omitted
>    static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
>                                                                              ^~~~~~~~~~~~~~~~~~~~
> when trying to define our configfs stub functions. Fix that.

only when trying to define the sutbs?
anyway,

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Fixes: 7a4756b2fd04 ("drm/xe/lrc: Allow to add user commands mid context switch")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> v1: https://patchwork.freedesktop.org/patch/696102/?series=159395&rev=1
> v2: align everything with the .c signatures (Rodrigo)
> ---
>  drivers/gpu/drm/xe/xe_configfs.h | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 487531269511..07d62bf0c152 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -23,9 +23,11 @@ bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev);
>  bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> -u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> +u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> +				       enum xe_engine_class class,
>  				       const u32 **cs);
> -u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> +u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> +					enum xe_engine_class class,
>  					const u32 **cs);
>  #ifdef CONFIG_PCI_IOV
>  unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev);
> @@ -40,9 +42,11 @@ static inline bool xe_configfs_primary_gt_allowed(struct pci_dev *pdev) { return
>  static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return true; }
>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> -static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> +static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> +						     enum xe_engine_class class,
>  						     const u32 **cs) { return 0; }
> -static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
> +static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev,
> +						      enum xe_engine_class class,
>  						      const u32 **cs) { return 0; }
>  #ifdef CONFIG_PCI_IOV
>  static inline unsigned int xe_configfs_get_max_vfs(struct pci_dev *pdev)
> -- 
> 2.47.1
> 
