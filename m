Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138F6CFD2F6
	for <intel-xe@archiver.kernel.org>; Sat, 29 Nov 2025 20:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD8610E214;
	Sat, 29 Nov 2025 20:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cir+haqd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA8210E214
 for <intel-xe@lists.freedesktop.org>; Sat, 29 Nov 2025 20:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764446494; x=1795982494;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8prY7HIqg3iS49k4Mum2Vj4D93KCpm2rHVIDioUJ3AQ=;
 b=Cir+haqdMrR3fUikgKf5MP99Wzjk9Fv2QUgj9/4Sju7Bd4r2Q3JxjYpY
 qKE4Kt0my7BSW8f9cUMast+hQgQMzJ3MLgUo36AIltQgez6Nn/3RnFdWN
 h1o8UsftULZozhff4G8FeqaDoSVHSKtw3JXJGyyWJmEkJlr0hNlrga7JM
 ZOWJOKVdkoEgfw2h4hfsO9pB3ifHYmwt38pyzvVZKXRhEHE0O7CXqp6U/
 sw5Y3vcfVHI+0i1ZTGFQOSFiRYu6+bBEN43Lb/83e4f9CQ4I+3cPXLJFw
 osoQy/VyAgpFnlvY8el1Jx6D9rgjcmoH8xb3Sr9CqZQvy6CHST0oBf1Dp Q==;
X-CSE-ConnectionGUID: uOgZJxjbRDarcYWUX6nbEA==
X-CSE-MsgGUID: uV7WQZ5hQ8WPADKrTy0hug==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="76754533"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="76754533"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 12:01:33 -0800
X-CSE-ConnectionGUID: EAhZ1+IURAeJVdQqvc42yQ==
X-CSE-MsgGUID: 1zrFXzyvQ7SCxgxrSAu9Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; d="scan'208";a="193717536"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2025 12:01:34 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 12:01:32 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 29 Nov 2025 12:01:32 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 12:01:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9/dA//sVjtmQtn+un8a9rFOipWxbD2VAULuZPI3IJSWWaYWiVqrJfpcZFbF6lMgrIwMxxR28ITe8kdWKK3i21X0fZCFzBm+nbDMH61Ga4jmiacs+9pQcHvSHiIz1++Ph3lMuQMojfsYpRFOndkdYNa7D+SsRUW0NtNXpeizNS7f2QjQKksfGwRarWqI2MtCPlptNNTTrTuDScIj4OfxxatoGaqA7qfsiUVusbRNMjS3kjlVaGzMaKaVCCstIROO2PoVOqO1jpX/6QphiazD0nQVy+btv36CaM0KIF1Dh84oMjjcSsPykyREK+vbU+/p0HXk4Zv/0MBrBRNBOYZeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zc7kG104mqjUbyWqKZoTak+gqb7sN75t5O6+BLSCfLI=;
 b=kE6dIlUzNBBp+Ll3RrDp8TqO7b2fog9pbA8mDWqMaULMoC4Pi9J27SNyH/6u3GiCpmc8ys5wLmlQW1yvJnraFELvzoLdkKNuueYYMFvnmwnhYppTx/yCZOAYkmgQQxuCUZ01Q/6FyaqZEWS2IRfiJ9oPhz4KYpNm0suELkwjPfbJTQKHDZLJYh7+zf0Ryz4qCXJkIvfS59A38Xa+GRBLwSeY4CzO4WFNabHE25muPKFfQG8y4L2WO7Wu4PfEsjHZn1abpp905Lgsee6OzOEVmLj1vVNbeZO3f5YTW8V+DRi3cGzxlm3wUlfBX/h8T1iwfgfmG82wY1sPEF53e1cruQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV8PR11MB8584.namprd11.prod.outlook.com (2603:10b6:408:1f0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sat, 29 Nov
 2025 20:01:30 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 20:01:30 +0000
Message-ID: <c0c71748-8dbc-4fdf-be83-176e5213bb17@intel.com>
Date: Sat, 29 Nov 2025 21:01:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] drm/xe/vf: Introduce RESFIX start marker support
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251128133052.17120-6-satyanarayana.k.v.p@intel.com>
 <20251128133052.17120-8-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251128133052.17120-8-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P189CA0007.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::20) To LV2PR11MB6024.namprd11.prod.outlook.com
 (2603:10b6:408:17a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV8PR11MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 564a0856-4ee3-4cbb-9131-08de2f821675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LytTSHVqVnExN01qLzR4ZndVZ2hrSDBiemF1MHRzRHgxd1dScUpHelBFemJq?=
 =?utf-8?B?bzc0VGZ6VThWQnNMRVA4UlNueUNJVXFJbHFIbk9sT2hRRWRzUDg2NFNURFJ5?=
 =?utf-8?B?YkJibmkyRXMwaXFLVDlla3B3aHJ2a1FQalRwZVdhb0J6ZjlEQkRzcmZhc0FV?=
 =?utf-8?B?MWtJQnE0eXY1YWtzZ0dacXBUNTJlY3lNTFhLUHNibjB3U3IyVGVlNU5xYjh4?=
 =?utf-8?B?STduazhJNUdobGhPVExhRkFtd09SYzBzcnBiaWZJdmFTY1k5TlZJbWZidjJR?=
 =?utf-8?B?UkJ3WVFJdFdpZ0ZTdXNOSGkvODBoOGFvRW9vNkp1MFhNOW9QMSt1SHEzd1Fz?=
 =?utf-8?B?Y1RNM09HNFI0V05jSVZFeVg2NXdWdDBRbzlJd2J0QzJRL2JlVWNTR0N1VFpN?=
 =?utf-8?B?UHRWbjFqdWhmZGx6dk04STFWdWF1c3pOWjRJZXhMYlUzSXJ4OGtyTk45OHM1?=
 =?utf-8?B?THpuUTdUbWRPL1VRN3VRVjlUOFFlUGFtb3krMFNsdXZrSjlhMHpJc3RoRHAz?=
 =?utf-8?B?OExKMmVMMVJEUW5yRmliMWtqNVBWaVBTcVNKNVh2ZFViRjFleHc5b25xTGdP?=
 =?utf-8?B?VElVcXNFSCtFdFZ5dDZHSWhoS1A1alFCNHdlM0NmUWY1SlhOb2RONmdhZ2M4?=
 =?utf-8?B?TkRiNWZmZGw5WkhvbkxHOFd4SFhtZld0emRFQUdOUTl2Z2ViTmRoRzlHcE9I?=
 =?utf-8?B?Zmsrazg4S0dsRHZrNEhVZjhEL1FmVFdhUVVjY0tYNjdSYzRkd0E2RG02bWly?=
 =?utf-8?B?UkREUHJmZTNHTEdkRnBhaExYUHEvdkhkQUZjQ3lZcjhsVXQ5M1NWSHIrRXZC?=
 =?utf-8?B?emQ4N2RERXRPVi9nK1FhS2JUajRVQlhvVlA2M2JTZHBGVjZJVjBad0VpbmI1?=
 =?utf-8?B?OVZPUzdmdTRmM2pJK01LazRzS1N6UFRhUkpzMUQ4bGNlZ2FCdDhSdlN3aVJL?=
 =?utf-8?B?RXFPNDZLK0o4MHNLZnZ1RC85azhSMkJXMjQxeW43N0NUeXpHQjR2N3VjQ0Mx?=
 =?utf-8?B?dy8xS2dNeVVqQnFWaGdTT05YUlZNV21iSzcxOWFMQUppWWgybWkwWC9HVUl1?=
 =?utf-8?B?YWNaeWlHU0NWVkd5bldrdEFHYlJ0UEZxTENhRlZiTFhmNkg4QnhuOG1CajZ5?=
 =?utf-8?B?TGxrMEJzcEU5aVN6U085aTdVRnExaW1lakZTZHBVK3ZiZmVNTDRvTUprMXlL?=
 =?utf-8?B?MXBhVkNWZlJ4SjhtUE1Zcnc3b1l4SzBnbUNiL1lNRmdPSzZmSGdjTzVuVXor?=
 =?utf-8?B?SlFKa2hocXpXL3l3anF5REp4SnVyQXBWRHByMEZvQnpyOVJBZFFpZ0VpTzBm?=
 =?utf-8?B?Z2hUdjhOSXVnaVJHUVdpR3JHRUNhaDBhTWx4M3I4YnM1TWtvbXZSU3lGRkFk?=
 =?utf-8?B?UTdabnhlM01wZkc3RUtoVGhZWUdQU3plNkhIc2w3Z1VJN2hmYy94TmNzcXBD?=
 =?utf-8?B?cnBvVjVQblVFU0piMkJhVVpQYitGcTIyS0RMaWNoei9rNzFTK0ZkN1ZJRVBq?=
 =?utf-8?B?L3F3Vy9iU3BoZVRBbmVmOFNURnhEazNqNGpOVDJLWTdIVTdZcEtNcWd0K20z?=
 =?utf-8?B?UVQvVXZqVGg1WXlJWVpZMWpMTWNhblNUeW9ERDZ3UEdRSENCbmVKbDN5TUJQ?=
 =?utf-8?B?QncvajVoaENyS1dyMG42NG1tUUllcXA5RGxaNkIxRlpQcm9sdjBUMFRpQXZ1?=
 =?utf-8?B?YzRnZ3ZWMlBSbHZqM2UwT2RRa1VXazRlV2FtVnJyR21HRlJSUE5BNHBSdFVv?=
 =?utf-8?B?YStmSE9lWVQ2dElLOUtrY1E1RmNQczArN1Mzd2FGb2ZxaU9HbDU2cVZJaWQz?=
 =?utf-8?B?TExvTlZ1NU9FWXR2TmlCOWd0YnhMckp3dGpOYmFERDF0S2tQNlRzMjdqaERM?=
 =?utf-8?B?RzRhY0ZyZ3drMU5QbXNxdUx2dnNyUGw0ZStWK3RxVUVXcjEvbUw4Nll1RCs4?=
 =?utf-8?Q?Psmo5QZ1xvXwvA+26ZNKkADT2zYbRQuL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZU5scFpSN2VjeWFxT0pyRE9ha0tYVThlMlhEbkx4TGhyckhjNlRxcEN2Lytr?=
 =?utf-8?B?QXhmVzZGam92aE41RmdsY08wU1hEdlNZKzNBU2pRMGxvZGJtdnFVaHZEbDY4?=
 =?utf-8?B?cGw2VXNHSGs1WGNVVlQydG1PTmRWY0V6SExDaHhQSDBGNTFUa2VGbjg3ZkFB?=
 =?utf-8?B?anBZU0FMdEJGOXR4V0YrcnJqOTZacEpNOG9xOENIUWJhOWlEWVNaejFpOFBP?=
 =?utf-8?B?L0tIN1ZEck1yWDhpUG1pdlEyTk4yc3lhd0UvVnlqUEh3Sml1T2dIRHdjZS83?=
 =?utf-8?B?N2g5UFA2WXl3VWR3WldzRlljUEdxTGJUc2JxdUpBcnlSd21PWlRmWDNsTzRT?=
 =?utf-8?B?bHV2dk5VeE53YS9zUmpyYngyaGlDbVdOU0FwcnQ3cFpiUC91dnVnMGl2OVJL?=
 =?utf-8?B?cDV0c1hySW5UazV1c2RhRzIybVA3QitXU3g3WUVUK1o1aTRxOTlIRkZhNmE5?=
 =?utf-8?B?c0F5eFZURWpBVWpRZzRPNFNJWFhlalN1ZkhWbjl6SUw3QVBnSnNKMW4yeTdm?=
 =?utf-8?B?eGpGeG5sckFBaGRKUG92cFpOK09sbVAvT2VDRWVweUdtT3J3dlkwRWlZaTV0?=
 =?utf-8?B?bUwwMlNXV05VaUlzN3dRWUl2bGU5SEM4VDhHWTZMd2U4dFBRQW1LU3oyblFV?=
 =?utf-8?B?UFRvYTcvc1l0SDZMRVZXZmVXbWN2OHlMZU9jNHRyUGVuTjZyN2pkb1dVamE2?=
 =?utf-8?B?dDlKMVo3Z3p0ZFlsd1hiWHpxbS9aR09XTjBYMktjUmdzbHpwSFZmVEtHWkdi?=
 =?utf-8?B?OHhzOHdEdWh2L0p5ZlhkWXErWThEMmlaTGxla3JsSHNBOWRkYUU4TXZQSDdD?=
 =?utf-8?B?bCt6VFh3WU4xTnE0TmFVeGtISGVSK281T1AzTUV1V0kwMFdwZi85Y0lGZFpt?=
 =?utf-8?B?bmIrVk95N1N6SDVJR29sdlI0bWhFVnd6aW56MXBQUHZrYUw2OHliNVJwMFM2?=
 =?utf-8?B?QndTMnB0ekhSMnpsQUNESHE5V20xUFhVckF0YkhjUjhGdXdPZ0ZzaUV0SmtI?=
 =?utf-8?B?L0c4cU9lWDQxSUV6Y0ZDNGVXVm0wZW5WYVkxL05HYkc4UFRkcXp6Q2drdmVP?=
 =?utf-8?B?ZkxhVXFaMVZpeG9vRnVmY2xMSU90bUdlQ1duUitFeUNoOGtXWXZlVUo3d2Zi?=
 =?utf-8?B?eElsWjJ5NlI1UXZoY0c0dW1xMGQ3VU9GM0FPNi84L2VDNFBySlNYYzdndHRP?=
 =?utf-8?B?bWsrTWhNTHNvb09OWHIwMk9Hc0Z1cmlVMXR2WWpFYTJWbXZlOVgwanZlREtI?=
 =?utf-8?B?QVRHY3dzbWhmdHdwaXoyYnlMby9HQWY4cG9HeG1nTTRxVGNXcEY1L3V5ek43?=
 =?utf-8?B?N2t4OWdLbjI0Ri80Z0JTcUhsQnFCMXZuTTRxbG9pRGJHY283RlEraHlpdlZL?=
 =?utf-8?B?dk5tdzlNRGhVRGRVTlUwa2kvRHVQT3lrWnFhSFA5SHdoakJYcXNDby9icGhw?=
 =?utf-8?B?UVdSclBnV3VMbDRXNUlPR3dTNjU2bTFMcGdEQzBPeVcyM2EzMDd1SllZY2ZC?=
 =?utf-8?B?UGlWN3BVOHZzWFAvR0RZSmU4MnhvZ3pYTkR3Z0pyZWs0Zm5vUWtvRndpTFVE?=
 =?utf-8?B?QVc2MHlLUFg5N1VmeUgvWXhvRHlYcWVOZmFGVFNuLy8rT0NsQ3RLRTFkV1ZO?=
 =?utf-8?B?OWl0b1BuRHEySDVPdkpSV3dBSTdRWkhUR3dhNENaa3B3d1BpeGVYUENCQThE?=
 =?utf-8?B?bDEzRGhUYzhzUkJWRkF5bHlvbUlHdHFmZWVMLzc4SWlEUGpaYjBhaHJ6VkJ3?=
 =?utf-8?B?cnYvQXdkb0R2LzBnV3BhRm5iTzhXeFoxa2tGcmROVzdjSWpzOHpxeEwzVlJM?=
 =?utf-8?B?U3dEeEliYmZOWFlHbnpyQjkwUTBuSjVVVmVvRURoWlp5aDBCRWorVmRXZThu?=
 =?utf-8?B?ZEkwZkhadHNwMkMrcmpvSmIzTXBLMmlseVJZUS9UZWZWUlhqczltQ0EyWUMr?=
 =?utf-8?B?bVpWUmV3c0RIWlRBajBEUDFSL2ozWEt1VDJNYk4ybkZpQjBZU0x0YllXVFEx?=
 =?utf-8?B?U1dtQjVBdkNRS0VaTm02Z1hORHgvallhOS8wRndPK3d3QkdSTE9JcHh4U1hR?=
 =?utf-8?B?U3k5MmVxUWhEUFFOZjZhNXRkZ0djRVB5aXBKUVlSeXFsN1R5Q3lMaUcvSlAv?=
 =?utf-8?B?QklWS3AzWS9kYW9tT2pWUWZrOFdaa0NTdnlXWVFjZktraGlyTzREalo5bnFW?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 564a0856-4ee3-4cbb-9131-08de2f821675
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2025 20:01:30.6770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onCzUEJhXZ5uKTCQuJIflTtoB3Mx3ua5TI10MkgNCOLRmBLD9FzvAEsgPgXTPHHHHceiCVdNy1EkzqkiRhY35mdtydolees+SC9yDLLL1Ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8584
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



On 11/28/2025 2:30 PM, Satyanarayana K V P wrote:
> In scenarios involving double migration, the VF KMD may encounter
> situations where it is instructed to re-migrate before having the
> opportunity to send RESFIX_DONE for the initial migration. This can occur
> when the fix-up for the prior migration is still underway, but the VF KMD
> is migrated again.
> 
> Consequently, this may lead to the possibility of sending two migration
> notifications (i.e., pending fix-up for the first migration and a second
> notification for the new migration). Upon receiving the first RES_FIX
> notification, the GuC will resume VF submission on the GPU, potentially
> resulting in undefined behavior, such as system hangs or crashes.
> 
> To avoid this, post migration, a marker is sent to the GUC prior to the
> start of resource fixups to indicate start of resource fixups. The same
> marker is sent along with RESFIX_DONE notification so that GUC can avoid
> submitting jobs to HW in case of double migration.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V6 -> V7:
> - Fixed review comments (Michal W).
> - Made resfix_start marker width to u8.
> - Removed XE_GUC_RESPONSE_VF_MIGRATED handling in xe_guc_mmio_send_recv()
> function and moved to seperate patch.
> 
> V5 -> V6:
> - Fixed review comments (Michal W).
> - Updated resfix_done and res_fix_start function names.
> - Handled XE_GUC_RESPONSE_VF_MIGRATED error case received from GuC.
> - Remove skip_resfix error when another migration is in queue.
> 
> V4 -> V5:
> - Fixed review comments (Michal W).
> - Fixed minor debug log levels and documentation part.
> - Moved complete marker logic to vf_post_migration_resfix_start_marker()
> 
> V3 -> V4:
> - Updated RESFIX_DONE action name and documenation part. (Michal W)
> - Enable resfxi_start marked by default as sav/restore is gated on
> Guc version 70.54.0
> 
> V2 -> V3:
> - Fixed review comments (Michal W).
> - Updated commit message.
> - Fixed CI.BAT issues.
> - Added helper function to assert on unsupported GUC versions.
> - Updated RESFIX_DONE action name and documenation part.
> 
> V1 -> V2:
> - Squashed "Enable RESFIX start marker only on supported GUC
> versions" commit into a single commit. (Matt B)
> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 67 +++++++++++--
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 94 ++++++++++++-------
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  5 +
>  drivers/gpu/drm/xe/xe_sriov_vf.c              | 64 ++++++++++++-
>  4 files changed, 184 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index 0b28659d94e9..d9f21202e1a9 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -502,13 +502,17 @@
>  #define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>  
>  /**
> - * DOC: VF2GUC_NOTIFY_RESFIX_DONE
> + * DOC: VF2GUC_RESFIX_DONE
>   *
> - * This action is used by VF to notify the GuC that the VF KMD has completed
> - * post-migration recovery steps.
> + * This action is used by VF to inform the GuC that the VF KMD has completed
> + * post-migration recovery steps. From GuC VF compatibility 1.27.0 onwards, it
> + * shall only be sent after posting RESFIX_START and that both @MARKER fields
> + * must match.
>   *
>   * This message must be sent as `MMIO HXG Message`_.
>   *
> + * Updated since GuC VF compatibility 1.27.0.
> + *
>   *  +---+-------+--------------------------------------------------------------+
>   *  |   | Bits  | Description                                                  |
>   *  +===+=======+==============================================================+
> @@ -516,9 +520,11 @@
>   *  |   +-------+--------------------------------------------------------------+
>   *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
>   *  |   +-------+--------------------------------------------------------------+
> - *  |   | 27:16 | DATA0 = MBZ                                                  |
> + *  |   | 27:16 | DATA0 = MARKER = MBZ (only prior 1.27.0)                     |
>   *  |   +-------+--------------------------------------------------------------+
> - *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE` = 0x5508    |
> + *  |   | 27:16 | DATA0 = MARKER - can't be zero (1.27.0+)                     |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_DONE` = 0x5508           |
>   *  +---+-------+--------------------------------------------------------------+
>   *
>   *  +---+-------+--------------------------------------------------------------+
> @@ -531,13 +537,13 @@
>   *  |   |  27:0 | DATA0 = MBZ                                                  |
>   *  +---+-------+--------------------------------------------------------------+
>   */
> -#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE		0x5508u
> +#define GUC_ACTION_VF2GUC_RESFIX_DONE			0x5508u
>  
> -#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_LEN	GUC_HXG_REQUEST_MSG_MIN_LEN
> -#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
> +#define VF2GUC_RESFIX_DONE_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER		GUC_HXG_REQUEST_MSG_0_DATA0
>  
> -#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
> -#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
> +#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>  
>  /**
>   * DOC: VF2GUC_QUERY_SINGLE_KLV
> @@ -656,4 +662,45 @@
>  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_0_USED	GUC_HXG_RESPONSE_MSG_0_DATA0
>  
> +/**
> + * DOC: VF2GUC_RESFIX_START
> + *
> + * This action is used by VF to inform the GuC that the VF KMD will be starting
> + * post-migration recovery fixups. The @MARKER sent with this action must match
> + * with the MARKER posted in the VF2GUC_RESFIX_DONE message.
> + *
> + * This message must be sent as `MMIO HXG Message`_.
> + *
> + * Available since GuC VF compatibility 1.27.0.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 = MARKER - can't be zero                               |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_START` = 0x550F          |
> + *  +---+-------+--------------------------------------------------------------+
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | DATA0 = MBZ                                                  |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_ACTION_VF2GUC_RESFIX_START			0x550Fu
> +
> +#define VF2GUC_RESFIX_START_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER	GUC_HXG_REQUEST_MSG_0_DATA0
> +
> +#define VF2GUC_RESFIX_START_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_START_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 97c29c55f885..fd7dd4a4739d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -299,12 +299,13 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>  		*found = gt->sriov.vf.guc_version;
>  }
>  
> -static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> +static int guc_action_vf_resfix_start(struct xe_guc *guc, u16 marker)
>  {
>  	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
>  		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>  		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> -		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_START) |
> +		FIELD_PREP(VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER, marker),
>  	};
>  	int ret;
>  
> @@ -313,28 +314,41 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>  	return ret > 0 ? -EPROTO : ret;
>  }
>  
> -/**
> - * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
> - * @gt: the &xe_gt struct instance linked to target GuC
> - *
> - * Returns: 0 if the operation completed successfully, or a negative error
> - * code otherwise.
> - */
> -static int vf_notify_resfix_done(struct xe_gt *gt)
> +static int vf_resfix_start(struct xe_gt *gt, u16 marker)
>  {
>  	struct xe_guc *guc = &gt->uc.guc;
> -	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	err = guc_action_vf_notify_resfix_done(guc);
> -	if (unlikely(err))
> -		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
> -				ERR_PTR(err));
> -	else
> -		xe_gt_sriov_dbg_verbose(gt, "sent GuC resource fixup done\n");
> +	xe_gt_sriov_dbg_verbose(gt, "Sending resfix start marker %u\n", marker);
>  
> -	return err;
> +	return guc_action_vf_resfix_start(guc, marker);
> +}
> +
> +static int guc_action_vf_resfix_done(struct xe_guc *guc, u16 marker)
> +{
> +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_DONE) |
> +		FIELD_PREP(VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER, marker),
> +	};
> +	int ret;
> +
> +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
> +
> +	return ret > 0 ? -EPROTO : ret;
> +}
> +
> +static int vf_resfix_done(struct xe_gt *gt, u16 marker)
> +{
> +	struct xe_guc *guc = &gt->uc.guc;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	xe_gt_sriov_dbg_verbose(gt, "Sending resfix done marker %u\n", marker);
> +
> +	return guc_action_vf_resfix_done(guc, marker);
>  }
>  
>  static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
> @@ -1183,22 +1197,15 @@ static void vf_post_migration_abort(struct xe_gt *gt)
>  	xe_guc_submit_pause_abort(&gt->uc.guc);
>  }
>  
> -static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> +static int vf_post_migration_resfix_done(struct xe_gt *gt, u16 marker)
>  {
> -	bool skip_resfix = false;
> -
>  	spin_lock_irq(&gt->sriov.vf.migration.lock);
> -	if (gt->sriov.vf.migration.recovery_queued) {
> -		skip_resfix = true;
> -		xe_gt_sriov_dbg(gt, "another recovery imminent, resfix skipped\n");
> -	} else {
> +	if (gt->sriov.vf.migration.recovery_queued)
> +		xe_gt_sriov_dbg(gt, "another recovery imminent\n");

with this new flow, which includes sending both RESFIX_START/DONE messages,
do we still need to track 'recovery_queued' flag separately and print info
about the 'imminent' recovery?

> +	else
>  		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
> -	}
>  	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>  
> -	if (skip_resfix)
> -		return -EAGAIN;
> -
>  	/*
>  	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
>  	 * must be working at this point, since the recovery did started,
> @@ -1206,14 +1213,26 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
>  	 */
>  	xe_irq_resume(gt_to_xe(gt));

hmm, shouldn't this IRQ re-enabling be part of the kickstart() step called later?
then we will keep them off in case of failing at sending RESFIX_DONE

>  
> -	return vf_notify_resfix_done(gt);
> +	return vf_resfix_done(gt, marker);
> +}
> +
> +static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)

nit: this is not just a 'start' marker, nor fixed value, so maybe:

	vf_post_migration_next_resfix_marker() ?

> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	BUILD_BUG_ON(1 + ((typeof(gt->sriov.vf.migration.resfix_marker))~0) >
> +		FIELD_MAX(VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER));

is it correctly aligned?

> +
> +	/* add 1 to avoid zero-marker */
> +	return 1 + gt->sriov.vf.migration.resfix_marker++;
>  }
>  
>  static void vf_post_migration_recovery(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	int err;
> +	u16 marker;
>  	bool retry;
> +	int err;
>  
>  	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
>  
> @@ -1227,14 +1246,23 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  		goto fail;
>  	}
>  
> +	marker = vf_post_migration_resfix_start_marker(gt);
> +
> +	err = vf_resfix_start(gt, marker);

all private helpers called here have vf_post_migration prefix except this one

so maybe this step should be called vf_post_migration_resfix_start() instead
where you can call lower level helpers if needed

> +	if (unlikely(err)) {
> +		xe_gt_sriov_err(gt, "Recovery failed at GuC RESFIX_START step (%pe)\n",
> +				ERR_PTR(err));
> +		goto fail;
> +	}
> +
>  	err = vf_post_migration_fixups(gt);
>  	if (err)
>  		goto fail;
>  
>  	vf_post_migration_rearm(gt);
>  
> -	err = vf_post_migration_notify_resfix_done(gt);
> -	if (err && err != -EAGAIN)
> +	err = vf_post_migration_resfix_done(gt, marker);
> +	if (err)
>  		goto fail;
>  
>  	vf_post_migration_kickstart(gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 420b0e6089de..db2f8b3ed3e9 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -52,6 +52,11 @@ struct xe_gt_sriov_vf_migration {
>  	wait_queue_head_t wq;
>  	/** @scratch: Scratch memory for VF recovery */
>  	void *scratch;
> +	/**
> +	 * @resfix_marker: Marker sent on start and on end of post-migration
> +	 * steps.
> +	 */
> +	u8 resfix_marker;
>  	/** @recovery_teardown: VF post migration recovery is being torn down */
>  	bool recovery_teardown;
>  	/** @recovery_queued: VF post migration recovery in queued */
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index d56b8cfea50b..1827d77852a4 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -49,11 +49,13 @@
>   *
>   * As soon as Virtual GPU of the VM starts, the VF driver within receives
>   * the MIGRATED interrupt and schedules post-migration recovery worker.
> - * That worker queries GuC for new provisioning (using MMIO communication),
> + * That worker sends `VF2GUC_RESFIX_START` action along with non-zero
> + * marker, queries GuC for new provisioning (using MMIO communication),
>   * and applies fixups to any non-virtualized resources used by the VF.
>   *
>   * When the VF driver is ready to continue operation on the newly connected
> - * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
> + * hardware, it sends `VF2GUC_RESFIX_DONE` action along with the same
> + * marker which was sent with `VF2GUC_RESFIX_START` which causes it to
>   * enter the long awaited `VF_RUNNING` state, and therefore start handling
>   * CTB messages and scheduling workloads from the VF::
>   *
> @@ -102,12 +104,17 @@
>   *      |                              [ ]        new VF provisioning  [ ]
>   *      |                              [ ]---------------------------> [ ]
>   *      |                               |                              [ ]
> + *      |                               |   VF2GUC_RESFIX_START        [ ]
> + *      |                              [ ] <---------------------------[ ]
> + *      |                              [ ]                             [ ]
> + *      |                              [ ]                     success [ ]
> + *      |                              [ ]---------------------------> [ ]
>   *      |                               |       VF driver applies post [ ]
>   *      |                               |      migration fixups -------[ ]
>   *      |                               |                       |      [ ]
>   *      |                               |                       -----> [ ]
>   *      |                               |                              [ ]
> - *      |                               |    VF2GUC_NOTIFY_RESFIX_DONE [ ]
> + *      |                               |    VF2GUC_RESFIX_DONE        [ ]
>   *      |                              [ ] <---------------------------[ ]
>   *      |                              [ ]                             [ ]
>   *      |                              [ ]  GuC sets new VF state to   [ ]
> @@ -118,6 +125,57 @@
>   *      |                              [ ]---------------------------> [ ]
>   *      |                               |                               |
>   *      |                               |                               |
> + *
> + * Handling of VF double migration flow is shown below::
> + *
> + *     GuC1                                             VF
> + *      |                                               |
> + *      |                                              [ ]<--- start fixups
> + *      |                  VF2GUC_RESFIX_START(marker) [ ]
> + *     [ ] <-------------------------------------------[ ]
> + *     [ ]                                             [ ]
> + *     [ ]---\                                         [ ]
> + *     [ ]   store marker                              [ ]
> + *     [ ]<--/                                         [ ]
> + *     [ ]                                             [ ]
> + *     [ ] success                                     [ ]
> + *     [ ] ------------------------------------------> [ ]
> + *      |                                              [ ]
> + *      |                                              [ ]---\
> + *      |                                              [ ]   do fixups
> + *      |                                              [ ]<--/
> + *      |                                              [ ]
> + *      :                                               :
> + *      -------------- VF paused / saved ----------------

from here

> + *      |                                               |

(and lifeline for GuC1 shall end here)

> + *
> + *     GuC2
> + *      |
> + *      :                                               :
> + *      ----------------- VF restored  ------------------
> + *      |                                               |
> + *     [ ]                                              |
> + *     [ ]---\                                          |
> + *     [ ]   reset marker                               |
> + *     [ ]<--/                                          |
> + *     [ ]                                              |
> + *      ----------------- VF resumed  ------------------

up to here, there should be no lifeline for the VF

> + *      |                                              [ ]
> + *      |                                              [ ]
> + *      |                   VF2GUC_RESFIX_DONE(marker) [ ]
> + *     [ ] <-------------------------------------------[ ]
> + *     [ ]                                             [ ]
> + *     [ ]---\                                         [ ]
> + *     [ ]   check marker                              [ ]
> + *     [ ]   (mismatch)                                [ ]
> + *     [ ]<--/                                         [ ]
> + *     [ ]                                             [ ]
> + *     [ ] RESPONSE_VF_MIGRATED                        [ ]
> + *     [ ] ------------------------------------------> [ ]
> + *      |                                              [ ]---\
> + *      |                                              [ ]  reschedule fixups
> + *      |                                              [ ]<--/
> + *      |                                               |
>   */
>  
>  /**

