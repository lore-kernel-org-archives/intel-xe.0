Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2541DC77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 20:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F8C10E074;
	Fri, 27 Jun 2025 20:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KJKh8Dbh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06AB10E074
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 20:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751055735; x=1782591735;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Y4yPrj8u4GAb84atjKKn/p9ERDD2KtVMlW0PcDf3wtI=;
 b=KJKh8DbhqnQDhzlJiBjpWg+M/yMFLVX2uArFv5h4O1ELHvkQv3wp2r6K
 Ff9U/8RzUOg3sbG8UaArua+Rg9EtxtcT/dKzw6Iky38PhPPOdx4aJaE99
 CjKZslWvNsyaGhrs7qOZ9AG9D2N+VSxoMr6pxE/WLofDNNQcE93/ANIkK
 YHCq65X/cVBcm7G3dWIDr2Is0OadMwkFTSpPcbZc1ssv0ur3QE+3Uk515
 iBaeFN/rDv/qMQJ8V4ZCnY3+WAwq7LZVV0lcBu0YTBxghJmHjf9ENpSM2
 tZ7+hMcv1ELc3nkC2Z+WXhQh1y8YzqhLMAFLFbgceKVRwRCrvTvduHFU7 w==;
X-CSE-ConnectionGUID: eoF7qo2ESUCEActwxiJj5w==
X-CSE-MsgGUID: ZvZ5kbBZQOqfm2Ax1TtYcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53502279"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="53502279"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 13:22:15 -0700
X-CSE-ConnectionGUID: 8dJpBxRvRvC3lU3jgpITtw==
X-CSE-MsgGUID: /kX22OjDR2aD40HLH21Dbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="152285295"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 13:22:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 13:22:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 13:22:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 13:22:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4TF9v6yM3bSAM5olcbWvN3o3DDo/zl6+Fn4Rv+WtO5k61hvvFJymGKva3jJIuMAyx8choKRhF/ShvTnAhsTWvMVeBOaNW/9zeISivjbKS5y+i0yUppmbxnVknwoMKrQXcLM5fT9gjeH2b7R8S8MUejcoMs096GzvUt71adCgtNDU3OH6EMiaC3gQUfadtBaJySNA8pkqXj/Hz78285kFdQwx+KZYXQ9iJblf5b0j+52OzpGlHvQnRiDD90ssj5D1Ole3D8vyN6b8mecGg7MMUa6Y2unFeBHGV6YCiI4ro+qKFjw0hd11xqFLel/JSDpD7H9oF1pUz8+U+QXI11c2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYcY7hgl++ab2Q3fguSYqJHDefHMeukHNoD/AJgnuos=;
 b=yQkbF5LXOiCQfSGgzZ7oXuh8wTDufibgZ0SLqRbQxiCcVoX7Kk1htiQxetxX6hLDcob37dGmtIA+r3luY2J9h3X23pXaLYD4DsoC3Q60pBCN9uwCKW39C7B1ccVym6efv2Z0l94o8qNkEmFeJusPKHgwZhNk3TTZszi6vChznnU3+/DwFlQVz6o3FHAuQnLM6Jn+0zGSKRbZtldfKw/XC2HJfXbGF9FNN2Ulbeow4IziVHb62bxZ1bx7mkQ/MhbcoONU/QZelKUWmMdQ+YPWRqMjfDkgHrLr1J02L2tK9WLF+s3n87i/vULiGI+iEk+WOSsiY8Z5h9Wq8oMMtix5EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CYYPR11MB8406.namprd11.prod.outlook.com (2603:10b6:930:ba::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.22; Fri, 27 Jun 2025 20:22:06 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 20:22:06 +0000
Date: Fri, 27 Jun 2025 22:22:02 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH v2] drm/xe/vf: Make multi-GT migration less error prone
Message-ID: <cp52a43gfi5dx5b7kemu2rkvvzfwmkmqslizdeqhddxdscuth6@aqmm6t642soi>
References: <20250624210957.2607454-1-tomasz.lis@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624210957.2607454-1-tomasz.lis@intel.com>
X-ClientProxiedBy: VI1PR09CA0134.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::18) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CYYPR11MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a95572a-ece7-4c61-bc09-08ddb5b84909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXdtTG1tSkhiS2YzcEVZcDNtdzgreDJoeHFtMVUra2pFREJQbEdZZmdYY2h1?=
 =?utf-8?B?L2pNSkZtd1hxS1hzeGN5a3pUNGZ4RERBbUNXVithalJCbnlpdTlOMzBWcGdi?=
 =?utf-8?B?TUVoeitlNTlHUlZlaDk5T04rV3E1Qk9TcWpuNGJZQStqMlFtejRHZ0kxUHdu?=
 =?utf-8?B?YkZCSmZzTFAzZGRLUUpBQzIrMkZ5Tk85R25OM0xWa2VvVWpOWGROYVRydlBK?=
 =?utf-8?B?OG93bUJON2tieGR4dThTeGpFZzA3M2h3NnJtYlRIdGpjSzA2UDBZN0hMOUp3?=
 =?utf-8?B?aXhTemkzc2w5VmdmbDlaVEFJSEh5S0U0djNyb20xQ0lpNDRDN0NYd0FJcC9E?=
 =?utf-8?B?c1JhUUNBVW5aU0cvMVdkVm96ejVpbDBMNXprRGVCeUtrTGhqMU1EL2d6UnNI?=
 =?utf-8?B?SGM3THErWnlXbFRac0lJT3N4dzlUN1AvUWlYbFdCSHd3ajROa2c2MUZpSDFz?=
 =?utf-8?B?L2NmUVFiVUwxbysvYzhXamdJSW9ESmFieEhyUTR6enZnV2VCWGhIakg5dVR0?=
 =?utf-8?B?SlRPMWNsRTNhUC9pcVJid1RUQmNtNHBSQm41cGFVMkFvQ1dYVGluUTRxaUhZ?=
 =?utf-8?B?NytpOU5aQzBLd0t0NHFuNUhOZEQvZ1dadkZXUCsyWmJVcFZ6anphRFZVM052?=
 =?utf-8?B?WmxJKy81aHh6MmNVeFNoNlJOVTJiN2FaWTFscG1uQnpzYWpiT1NJWjZxazdC?=
 =?utf-8?B?TFRTMjJaVmtsRkRHRnQ1K3pIdFZpa2wvNG02eUl2NlBNdUFKNUJERTk5ZzRQ?=
 =?utf-8?B?dWRZeWsrdk1VcU9WYXVreDNydld3Z1hCMFl5MjEyZkFhTDc5b0VqU2VneVZU?=
 =?utf-8?B?Q0k0VVUxQnBFdEUyTmFoOG5EUWlySzRRRFpnNmdZUDJSSGMzcUhKb0w2a2dE?=
 =?utf-8?B?YzBPMmNQdkpvRUZ1eUlEMUFCcUhxbnBRcWFyOStiWVNmQXp4K0Z2cW81Wng2?=
 =?utf-8?B?RlNleEo3eGpxVWhnUmhBelpKcXZPdUFiWE9ORVpLWXBHSnRMMEt3anBZSCtT?=
 =?utf-8?B?aC92OGxxUFZuQ1VsaFVFaTRiRURJamU0cEdWN1lqamIwR3E0YXBVeWpBaDZy?=
 =?utf-8?B?eUhuMzY1ZFdWcTU2UXFwMEp4elhYT0Nkd1FnbS84WHF6L1dIYzBXeE12c3Zi?=
 =?utf-8?B?TWIwbHZzUWpwekdvV3JqaTB4WkIrS2twUUwwRVBzbmVTeHVXbkpKMHYvQzgy?=
 =?utf-8?B?UU0wWXRuZkdpVk1zVlpoSGw5djRNVGJLWDRNaXlQVmFYNy9IZkZENGZnMEd5?=
 =?utf-8?B?Tit1YUNTMkp0UVE3RlhUUk92QlM1eUQweTg3cFhJZStuNW5aQVlCc2lLOU1y?=
 =?utf-8?B?bzlVckVZbDQwazhmQ2pva05scEpaNHBWMUtBSkJTMmJwM1hhK2JCWWhHc1By?=
 =?utf-8?B?WUNBY1U4NFZyWWdsNTBkSXhua2REZ29hbGVkYnR0K2NSdmpheC9OdWlLUXRY?=
 =?utf-8?B?MlowcHF0NWgwdDhjTERLZnVjSk5FNGVoQlc3dkdndzlKT3dONlc5NlRqZVlY?=
 =?utf-8?B?YjFZa25ncVNyNFBqbm9Wa1pvSEtlYnU0akg4VlJDcnBQdHQ5NlRXN0hUZFcr?=
 =?utf-8?B?UDJXN1ZBcU9RekRlN1ZzYlA4SWl6Q0ZrM0ZuU1MxQjVJOTUwMHVSZGJXQnRS?=
 =?utf-8?B?dFRQdnBTZHUyVG1nZFI3S1VCTUFTa1pYdisxNjkwbHRtb2FvendSR0FzajRJ?=
 =?utf-8?B?N1J3S0Y2TmxRanh5TWx2TkxoeVlRbzZDeUpYSlNqM2NBQUptTkJPc2dZQ3J2?=
 =?utf-8?B?dWs2T09qYUZjZXVKbGFIQWplS0Q4V0xyZjV0cHpYQTUxSGJ5a2dNVUVZTnR4?=
 =?utf-8?B?WUpNUnlBZkEwcTF2TTlGTXpPcDlHMHBlTVgxbHlkdlJxTHJyVkF4cTcvY0d5?=
 =?utf-8?B?eWh5SGtUUktWeUlkMDM1WlY3WElFOEVNZlZobzd5VUsxTU1hYkw1Vm1qanpN?=
 =?utf-8?Q?r70JMeG3XEs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0tuNnowdWRxZGhWcW9GdDR4a0o3Y3l4ckNQUEpETXFaSlR6Z01PVE1tMWdn?=
 =?utf-8?B?V0pseHlUaGU0YUY3dnk4ZDJwNTlBWkZFMy8yNkMxVlFaenl0d2dtWG1LZ3V2?=
 =?utf-8?B?bFBxR2xrSHhCUUt5VlYrT2NISjdTYXZoczNwa0REUmhORHFTV05VNHhYNTFK?=
 =?utf-8?B?T1BGWStkQk9lMmt3MU9ZWnFicDFnbm9JbUJXTkU2RDE3NzZrM2NadE9aN3d4?=
 =?utf-8?B?MW9XMXdlUjQ3UDhFaWF2dEh5a0FmMTNCZnNyRkdPc1RmWTIzU1hDSERsaGtk?=
 =?utf-8?B?Y3FoQnM0TzdsSll0S3ZTTTI1RkxRd3FUelNlUmphTkhmMWhQQm00K3NJN0R4?=
 =?utf-8?B?Z3pmZ29OOVYvQVQ0R3hYYm5FMnVxZjdrejMzS2QrR2JZSk5PSXpwMkVnZU4x?=
 =?utf-8?B?N0NJNk8yNWNKZnVydDJkRmpuNmpjNnZsZ3NOVzN6b3c2bDdxNVFJL2FOQ2w5?=
 =?utf-8?B?TksrSnpLVnF2ZEJZMUxyMSttdjB4eHNzYXFUamswbkxjM0orSlNkRUZrbjhk?=
 =?utf-8?B?RkdnTlpWUlR2R2pzRTlWSURLRVUwYVdEbHJ2eXNhanJ4OEsxaDdnbUZJT2NX?=
 =?utf-8?B?MUlJbEJjbGxScDA1YkY3Y3ZGODFGTk5JM0VDUExUd1ZyRFgzTFF6d3R3QVJr?=
 =?utf-8?B?ZThvRWg3ekZnQk1zakN4VlBhbDgvL1QzUXRMR2lMMFpXOWhhNGdyMmRxRVB3?=
 =?utf-8?B?NjVhRFdKdzU2UzVMS0tZa2psandoK1FqOE51QkZ2TnBzZW5XZThpMm1jOXZ0?=
 =?utf-8?B?UCszcUVxeXBuK0NmSGQxMThUclZCNkU1UHpqVDk2TFFEKzdmNHpxZ0hnQ3JY?=
 =?utf-8?B?TjR4ZEhwUlludjdEOU5McnRId2Q3TzNBdVdmWE12ZGR0cGhkaVVEb0p3UURV?=
 =?utf-8?B?bEsyOHNqdnFVamFtb3hGUmRuWmlGeVJCQmErRHBsbm53MTBwMWsyMVIvb0Z0?=
 =?utf-8?B?SkltT1FYU2ZOR2VQUXN1Si8vT0ovNGUvblQ1TWpjdDBPaXFNTzhCekRYLzlV?=
 =?utf-8?B?YXVZcmQ3ak1BQ3V4UFlFdmRhVzcxNENOTENueUYwZHJmUTVyRE9nSGdyS0Z3?=
 =?utf-8?B?d1prcFAybWhSandlZ2daT3ZrZmpWcHdkd3JpMU4xYzZ6U1lPanJEVG5VdFFP?=
 =?utf-8?B?bnV0Q09Wc0Evdy9LSzVtV0JPenhRVmxBRjl2MDZXUDllVnpGNmpBWlhYS0ln?=
 =?utf-8?B?ZmwwQmJOQzl4cGRMRU56OGJYS01IeVhTUDNFQzlsK2RTa01BSW5ZTzU4TDBI?=
 =?utf-8?B?bGpPSGVQWE52bnRBSW12SklhZkQ2YVF4QjJkckxwaGNITDE4SDhFbTFqZGF5?=
 =?utf-8?B?S2E1aC9CTGxhMjhRVnpiUkk2Q1NmTm04Tjk3ZzZCOXZHOGxiZzhmT0E2dU10?=
 =?utf-8?B?ZWw4T2dJQktxNWF1UjBPZEJrNjFDdmF2QmFDZkh6THJlOWgvcW9RTFJnNG5P?=
 =?utf-8?B?RTdnS1N6c0R1ZWtHd3JuRGZEbC9iYWNxVWtvMllBdFJmdWxaa3MvSTl1ME1y?=
 =?utf-8?B?VjBkSjNBMkc3SStXYkZQM0hqc3BZQnVPQmhnL0haeVlpLzA4eS9tbWkyRVFr?=
 =?utf-8?B?NlMvZDEwQjN5c1pVUFJaSXpaOEUyYmFwQUF6bXV6Z1Fwd0MxMWgrbW15UVJo?=
 =?utf-8?B?NXNueUs0aHlmZEhwci8yaHJrM0Fya0tOSkRwT0FYK051Q1E3UEE4Zm92TGE3?=
 =?utf-8?B?OEc2M3Q2d3JhU2hON2xsNHUwN1NXYzVGbklXUkI4cnNsak01RGJWVXVJdDRt?=
 =?utf-8?B?a3BudmErOFplY0pyMTNhd1dvNURmT2VjWDJpODlDRnhVSDlvaldZc1dFZnBQ?=
 =?utf-8?B?M2RDQXJ1MXBjNlloY3FLUW0wd3pWSjFYT0c4U3gxNWlqb0ZSUWVJSldrQVR0?=
 =?utf-8?B?MUh1blhZaVlpbU5pd2lseVNCM3dGK0JaNFVSaHpxbi85UkZFZkI3Q3VDT1Np?=
 =?utf-8?B?MVFqWFRHcFlTRmNUa01BTWpTbjZWamFUaTFicVlUcm11UmZFRzRpcmR0TVBx?=
 =?utf-8?B?TGRHdUQwYUYrMjJuaE8wVVk1ZDNBUlRUZ1hrQzgySUhKVko1RTdsa01URGFF?=
 =?utf-8?B?cTFZRWlyb3pOU0lXTXNoWUpZb0h0WkRyZzB2VXMwOVRsVCtzR0FPYnEyaHlE?=
 =?utf-8?B?V1YvM0JMU3pRNUlQbEU2SGR1ODVxVFdqcGk3bkt0SlJ6cWpTL3ZBOUoydnhY?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a95572a-ece7-4c61-bc09-08ddb5b84909
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 20:22:06.4141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOIemzgclyuW/poBPLGN8dph0XjdyyZdGYzaiy5WTCDozwNE7BUTydirlU+FWAmBUrQbQ39CsQf73erMMbOyKvcQELhZPJgwTW93Yn/W4m4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8406
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

On Tue, Jun 24, 2025 at 11:09:57PM +0200, Tomasz Lis wrote:
> There is a remote chance that after migration,  some GTs will not
> send the MIGRATED interrupt, or due to current VF KMD state the
> interrupt will not lead to marking the GT for recovery.
> 
> Requiring IRQs from all GTs before starting migration introduces
> the possibility that the process will get stalled due to one GuC.
> 
> One could argue it is also waste of time to wait for all IRQs,
> but we should get them all IRQs as soon as VGPU starts, so that's
> not really an implactful argument.
> 
> Still, not waiting for all GTs makes it easier to handle situations:
> * where one GuC IRQ is missing
> * where state before probe is unclean - getting MIGRATED IRQ as soon
>   as interrupts are enabled
> * where multiple migrations happen close to each other
> 
> To help with these cases, this patch alters the post-migration
> recovery so that recovery task is started as soon as one GuC IRQ
> is handled, and other GTs are included in recovery later as the
> subsequent IRQs are serviced.
> 
> The post-migration recovery can now be called for any selection of
> GTs, and it will perform recovery on all GTs for which IRQs have
> arrived, even multiple times if necessary.
> 
> v2: Typos and style fixes
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Acked-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c | 167 ++++++++++++++-----------------
>  1 file changed, 76 insertions(+), 91 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 6526fe450e55..57b36ea74a45 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -147,127 +147,111 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>  		xe_sriov_info(xe, "migration not supported by this module version\n");
>  }
>  
> -/**
> - * vf_post_migration_requery_guc - Re-query GuC for current VF provisioning.
> - * @xe: the &xe_device struct instance
> - *
> - * After migration, we need to re-query all VF configuration to make sure
> - * they match previous provisioning. Note that most of VF provisioning
> - * shall be the same, except GGTT range, since GGTT is not virtualized per-VF.
> - *
> - * Returns: 0 if the operation completed successfully, or a negative error
> - * code otherwise.
> +static bool gt_vf_post_migration_needed(struct xe_gt *gt)
> +{
> +	return test_bit(gt->info.id, &gt_to_xe(gt)->sriov.vf.migration.gt_flags);
> +}
> +
> +/*
> + * Notify GuCs marked in flags about resource fixups apply finished.
>   */
> -static int vf_post_migration_requery_guc(struct xe_device *xe)
> +static int vf_post_migration_notify_resfix_done(struct xe_device *xe, unsigned long *gt_flags)

Why is gt_flags passed as a pointer? It doesn't look like the caller is
doing anything with this variable after passing it to this function.

>  {
>  	struct xe_gt *gt;
>  	unsigned int id;
> -	int err, ret = 0;
> +	int err = 0;
>  
>  	for_each_gt(gt, xe, id) {
> -		err = xe_gt_sriov_vf_query_config(gt);
> -		ret = ret ?: err;
> +		if (!test_bit(id, gt_flags))
> +			continue;
> +		/* skip asking GuC for RESFIX exit if new recovery request arrived */
> +		if (gt_vf_post_migration_needed(gt))
> +			continue;

If the IRQ arrives here - we'll send the resfix_done, which may have
some unexpected consequences.
I think we may need to tweak the protocol with GuC, but that's something
outside the scope of this patch.

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> +		err = xe_gt_sriov_vf_notify_resfix_done(gt);
> +		if (err)
> +			break;
> +		clear_bit(id, gt_flags);
>  	}
>  
> -	return ret;
> +	if (*gt_flags && !err)
> +		drm_dbg(&xe->drm, "another recovery imminent, skipped some notifications\n");
> +	return err;
>  }
>  
> -static void vf_post_migration_fixup_ctb(struct xe_device *xe)
> +static int vf_get_next_migrated_gt_id(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
>  	unsigned int id;
>  
> -	xe_assert(xe, IS_SRIOV_VF(xe));
> -
>  	for_each_gt(gt, xe, id) {
> -		s32 shift = xe_gt_sriov_vf_ggtt_shift(gt);
> -
> -		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
> +		if (test_and_clear_bit(id, &xe->sriov.vf.migration.gt_flags))
> +			return id;
>  	}
> +	return -1;
>  }
>  
> -/*
> - * vf_post_migration_imminent - Check if post-restore recovery is coming.
> - * @xe: the &xe_device struct instance
> +/**
> + * Perform post-migration fixups on a single GT.
>   *
> - * Return: True if migration recovery worker will soon be running. Any worker currently
> - * executing does not affect the result.
> + * After migration, GuC needs to be re-queried for VF configuration to check
> + * if it matches previous provisioning. Most of VF provisioning shall be the
> + * same, except GGTT range, since GGTT is not virtualized per-VF. If GGTT
> + * range has changed, we have to perform fixups - shift all GGTT references
> + * used anywhere within the driver. After the fixups in this function succeed,
> + * it is allowed to ask the GuC bound to this GT to continue normal operation.
> + *
> + * Returns: 0 if the operation completed successfully, or a negative error
> + * code otherwise.
>   */
> -static bool vf_post_migration_imminent(struct xe_device *xe)
> +static int gt_vf_post_migration_fixups(struct xe_gt *gt)
>  {
> -	return xe->sriov.vf.migration.gt_flags != 0 ||
> -	work_pending(&xe->sriov.vf.migration.worker);
> -}
> -
> -static bool vf_post_migration_fixup_ggtt_nodes(struct xe_device *xe)
> -{
> -	bool need_fixups = false;
> -	struct xe_tile *tile;
> -	unsigned int id;
> -
> -	for_each_tile(tile, xe, id) {
> -		struct xe_gt *gt = tile->primary_gt;
> -		s64 shift;
> -
> -		shift = xe_gt_sriov_vf_ggtt_shift(gt);
> -		if (shift) {
> -			need_fixups = true;
> -			xe_tile_sriov_vf_fixup_ggtt_nodes(tile, shift);
> -		}
> -	}
> -	return need_fixups;
> -}
> +	s64 shift;
> +	int err;
>  
> -/*
> - * Notify all GuCs about resource fixups apply finished.
> - */
> -static void vf_post_migration_notify_resfix_done(struct xe_device *xe)
> -{
> -	struct xe_gt *gt;
> -	unsigned int id;
> +	err = xe_gt_sriov_vf_query_config(gt);
> +	if (err)
> +		return err;
>  
> -	for_each_gt(gt, xe, id) {
> -		if (vf_post_migration_imminent(xe))
> -			goto skip;
> -		xe_gt_sriov_vf_notify_resfix_done(gt);
> +	shift = xe_gt_sriov_vf_ggtt_shift(gt);
> +	if (shift) {
> +		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
> +		/* FIXME: add the recovery steps */
> +		xe_guc_ct_fixup_messages_with_ggtt(&gt->uc.guc.ct, shift);
>  	}
> -	return;
> -
> -skip:
> -	drm_dbg(&xe->drm, "another recovery imminent, skipping notifications\n");
> +	return 0;
>  }
>  
>  static void vf_post_migration_recovery(struct xe_device *xe)
>  {
> -	bool need_fixups;
> -	int err;
> +	unsigned long fixed_gts = 0;
> +	int id, err;
>  
>  	drm_dbg(&xe->drm, "migration recovery in progress\n");
>  	xe_pm_runtime_get(xe);
> -	err = vf_post_migration_requery_guc(xe);
> -	if (vf_post_migration_imminent(xe))
> -		goto defer;
> -	if (unlikely(err))
> -		goto fail;
> +
>  	if (!vf_migration_supported(xe)) {
>  		xe_sriov_err(xe, "migration not supported by this module version\n");
>  		err = -ENOTRECOVERABLE;
>  		goto fail;
>  	}
>  
> -	need_fixups = vf_post_migration_fixup_ggtt_nodes(xe);
> -	/* FIXME: add the recovery steps */
> -	if (need_fixups)
> -		vf_post_migration_fixup_ctb(xe);
> +	while (id = vf_get_next_migrated_gt_id(xe), id >= 0) {
> +		struct xe_gt *gt = xe_device_get_gt(xe, id);
> +
> +		err = gt_vf_post_migration_fixups(gt);
> +		if (err)
> +			goto fail;
> +
> +		set_bit(id, &fixed_gts);
> +	}
> +
> +	err = vf_post_migration_notify_resfix_done(xe, &fixed_gts);
> +	if (err)
> +		goto fail;
>  
> -	vf_post_migration_notify_resfix_done(xe);
>  	xe_pm_runtime_put(xe);
>  	drm_notice(&xe->drm, "migration recovery ended\n");
>  	return;
> -defer:
> -	xe_pm_runtime_put(xe);
> -	drm_dbg(&xe->drm, "migration recovery deferred\n");
> -	return;
>  fail:
>  	xe_pm_runtime_put(xe);
>  	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));
> @@ -282,18 +266,23 @@ static void migration_worker_func(struct work_struct *w)
>  	vf_post_migration_recovery(xe);
>  }
>  
> -static bool vf_ready_to_recovery_on_all_gts(struct xe_device *xe)
> +/*
> + * Check if post-restore recovery is coming on any of GTs.
> + * @xe: the &xe_device struct instance
> + *
> + * Return: True if migration recovery worker will soon be running. Any worker currently
> + * executing does not affect the result.
> + */
> +static bool vf_ready_to_recovery_on_any_gts(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
>  	unsigned int id;
>  
>  	for_each_gt(gt, xe, id) {
> -		if (!test_bit(id, &xe->sriov.vf.migration.gt_flags)) {
> -			xe_gt_sriov_dbg_verbose(gt, "still not ready to recover\n");
> -			return false;
> -		}
> +		if (test_bit(id, &xe->sriov.vf.migration.gt_flags))
> +			return true;
>  	}
> -	return true;
> +	return false;
>  }
>  
>  /**
> @@ -308,13 +297,9 @@ void xe_sriov_vf_start_migration_recovery(struct xe_device *xe)
>  
>  	xe_assert(xe, IS_SRIOV_VF(xe));
>  
> -	if (!vf_ready_to_recovery_on_all_gts(xe))
> +	if (!vf_ready_to_recovery_on_any_gts(xe))
>  		return;
>  
> -	WRITE_ONCE(xe->sriov.vf.migration.gt_flags, 0);
> -	/* Ensure other threads see that no flags are set now. */
> -	smp_mb();
> -
>  	started = queue_work(xe->sriov.wq, &xe->sriov.vf.migration.worker);
>  	drm_info(&xe->drm, "VF migration recovery %s\n", started ?
>  		 "scheduled" : "already in progress");
> -- 
> 2.25.1
> 
