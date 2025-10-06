Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A64CCA470
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 19:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B632B10E45C;
	Mon,  6 Oct 2025 19:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUKAwTyA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC1410E12D
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 19:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759780746; x=1791316746;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xPngdFguO3lWPWMS8KbaSoRxHxC5d8OD13TmI2Kv3Vo=;
 b=nUKAwTyA+t9MbVpPr/qzmd0ZHByNeXDm+TBM0OXavcq0OBzHU3of6Smi
 Qr6SwgEZCiNiEG0+x2Y5PmCYjkqdXs8pcz2ndORSoWzG+dBOWZ+3z15ex
 mb45C8j/G72VgJl6uRM6Oa8teOZ7v1wv7NuBMO0XhHyFmljxq5WRm53MX
 zl2YmcogmGanKfarytco6Q5bcvyu+oRldfwlAvjR1AB+P2eSjs7VrDcOg
 Vg/1DVg7pVpRmzzL11NCMGjCeYlswJ40elgdZkvxcGE2yalrtEMYQr38b
 CpTtC7FaSnJBNwhyInekJ4jj1GbWNsojUi/C/htGtHhGKHxOq+QPADWJ1 g==;
X-CSE-ConnectionGUID: 3HwV6nBGTXKM5zPMCI2PYw==
X-CSE-MsgGUID: NHxJ0g5STyWHFV2EvwcCLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="72636847"
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="72636847"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 12:58:55 -0700
X-CSE-ConnectionGUID: J+VMMW4IQtK3Bs+76t5LJw==
X-CSE-MsgGUID: oGh/13UYTnKUZXMo/Mkg+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="185132167"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 12:58:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 12:58:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 12:58:54 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 12:58:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIYddf5pTJLAvboT/hjhO04yPwltaoi0TvXjPFuw72Eauy9obZEFbnjEYc0pVugvwXkGDG27Eu6ioQKKC4YC15FefyNsvOZVFU7yWoM956zCxJtJ3OpLmUUSzTA0QRk+3VaACWlUPy2R5AzdIL2s/TruXCwE/tnfBTHg42mqcfe0+ra7XFyqVYMc117kRdkChTYFZmElhBcPDqq3Ov7Aml0Lx/xOJKzF8MKPYeqNNSnHHNuWSIUwzsd0OQSZF3R1GAkZ/CMmqigr+GhpFw9Fz43tg+2sNREhgCRhNac6jBABD7yQzTnfhQI4CZBGwMyVthCWiI4Mt7McZOCcqhQjig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KSV4D6cnTrSqOFzuyRCPDqyBqcME6GkSZUk6OSiiJQ=;
 b=lgTl9uMqwQUiDcCju/bP5UyDJwIS0+OxEpP2BPDiLUhGRhsKO+njG6mZRLubTMrR2Qcl9BOzY0sL/iD287Ghff33R/dTk9tWU+mbU+mpLDUGwBzVYMy3Lz03fwhGVOVAeQkULz3YrlnmqnFJbnH+OOeLyBAVx4q6TWGG3ojMQIjm6aUQBZaWON6DsAk01hiCKv56y8q9MInoV6/MlBsnasBhGLwh4gThvK6BfLX8vWtVWXEi3DH5qBXnjuPCayShSf2QgSMVU8BnmpliVFkEDuMfj+WEjeEmdxa5lZ3569UYSJ2NsdxzqApXwRLcpk8RZ7A+UTGnVpEKQFBjMZuYIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF75B6D7B42.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::835) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.17; Mon, 6 Oct
 2025 19:58:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 19:58:51 +0000
Date: Mon, 6 Oct 2025 12:58:49 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aOQfeQ5YYcOVmafh@lstrano-desk.jf.intel.com>
References: <20251006152443.12269-5-satyanarayana.k.v.p@intel.com>
 <20251006152443.12269-6-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251006152443.12269-6-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: BY5PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF75B6D7B42:EE_
X-MS-Office365-Filtering-Correlation-Id: a9d32d03-1a51-4989-c70c-08de0512c569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t0gr/rHHRKNJSnN+PedP3uyondmcEbJ9T3pyXkt5OxqjeUZLh0THZ9eYB9uH?=
 =?us-ascii?Q?Y5t48lzk410j4CWK417iE6VhdM8/ShqmTS6oxij/GyN5QEq5Ff4XYFCavlp/?=
 =?us-ascii?Q?Hy5cZeCWkodvQxUeDabtohqTGZVVpYWTwHp9fJ0CJ4HZOvVafR/vGuf9g2Sj?=
 =?us-ascii?Q?h3nvrSU5yHSFDIcl7rVizIDCHsfHMGuFy+7h8PkKaktEeZBxT+nQ8PBGKp0u?=
 =?us-ascii?Q?DFnoWEE5Hh0qdYEuVoZ+D0bbWaXTJU6QTVnbSfsORdsoWh/wK2HxtAuB8Bus?=
 =?us-ascii?Q?Tmlw2GFvcLmTCFD1wldJhzOxDiN2F1ULiDApqCb/BTNyHtYH58WWAhk4C4dg?=
 =?us-ascii?Q?Q525MfDLh+wbn44YMq7Rf+SZGnpdZNsL2Iu1GdcdgKUfT2G8oR1uccaCGvCq?=
 =?us-ascii?Q?3vN8XyBP4MVjZyHjVSEQdj4dpgU1K8OBXWD6ZFkfRbSqZ/8SIvsXHvSoIFRY?=
 =?us-ascii?Q?KZ5LuVUmsKHiYpVorqwiGxRJ+UMIpTfHJJwHRKaP0K1SB3cq35AZoKgXysTi?=
 =?us-ascii?Q?NOY64iAIxJTtQgFBIG4wSbe1sSQhu5UCKjqyvJU5qu8ZfPOrsKrlb94oxyGp?=
 =?us-ascii?Q?vBl8l8wZr4klNRuyi05qFwV77j/FFhmiLQSrdBLpqSRN9xRSsB1k37tbbQre?=
 =?us-ascii?Q?JyprkiLlco7CcXLy6fCahsvYDG4+HSyaeaaj65pFVqlcXbgz9hvMoIaI2ntI?=
 =?us-ascii?Q?sp0gdgo/L4azeHvd6oa6PgrNdptc63Av7Ji2BCJG/pYJ6bOdtNQ40tZwABhp?=
 =?us-ascii?Q?nF8BOD8NB/R6+hT1+iQzhLdKa+5LziHpNjkDPLu+ws27RdI3jHT4DBV0xm6p?=
 =?us-ascii?Q?IRPwbQPu48FWLF3NwilOQkcbidSCKZnoW4RoYXqxmqTLjsdbUkBSwnq/o/Jd?=
 =?us-ascii?Q?nudJsqseBY6V0ClqQ4MWLgz2Uy9RFF8pn+iWQRc5aoxlg1mb7xBXUTkx3QFO?=
 =?us-ascii?Q?HTqHDP6Ra6ZPW+szclRav9ghTmb+i/DU7ibhZ+WMwgmOKbAp7yOc2Yeu6LvR?=
 =?us-ascii?Q?2Fpfgl2pzlTbibOZvoEHXmSCQIlmh+bPuCE5ZPNLvYj/mvYHpzViZByS/P+m?=
 =?us-ascii?Q?/UlhcHmFOET6ArOMsFIlJkAHmOn8Y286emh378Rrgb45LF/J4FStuRWhF2e5?=
 =?us-ascii?Q?0mbjkFcggyNjZNdA3K9TA8wxMTxR98MmyFWf/YdIQDj13crjZFWsgIEMUE+9?=
 =?us-ascii?Q?4o5uzX0IA/+GwoIICCFdD/9OwBKAJOaQdjZRH6J/IIF05JnUHymPc2VL3L8r?=
 =?us-ascii?Q?XPYQ20SLipT45grC9Tz3SsfTCwZScVaWBHL5LAn4juzakYvvH8nlRgzQmK8t?=
 =?us-ascii?Q?Gtc6t920lw3lK2EqNcSIfNHrLOMholVwPP1083KmduVvFhawSfccOq0pENMI?=
 =?us-ascii?Q?beGgWkJC684PUVZxIJjKvl9h5LgynDEklSvHzfhwyByXqKGjPs9YNSPmf3ry?=
 =?us-ascii?Q?PtLLQNjSQnKSUI/bjvJtLbjPOJkQNRke?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9IABenHNJTgcC3ofp33cVQ1ygV/xpcZF++bK/xlHKruDJjEAScdvlpOKjQA2?=
 =?us-ascii?Q?HaSU/ml+E2TfmiYpkish+bYvkK5GZJVO/eQ11zo5X0SR92M1cQFuqGmJw+SN?=
 =?us-ascii?Q?hV8yTOR/HbNC/PToIK4sh2bP1ByAkXEqIB67/+VwXsa9Gr3QYaxAnVklxm3u?=
 =?us-ascii?Q?PLVX0WtI6hcSm02y6+RgyMoLCEG8xwzzeaTBu4MXNmwFUgz3I2nFNrtHW+ix?=
 =?us-ascii?Q?Mp4HIezqiSQ7H4FfhWU0fjNU4IKzcwh1lrISHRI+/niGRLdHn94IpbjYQg4R?=
 =?us-ascii?Q?7WcrM3O/MzeR3oySlmrWEmkgBkes6YH8MWjsHwkIaiFBoWSzJXJ91SBBNY1W?=
 =?us-ascii?Q?KkPucK2gDaSgXhpdfE3hGDU4Cvu7MtcC/Zj1Abd0kfQaiiYN/WMkGKV6K3dS?=
 =?us-ascii?Q?nbvYOrerFl8T+k0O4JFbFtumRlXGrL4jmuQu3PjJIc9542uKr07rSVvEp+Jw?=
 =?us-ascii?Q?o1BqKrE2stGp2OqQHsjZGBU97AgcwwPtek9yQZhjYIYoy1cU7Skqiz9FHf6R?=
 =?us-ascii?Q?VYxHA/OAUaGeWog/5QM5AuWVz/oAUWQ0hCCVxUvxxsRF7u6fPW8h36Ribq8r?=
 =?us-ascii?Q?X9HG1PCjCBSQlf6ucZlmIoEns5xgJib15ube7P+/TWBQHoUL8dU/RvRs6f5E?=
 =?us-ascii?Q?dAka6S1CHS4DjzwV+dzB6HUfX7GizvTBxFovZ+cFcgS8mddOeY193FArrizD?=
 =?us-ascii?Q?FPB/+7BeqF8zsRx20tGdLZdr0JBYW7MllAt99Gc3LPN6cDtnuAjFRpLSpaQH?=
 =?us-ascii?Q?lNyipf4uKgzy/fOIA9f74E9VmyPtKYnnzaha8aTSsxaWf4lx/63e4jaEJSkU?=
 =?us-ascii?Q?qMoxTuyEs5BthFzdmwFKENxxAr5C/ZjVAs4XhwYy96pcWXj6UGmUM9V6UIbB?=
 =?us-ascii?Q?4mQC0BPK6DWgM4Mu8wulH77KacyqbqiWaJMwRmg4+uAzQ3Z4BGtuGtI4EthJ?=
 =?us-ascii?Q?g+XH5X9OWskAVVNmC0TXHO7ME4+0pZHuufAjK+ojT0+mULbxLnhcpomc8fUC?=
 =?us-ascii?Q?kyh0ZtVzRm5wNzRf6P3dX+5/eK6qMXds05lbvO/LFX6MiDRLKKq1FX0bi9wD?=
 =?us-ascii?Q?ThKAox8Y+P6Th0BGorl/EK+IuyR7W99jPI8G9edzI2gGTHPcECp02ahsR+BN?=
 =?us-ascii?Q?kWCfV2KKw9LiYrY5QuaIZs1TjzpzWBKljHo/6r8yvKjtGJ1y3W5BrSR8BVEY?=
 =?us-ascii?Q?kByiR2IZWLgDu4BjbfvSiysC86tEZvdaaHyl0enzPxpvtsjMCNpTox+U/0Jr?=
 =?us-ascii?Q?dtUOR4yIubOlff6e6++u//t5V9v6HJIfBK46U5Nx1upDPgdhpuzk9bewPUli?=
 =?us-ascii?Q?q/CZRFyyVSKG0ncfE7xBrTVkumqqJBQ2HHZUz4rPphEOIh2WV02ALEFR7n5Y?=
 =?us-ascii?Q?XlqB9CVdUIOzeBLEwS/K5R33+07+x9HlXTLNaQxHY/ym9Wbd5jF1XuPPZhOP?=
 =?us-ascii?Q?pb2sJE6ItvVeISxSyjYIGvmOS2tlmUicx4Me8+kdmpVT4+rXE+btQZ+uZsEo?=
 =?us-ascii?Q?ZbE2ToeM+TSd9ZOs4+DiOooI7ZTMr7PdkOkWtPxLQ9++oUcqwL3oa7QwsZwE?=
 =?us-ascii?Q?X8Y5us0p9qZAv5EsKrERPk/6wsYstyETFilXC1Nbrf0qs9dQnIkM5hqLOG4K?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d32d03-1a51-4989-c70c-08de0512c569
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 19:58:51.4426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OK0hAzVJZOTxH2RFt27RlBweBrf0iNBt9TxuG1CbScVN7dTmDCcZXOdvjSQGViTpJrrnKgTdQdqEsl29gXeVEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF75B6D7B42
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

On Mon, Oct 06, 2025 at 08:54:45PM +0530, Satyanarayana K V P wrote:
> The CCS copy command is a 5-dword sequence. If the vCPU halts during
> save/restore while this sequence is being programmed, partial writes may
> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> instruction to write the sequence atomically.
> 
> Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> 8 dwords instead of 5 dwords.
> 
> Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> chunks.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> ---
> V3 -> V4:
> - Fixed review comments. (Wajdeczko)
> - Fix issues reported by patchworks.
> 
> V2 -> V3:
> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> - Updated emit_flush_invalidate() to use vmovdqu instruction.
> 
> V1 -> V2:
> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
>   (Auld, Matthew)
> - Fix issues reported by patchworks.
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 92 +++++++++++++++++++++++++--------
>  1 file changed, 71 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index c39c3b423d05..b960fdcecd88 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -5,7 +5,9 @@
>  
>  #include "xe_migrate.h"
>  
> +#include <asm/fpu/api.h>
>  #include <linux/bitfield.h>
> +#include <linux/cpufeature.h>
>  #include <linux/sizes.h>
>  
>  #include <drm/drm_managed.h>
> @@ -644,18 +646,50 @@ static void emit_pte(struct xe_migrate *m,
>  	}
>  }
>  
> -#define EMIT_COPY_CCS_DW 5
> +static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
> +{
> +	kernel_fpu_begin();
> +
> +#ifdef CONFIG_X86
> +	if (size == SZ_128) {
> +		asm("vmovdqu (%0), %%xmm0\n"
> +		    "vmovups %%xmm0,   (%1)\n"
> +		    :: "r" (src), "r" (dst) : "memory");
> +	} else if (size == SZ_256) {
> +		asm("vmovdqu (%0), %%ymm0\n"
> +		    "vmovups %%ymm0,   (%1)\n"
> +		    :: "r" (src), "r" (dst) : "memory");
> +	}
> +#endif
> +	kernel_fpu_end();

I think you can hide this entire function by #ifdef CONFIG_X86.

> +}
> +
> +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> +{
> +	u32 instr_size = size * BITS_PER_BYTE;
> +
> +	xe_assert(gt_to_xe(gt), !(instr_size != SZ_128 && instr_size != SZ_256));

I think it is slightly more clear to write it like this:

xe_assert(gt_to_xe(gt), instr_size == SZ_128 || instr_size == SZ_256);

I suspect Michal would insist on xe_gt_assert here too.

> +
> +	if (IS_SRIOV_VF(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX))

Should this be VF CCS initialized check rather than generic VF check?

> +		memcpy_vmovdqu(dst, src, instr_size);
> +	else
> +		memcpy(dst, src, size);
> +}
> +
> +#define EMIT_COPY_CCS_DW 8
>  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  			  u64 dst_ofs, bool dst_is_indirect,
>  			  u64 src_ofs, bool src_is_indirect,
>  			  u32 size)
>  {
> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
>  	u32 num_ccs_blks;
>  	u32 num_pages;
>  	u32 ccs_copy_size;
>  	u32 mocs;
> +	u32 i = 0;
>  
>  	if (GRAPHICS_VERx100(xe) >= 2000) {
>  		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> @@ -673,15 +707,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>  	}
>  
> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> -		ccs_copy_size;
> -	*cs++ = lower_32_bits(src_ofs);
> -	*cs++ = upper_32_bits(src_ofs) | mocs;
> -	*cs++ = lower_32_bits(dst_ofs);
> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> +		  ccs_copy_size;
> +	dw[i++] = lower_32_bits(src_ofs);
> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> +	dw[i++] = lower_32_bits(dst_ofs);
> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
>  
> +	/*
> +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> +	 * save/restore while this sequence is being issued, partial writes may trigger
> +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> +	 * write the sequence atomically.
> +	 */
> +	emit_atomic(gt, cs, dw, sizeof(u32) * EMIT_COPY_CCS_DW);

sizeof(dw) to check this consistent with below or change below to match
the logic here.

> +	cs += EMIT_COPY_CCS_DW;
>  	bb->len = cs - bb->cs;
>  }
>  
> @@ -993,18 +1035,26 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
>  	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
>  }
>  
> -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> +/*
> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> + * save/restore while this sequence is being issued, partial writes may
> + * trigger page faults when saving iGPU CCS metadata. Use
> + * emit_atomic() to write the sequence atomically.
> + */
> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, int i, u32 flags)

s/dw/cs ?

>  {
>  	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> +	u32 tmp_dw[SZ_4] = {MI_NOOP}, j = 0;

#define EMIT_FLUSH_INVALIDATE_DW 4 ?

s/tmp_dw/cs ?

> +
> +	tmp_dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +		      MI_FLUSH_IMM_DW | flags;
> +	tmp_dw[j++] = lower_32_bits(addr);
> +	tmp_dw[j++] = upper_32_bits(addr);
> +	tmp_dw[j++] = MI_NOOP;
>  
> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> -		  MI_FLUSH_IMM_DW | flags;
> -	dw[i++] = lower_32_bits(addr);
> -	dw[i++] = upper_32_bits(addr);
> -	dw[i++] = MI_NOOP;
> -	dw[i++] = MI_NOOP;
> +	emit_atomic(q->gt, &dw[i], tmp_dw, sizeof(tmp_dw));
>  
> -	return i;
> +	return i + j;
>  }
>  
>  /**
> @@ -1049,7 +1099,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	/* Calculate Batch buffer size */
>  	batch_size = 0;
>  	while (size) {
> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> +		batch_size += 8; /* Flush + ggtt addr + 1 NOP */
>  		u64 ccs_ofs, ccs_size;
>  		u32 ccs_pt;
>  
> @@ -1090,7 +1140,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	 * sizes here again before copy command is emitted.
>  	 */
>  	while (size) {
> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> +		batch_size += 8; /* Flush + ggtt addr + 1 NOP */

EMIT_FLUSH_INVALIDATE_DW * 2 ?

>  		u32 flush_flags = 0;
>  		u64 ccs_ofs, ccs_size;
>  		u32 ccs_pt;
> @@ -1113,11 +1163,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  
>  		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>  
> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>  		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>  						  src_L0_ofs, dst_is_pltt,
>  						  src_L0, ccs_ofs, true);
> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);

Side note: I don't think the second emit_flush_invalidate is actually
necessary here. Removing it is probably out of scope for this series,
but once this is merged and testing is stable, we can try removing it in
a follow-up and see what happens.

Matt

>  
>  		size -= src_L0;
>  	}
> -- 
> 2.51.0
> 
