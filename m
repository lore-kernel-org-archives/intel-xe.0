Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2131DC54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 18:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7D710E515;
	Tue, 27 May 2025 18:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kaf2EI0t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EABA10E52B
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 18:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748372197; x=1779908197;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rgn7jgAuDtnfqkPYlfn7v28vw84E7Uy9gtlZpzTumUM=;
 b=kaf2EI0tDgmCpITGPtYsRZALPJxfyDw7DZblS24Kj5SXvzxVAWV7xiN8
 DFTSK+cNZCSCc1f12tqbcM2YS1JWk+3FEuK6AQ4GSdreX8Nfl4/MgIfkg
 eA6xUOLxsq3zHP2RTkPx29FC9nL016uXvC/xXNEEwqGJ3Eu4tqWHstZix
 /iui2/Pz1HLcIKoFni8/C68WxxCT/RQsAR7xB4uuGRonskbg5OFFUkK3J
 wJOkntW+WVhbwJTRySJo2hQ2SwsTNAKt6K5YHnETOe2Nv3THOujj582Ct
 9nsxguYeje2yWPr3S+sSugzBI8t9EsHaDFOgt2cVL0vKxme3YxAJATdjQ w==;
X-CSE-ConnectionGUID: Xy+GugJ0TwyOwrvVT69nBg==
X-CSE-MsgGUID: QIJfqeOlT1yAEXd+N1kk2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="38002381"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="38002381"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 11:56:37 -0700
X-CSE-ConnectionGUID: dSTL9syMTqufvRerMvJF0w==
X-CSE-MsgGUID: c9qxlZCVQCiFgTQF9kvDFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="143394565"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 11:56:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 11:56:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 11:56:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.40)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 11:56:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+2I3I414euxpXLwPMSEc7BRbJFW+Qz35TyC9aMD3R+69o4S1Ii0nlvmULO0V2SFDZ9BekcFhBq+7lwLxR54uPz83VF6G/3sUW3ko2Pj7Jx74I2SomtkxZBjZp0LdGn/JlD84GVABaRHY3fko4767omYnZWZed0HktI4nnYvPK8FJ4kRWZGdAeZ9/DjSryTODBgNoicHANvEITvbaEsCT55wDpQW051MZQ4it4tYZ23RiEIeALP/2q7C5mnMZr3jQQaSSdRTE2ztklPH7blaLPvWHoZ2I3lJmp62zrNA7Bnqj9T+F4Tu8KE8co01/OtcTJq1VTTrkfsj3EatVvkpMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82ZpM3EwMs0bOqR3TBW+BIt7u1h+cBAWYzZIzf7pxus=;
 b=IYT6QI4IG6VFCu1aCsTR1G2WuWP/yVGV4McpEWlVaZNp1SVoTOuklw7sD+uzxvni7w2nfNK9OCkCtoKz7HB6d5buzo+GmZMuB2ApHyE7T7eyxws5eKhjlw85ArjSR9XDwz+/y8c+T8JJFCtxvtkU3GXYpaGkxzURb9nR4AWDWU3jAQmMWfIaEkqbeWpRaIMiF9WC2URsmZHMjeUmeBgkLppqyWtR/Af2lOi1QbQcN9/hCs/anf3DzATalTgeAFeApSICcCGk0W/MF6tANuMTbiPQLXmFmaBa9xGccHWbIsXlLmavQMa7UPrpvqxEZ9wVvEjn/Cv8A93KD6Lr2UXGuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM6PR11MB4737.namprd11.prod.outlook.com (2603:10b6:5:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 18:55:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Tue, 27 May 2025
 18:55:50 +0000
Date: Tue, 27 May 2025 11:57:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Oak Zeng <oak.zeng@intel.com>
Subject: Re: [PATCH v2] drm/xe: Rework eviction rejection of bound external bos
Message-ID: <aDYLEuObNlqzG9qg@lstrano-desk.jf.intel.com>
References: <20250526161632.20694-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250526161632.20694-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM6PR11MB4737:EE_
X-MS-Office365-Filtering-Correlation-Id: b11fd34e-898b-4460-f1c1-08dd9d501989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?CZGDaWQlqh1VogyOTu+HDjgg8rssLGmhRxnZaeI3YtNjoiQpVaUiK1fZPv?=
 =?iso-8859-1?Q?Itp9diY/rLqZElviqvkprIwFiZmw3XfsD6Eq+YAJZPSkF/5PPOTK8SYdEZ?=
 =?iso-8859-1?Q?tlinXDwZY5eY2byTO+n16+8I5ChQ/M80LcHtoA8adZ9BlyAEnwVVokcewO?=
 =?iso-8859-1?Q?mf8Aetf0lBLOYHsKxNbjB12CmgQZYcciVSrbCypIrDnfshjqx12WN57lYC?=
 =?iso-8859-1?Q?slWQCrgtZB7vTtt36IqSIJTR+3+SzQrXuX06NuGnNC0S0XMYuezNbrqSFq?=
 =?iso-8859-1?Q?V1or6rJA2OtNFBwkMq1jIE0y2KD3uSB+qyacmqMdzzfavTSb+P/bQoxmql?=
 =?iso-8859-1?Q?94GZzmcO9/EjjJmjglZ3ssc2AybK8N2nkF4tT1yZHs1bU7TBwsPOyTjUs9?=
 =?iso-8859-1?Q?BoZY/dDxbPUrr8MUFDzDCocEA84Xyy2t/GAgCglQNdVYuJaDLZpAdrvmrA?=
 =?iso-8859-1?Q?JkjqUbbUNACN3T4hHOLlmk929R+8ygT1anqpRzRL6WhcY4TxgkHICvOpsD?=
 =?iso-8859-1?Q?SljEVK1bSjQ8QUQL6J4tvGPXtGSJ+3ZPDBYd4OJc/V0fASJQ7pK8L4/LLd?=
 =?iso-8859-1?Q?U/wreL72JIKcKzARmrOMzPAeVFxEC99uXalOGiQz702XxG4U7Xq8MfACkt?=
 =?iso-8859-1?Q?pBQoUbIYi/WJ254/KD3yV2/1gGI9hIHkMlcTZSgXuFX67QiK2QXH5y6jF/?=
 =?iso-8859-1?Q?Rv0IHzF4EIGqfoeNdMs6Fit97s8/feozq27Ey8r+rSi183OdPNS6bUwQdV?=
 =?iso-8859-1?Q?UZcqwdFqtNV2NOquqZLGXsorDSmUWTg5IRCGg86loEG1gVrJ/Hup3yghtJ?=
 =?iso-8859-1?Q?AxHtHGk5V5jkWHjUxRSCx6Ir8AoDx1mLx5F82fexkeucjPY0qydj8jXi/Y?=
 =?iso-8859-1?Q?W5o3exXlfHMPu2RA6Wz8yp6/vyvIXiWe+En4zgoBW9Pz6lPLVHLvHaoUa+?=
 =?iso-8859-1?Q?QRv/wUNZabv47rXvb1Qbahjb0tNboIjIZZA6LF7EDqK531yqUooLsYteJ6?=
 =?iso-8859-1?Q?D5HIIGXAVQw4g+Dle8Dji8Bw/cxDcKiENoVpq81rWhNtGhGJNWvWWW3sM3?=
 =?iso-8859-1?Q?9fQz1KeIBERjyYS8HAh4/EKtGWQ0XGRvkyfEbW0FUZvmvqaDoQqcXiIjWN?=
 =?iso-8859-1?Q?1R3w74qttWClsCRYCRRT421CDtbblU1sjnYlfq0MO17qH2KCj6ck3VS8wN?=
 =?iso-8859-1?Q?oCcvLfosdxB9tSmNrtdmKKLTcXnKSG98wc/jdmwxnjJ3b5mXlH6uHoFc5Q?=
 =?iso-8859-1?Q?sXfDgsJWS3Lvw6StsbGAv+5EM1gJdunXtQJRb/p70gNLMS2G88/C87uVwx?=
 =?iso-8859-1?Q?1kpFJIcDdnFD+LAwYxP46IfDX/djquj7L8WOL5zrI8T2g5oNXf515pUdEE?=
 =?iso-8859-1?Q?Ji4gcwqTWYw37mrNt4e6Xb93SdlQ2NMgiyicXHMfPg12HCXDcnT5l9VuYX?=
 =?iso-8859-1?Q?kzxFtWHJJeA9Pbof66eaSeOr3EgBWM+Q3qZNxA8ldlM6S4BIpJkk9g5Bu9?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?b1bnwL2HMAYx/HMG9lyboKGIlMAPNSTqzr9YQl/2FxTTeqabfV4oG/o+gN?=
 =?iso-8859-1?Q?G6pnJtIDWYZamj8r3gyVbumE5FmMNt3nO+V2tQQMJ/yQrKSNd8kq8sZDSd?=
 =?iso-8859-1?Q?piaALZh5c4sBx0KZg7HsaCz0A0lRm5jltAPrjVfqKeu2Jdu8qTrXZ4g2Hs?=
 =?iso-8859-1?Q?HG5fxvJIqLBRhHIjlxtp+6oxRYcWPNK6xckTe3pkYmjSHz2sEGb31BwgsN?=
 =?iso-8859-1?Q?ekXSzDZmg1u4VTtYBcC++zh/c9T7Bt4vHarXOm9svm86brxfi9FobWGLgS?=
 =?iso-8859-1?Q?UxJcGz6QlX02lEqhj2coeoGvjZGcvr8ofrTRwub+SIE5ANT/pwg4jv+Je0?=
 =?iso-8859-1?Q?lhVQu7Hwl3F297Y+/BerwdX6RS/yDO/sPNWjwQo9Kr7BG02WoY77kVnFZS?=
 =?iso-8859-1?Q?rCi/+dJ3no9DiuUW5SnxmZzhBB+j4c8izmJc1vNYu3CxrrCCmQml5t92Qm?=
 =?iso-8859-1?Q?23vOJ44MllHe/BQ4halzEmT5MVuFdbqS1iGOGs6thc/4KqgNK1IbpkTaOO?=
 =?iso-8859-1?Q?6mAmVTIJ1prwprHwc6DOmbXQh4DTHFyV87UZYd8+93QD9ryrBD8IOC4Le1?=
 =?iso-8859-1?Q?Rm1AMXTFkIh79kNfyIpaKlSWPVmvubDU5zQZKGWfyk5bQ0SUtpoF5kJqBL?=
 =?iso-8859-1?Q?KVs/8YbBJFMmLN96imt4Ks169e53J1Xwm/rAatGMOj6RKVjaclHkr9Au4X?=
 =?iso-8859-1?Q?D9njmmrG5VuQLhTGCCPRBSxHexoMJbh8j3pcObicYIC74l6FkwDQYIcGlv?=
 =?iso-8859-1?Q?yGrK6ZEEal2XGACxieK8L+08G9WYpIqc7e64xdskNo4N1PQGskUUh6dStO?=
 =?iso-8859-1?Q?LVvQO1Kbf5W46JdM+JCv32T5VTgWYkMI/yJKiIOs6/n4EJ1SED71DQZTrN?=
 =?iso-8859-1?Q?10QEyXvyfP2jB23dqecHpo+sWvN+ptUzuuL1tdxBXe2R2d+/4hBu02psLD?=
 =?iso-8859-1?Q?LenKwUudJjgwuBd5si4MQAJLmxEfgLs4XyfXA25WDO2F+e/m48sqUstI+y?=
 =?iso-8859-1?Q?ab+geYrE65X1v9JiYXTNKUYGEZHHgldLjEGUnGBvBgsooWh/lIYIRWEHCc?=
 =?iso-8859-1?Q?rt2RGIt5hQ80+/haLGWjwmq+K+tg9zB2/xDsnsgxzhVlg6+OcDI3/Th3zL?=
 =?iso-8859-1?Q?TIP1K16sP+90GagYd0Uml3oZgPeloZSCvVbER7AmCt5wAkdpMszISB5fIp?=
 =?iso-8859-1?Q?off2q4+3UQ5yliWvcN6PazdH88QFdiHNKT7iTrjZrykwINvy7JUSSYmlNB?=
 =?iso-8859-1?Q?aAqo4/0i6kvnoStVz1EqZJ/4+4JbaJ3qaUvvl7gbihaTA4aIK2FFqRCL0x?=
 =?iso-8859-1?Q?dX1FyHQ623VWTH6TF3dK9/nOqLKU7gIcNLhntJqSVBTxkCj6mAV+bt8F0/?=
 =?iso-8859-1?Q?th3nH85Kp1wWPKIk+xIu3bevDugrtUMJZNzh8CZZLUL3ZBPemBs0ocIx4g?=
 =?iso-8859-1?Q?0dctkbONu86euzrdGlSQDlNVfylG0p+tkwIxdQQgADCpWWel3N5rqjVKVG?=
 =?iso-8859-1?Q?wLUT0XcBv//3ImMwCB4ppt/WL35rkrwtDQ+TNjgPwhevpfrU+n3Bx8tEtj?=
 =?iso-8859-1?Q?vKNz3o2LjEXw2v0g+N+boFm3EWH5vCix+gOQ9hQiWRh9LUuztw+rXLgOGR?=
 =?iso-8859-1?Q?hfPjQdjoKDcPLdqFyBN/Cuyn6eA47+avMdWEgtMPpyupGDS+zyi21SjQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b11fd34e-898b-4460-f1c1-08dd9d501989
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 18:55:50.9241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2+L75ZCfJpUu6sEvt3CHVWIk92Zc5PvisOHNcgL+SQqJVmNPdWkh1Y9A0tzzojCOoscLT5VvHNcZk0XhZhdXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4737
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

On Mon, May 26, 2025 at 06:16:32PM +0200, Thomas Hellström wrote:
> For preempt_fence mode VM's we're rejecting eviction of
> shared bos during VM_BIND. However, since we do this in the
> move() callback, we're getting an eviction failure warning from
> TTM. The TTM callback intended for these things is
> eviction_valuable().
> 
> However, the latter doesn't pass in the struct ttm_operation_ctx
> needed to determine whether the caller needs this.
> 
> Instead, attach the needed information to the vm under the
> vm->resv, until we've been able to update TTM to provide the
> needed information. And add sufficient lockdep checks to prevent
> misuse and races.
> 
> v2:
> - Fix a copy-paste error in xe_vm_clear_validating()
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Fixes: 0af944f0e308 ("drm/xe: Reject BO eviction if BO is bound to current VM")
> Cc: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 46 +++++++++++++---------
>  drivers/gpu/drm/xe/xe_vm.h       | 65 ++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm_types.h |  8 ++++
>  3 files changed, 101 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index d99d91fe8aa9..3c48a8c5f439 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -841,21 +841,6 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		goto out;
>  	}
>  
> -	/* Reject BO eviction if BO is bound to current VM. */
> -	if (evict && ctx->resv) {
> -		struct drm_gpuvm_bo *vm_bo;
> -
> -		drm_gem_for_each_gpuvm_bo(vm_bo, &bo->ttm.base) {
> -			struct xe_vm *vm = gpuvm_to_vm(vm_bo->vm);
> -
> -			if (xe_vm_resv(vm) == ctx->resv &&
> -			    xe_vm_in_preempt_fence_mode(vm)) {
> -				ret = -EBUSY;
> -				goto out;
> -			}
> -		}
> -	}
> -
>  	/*
>  	 * Failed multi-hop where the old_mem is still marked as
>  	 * TTM_PL_FLAG_TEMPORARY, should just be a dummy move.
> @@ -1013,6 +998,25 @@ static long xe_bo_shrink_purge(struct ttm_operation_ctx *ctx,
>  	return lret;
>  }
>  
> +static bool
> +xe_bo_eviction_valuable(struct ttm_buffer_object *bo, const struct ttm_place *place)
> +{
> +	struct drm_gpuvm_bo *vm_bo;
> +
> +	if (!ttm_bo_eviction_valuable(bo, place))
> +		return false;
> +
> +	if (!xe_bo_is_xe_bo(bo))
> +		return true;
> +
> +	drm_gem_for_each_gpuvm_bo(vm_bo, &bo->base) {
> +		if (xe_vm_is_validating(gpuvm_to_vm(vm_bo->vm)))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>  /**
>   * xe_bo_shrink() - Try to shrink an xe bo.
>   * @ctx: The struct ttm_operation_ctx used for shrinking.
> @@ -1047,7 +1051,7 @@ long xe_bo_shrink(struct ttm_operation_ctx *ctx, struct ttm_buffer_object *bo,
>  	    (flags.purge && !xe_tt->purgeable))
>  		return -EBUSY;
>  
> -	if (!ttm_bo_eviction_valuable(bo, &place))
> +	if (!xe_bo_eviction_valuable(bo, &place))
>  		return -EBUSY;
>  
>  	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
> @@ -1588,7 +1592,7 @@ const struct ttm_device_funcs xe_ttm_funcs = {
>  	.io_mem_pfn = xe_ttm_io_mem_pfn,
>  	.access_memory = xe_ttm_access_memory,
>  	.release_notify = xe_ttm_bo_release_notify,
> -	.eviction_valuable = ttm_bo_eviction_valuable,
> +	.eviction_valuable = xe_bo_eviction_valuable,
>  	.delete_mem_notify = xe_ttm_bo_delete_mem_notify,
>  	.swap_notify = xe_ttm_bo_swap_notify,
>  };
> @@ -2431,6 +2435,8 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
>  		.no_wait_gpu = false,
>  		.gfp_retry_mayfail = true,
>  	};
> +	struct pin_cookie cookie;
> +	int ret;
>  
>  	if (vm) {
>  		lockdep_assert_held(&vm->lock);
> @@ -2440,8 +2446,12 @@ int xe_bo_validate(struct xe_bo *bo, struct xe_vm *vm, bool allow_res_evict)
>  		ctx.resv = xe_vm_resv(vm);
>  	}
>  
> +	cookie = xe_vm_set_validating(vm, allow_res_evict);
>  	trace_xe_bo_validate(bo);
> -	return ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
> +	ret = ttm_bo_validate(&bo->ttm, &bo->placement, &ctx);
> +	xe_vm_clear_validating(vm, allow_res_evict, cookie);
> +
> +	return ret;
>  }
>  
>  bool xe_bo_is_xe_bo(struct ttm_buffer_object *bo)
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 99e164852f63..fe05c4f7f425 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -303,6 +303,71 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
>  void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
>  void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
>  
> +/**
> + * xe_vm_set_validating() - Register this task as currently making bos resident
> + * @vm: Pointer to the vm or NULL.
> + *
> + * Register this task as currently making bos resident for the vm. Intended
> + * to avoid eviction by the same task of shared bos bound to the vm.
> + * Call with the vm's resv lock held.
> + *
> + * Return: A pin cookie that should be used for xe_vm_clear_validating().
> + */
> +static inline struct pin_cookie xe_vm_set_validating(struct xe_vm *vm,
> +						     bool allow_res_evict)
> +{
> +	struct pin_cookie cookie = {};
> +
> +	if (vm && !allow_res_evict) {
> +		xe_vm_assert_held(vm);
> +		cookie = lockdep_pin_lock(&xe_vm_resv(vm)->lock.base);

I'm little unclear on why the cookie is needed / what lockdep_pin_lock
does. I looked implementation for lockdep_pin_lock and it completely
undocumented - could you explain?

Everything else makes sense and LGTM.

Matt

> +		/* Pairs with READ_ONCE in xe_vm_is_validating() */
> +		WRITE_ONCE(vm->validating, current);
> +	}
> +
> +	return cookie;
> +}
> +
> +/**
> + * xe_vm_clear_validating() - Unregister this task as currently making bos resident
> + * @vm: Pointer to the vm or NULL
> + * @cookie: Cookie obtained from xe_vm_set_validating().
> + *
> + * Register this task as currently making bos resident for the vm. Intended
> + * to avoid eviction by the same task of shared bos bound to the vm.
> + * Call with the vm's resv lock held.
> + */
> +static inline void xe_vm_clear_validating(struct xe_vm *vm, bool allow_res_evict,
> +					  struct pin_cookie cookie)
> +{
> +	if (vm && !allow_res_evict) {
> +		lockdep_unpin_lock(&xe_vm_resv(vm)->lock.base, cookie);
> +		/* Pairs with READ_ONCE in xe_vm_is_validating() */
> +		WRITE_ONCE(vm->validating, NULL);
> +	}
> +}
> +
> +/**
> + * xe_vm_is_validating() - Whether bos bound to the vm are currently being made resident
> + * by the current task.
> + * @vm: Pointer to the vm.
> + *
> + * If this function returns %true, we should be in a vm resv locked region, since
> + * the current process is the same task that called xe_vm_set_validating().
> + * The function asserts that that's indeed the case.
> + *
> + * Return: %true if the task is currently making bos resident, %false otherwise.
> + */
> +static inline bool xe_vm_is_validating(struct xe_vm *vm)
> +{
> +	/* Pairs with WRITE_ONCE in xe_vm_is_validating() */
> +	if (READ_ONCE(vm->validating) == current) {
> +		xe_vm_assert_held(vm);
> +		return true;
> +	}
> +	return false;
> +}
> +
>  #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
>  void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma);
>  #else
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index bfc145baad49..0e1318a15c9e 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -310,6 +310,14 @@ struct xe_vm {
>  	 * protected by the vm resv.
>  	 */
>  	u64 tlb_flush_seqno;
> +	/**
> +	 * @validating: The task that is currently making bos resident for this vm.
> +	 * Protected by the VM's resv for writing. Opportunistic reading can be done
> +	 * using READ_ONCE. Note: This is a workaround for the
> +	 * TTM eviction_valuable() callback not being passed a struct
> +	 * ttm_operation_context(). Future work might want to address this.
> +	 */
> +	struct task_struct *validating;
>  	/** @batch_invalidate_tlb: Always invalidate TLB before batch start */
>  	bool batch_invalidate_tlb;
>  	/** @xef: XE file handle for tracking this VM's drm client */
> -- 
> 2.49.0
> 
