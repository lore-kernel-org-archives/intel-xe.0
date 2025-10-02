Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F0FCAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 21:27:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6597210E845;
	Thu,  2 Oct 2025 21:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y4O6cekR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4CFE10E845
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 21:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759440420; x=1790976420;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tYqc97mNQVNGDlIQzyQIAqDBFXI82VW9UKgwjgfpjOA=;
 b=Y4O6cekRoQDUOm7N5c9qoIF15sKJ4L1hS23CulYml3Frg20zG42Dd5cw
 1RC/2ts6yNOOedtFqOCrj824I3dHr/yZPEMFzStFFPlzEbibukanw7o+I
 p19TxMe0b1BLjfRqrpoNpuJzhE1msUaIB3g6p89sSgAwxiUX/a686wsnr
 9LgqS3QoTvGrC3IW8B6/6XsQE3i2+W3DR0gCOCm/MMNDpzgaRe1lvsbgj
 4f+AS1B1YpwWI93ZJ6XJ4gH584untO94Q7mJnfd8RsbIMOgulfHj9qf81
 u9FLo3U1sassyc9SXukzPmSTxrMFbj9aahWWlqKEwaEROII1NDivELo+j g==;
X-CSE-ConnectionGUID: sdbJJwSuQCaChCGm5byD9A==
X-CSE-MsgGUID: gIgvb2brSAeOiKRute0rNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="60770783"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="60770783"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 14:26:52 -0700
X-CSE-ConnectionGUID: xF3X0qnoR7+MeWYdSDq5hA==
X-CSE-MsgGUID: 1QtO7mNdTIyNBfYRnAjciw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="184428103"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 14:26:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 14:26:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 14:26:51 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 14:26:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pm9oCwWYqmDvunZFXOTy9vhc49v23FprKE0nNQl08lG3cpf3T+P7aXJ/V8HSg8v6BdoWYQk5CgWLP2PUoQwZnyFBevU95ZBIihxlN53/42IsZyxPs3nyRbGbptLWwYKL8QIcvpwMaTsF6lX30G93I52Gdso7WzYWesT+rNGeFHeE57IKGB3x1/4z4ZPPF1IpVm1pXyzttbFFFeJP85arcJX2zWihiHQA40rBb9XknBbfkAQD7YsblF78UoBUA//buY5Fh0OeKhJOVxGW6HvxT5+CFzFyvm38ngp2touLYdeAsOKVZapGVdtd/S9p+/nPnPZFuM/4B7c9Vy+JbNJv0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qlniju6l0OiJkxmuzqblgUtACUmI/ZcMgItoM1wNPE=;
 b=MgNBfzpbBacLqyxKrHWfl5rl0TJMUDsvw+uX64dyWQnv6puTE8AKifMtNFIcPhVu4+WkgA6R5gmE0XhgOQeTIU1vEAiTFvPcHBQbv5BO+XvfzR6EXwNXBsTsXTSu7kXk6odbyONZ1xx/JoicJWNa0QRRtoucqUwocT4oRJyqj+p/cE8H1y+7r0igm1pRxinb8RVx7gMmkw/tPiFH+qq7s6shyrtq1t2OJ1/O085yZxTTxu908BBeRCyAbw3F7ky+ZZ2jH3vxuaSrYxmkewTJVR9+QABl9z8a8jxpV7VWXzszyR9mxYWwoukjWXSp/djbcdrAwQZezhP7biLjJV/nvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB4879.namprd11.prod.outlook.com (2603:10b6:a03:2da::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Thu, 2 Oct 2025 21:26:47 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9160.015; Thu, 2 Oct 2025
 21:26:47 +0000
Date: Thu, 2 Oct 2025 23:26:44 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/6] drm/xe/pf: Add top level functions to control VFs
Message-ID: <htlfp3sg4kvxscxz2raxolar5uehyub4piqoz7exuc4fc2ecy3@yig7trus62kb>
References: <20250930233525.201263-1-michal.wajdeczko@intel.com>
 <20250930233525.201263-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250930233525.201263-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: WA2P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::21) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB4879:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc666be-39c3-4a02-0491-08de01fa6483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTlMK2U5QmJScXJGdHgrMkh5eGI0aHBQd1d4bCtMSzJHMnErWHRpSG16Rkdl?=
 =?utf-8?B?ZS9HSTZwaFBSWE1wRG9FUlRsNDNZTDF3Y3E1Mmh1MXgrM2lMNDdMcW11OXVz?=
 =?utf-8?B?d000ZDlMQlRjWGhLRks5Y3p0YjF6c0VKdzh5TkQxaSs1MVZqekZ5K214T2lW?=
 =?utf-8?B?MU54dVRvUmNteS9xdTdjZnk2d2sreW55dUxHek9PZTFEaWhyRzE2aUtrVjU2?=
 =?utf-8?B?WS9nR0lYdDBCaEc0czBKWnZBRHc2Wmc1UWE4aU5weHF2WDZCRlE0QnNLYmlN?=
 =?utf-8?B?bTR4T1IxYlZKWjAzUU9wNVg2TEl3SWdEelZrYnBTeU9WMEY4a3VNTkk5UWQy?=
 =?utf-8?B?TnVOVWxTdk1Udnc1c3hEb2JIUnVNVkUyaVBtVy8wUGl6WExvN3FMUFUzNHlH?=
 =?utf-8?B?eUFLSHhPdWlndUNqemRNeFc1cmlaaXBhSUw1cGhIbmJWbGhMWnFVd3FpbDRY?=
 =?utf-8?B?Lytpd3pVMDJIVlpmdWNlRGxvYXRuSGo3NzNZOXlBODAyQUk0cjhoMTVCSWlL?=
 =?utf-8?B?NFd2R2hEMzhOV3Qva2tNRU5SUEpGUUJpajlnYjg1czBXL3JwOHdTY0VpbTdE?=
 =?utf-8?B?QjRXczdoSklYM20waE1SUWhyRDBrSVhjRmlrcTU2RW5kU1B5K09GVDU0blgx?=
 =?utf-8?B?Rk05NUg2ZmRwMElyajg3dkFhN1IwMTdNd0hST2NETnpVd281Q0dzdzErNC9x?=
 =?utf-8?B?M1p4VkVrRmFzVGxhdS9WcFZuMTJxMmZTWHN0QjBoQ2VkSkVyRGZZbk1KSTls?=
 =?utf-8?B?dCs4aEZTYURtQVp0d0dFbnhWSlNXYm5IQlVpYWtkRWRqL016QXRxcHVvcjYw?=
 =?utf-8?B?Mm9hZE1KUEJON29wd0grL3R3U3BSTkUxbDdzOG9TVnk4UVZkOHVHTFRWRUdx?=
 =?utf-8?B?U3BQTklScytwK285cC9hV2FtV2UxSFo4M1NaN1Zsd2dJTW55OXd6a21sVGF0?=
 =?utf-8?B?TlhvejU1NFg0M0F0SGhUa3BTamFXbXQ3aEo5TEpOd05mOThxUWlVbVhta25G?=
 =?utf-8?B?TEIveHBDV1BKRDRSUTZ4OWpEYy9nQmd1bXh1cGJaL215NFo1K0lWdW5sc25x?=
 =?utf-8?B?YUhWRWRTUjNVUkxkZjRzUVpSRW5QYlNMVEs1ZkJkeVJnb282NlljQ1YrT0Zj?=
 =?utf-8?B?SE56SFZKZlgrYjdndHk0aEdjL2hrbzNncFBsYlZlRFRrTjAvcm5Yd08zang2?=
 =?utf-8?B?UTZlQTUzZkdueWJ1cDNNU0w3NWVJWElHQlJhTlUyTDdzSjc5Ulp2VVVuZU43?=
 =?utf-8?B?WVlxcEFKUmZ2bEM1N2ptQVdvZWdOMWtSSFBBWTZTUXYwSk9iODlZc1l3Q2JB?=
 =?utf-8?B?bGNwcXo2dUNhSVZKczkreUk2d1hMRDhFallDeThFeDBmQkNycVJBWVVNV3ZJ?=
 =?utf-8?B?NmprWjNheWdpNjEzaGhDVjNEbWd3K2JwUG1oZjA5Mi9NWXFXOTFGUUJLOFJS?=
 =?utf-8?B?U3Jsd1hFVXZWRVYrUndKSFhkckNiOHpRajBBSU9FZlF3ZS96S2RFTFdKa3Nh?=
 =?utf-8?B?amgwd3JXNG5OcnpmZ3g0QTJ6TlJCbEUrcTF0dkxnYVpJL04yY0RhdE15UEtn?=
 =?utf-8?B?OFJCWmt1dzNCcUxHdklLcUxKc3dkMkZsYytDTWdoUmMxQVZJaEtGTFpOenoz?=
 =?utf-8?B?UkNLSlI0d0tjR1RkRGpzaHF6WTYwUCtEcTB6eEdHYkNkWkRHSWoxS0FXZFFX?=
 =?utf-8?B?Smg1eTdzeWp2bGYweEVsUzZzMXFWRmdFeVZpU1lNQ0FtdHBxaFRPbTBWOXpX?=
 =?utf-8?B?S0RPUHZ2Y3FkNWwrbUhmdjJUelo0QUZwMm5NOHhpT3RSV29tc1FXbWt5SnhG?=
 =?utf-8?B?bU00ejl4TDlsSlJPeXBtbVpudTJRV1RvUmRqZ25IVEE1bmo3dmFBemFSTzgy?=
 =?utf-8?B?NTBUY2NMYS9STnU0QzArVG14eGZ2VlJzbGpRN2padFRWZExodWl3ckpNY244?=
 =?utf-8?Q?0owyOK3ad6xWtf+aiAMPAw0k6h1KiDFI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU9TY3YxUmIvUG9sWEQvaFJURUhVcmhiOUpESTVKYU00KzhhR0JuM3A3WElk?=
 =?utf-8?B?OTEzN2RZOW5VMmE0R3pDQ2RNZHgrV3A1UmdRUXFZbEZEbmtvUC8yWTVrSnE5?=
 =?utf-8?B?Nm85ZXFIRDdyRlRWZEpLK3dxTlhaQ2JHcDlKNW9qc3MzNEcwQ1MwRnJrS3ZC?=
 =?utf-8?B?UlBZTWFQdXJjWGZVUFc5L1dYZW5rdGpvNFY5VEh4WjV6TFV2MW5XdDkvTVUy?=
 =?utf-8?B?UXpvUXNsWG9oMitKdHVLbW9KVW5jSzN3eEZwQ3FpWS9JeWdvU3lQcnBLR3d4?=
 =?utf-8?B?MUpkNmV0RTZBa1hQYjNCdXRxMCt2UnZ6TlRkZnh2ZCtsdHh1aTB4aVpkRHBP?=
 =?utf-8?B?R1ZUclJvTnFBeXh5d0hCQlBHLzkxQjVJWngrcmhWemErZUJ4amsraS9lN1BO?=
 =?utf-8?B?NnJKbTJITy8xc1JDZjVxMWRGelFjczgvdEMyS2RxMmtueHBxNDBNRzFneTdv?=
 =?utf-8?B?TloxeC94UEpzZ2Z6RTEwNWlZdmEzYkxNWHprZTZjYTJSMmkwWkFwWG1YZEZL?=
 =?utf-8?B?dUVEb3luZlg4VTY4YzA3TXJNSkUxbjRzSjlDQ3lQQ0Q4aXRPS0E0WGVabCtv?=
 =?utf-8?B?T0R2NGw3OGNKN1BsWDF1dDhGVVloeSt4Qk41eFdlYzVoR2YreGxEbHlZOTFo?=
 =?utf-8?B?ZkV3akhVSTJqcmpwYlF4VDZJRkNReDRGRk5idXVEdUhrMWd5SGl0aGxLUmgw?=
 =?utf-8?B?aGw3ZS92UHRHN1NPQ2syNGlFejJJeFpvZWRnWlNick83UHJtV25BOHRuTTlz?=
 =?utf-8?B?aVhwQUtNVkRJYUloSHg5eWNoMXdXa2ppQlRDWDRpY1IvLzVWVjhWRitnR2tL?=
 =?utf-8?B?dW5lY2loWlNzNEU2QU1ianFiSzhnMUczL2RaOXUxNzU2QzNvVEZKbGpEMExC?=
 =?utf-8?B?ZHRtcFBCWEZGa2lzNGw0elpReVY4YnAvUWNCSlFpLzcxTkV6SlhZeU9HODZM?=
 =?utf-8?B?MFhkUVc5czNHQXc5UE0rdCtDSnIwZTVDd0hQSkdtQ2RBK0MwYUNmbE10amNn?=
 =?utf-8?B?TUFPbG5Obm5HNWhjZ0dWZmxueG1GVzBsZWY0MEVjalBNaDJzQXR3LzZwWWZu?=
 =?utf-8?B?QmdoMVp5bkpiUkxtbGZpL2xoVGNGRnh2bEtqU0xuVHVFSjJKTnZQN3EzanVI?=
 =?utf-8?B?d3B5UDJBbzEwZFpIb1hBU2M0bTI4VVdSVzBDcmRFWXIwS3I2MDZZUnpZZlR5?=
 =?utf-8?B?SXFiS0dmQUxaNXNrcGlCWXQ3R1dHYzdLSklHNVppWTN4TW1nRWh5T2NPa2FT?=
 =?utf-8?B?M3I1Y0ErdDhOaU5IL3kzeG1nMmlHNzNTYVBqcHB2aFk5MlYyaXN1SVBMbHBS?=
 =?utf-8?B?MHo5YkE1Q0JQQStER0tSdURsclNLNXd5SHBIZmdYb2pZRjM0SEN5VTFTUzdj?=
 =?utf-8?B?eW9IWVZSd2RCNVFiMDBRUG40Zk5XZllmOTBPWkUzcjNQdVNLenRiN0UzMzR6?=
 =?utf-8?B?QWQzTUdXWkVDeUY3RzZlWnFaTy9jY3BnSjQ0cy82SmlHeWNjY3Ewd2x6T2JZ?=
 =?utf-8?B?akYxeHV1ZFNodWxFN3BHcHJJY2JxVThJbXkwNEYyWWx2MStCRzdzQTlDQ0RY?=
 =?utf-8?B?NitocGRTZzBRMTRlTUo4SjN0a1lWMzUwWmFFblR5VW1GTWF4K2ZDektRcElM?=
 =?utf-8?B?YnphNFo4cmVUS1h4NnoySG1CcXM1U0U3TGYrQ0Uwek1oK0tUVTg0L2JSMmZH?=
 =?utf-8?B?M1dFWGZWdWlyVUM2TERHbmlDMG03dmlVUjRVaEtnQVNRSkZvdFQyeU9NUnZO?=
 =?utf-8?B?c2I3WWUzQmJGV25rcFBuUzFxTUVnUmF3NTJUaG01Sm1SRXlsODR2M1ltUkR5?=
 =?utf-8?B?eU0yd1JmeTJLWGQ2ZUxlZVZPei9FbFR2c0s1SHBKWXZ4S2dVelhEdnduK2FQ?=
 =?utf-8?B?L1BxRysrSGJUVndGbHFWSGVKU2FQS3ZrKzJ3dEFrZnNjaFNxbE1RZWx6SExt?=
 =?utf-8?B?S1RSLzNmSkVORCtMeTdNNFhlaFZQWDBNMWdKdlJIbzZsbEZSZkUvdDEyU05L?=
 =?utf-8?B?cms0dUltMEx1RFJFNjk5NjB1MUxyeEs5WSsrRGpEMEVXbGk3bXIzWnRuaEpy?=
 =?utf-8?B?bXVNWjZXaTJqbmNXZE1lbkc4cnAxRkVKZU8vRzJZV3k3dGlLYVNsL3FkQ0Jo?=
 =?utf-8?B?cTBVOVREZ1pGZEZKdStPSnZ3Wm1QQ0FOYkE1cWV1RVdPeWt3YjhIRWFqTlo1?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc666be-39c3-4a02-0491-08de01fa6483
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 21:26:47.6239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c78blo1USGubkjAS4bTBRaKygnKSWiHdBWLWnIoOBQYMRUWj5M86H/0LWDLNqqjeVz1qfyg7TPa/JGTpBjM9XVns5vh7PKMjgeGQujTiu9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4879
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

On Wed, Oct 01, 2025 at 01:35:19AM +0200, Michal Wajdeczko wrote:
> We already have control functions that we use to control the VF
> state on the per-GT basis, but that is low level detail from the
> user point of view, who rather expects VF-level functions.
> 
> For now add simple functions that just iterate over all GTs and
> call per-GT control function. We will soon allow to use some of
> them from the user facing interfaces like debugfs.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> ---
>  drivers/gpu/drm/xe/Makefile              |   1 +
>  drivers/gpu/drm/xe/xe_pci_sriov.c        |   8 +-
>  drivers/gpu/drm/xe/xe_sriov_pf_control.c | 104 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_control.h |  16 ++++
>  4 files changed, 124 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_control.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_control.h
