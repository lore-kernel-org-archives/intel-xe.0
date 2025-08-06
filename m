Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FD5C87FCB
	for <intel-xe@archiver.kernel.org>; Wed,  6 Aug 2025 23:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F25D10E1A3;
	Wed,  6 Aug 2025 23:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k+SH36ne";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBC710E1A3
 for <intel-xe@lists.freedesktop.org>; Wed,  6 Aug 2025 23:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754524470; x=1786060470;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Rg/nvr/FCZ3T8nuLgo68mn5lWnXsln6AjtV2KSnxBcE=;
 b=k+SH36ne8LULBPmsZLWeHypHZ1Z06uKZJpEnI12VitTJ2dph0xzUaW20
 izvE+wyZNA5YIRXUYrEqVBix0s0sPIs3djdQjVUEXMx/zn/Htegl5RhjI
 vNWYkGqbNGBrmlxL/DEETGTPIAFo0wfS3Ujz1itXUuNQTA0W/+f7ySbPN
 ajQMZa/hTrISXQrUKquJp2fzZFr0MBA9NS/tsCbwWqAtKHEEHsSpstrNJ
 D1Vx6TaB3ON3AU/CwCpiAIbLDmTxuoUgxMOWlftkeyktbfOj5CQ2ZV2yf
 mhNqCuFTpWpI/c/R0OvE+3qQ3O+sFOcXAtvcxnCbrAkbsGJ/N/T3LoD3J Q==;
X-CSE-ConnectionGUID: 1mRXd30ITj6JfcWamDfARA==
X-CSE-MsgGUID: BzbITyf5R3eBK9zf1yj4bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67119538"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="67119538"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 16:53:32 -0700
X-CSE-ConnectionGUID: hts9nO6bTUa9ONVveTRk0w==
X-CSE-MsgGUID: aAysYZftQ4icBkt5mexo4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208";a="164916042"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 16:53:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 16:53:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 16:53:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.40)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 6 Aug 2025 16:53:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZjnd/fkgC3p/SGSX+3wMfQ67BZdS9P3ikf5kc0kogrw/450JFxqQjOSN9Wm1cKmufJZ2nl/ol5DbWoBCnAwm+3t1DH76oy5IB0uHDdP5WDUPlmvfFEmqauL4e4tEj++isD4mIoUAGo0/Y6wHWPcrtgELAs+4CP7YF3TPTntGCJbhPlm6kOjiKg2EZLTqfJMsQm3crEi9baX0/h1tGAIJqb0OhksdgtwmTThiHjwKR53SGOu95hqPwJZKqsQtzFT5QxXd7WaRPvpSR2LyHuldu51MmmDIogWGlwQUZAJHkwYnGTqCxm8p6z1Dc2Js+RPWz4kYA+lNuD6vtpHuXWH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AQxoHW9G7jB0up94cIzCPSTYl2+M/OisVCWv5vhgxs=;
 b=Ddw+cOVdH2ab5/51lo51AA+IuKd1A58fhRPYsbI59TUIjv0tLYek33Q6mksMRuUiqgg/rVscdCe1SVtOVSOqBHWaqXGBnJoqIyTLYb0Ltxk9lipDQpXgMI3QnYt+eiOdTmOzdY9FEwQAfpM7QfIlNMRcI/N3b3JWse3kYZaXU2u0moke5yAYz8P4yYj+OMZTFY3ykOO0DPDN9M8cU7fpA1LX1cyQKgck+ipemJHARbg2UrFmuOnaLR+I0RhZdDg9fy5WwAbFwnYfyryDJul2ZnfLBXbUv0pR/f14CELToxJrwJT5HsUMB6wviL9clIu3XtJU5+T7jyA4sCBnM5WMxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6527.namprd11.prod.outlook.com (2603:10b6:8:8e::19) by
 DM4PR11MB6551.namprd11.prod.outlook.com (2603:10b6:8:b9::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.14; Wed, 6 Aug 2025 23:53:28 +0000
Received: from DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0]) by DM4PR11MB6527.namprd11.prod.outlook.com
 ([fe80::5a48:57be:974b:8ee0%4]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 23:53:28 +0000
Date: Wed, 6 Aug 2025 16:53:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Mrozek, Michal" <michal.mrozek@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Dugast, Francois"
 <francois.dugast@intel.com>
Subject: Re: [PATCH 01/11] drm/xe: Stub out new pagefault layer
Message-ID: <aJPq9KNMFVegkdkN@lstrano-desk.jf.intel.com>
References: <20250806062242.1090416-1-matthew.brost@intel.com>
 <20250806062242.1090416-2-matthew.brost@intel.com>
 <afdc621f35edb08a9c161e4e08bfa5c74eecad1f.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afdc621f35edb08a9c161e4e08bfa5c74eecad1f.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0273.namprd04.prod.outlook.com
 (2603:10b6:303:89::8) To DM4PR11MB6527.namprd11.prod.outlook.com
 (2603:10b6:8:8e::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6527:EE_|DM4PR11MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: 83584ac0-f552-4908-11be-08ddd5447023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2NtK2dzbXpleDFwN1pQMllUSUtIMExRN2s0UWFRaGtPd1VJSG96Wk5xNXc5?=
 =?utf-8?B?U2dDS0x3elBpNW9GSkpLci9qaXlmcmplNkY3dDJDcWcvdEJsM2hZMFNXSDQz?=
 =?utf-8?B?OW1ZZXVVZURhemtJdlY2TWdJZW5LR2RKQm5kYkhEcHVDNTdtbVloWnFpWExM?=
 =?utf-8?B?MTlSRytWeUpIWlpCd0RpajhVYTlmWCs0YmwzdUZGNDRuaXBVQk55NElxcDJl?=
 =?utf-8?B?TWpJMUt0WmRRMGUrZGpEZkNGQjRuSm5RZkRwczNHS2g5Vys1aXVOUzRXb0kw?=
 =?utf-8?B?T0t6c0ZId08rUjZTb1lmeWFwSURKR3Rac1d5VDdCMjdsUEdEaEFqTzdRQjF1?=
 =?utf-8?B?SlE2Y3lhVkFUaExrNEQ4cktZTDNlZkd2bXVKMkJYbFdaUDBBZHJTR3o2dmpV?=
 =?utf-8?B?ZTFNVUVGMmZDdFRnaTZTbFFVWkpUV25DY3hXLzRVdy82VTR1K3F1QTZCV055?=
 =?utf-8?B?bm9UTU9zK0lPN0NiVUxCZjM4cisyZ29VMXUzRHNZM1ZseTJ1dXlXN1Y0YVNi?=
 =?utf-8?B?emp6RHYwSlRySWwraEhkV2tEVm8yMk5yK3RMQUFoMUg4dUJzUlJmRm85eGhS?=
 =?utf-8?B?RTV5NFBmeGpNNW9vdHJOVXlVYVRpQXRMTUVnRlZpUlcvNEQ0RWtpb0JORTds?=
 =?utf-8?B?eUViODZqRHVlaENoN3BlQVE4eGlzOEx3WXFYdjdzRmh3V2ZGM3F1dk1vS2lt?=
 =?utf-8?B?UmpTcmNSNDQ0ZURSdGtWbTNRT2RPS1hlaTNDeDZ4djdwWFpLYURhOVczZ3dG?=
 =?utf-8?B?cWhPdmRndjlraFRyZE9FNFAzamswZ1d2L2laR2YxcjlHeHQ1d0hNTlY4d2tw?=
 =?utf-8?B?cHhBMVdQL0ZNN1RhTXZvZi9VWTlIOHhnb0d0Zi9zUkNGbTZxMzZINnI5a3VD?=
 =?utf-8?B?TFB5NDJVMlpwQjNOSHIzUy9BeGhjaWZPakNMbDZhSUdyakZDanZTb0c3Tkg2?=
 =?utf-8?B?eHJ0YkRmdTdxZmZGdS8xcm5HSm5QUmNoQ0ZYMjE5ZEtrV00zbGtkeFgxamsw?=
 =?utf-8?B?Z2JSN2FEc0ZzTC9xcURkREpDcjNWYldYK0haMkxXWWxCLzkydDMrclVzRnM5?=
 =?utf-8?B?OGxRM2NkU3lxZDZxQ3puekRnL3NCNFEwdlVnajJ0bjNYZHRpUE1NSGdFcjIz?=
 =?utf-8?B?UXRPcHFuYXpmNUgvMW92SWM5SGxCVGROcTY1YXNPUjhOTzlkOURpYmdPNzZa?=
 =?utf-8?B?K0RLNTlBdVNyUmRGQ05xbStwY3NRS3BaQnkzSFVvODBUUllFQllxejBxSUx1?=
 =?utf-8?B?ckpKUFFLUE9OT0taS3lGL3R2bk1QQlg5dXk0YlhLWmZ5VGJ1RnB4cEF0eHZo?=
 =?utf-8?B?c3F6TkloU0VDWVhqMnNBL3hiV0Y0TWJ6WkdXZVZCU1orbDk5bGpiUi9QTVZK?=
 =?utf-8?B?OXkzK0RzMmg1Wjc3SElXZGVGbDFkelBOdkdhY2VWbXNpdEFCYnJOcDlWcnFX?=
 =?utf-8?B?VGp3dm5aVzlweXRQMWZ6Q1BlTUxncUIzZDBBME5KdDVwMkdjYTNGS1dzZ1FW?=
 =?utf-8?B?eCtSYzFLejNXZjlTcW1vVTFPbDhsWTBiZFhUYlV0enJuVU1BYURLUGJaUmVl?=
 =?utf-8?B?UllDZUJ5Z0NnZ2NPL1h1ZHdvaDV2NDJpZkhrRlhTSDAxQnZtTVB3RWtkVmJP?=
 =?utf-8?B?WTNPWGN3UHgzZEZzSHlCemVXSTN5dW94VDd4bGEyUkFqVVpBNFJFei8zelF5?=
 =?utf-8?B?OXJxZkd1M3RBVXJvbjdKSjVtZ2tzcnAyeDdDZjNQT3RBVDR2aENxUXpZRWps?=
 =?utf-8?B?UWVVZmdSb29COE9HTmYwUkVNNTVZNWd3ZDdHbEtBSnh5RFVEcVN4MjZqUHZR?=
 =?utf-8?Q?gAZcbqBgU4g5XFuxwcjEQTbmQry/8VMQLLezI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6527.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWJ6amJXaFN3bUw2am1ZWEhGcFlWdVh6cmpwcXhldkw2VXpmR1A3eUFnWDlO?=
 =?utf-8?B?bmxaL2QzVUpUV3BHbEFNNlRXOVdKeWxzZDVVZC9JVnhncVlrb2w5T0lVMEpj?=
 =?utf-8?B?UDlRT0d2UlArT2FWcXJBY1pXWGs2ZEt2bWtrajVMRVMreXJ5TDRRcDgyeVYr?=
 =?utf-8?B?bCs0ZkVnVnZjMFJ5N3dOZmM0Z3hjV3U1UkNEemJuVWNyZWhyZ3dzVnBwL243?=
 =?utf-8?B?bmVIVzVRQzZiSXFNTkZEenF3VkhXckpkc1puTlgwVS96RmlZUnB2bUZucTNX?=
 =?utf-8?B?TlpMcVZZcUlDdFpaeko1Mkg2WE1XYU1KNlg3SFErdms1RWJaUnlxSmFMYUM5?=
 =?utf-8?B?RnltTGRKR1pvY3VYRlF3bE9BT2hqSGhpZFFVNFlIZ0U4MXNJN2hvUUhBcEYy?=
 =?utf-8?B?S0pNWUV1c0dVcEhiZFVoaUx4dXBpcWtBTGRwQVJEYWJ0U2d5aDJzU3JHTFZM?=
 =?utf-8?B?Z2J4QlQzVW5hUWJvbXBsY2hiUVIwZUE3RXpUaXpRckVBN0V5ME42MWdKT2t3?=
 =?utf-8?B?N3RDbHJBbmd4ZUY1cWx4aFZLRTA1K2F3VlI5ZVMzbHUrTnpCZGZ0V051R1ZI?=
 =?utf-8?B?SzgyNEV6YkR5NlBJUmdDT1IyakhXK2hjRWJHMDZsOEdPbEw1dnRJNklwVTRp?=
 =?utf-8?B?Y3YrQ05LTWcrWXlRZ2JNWmVGemNDNG9KdWZRSklrR05CTmlVR1psNnlXNXVr?=
 =?utf-8?B?eHVCTHZFb1hLTU9vK20yM2FWaEFESVdSbTNwdVNLZlJ6QVFwd3ZMTFQyQnlR?=
 =?utf-8?B?am0xOUFXYzNsL3NCbUZQS3pqcVROTFJ6clRvaFltQlhic1B5RktacUtyUXcz?=
 =?utf-8?B?ZytnM0kybGZVTzVHUTJUZnBnTzExMVRGdjZZTlhGN2Q3K3dvR3AvOUNoSTh5?=
 =?utf-8?B?a1NXT2kvUkpVeEg3bUJ3QzdrTnNzVXdOYXJwblcvT2lzQ0JKTllNQVE0S29v?=
 =?utf-8?B?R0FRKzVDQktkbXZOWHNQbDUrUkJ1L0IvTUhRLzMySFV4ZE56TU1rZ3ZIY09I?=
 =?utf-8?B?aWxhQmh1M2pjOFpwTGI3dExRR3pMSS9HYkxBZmI4OWc2b1dMVklmakRrR0JV?=
 =?utf-8?B?UE0wdGt4NmEzL3JNbjg1YkFhblYwSGZrY2NTV0F0azdpWjY4QlBkM1JhNm9p?=
 =?utf-8?B?L1RhdVRRODRiNzRSOXhjUUFWNjM0VnBTSjFCa3U4aUdZWWtSV0s3UzF0aVpj?=
 =?utf-8?B?VVVCZTF4dnJieUFhcEFNS0c1MVNRTEdITnIxU2tNd1RHWWdyWUFVZ0hOYkNh?=
 =?utf-8?B?cXFjd1ZnY1dOL3FSUHpvK2NWZy8yazByK2Y1b0JNZnF6dXFQdWZKd1BRUjVL?=
 =?utf-8?B?VGR3dlBEaDJHVmRYMlVsL3J3UXFEL0dGWXVTbGgyVXhvbFpIOXViWGJ4MFNy?=
 =?utf-8?B?TG5uWGpWQUIzSDhjOWpzUElVbGlka1ovTUZnUnRva25VYVNkR2lQQTl6KzFa?=
 =?utf-8?B?dkZWOG9BNjdpbDdDL0laeWMvRVdKc0RtZWtqaHlrOEZiSTg3eldwbWhlaXln?=
 =?utf-8?B?WGN0U1Aya2xvNVoya3dmVzIwS0xjbEpCVXNkL2FZTkx3SkIzdENML1lzNGd4?=
 =?utf-8?B?NUJtS0FJZnB6UENSSlhZV29uYmovSnI3NnBGNkZMWWNtdVlNV2dnanc4T255?=
 =?utf-8?B?QjlGWnF4c2RicWQ5RUNSRUNvVXFvaXpKcGJOQnJ2WVlLdTBtdWVrY3VaajR4?=
 =?utf-8?B?VWJEN2libTh1L3AveE5iSkNUTVF3WG5xRVY3U0xnbDNWUWdPelhPRktBUE5k?=
 =?utf-8?B?WWZ3VG1zOUFvYjRrNUovenZWbFk1VDNjaVN6aHlIU1RQTE1PeFJJS05QOVZm?=
 =?utf-8?B?bmJ0WElrb2NrRnVkVVpTMXJqZjVERGRlMTRSSjlqVVE2L21aVUZ5V3ROQWp4?=
 =?utf-8?B?Q210R2duOHY0VjFYc2JlQjFjZ1VNNlQ3TyszdzhYdzlzRERmVmR3bGR2Uk02?=
 =?utf-8?B?eU8zZWFUeG9xV01mRHRVcW5Od3A3NEZab3B1Mk8vU3grMlZ1QnA0cDRhT29Q?=
 =?utf-8?B?R2FHS2hIYUExRjYySHhKU2FjbkY0MUgxZWxCc3BpQmRWbE1yRDQxcG1FdTNK?=
 =?utf-8?B?M3E5ZWxpUXMzUTFTUlNWZVZGdmRkT1dxOGUxcnlPQm5jQlErb1kxbWxKTXlz?=
 =?utf-8?B?Tk9yWGo0Nk9vYnNxWmhvVWZmRkpudXhpVmdCT09hTkFrYU1qTC9SSkVZcHVk?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83584ac0-f552-4908-11be-08ddd5447023
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 23:53:27.9332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YIRFmyLamX4PkFDDEEfal1fJxbBl0THB3oUt7UfSf9cz8bSdw1phnG/Nf8x3oKnq4p4Pr8xFI/x5T674fOJ3FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6551
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

On Wed, Aug 06, 2025 at 05:01:12PM -0600, Summers, Stuart wrote:
> Few basic comments below to start. I personally would rather this be
> brought over from the existing fault handler rather than creating
> something entirely new and then clobbering the older stuff - just so
> the review of message format requests/replies is easier to review and
> where we're deviating from the existing external interfaces
> (HW/FW/GuC/etc). You already have this here though so not a huge deal.
> I think most of this was in the giant blob of patches that got merged
> with the initial driver, so I guess the counter argument is we can have
> easy to reference historical reviews now.
> 

Yes, page fault code is largely just a big blob from the original Xe
patch that wasn't the most well thought out code. We still have that
history in the tree, just git blame won't work, so you'd need to know
where to look if want that.

I don't think there is a great way to pull this over, unless patches 2-7
are squashed into a single patch + a couple of 'git mv' are used.

> On Tue, 2025-08-05 at 23:22 -0700, Matthew Brost wrote:
> > Stub out the new page fault layer and add kernel documentation. This
> > is
> > intended as a replacement for the GT page fault layer, enabling
> > multiple
> > producers to hook into a shared page fault consumer interface.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile             |   1 +
> >  drivers/gpu/drm/xe/xe_pagefault.c       |  63 ++++++++++++
> >  drivers/gpu/drm/xe/xe_pagefault.h       |  19 ++++
> >  drivers/gpu/drm/xe/xe_pagefault_types.h | 125
> > ++++++++++++++++++++++++
> >  4 files changed, 208 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile
> > b/drivers/gpu/drm/xe/Makefile
> > index 8e0c3412a757..6fbebafe79c9 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -93,6 +93,7 @@ xe-y += xe_bb.o \
> >         xe_nvm.o \
> >         xe_oa.o \
> >         xe_observation.o \
> > +       xe_pagefault.o \
> >         xe_pat.o \
> >         xe_pci.o \
> >         xe_pcode.o \
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c
> > b/drivers/gpu/drm/xe/xe_pagefault.c
> > new file mode 100644
> > index 000000000000..3ce0e8d74b9d
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -0,0 +1,63 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include "xe_pagefault.h"
> > +#include "xe_pagefault_types.h"
> > +
> > +/**
> > + * DOC: Xe page faults
> > + *
> > + * Xe page faults are handled in two layers. The producer layer
> > interacts with
> > + * hardware or firmware to receive and parse faults into struct
> > xe_pagefault,
> > + * then forwards them to the consumer. The consumer layer services
> > the faults
> > + * (e.g., memory migration, page table updates) and acknowledges the
> > result back
> > + * to the producer, which then forwards the results to the hardware
> > or firmware.
> > + * The consumer uses a page fault queue sized to absorb all
> > potential faults and
> > + * a multi-threaded worker to process them. Multiple producers are
> > supported,
> > + * with a single shared consumer.
> > + */
> > +
> > +/**
> > + * xe_pagefault_init() - Page fault init
> > + * @xe: xe device instance
> > + *
> > + * Initialize Xe page fault state. Must be done after reading fuses.
> > + *
> > + * Return: 0 on Success, errno on failure
> > + */
> > +int xe_pagefault_init(struct xe_device *xe)
> > +{
> > +       /* TODO - implement */
> > +       return 0;
> > +}
> > +
> > +/**
> > + * xe_pagefault_reset() - Page fault reset for a GT
> > + * @xe: xe device instance
> > + * @gt: GT being reset
> > + *
> > + * Reset the Xe page fault state for a GT; that is, squash any
> > pending faults on
> > + * the GT.
> > + */
> > +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
> > +{
> > +       /* TODO - implement */
> > +}
> > +
> > +/**
> > + * xe_pagefault_handler() - Page fault handler
> > + * @xe: xe device instance
> > + * @pf: Page fault
> > + *
> > + * Sink the page fault to a queue (i.e., a memory buffer) and queue
> > a worker to
> > + * service it. Safe to be called from IRQ or process context.
> > Reclaim safe.
> > + *
> > + * Return: 0 on success, errno on failure
> > + */
> > +int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault
> > *pf)
> > +{
> > +       /* TODO - implement */
> > +       return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.h
> > b/drivers/gpu/drm/xe/xe_pagefault.h
> > new file mode 100644
> > index 000000000000..bd0cdf9ed37f
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.h
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_PAGEFAULT_H_
> > +#define _XE_PAGEFAULT_H_
> > +
> > +struct xe_device;
> > +struct xe_gt;
> > +struct xe_pagefault;
> > +
> > +int xe_pagefault_init(struct xe_device *xe);
> > +
> > +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt);
> > +
> > +int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault
> > *pf);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h
> > b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > new file mode 100644
> > index 000000000000..fcff84f93dd8
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > @@ -0,0 +1,125 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_PAGEFAULT_TYPES_H_
> > +#define _XE_PAGEFAULT_TYPES_H_
> > +
> > +#include <linux/workqueue.h>
> > +
> > +struct xe_pagefault;
> > +struct xe_gt;
> 
> Nit: Maybe reverse these structs to be in alphabetical order
> 

Yes, that is the preferred style. Will fix.

> > +
> > +/** enum xe_pagefault_access_type - Xe page fault access type */
> > +enum xe_pagefault_access_type {
> > +       /** @XE_PAGEFAULT_ACCESS_TYPE_READ: Read access type */
> > +       XE_PAGEFAULT_ACCESS_TYPE_READ   = 0,
> > +       /** @XE_PAGEFAULT_ACCESS_TYPE_WRITE: Write access type */
> > +       XE_PAGEFAULT_ACCESS_TYPE_WRITE  = 1,
> > +       /** @XE_PAGEFAULT_ACCESS_TYPE_ATOMIC: Atomic access type */
> > +       XE_PAGEFAULT_ACCESS_TYPE_ATOMIC = 2,
> > +};
> > +
> > +/** enum xe_pagefault_type - Xe page fault type */
> > +enum xe_pagefault_type {
> > +       /** @XE_PAGEFAULT_TYPE_NOT_PRESENT: Not present */
> > +       XE_PAGEFAULT_TYPE_NOT_PRESENT           = 0,
> > +       /** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Write access
> > violation */
> > +       XE_PAGEFAULT_WRITE_ACCESS_VIOLATION     = 1,
> > +       /** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Atomic access
> > violation */
> 
> XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION ->
> XE_PAGEFAULT_ACCESS_TYPE_ATOMIC
> 

The intended prefix here is 'XE_PAGEFAULT_TYPE_' to normalize the naming
with 'enum xe_pagefault_type'.

> > +       XE_PAGEFAULT_ATOMIC_ACCESS_VIOLATION    = 2,
> > +};
> > +
> > +/** struct xe_pagefault_ops - Xe pagefault ops (producer) */
> > +struct xe_pagefault_ops {
> > +       /**
> > +        * @ack_fault: Ack fault
> > +        * @pf: Page fault
> > +        * @err: Error state of fault
> > +        *
> > +        * Page fault producer receives acknowledgment from the
> > consumer and
> > +        * sends the result to the HW/FW interface.
> > +        */
> > +       void (*ack_fault)(struct xe_pagefault *pf, int err);
> > +};
> > +
> > +/**
> > + * struct xe_pagefault - Xe page fault
> > + *
> > + * Generic page fault structure for communication between producer
> > and consumer.
> > + * Carefully sized to be 64 bytes.
> > + */
> > +struct xe_pagefault {
> > +       /**
> > +        * @gt: GT of fault
> > +        *
> > +        * XXX: We may want to decouple the GT from individual
> > faults, as it's
> > +        * unclear whether future platforms will always have a GT for
> > all page
> > +        * fault producers. Internally, the GT is used for stats,
> > identifying
> > +        * the appropriate VRAM region, and locating the migration
> > queue.
> > +        * Leaving this as-is for now, but we can revisit later to
> > see if we
> > +        * can convert it to use the Xe device pointer instead.
> > +        */
> 
> What if instead of assuming the GT stays static and we eventually
> remove if we have some new HW abstraction layer that isn't a GT but
> still uses the page fault, we instead push to have said theoretical
> abstraction layer overload the GT here like we're doing with primary
> and media today. Then we can keep the interface here simple and just
> leave this in there, or change in the future if that doesn't make sense
> without the suggestive comment?
>

I can remove this comment, as it adds some confusion. Hopefully, we
always have a GT. I was just speculating about future cases where we
might not have one. From a purely interface perspective, it would be
ideal to completely decouple the GT here.
 
> > +       struct xe_gt *gt;
> > +       /**
> > +        * @consumer: State for the software handling the fault.
> > Populated by
> > +        * the producer and may be modified by the consumer to
> > communicate
> > +        * information back to the producer upon fault
> > acknowledgment.
> > +        */
> > +       struct {
> > +               /** @consumer.page_addr: address of page fault */
> > +               u64 page_addr;
> > +               /** @consumer.asid: address space ID */
> > +               u32 asid;
> 
> Can we just call this an ID instead of a pasid or asid? I.e. the ID
> could be anything, not strictly process-bound.
> 

I think the idea here is that this serves as the ID for our reverse VM
lookup mechanism in the KMD. We call it ASID throughout the codebase
today, so we’re stuck with the name—though it may or may not have any
actual meaning in hardware, depending on the producer. For example, if
the producer receives a fault based on a queue ID, we’d look up the
queue and then pass in q->vm.asid.

We could even have the producer look up the VM directly, if preferred,
and just pass that over. However, that would require a few more bits
here and might introduce lifetime issues—for example, we’d have to
refcount the VM.

> > +               /** @consumer.access_type: access type */
> > +               u8 access_type;
> > +               /** @consumer.fault_type: fault type */
> > +               u8 fault_type;
> > +#define XE_PAGEFAULT_LEVEL_NACK                0xff    /* Producer
> > indicates nack fault */
> > +               /** @consumer.fault_level: fault level */
> > +               u8 fault_level;
> > +               /** @consumer.engine_class: engine class */
> > +               u8 engine_class;
> > +               /** consumer.reserved: reserved bits for future
> > expansion */
> > +               u64 reserved;
> 
> What about engine instance? Or is that going to overload reserved here?
> 

reserved could be used to include 'engine instance' if required, is
there for future expansion and also to have structure sized to 64 bytes.

I include fault_level, engine_class as I though both were used by [1]
but now that I looked again only fault level is used so I guess
engine_class can be pulled out too unless we want to keep for the only
place in which it is used (debug messages).

Matt

[1] https://patchwork.freedesktop.org/series/148727/

> Thanks,
> Stuart
> 
> > +       } consumer;
> > +       /**
> > +        * @producer: State for the producer (i.e., HW/FW interface).
> > Populated
> > +        * by the producer and should not be modified—or even
> > inspected—by the
> > +        * consumer, except for calling operations.
> > +        */
> > +       struct {
> > +               /** @producer.private: private pointer */
> > +               void *private;
> > +               /** @producer.ops: operations */
> > +               const struct xe_pagefault_ops *ops;
> > +#define XE_PAGEFAULT_PRODUCER_MSG_LEN_DW       4
> > +               /**
> > +                * producer.msg: page fault message, used by producer
> > in fault
> > +                * acknowledgement to formulate response to HW/FW
> > interface.
> > +                */
> > +               u32 msg[XE_PAGEFAULT_PRODUCER_MSG_LEN_DW];
> > +       } producer;
> > +};
> > +
> > +/** struct xe_pagefault_queue: Xe pagefault queue (consumer) */
> > +struct xe_pagefault_queue {
> > +       /**
> > +        * @data: Data in queue containing struct xe_pagefault,
> > protected by
> > +        * @lock
> > +        */
> > +       void *data;
> > +       /** @size: Size of queue in bytes */
> > +       u32 size;
> > +       /** @head: Head pointer in bytes, moved by producer,
> > protected by @lock */
> > +       u32 head;
> > +       /** @tail: Tail pointer in bytes, moved by consumer,
> > protected by @lock */
> > +       u32 tail;
> > +       /** @lock: protects page fault queue */
> > +       spinlock_t lock;
> > +       /** @worker: to process page faults */
> > +       struct work_struct worker;
> > +};
> > +
> > +#endif
> 
