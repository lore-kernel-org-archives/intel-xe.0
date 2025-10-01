Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A8ECAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 07:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C7310E697;
	Wed,  1 Oct 2025 07:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhme3Cpc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F55A10E29F
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 07:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759303818; x=1790839818;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=558iBtWYWK2lljxeS/zKBEKp4RVv2pOVrnG/RgVeMm4=;
 b=lhme3Cpcri+mhHgBRLOdkn65WA2ZjREcPZUK7/3CmX+mb+6/MqFeEh8+
 x+bnDao1Jj9Y0SKRWFKimKvGyv9LJwUKFqZKXAEBiant4QufrPAa7ypWf
 2XtP/1v5wgfRUHhHIZfA0cpykSk/wK3XGduw1zlZToCYpo7LYRM4Oe4We
 tvLMORPWfQo9q0FzumF7lHgbVP8KFHW3fxo949mHaHZpLkSS3odlJ+gD4
 c1Hdd38rTcWm+ukOzsr80EdeJws4hosvwZqQIt58YEbcfRbsKlPlisM6O
 WXm2iua/aphyEPr90z8tNIFlDnwxEqr0gGoZKQEtuMor+CtfTg8dSn2+9 A==;
X-CSE-ConnectionGUID: sgQSpACjQj6hHNNTNIKDqQ==
X-CSE-MsgGUID: dQMZwfP0TCCG8o021SdiHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60784455"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="60784455"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 00:30:18 -0700
X-CSE-ConnectionGUID: s1xOuDoAT6GOhlvWtlCCaA==
X-CSE-MsgGUID: d0wuyl15RWqmjLvI+fNgNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="178523984"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 00:30:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 00:30:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 00:30:06 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 00:30:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovyZaUpucFhunwdmSXupnI0ISiJEPouNjWLp4RM0VJyud8knAgOr6RjyfwuHx5b/0G+QbuTsjL02PoEPS+X+blmJ/MT/sCXDmPZTlSbjI5gH5mqbum85gnS7PaT5yqFyqH5w1hFrUlvw3wu9TcIu4jOeEymi7UT54cNpVP3kyO2rMwwKPlnKbqALssL2Y3Enrg1Cb++EC53575oaYP1KWp+oGO/CgpYxdEu9m4evvOeW1Bz9YnvETGwgY8juGWnWcPJbiQBxzJ9BXROl4E6FWBbHmMQQ2oecbyBvsmdpl9uPWMGSJySc6PkpEmFSYoqyIi3RHcAgVaIX94fAjeZqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmFZXjddq1tuzlrCUyx5od+oNBaG6qinZN4PluZbIvM=;
 b=GaiynDl96BmfbPeaFc1Er31Lt7HEEPpdT8g6BwUyNQlJSgpBgQ+3iCeoc7LJKqqLewJbqeNEM42iPTyZUPfLZomN2YyKa2kmfdNBzK/pzxBr4nNwXRWFI8fyk7uqWQGRPrp5/fgolKwDxOp+xovcknQcmgRRGlC81F/1Fqd9rnzO7wH3Eha1A5rN1H7k8AcdDLd7qahabGpds79smTSHoH/l0lQ0g0jF/mkH3txGw/mywPDjkFZYp94JsHinqSi8/8CQojTOeVmRQVpSblocG8IMRkdBJJ3gpTlg6frPW0RE6w+SKYjmfkkHhCb6ZfnKzIzs7sAgzFG2aEt9Y5VSiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7267.namprd11.prod.outlook.com (2603:10b6:930:9a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 07:30:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 07:30:02 +0000
Date: Wed, 1 Oct 2025 00:30:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/6] drm/xe/pf: Expose VF control operations over debugfs
Message-ID: <aNzYeJpKdi8+6iIb@lstrano-desk.jf.intel.com>
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
 <20250930233525.201263-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250930233525.201263-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW2PR16CA0031.namprd16.prod.outlook.com (2603:10b6:907::44)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e21c60-d0c6-49e0-b223-08de00bc55b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a29hMDR1cnFBVUJVSUJGQmIzTTBCV3FrVHhseXQ3SlVCZldOWFh3Nmw1K1FY?=
 =?utf-8?B?OG1LMW1mNFRzMDFmeDEyWHVPVE5KekxWQk12YlJNRXFVcEhGc0RKZFdsZnVL?=
 =?utf-8?B?ckk4RlkvWXIrRXFXcEZqa0JnT0dsRnBpZlVHTGJ2bUlGWnFqKzZlS2dlMDJI?=
 =?utf-8?B?UmZDZFBwcVRkR090ejM4VGVuMnR4MEJUbCs5OTJhQXpJeVVYRjBqZGV0THZ5?=
 =?utf-8?B?OXBVVFZYRjNQTUZSZEFsWjVUMzJRYjAySXpIWGhCTHBVYm1WMGV2QVhGOGE0?=
 =?utf-8?B?cll0bnU4ajZRNW5QRXNIUDFRWjB3ZFVBa0d5WFYweG9FVTc4aGF1enZyd1h0?=
 =?utf-8?B?R0o3bWI5SjV1OXFwQm5yZHZTZUJDdkFuVlVzMTBDNERuV2xiZ1RnZVZaMEtZ?=
 =?utf-8?B?THladUNRRmNkZThBekJZMjdmN01haVdCLzZ3OWc2M2h1SHhYdjNwdmNHeVIw?=
 =?utf-8?B?Y2Jta2lyaGZVYWhEdkFpWXpPRkFvT1E0VGk0ZkRaZHhrc1JISUFWdVNvbUQ1?=
 =?utf-8?B?cWZBTG9LUWNETDN3MForOUY0djZNWE5EcTZrd1hFY3VIaGRxNFVqVGptRXN5?=
 =?utf-8?B?Y2tYeEo4OEExNzlOQlVZTXNPQzZmOEljTi9IWU5nM29qbmxrUUtBck9ISm5V?=
 =?utf-8?B?cEp2YkFuc25hMm1xYS9RK0JlZTlyS05GYVRFWTMwSDE1cDNUeVF1YUdkbCsv?=
 =?utf-8?B?eXdvNzNSNUVBemNPdFpkY1ZoQnBDQjhWblZvcmY4VC9hQUdXWmF0N3ZiREVD?=
 =?utf-8?B?WmsvelVXSk5hVmRvTnBaOVNLVDdQU1BMZWRqS0FqZ0piSmFJTlQ3ZW9WUG9K?=
 =?utf-8?B?ZHhELy81R1hQbnVkQXlDOVpaZXRBTGxDMERET2liNm1haUR5WCtkRGdSM2k3?=
 =?utf-8?B?cTdmNngwWlU0SEYyVTRLYk00NWFHS2xzL1ZDSjBiK3FIOVAyTFFKa01JUWRu?=
 =?utf-8?B?K0VUZnlDWEcyNmZRTzFmbWljK3FaYldkSUVBeUUwUElDNytEeWVST0NFOFp0?=
 =?utf-8?B?MGdMTXpEYkFhWVd6czljdEFVay8rTTVZZTVGTDV5K3ZIMWZZK1J4MmhIVnlu?=
 =?utf-8?B?VmRQU0hqZ3NaM0VaSmdWSlJ4UndkS3YyNXJ5cERMbXVJTE54Q2hwenlIcHUw?=
 =?utf-8?B?aHJqbzhDRlMrMTYxSEF3VXZ0VkcvQXp1N2FnL2ZBUTBoVy91WWVVSVRESmRj?=
 =?utf-8?B?YldYTHl6QWN4WDM4bStkV3VvOFpGRktmcDVlSWJhWlBjdFQ2bjA1eVY2Zy92?=
 =?utf-8?B?czdxR2EvejgxcFZHcG80Wk96cVRRQ1lLSllvYUZlSFdhOWV5dXE1c0ovVzh0?=
 =?utf-8?B?R2w1WnFkWWlMdjJRRjNxQ2xURVF4NXJYZHN6bEdsZm1IUHJaUW9KR0txWjNJ?=
 =?utf-8?B?NDRwSGVUK243STF3cG9GYkFwQ3FJcmp0d1ZCQzV3L2daSEVSOGlrZHUyM05T?=
 =?utf-8?B?SmlRM0xQaWZJY2FDYjFna0F4TWpObVRHdWFldTBGcSt5dWh6TFJURHo3YnV3?=
 =?utf-8?B?NHdmd2pMRzRCNUdOcVA0WFI0bkxSQ2g0d0QyMjZIM0hLT0Uya0lXaEVVUU5P?=
 =?utf-8?B?aGRmVnQ1d2lxK3dUdkh1RCt6aDMzSUNvTWJCekZ2aitiTEVJZUtaRFRqQXU4?=
 =?utf-8?B?RXE1djFaQU01R0JHeGdibENwVExZZm5ad1o3bmR4NlUrY2VBUmJlVzZKOUM3?=
 =?utf-8?B?N091R1diTXUrcUJlbXQyaUNVK2FCSVlXazk1c0VSbHlGb3B6amQ4aVJGNURR?=
 =?utf-8?B?YkRKRUg5V2c1K201ZDR0aEVsZUZYeHRrUENqSGFCMU9sM1JBL253N2U1cmlm?=
 =?utf-8?B?NjdZN0ZJaTFsQmdYajdsVzhkbU5iN0FaZGlIZ3k2YzVEMDhDT2xKbmtZOUpa?=
 =?utf-8?B?VWRlWXpwL1BwK2dST0svWHBDcXNTUjVkVjhxbTVuSTJjV3BaU2RVTDA1alUx?=
 =?utf-8?Q?1mkA1GM6CWp46CY7PKyko8nJPsJF0k5h?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3ZHa3gvMDZLUk5XQTd5VHhoczR2bGNMempqeVphRGg2QmVLdlp3Mi9EKzZX?=
 =?utf-8?B?Ni9MK1BWemRZZjJvZ3BRMmhqdk1EZWdKeHZPbzAreFJtNXNQZXpyd0ZpZ1cr?=
 =?utf-8?B?LzFTdlV6SytYaE12czJMT1Q0d1c1OHdWMjdpQmk3VDVLNjBtS1FIYzkxL0Ja?=
 =?utf-8?B?dmo5amNtRFY0c0ZyeFNYZHM5blNpd0VjQ1AreUFsNWxIZDhaVUVSVTI5dkRS?=
 =?utf-8?B?MVAwT05xaFI4WkxiUXIzKzhDOWhOUHZnN0ZTeVlITUpBRERWczQ4a1hUanlu?=
 =?utf-8?B?K3hzOWgxcFV5a3RMZXBmdEJHVXJpUEFKNERIa0ZRa3RUaTBOWGNFUENDVWNy?=
 =?utf-8?B?YXAvLzVSNzc3QzA4TTRmRXQ5VGVLM2ExTTRUUTlqOTZDTlpycWVCSDVsM1RC?=
 =?utf-8?B?QThtNitxL3ZKaUc3Y1drZTllWWxjSU9TemxCY2RkRW8zbEVseUlYblRlWTVm?=
 =?utf-8?B?ZFlUbmdoSzk3Q1E0SktxL09zTFdaaW55V1Bjayt0d29aUUxFa1c5UzBYdGVQ?=
 =?utf-8?B?Uy9BeFFjWk1jdmM0M0NIM1JvT1hHaUVaMEVHaGZucjhXZDZGMW02eHRvam56?=
 =?utf-8?B?dDNwdHg1VVIwTXFBT09rck1ZMUI3c0ZYWm55TTBTRzZ1b1dzOU5BK0Y1TlhY?=
 =?utf-8?B?bTRWNExYK1dZY3cxVHd1QXdnN3czcjViREhJaG55SHg5elJQczBWRGFNUjJI?=
 =?utf-8?B?YjEzTFdZSFpQTjA2d2dkdlFaRkVBOFliaDN0VlJsOWpRL3FYaWFmM1I5TGpU?=
 =?utf-8?B?dm15R0xTS2gzK3NFK0E3ZHF2OUlGOXMwUkpRNFBjRkVZRTQ4ZU41eXRPR2U3?=
 =?utf-8?B?aGVaSVZKKzlwOGhzRld1dSsrWmt3dFNKbzBmcUJUaVNrRGJaODcyU0lIT3FP?=
 =?utf-8?B?d2sxYitNUWFsOG5XdkpqaGYwc0M3T3VYbDlYTGNKM0hxb2t1Y2EveHNtbVk1?=
 =?utf-8?B?ZU9JVjZXSGt2alZGQWFGOWwvTS9aUkpObzE3eXpmNURNdVorLzFadFF3cFZM?=
 =?utf-8?B?MkxJNnRQWmVoenRQZmg4WGNUVjZyRFBzbzJ0ZHpSTG1taHo3cjU1TkIyZWhU?=
 =?utf-8?B?SzQ1QzBCb05uUm1jL1pDZ3pZVGFTRHBoczhVOUgxYnlNNUdvS3RCTnc3Nnhp?=
 =?utf-8?B?NUY2QklJLzhJM212RTBtM1FVek55eSthanJhV1djS1FPSUJyWjJkL3lFMVVk?=
 =?utf-8?B?QnVxdU8wQWpLMmtvcW1iVDdDMlhZd2pUSU1pRk0xNXVyQ0NMVmJIUDFIWmty?=
 =?utf-8?B?QTNvZzMyTTFZdnRCcU04b3FsMHJzSUhCQ2xjYVNWNWhaMm4xU1J6QmZEMzRi?=
 =?utf-8?B?aFFTMkU4RkpvNE5sNTNMR1VxMTk0MThHUFJaam92a2czUXIvWTJOMzJrNUJ3?=
 =?utf-8?B?WnF6UHJBaVhNa08zc0dWbGUwTVh1QmgxMDRSTGt3MmJkTmxRTVlpM0IvYXV0?=
 =?utf-8?B?TWJ3aExIb2x6QmZKZVdDenNVcU1SajdpcGlId3JteHFBQlhxZU5wZ2g3dUNm?=
 =?utf-8?B?NTdJV3RmWnZlMEFZRnhsQnVrdXFiVDFzVW9ZY055dVkvUCtJVlN2Z3poaUE3?=
 =?utf-8?B?OC9LZlFEVjc4VWJEMklYRWxCODlRb29sSTZ0ZUs0UE1mQVZ5RmR3Z2o3U1BC?=
 =?utf-8?B?cmlUZ2d6T2diR0RpUk8ydHhBT1NsYnJVZWU2T2d6U2lVWWl0N0xNMGlUa3Ur?=
 =?utf-8?B?QzExMzRwOUtXNHB1OTZTQkdQWC9IaE8xSXMzQ285TlBRbWwvQUhmc2VOTXZv?=
 =?utf-8?B?SE91UGhwTG9mNG5hMVFhM25wUlltTEYyaVRjdHVXeUh3TUxPQStSblY2SDJn?=
 =?utf-8?B?Z1lYN3pKNGhjam1YdnlLYkVuWTRvTkp1VXEzQjlYVWI5QmdRdjkvT2Z4YThk?=
 =?utf-8?B?V0Uxc01MNUdCMUxndjdBVnVWT056ckxkbVY4YmlrR25MZ2hYV3M1ZWUvWTNL?=
 =?utf-8?B?bjl3WmY2a09FbzhoSVB5bUF0eVV5cjdQTTR3dUNFUUozNzRZMkZpOGN2dWdE?=
 =?utf-8?B?RmQ1cUYyUURIeVNZci83dXVKWW1YY1NYOU9QMk96MWVNUUFYc1YxaU0vaDNW?=
 =?utf-8?B?TTNkNjhGYlBGUFdCTVlrZTYyM3BTTGFmNTZMRk50RGFDZFNqd0cwVHNWQVhL?=
 =?utf-8?B?WlhFYXQ5M3NNSm5NY05ienFxa1JPT0VGSlNBR2FpOCtEVy9leHdHSml4eG5m?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e21c60-d0c6-49e0-b223-08de00bc55b1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 07:30:02.6230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xxe2czEd9uIjZ7GV0hr8remTqLZp9TCtMkXpZVpiMbKdLAYTCJbxeoskfqBph7fCuXaW0nlI77PNiqOwMnHOxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7267
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

On Wed, Oct 01, 2025 at 01:35:21AM +0200, Michal Wajdeczko wrote:
> To allow the user to control the activity of individual VFs,
> expose basic VF control operations (pause, resume, stop, reset)
> over the debugfs as write-only files:
> 

What is the reasoning for adding these? Once we have VFIO driver will
these ever be used? Are there posted IGTs which use these?

Matt 

>   /sys/kernel/debug/dri/BDF/sriov/
>   ├── vf1
>   │   ├── pause
>   │   ├── reset
>   │   ├── resume
>   │   ├── stop
>   │   :
>   ├── vf2
>   :   :
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c | 93 ++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> index 2ab0b1f4818a..97636ed86fb8 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> @@ -8,13 +8,41 @@
>  
>  #include "xe_device.h"
>  #include "xe_device_types.h"
> +#include "xe_pm.h"
>  #include "xe_sriov_pf.h"
> +#include "xe_sriov_pf_control.h"
>  #include "xe_sriov_pf_debugfs.h"
>  #include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_service.h"
>  #include "xe_sriov_printk.h"
>  #include "xe_tile_sriov_pf_debugfs.h"
>  
> +/*
> + *      /sys/kernel/debug/dri/BDF/
> + *      ├── sriov		# d_inode->i_private = (xe_device*)
> + *      │   ├── pf		# d_inode->i_private = (xe_device*)
> + *      │   ├── vf1		# d_inode->i_private = VFID(1)
> + *      :   :
> + *      │   ├── vfN		# d_inode->i_private = VFID(N)
> + */
> +
> +static void *extract_priv(struct dentry *d)
> +{
> +	return d->d_inode->i_private;
> +}
> +
> +static struct xe_device *extract_xe(struct dentry *d)
> +{
> +	return extract_priv(d->d_parent);
> +}
> +
> +static unsigned int extract_vfid(struct dentry *d)
> +{
> +	void *p = extract_priv(d);
> +
> +	return p == extract_xe(d) ? PFID : (uintptr_t)p;
> +}
> +
>  static int simple_show(struct seq_file *m, void *data)
>  {
>  	struct drm_printer p = drm_seq_file_printer(m);
> @@ -39,6 +67,70 @@ static void pf_populate_pf(struct xe_device *xe, struct dentry *pfdent)
>  	drm_debugfs_create_files(debugfs_list, ARRAY_SIZE(debugfs_list), pfdent, minor);
>  }
>  
> +/*
> + *      /sys/kernel/debug/dri/BDF/
> + *      ├── sriov
> + *      │   ├── vf1
> + *      │   │   ├── pause
> + *      │   │   ├── reset
> + *      │   │   ├── resume
> + *      │   │   ├── stop
> + *      │   │   :
> + *      │   ├── vf2
> + *      │   │   ├── ...
> + */
> +
> +static ssize_t from_file_write_to_vf_call(struct file *file, const char __user *userbuf,
> +					  size_t count, loff_t *ppos,
> +					  int (*call)(struct xe_device *, unsigned int))
> +{
> +	struct dentry *dent = file_dentry(file)->d_parent;
> +	struct xe_device *xe = extract_xe(dent);
> +	unsigned int vfid = extract_vfid(dent);
> +	bool yes;
> +	int ret;
> +
> +	if (*ppos)
> +		return -EINVAL;
> +	ret = kstrtobool_from_user(userbuf, count, &yes);
> +	if (ret < 0)
> +		return ret;
> +	if (yes) {
> +		xe_pm_runtime_get(xe);
> +		ret = call(xe, vfid);
> +		xe_pm_runtime_put(xe);
> +	}
> +	if (ret < 0)
> +		return ret;
> +	return count;
> +}
> +
> +#define DEFINE_VF_CONTROL_ATTRIBUTE(OP)						\
> +static int OP##_show(struct seq_file *s, void *unused)				\
> +{										\
> +	return 0;								\
> +}										\
> +static ssize_t OP##_write(struct file *file, const char __user *userbuf,	\
> +			  size_t count, loff_t *ppos)				\
> +{										\
> +	return from_file_write_to_vf_call(file, userbuf, count, ppos,		\
> +					  xe_sriov_pf_control_##OP);		\
> +}										\
> +DEFINE_SHOW_STORE_ATTRIBUTE(OP)
> +
> +DEFINE_VF_CONTROL_ATTRIBUTE(pause_vf);
> +DEFINE_VF_CONTROL_ATTRIBUTE(resume_vf);
> +DEFINE_VF_CONTROL_ATTRIBUTE(stop_vf);
> +DEFINE_VF_CONTROL_ATTRIBUTE(reset_vf);
> +
> +static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
> +{
> +	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
> +	debugfs_create_file("resume", 0200, vfdent, xe, &resume_vf_fops);
> +	debugfs_create_file("stop", 0200, vfdent, xe, &stop_vf_fops);
> +	debugfs_create_file("reset", 0200, vfdent, xe, &reset_vf_fops);
> +}
> +
>  static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
>  {
>  	struct xe_tile *tile;
> @@ -103,6 +195,7 @@ void xe_sriov_pf_debugfs_register(struct xe_device *xe, struct dentry *root)
>  			return;
>  		vfdent->d_inode->i_private = (void *)(uintptr_t)VFID(n);
>  
> +		pf_populate_vf(xe, vfdent);
>  		pf_populate_with_tiles(xe, vfdent, VFID(n));
>  	}
>  }
> -- 
> 2.47.1
> 
