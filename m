Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAABCAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 18:24:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9995310E13B;
	Mon, 22 Sep 2025 18:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HND02Bx0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC4F10E13B
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 18:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758565451; x=1790101451;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Ha2P0El9HlN4RF8sslD1sSHhcZNXbpQTpgrytfUVLAs=;
 b=HND02Bx0WziUn6VFXLLvMuF87XriOSFTQZd0q+XOPYr3Q4j8VSQ3yMvT
 vR9McbJPsKA//67wOiFj8dx3hV4r+dWGzw542AS5DV+XTZQLQ3rwUZZaC
 DG3BBj2nuvjFLTg2iSiDvRgeJiJViK7G83VtpPd5em9DD1JPdmuJYD3qD
 KIImxRYIXrdAed6UBUA97HbNQcZS2pDn15hteBaF0FieWlCSfmBFFpdPi
 R/XDUV15XGFl/dWKbr4IXCOtM6OVxsTLpifd6/r6VzxEFHO3u3b/v5FVz
 4pVOxm/s+YkU0QUUKQfeK+qm7RWuAUxkNZu+kT6rL+vSTYTJAd0yULjCN g==;
X-CSE-ConnectionGUID: 9yw8QcfRS8K4wiO/+mD5BQ==
X-CSE-MsgGUID: bEo7Fo3xTqG/eAUY30ixUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71942592"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="71942592"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 11:24:11 -0700
X-CSE-ConnectionGUID: 0hD6QOQSQDinabjC43qINA==
X-CSE-MsgGUID: qKoiex5DSBe6/SQlx0FqPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="213698041"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 11:24:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 11:24:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 11:24:10 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 11:24:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IF0RtMYYV5LdGIzCOXS0N2YEGboVn3i8tr9ua7h2XjKnjPEP0qzyvJY2dlAFzkJsu1jRVS6N+eXNyZ0XEAluBHzQ6wKyrCLEdU0/aGhh6/RGS0mnNRQyXRzmWz0dRY/oP9P+92FWqjLUgq84K2TG1BPPw+UMNSehg+K2zWYZs1dGTQb0dskWQ8ZKB0VfyvnafKJwWNMz61207kyzuTN+01aY8wvurao5UWMyx2N6PJ9rerGtcKsH0kp8F5otldLAR/lIlYWXjSM1gwdQrakWcoe8//P7MDYenI7xWJZHRwssPLL+siACitixnWFapb3m483gIagmx/hSAm39S5ds+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRdl+ABe4ahfcSQLvNnHCV8H/UTJWfs/zavhOlNr+Sg=;
 b=PD495+DuOz6ZI/E0vDO1E83VvRY+fZloYZdCOtq8ztoyGO5UXRCYsGflkh8IoTD715YkeVfQAjXF8StOHFnbNFalfLsDnzdem8/ZEJEL0nsHuAbTscDCBQ/Q4T0VPkeCZoy8f35kJpfJOYtqPEXhZ4r2jCO6W3DHzbQmMs90VbGnw4fGI9Ifu8COD/Zp76axLiQAisam5rvW2IdvPYfepO/WXuDcTdAlvYqwND08hEzERiaNtPpMVsQvvuk5l4y9zU6McFuUxryBGMRzyKrp3yqtS4djYJVY+phJs2KuiQPzNndum/y1cwsJ3OYkuHxyXT3A1YV2IDWpgFEjWV4ztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MN0PR11MB6208.namprd11.prod.outlook.com (2603:10b6:208:3c4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.17; Mon, 22 Sep
 2025 18:24:07 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9137.017; Mon, 22 Sep 2025
 18:24:07 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250918211319.603324-6-matthew.d.roper@intel.com>
References: <20250918211319.603324-4-matthew.d.roper@intel.com>
 <20250918211319.603324-6-matthew.d.roper@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/configfs: Add attribute to disable GT types
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Mon, 22 Sep 2025 15:24:03 -0300
Message-ID: <175856544316.2439.1266660399029330345@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::17) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MN0PR11MB6208:EE_
X-MS-Office365-Filtering-Correlation-Id: cff0e19f-cff9-4b2f-8fc7-08ddfa0537c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUtlVndFRFNCaFdmekd4NkFBN1lONWt5ZHdnWlJXTm9YNUV6TnpZZ1AyR1RX?=
 =?utf-8?B?UzhzRWR4aDNkMmtXSjExbjZFTVpieEQydkFrMllROHcwQ0VFQ2JMMzJyeDZN?=
 =?utf-8?B?UVNLOTVaOWZ1dEhhWmU3RzBDWENxa3kzZzNlVHNPc3hpSkhaeDE1Y0JKeDhY?=
 =?utf-8?B?S252bE9IT2NLOHRMNWpLQ1cxeTQ2MkpneDRBdG1QVG5jaFNvYnJ4VGQyMnBU?=
 =?utf-8?B?Q0lUQlJ2SHVWK2crbjZ0U2h5cmRLaE9VbFR6VmM2bGJNaXZ2cU8wYjQreUtJ?=
 =?utf-8?B?TWxldHB2MnZ6aUtyeUZjbFJ2T3lHKzFqZGo3S01Wc3Npdll5S0tyaU9QZGtr?=
 =?utf-8?B?c1lPMnB3SEFkWkRHc2FEL3pHaGlCeXdudXRjVmlWZ0t3dUkzUWZVSE9DSjhX?=
 =?utf-8?B?dG4rQzhid1hhNTdmRHhLaFh5QjdFZzFGanBjbi9WSFNQZU8vcnVwT3BlOU5Y?=
 =?utf-8?B?eUMyNEtrVEJXREp2QWlzWUtJQUtNUFlQYTd6Qjg2K2JRU1BUQW5Fc1JZRGFz?=
 =?utf-8?B?NThrTFlxUzJzZG5kUkRWNGNwNC9PSmhSelhKbUZxeUlDSERtVXpSUE5LUDZ5?=
 =?utf-8?B?U1RCb0dCOUlObjQrc0pMKzc3MC9wanNsWTBBNEI2UkEvRDhPMlVhTHJzNFRz?=
 =?utf-8?B?bnV4aTZ5aU5rM2JBN0g1bDE2YlNCSHVxaXpTYTRjNEw5UnVwYWlCZVNkU2JZ?=
 =?utf-8?B?bmZNZDVZUkJ3OUp3alhxTE9tbkF1M3doNGp6b2xUa2pESWJiZklBTkxMOHY3?=
 =?utf-8?B?VHF5RnNkY2hPdi81RXFMeHdzaVAyVERJQ2c2K0NSdkE4aTh6T0hIckwzZnc5?=
 =?utf-8?B?bENRZDY2QXlweEdlNWZGVlVkenRYSTBlOWtxbUh1WlIrQ1BHdW5BV2Q0eXUw?=
 =?utf-8?B?d29LSWwvb0Q3cHVGU1VIUXErdllIa1crdFc4dFhmalhFOXhEb3pOaHBXem1n?=
 =?utf-8?B?bHVrNGFvM2FKaGEzRjFIanFoVWlBRFQ0UkQ3dlJCZ1JObVIxNGhhQzJKNVJG?=
 =?utf-8?B?dXFRVUw4cExScVFJc3dDUUFzYkdBK0Y3NTNtcFFDRzZ5K1Y0TEN4amZNbDB5?=
 =?utf-8?B?dklXcEtFTEwrZGcxUElPN3FWY3FZZVoweDlkV0FGVUZ0U1J6S052dEdmczhF?=
 =?utf-8?B?NzAzUUlnYzRZdDBFTDR6VUZGKy9xMmFtWG03SXZMc1FZR2JZMVpJU1VMK2o3?=
 =?utf-8?B?MWJFT0t5R1lObDI1N2c0dUI2amZNYVk3dEhnZ0FtQlZUbFVPSnVXOHNReHc1?=
 =?utf-8?B?NVZZOWlVb3NvOFFKVVNkTFcrd3h1ZWVaZU01SFJsQ2w4bVlxTjFoczNPUlds?=
 =?utf-8?B?R2o0ckdPVlFnYlEyT1plNUp0NEY4MWlhNnBIRm1PZ09RTi95bjA3RkhWRjVY?=
 =?utf-8?B?UjVaSms2NVJtZzF0eldSUTF3S0pMcWs2MU05L3h3L01lQnFnaEd4UzYwZHVh?=
 =?utf-8?B?bVVVSG45cmRGSyt4b2FFZ0R5MHRrWXNjS3lCN250WWhaMEc3a1lQcUQvUDd1?=
 =?utf-8?B?OHZ0VE9aeEhkTFVjc3A5YmRFNzJYRUNheVpRdVZKbWZmbzFvVlI2M21jMUJO?=
 =?utf-8?B?UFBrbWVRcndFL2g5RFJ0SjFXeE5DSnQxSFg3MDVDR3p4RXVTbkZYbjZNemN3?=
 =?utf-8?B?MFRaRWo0c1VlK25kYnVCenl4cWRDLzZOVENVSzcyR0ZjNDFmNDlrWXJDU2Rr?=
 =?utf-8?B?Rm0xY1pOZXNZRVBNdzN3K0pZRnNROUIxWWxPVjIyR1hQL3I2OFpxN25Tdm95?=
 =?utf-8?B?bTZnV2RsUHkzQksxeUVRR1dsYkhqTS9SMlU2NnhEdS9CaTNCUFRGbXNmZlNR?=
 =?utf-8?B?citERW1zRXcycjM2RFhNWG1UalFTalV4Qi93UktzNkVUTklCaG1DSmIvNmNL?=
 =?utf-8?B?YklrTDRqUXZWQmRuNWh6Qjc4NUt4NUJvTVcxd3BXYnRXMGtHeXRZV1dNZW5n?=
 =?utf-8?Q?0zIHxvRuvss=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkpQWXlIdE1Td09QSnpnMTZITmlabDN3dXNreTBmVjVvWHRDaERvMksyWll5?=
 =?utf-8?B?bldmQzJTaGVlcGh1MVNQbkFHQXROcXI4aWZzWHc0ZFozald6ekhjbTBTVmxM?=
 =?utf-8?B?ckVFVmZYdnNTNkFoOGZMTWNTYWZxZkF0dUMxQTFIQUtvdjIwRDJBWk5xeHo1?=
 =?utf-8?B?YlZtT1M3dWZDMUFKbWZIb2lBOVBvd3Ria0pQWTRNUGVmSEphUHdoZG1ScUNl?=
 =?utf-8?B?WmtIZ21CUzJHajZYeFhpaWV0aW9lWmdDVFVQRDlaeEVSMVBHdVZ6ZGZseFVB?=
 =?utf-8?B?d0xRNjJydi9YeGlRM3pUb3Raam5pMllYNFN1S0tXRXYyYy8yaDZ2V3kxaHNS?=
 =?utf-8?B?STZKSFhtbFBkRUF0NUVWRzNRem5VU1JnaWhHU2pudWJITTRtaUluQ1ptNUty?=
 =?utf-8?B?MERSZHJXbExwTTQ2WjVuQmM0WnZSWUI5Y1BxRloxT0o0dkQzUXl3M2t0NUor?=
 =?utf-8?B?MmRZRHJIMVZKOVMzQWFSblJYQUpWdlVCclFWVW1sc3M2c01ZQVhNWFNsQ0Ro?=
 =?utf-8?B?MXUrYmZ5dnRKSy90TmV6emYwdUJPeEMvWldRN1UzN01PdW1lQzR1NklCSUtn?=
 =?utf-8?B?c01PK0k0UnVnZ0lFNHdhM3FGdGs5bTkvY1NGdGY5TDNUZ2JRUC8wcUNIS2dw?=
 =?utf-8?B?dFRMZzd2b0pBMHZDb05jREwyWERRNXI4ZXFmRnBWSm1KV2t6K1NYMUZ1K0kw?=
 =?utf-8?B?T3lLeTM5aUtDYVl2NURWY25mby92ck1OZnhLVlpQK3VOYjk2VlRXL2wxeE84?=
 =?utf-8?B?N01sdS9SY0tZdHIzNzFUNGFqN09VZzA2NjVYQjg3UHU1Z3dlcXB5Q2FZMGlL?=
 =?utf-8?B?ZUloekxPY2dyUEpicXZjSXdDdGlNTVBXL2lhU2xrT3FBbkladXV1Z2RsWnkv?=
 =?utf-8?B?OUFSRlZNdXhKUWg1Wjkzb0NuT0w3dVd2dlBGbHVIOUd5RTJyV0ZuckNuTVVQ?=
 =?utf-8?B?eXJIckUxTnYvNkpnNFl5YzZGVDFaa2ZaR1EvbFE0LzV1NE9Ob3NIck9LUzBM?=
 =?utf-8?B?azFDK3hRTlNjWGVpU2xKSnpuUlQyTHlSTWFHeVoyZmY0OVpQbWl3NThkZ05O?=
 =?utf-8?B?eWZWQk5lUm9SR25GNHVQOE9WbWRNd0FYVmQ5WWhRdUJKVFMrazZuNHp3MmpI?=
 =?utf-8?B?aEZ1ck9GM2RodGZ5QmFpa0N1RUlsaGtuSDNTSENLaCthQW9GTkpmWVZOdUdP?=
 =?utf-8?B?d3JDbnZkazNhNEVlQmY1cERlMHovVEZYa2ZCcE5NRGkzQzAvak40VERTQm82?=
 =?utf-8?B?NkVWQXZzQ2VrOEM2MTBRY0VQMGltWE1XTGUzVm5zQ0d2c0tjS3pRZHFxTDRP?=
 =?utf-8?B?aGdYZDFKUHNFZVhTMGZJMTRQSzFFa09ET2JQNHloVlp2OXl3ajRFOEFNdUhT?=
 =?utf-8?B?TnR4eUhKcTBpdXloaTF5YW1ySzFzMVVKL2lNcm1jd0V1OVV0akpjTHFZRGlr?=
 =?utf-8?B?cEtWQlVZT0pWcUI2WUE0bTY3RS9mZ1V6U25LdFloTmErelBERzA1NHNNeTZ4?=
 =?utf-8?B?bE00NnI2RFJSSkpDcUhBcEZPdXBDUmtzL3hnY3d0UWIwa05FZkVWdi85aEZH?=
 =?utf-8?B?TzFkbDNtNG1ZbVN2UHVUK0RZTzRhUGFua0dBNHNsMEpTbjFvZDB0Qys4YjN2?=
 =?utf-8?B?MDFRVEVFcUYxaTh6cm4vcjZ2b21JUUN2Y3dFdFQ4Q21QTHo0OWxXKy9ZbUt3?=
 =?utf-8?B?NVZQWGhDeWsxenFuTXJ5TjFVSmpzNU1zYnZTZEZ2RHd3NFN4ek1qNlBjWHk2?=
 =?utf-8?B?aC8zaDJURjBVYkVHckRJbjk0Wml2WjFxUm9WcUQyZEttNTlqejg3K2lBdFNn?=
 =?utf-8?B?ekZGV0JrWmc5NW1MNXU1cFV5cEcwUjZUZ0Z1a01FQ0VCTjMySWRPVUpUekkv?=
 =?utf-8?B?ZDF5dDh4K05iZ1ZGdng4K1hEZkRlTUZacXBUTzZQV3dBeTV6Uzh3Y1FqRGZs?=
 =?utf-8?B?OGIrT1hVNFlJMFFZWXY3ZEhmQ0ltWFM2aHc5dHdEUzQ3NUxQT2dhQjQ2OHZE?=
 =?utf-8?B?eHp4VEVSM1ExZTY3SHFvempQcEtSU1FWUlJZcU9vc1pZSkVQdWg0SWpaMWZV?=
 =?utf-8?B?OUdhMEpvOUloNy9PRlBaeFF3a3NpQzZRUzByb1VBdE9zYVBVVGFPbWM2T05h?=
 =?utf-8?B?K25KZDRzNFh2RGJxU1JNMDArQmd1WHFsbnFib1htNHFLWG83VDNDd0Q3NTRZ?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cff0e19f-cff9-4b2f-8fc7-08ddfa0537c9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 18:24:07.6219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTrg5VS92pp0PCV3vdD2whrMdeoocwiOCQ1NKOCyCucfUSR/MrA7FClkx+77TIuYzyv+mn7S7O/Nf5S+F10LWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6208
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

Quoting Matt Roper (2025-09-18 18:13:19-03:00)
>Preventing the driver from initializing GTs of specific type(s) can be
>useful for debugging and early hardware bringup.  Add a configfs
>attribute to allow this kind of control for debugging.
>
>With today's platforms and software design, this configuration setting
>is only effective for disabling the media GT since the driver currently
>requires that there always be a primary GT to probe the device.  However
>this might change in the future ---  in theory it should be possible
>(with some additional driver work) to allow an igpu device to come up
>with only the media GT and no primary GT.  Or to allow an igpu device to
>come up with no GTs at all (for display-only usage).  A primary GT will
>likely always be required on dgpu platforms because we rely on the BCS
>engines inside the primary GT for various vram operations.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_configfs.c | 119 +++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_configfs.h |   2 +
> drivers/gpu/drm/xe/xe_pci.c      |  18 +++++
> 3 files changed, 139 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_conf=
igfs.c
>index e52808e3199f..c675994439d4 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -13,6 +13,7 @@
> #include <linux/string.h>
>=20
> #include "xe_configfs.h"
>+#include "xe_gt_types.h"
> #include "xe_hw_engine_types.h"
> #include "xe_module.h"
> #include "xe_pci_types.h"
>@@ -54,6 +55,7 @@
>  *        :
>  *        =E2=94=94=E2=94=80=E2=94=80 0000:03:00.0
>  *            =E2=94=9C=E2=94=80=E2=94=80 survivability_mode
>+ *            =E2=94=9C=E2=94=80=E2=94=80 gt_types_allowed
>  *            =E2=94=9C=E2=94=80=E2=94=80 engines_allowed
>  *            =E2=94=94=E2=94=80=E2=94=80 enable_psmi
>  *
>@@ -77,6 +79,40 @@
>  *
>  * This attribute can only be set before binding to the device.
>  *
>+ * Allowed GT types:
>+ * -----------------
>+ *
>+ * Allow only specific types of GTs to be detected and initialized by the
>+ * driver.  Any combination of GT types can be enabled/disabled, although
>+ * some settings will cause the device to fail to probe.

I think it would be nice to have a short description of input/output
formats. Something like:

    Writes support both comma- and newline-separated input format. Reads
    will always return one GT type per line. The supported GT types are
    primary and media.

>+ *
>+ * Examples:
>+ *
>+ * Allow both primary and media GTs to be initialized and used.  This mat=
ches
>+ * the driver's default behavior::
>+ *
>+ *        # echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_=
types_allowed
>+ *
>+ * Allow only the primary GT of each tile to be initialized and used,
>+ * effectively disabling the media GT if it exists on the platform::
>+ *
>+ *        # echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_=
allowed
>+ *
>+ * Allow only the media GT of each tile to be initialized and used,
>+ * effectively disabling the primary GT.  **This configuration will cause
>+ * device probe failure on all current platforms, but may be allowed on
>+ * igpu platforms in the future**::
>+ *
>+ *        # echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_al=
lowed
>+ *
>+ * Disable all GTs.  Only other GPU IP (such as display) is potentially u=
sable.
>+ * **This configuration will cause device probe failure on all current
>+ * platforms, but may be allowed on igpu platforms in the future**::
>+ *
>+ *        # echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>+ *
>+ * This attribute can only be set before binding to the device.

I think this line could appear before the examples.

>+ *
>  * Allowed engines:
>  * ----------------
>  *
>@@ -127,6 +163,7 @@ struct xe_config_group_device {
>         struct config_group group;
>=20
>         struct xe_config_device {
>+                u64 gt_types_allowed;
>                 u64 engines_allowed;
>                 bool survivability_mode;
>                 bool enable_psmi;
>@@ -139,6 +176,7 @@ struct xe_config_group_device {
> };
>=20
> static const struct xe_config_device device_defaults =3D {
>+        .gt_types_allowed =3D U64_MAX,
>         .engines_allowed =3D U64_MAX,
>         .survivability_mode =3D false,
>         .enable_psmi =3D false,
>@@ -157,6 +195,7 @@ struct engine_info {
> /* Some helpful macros to aid on the sizing of buffer allocation when par=
sing */
> #define MAX_ENGINE_CLASS_CHARS 5
> #define MAX_ENGINE_INSTANCE_CHARS 2
>+#define MAX_GT_TYPE_CHARS 7
>=20
> static const struct engine_info engine_info[] =3D {
>         { .cls =3D "rcs", .mask =3D XE_HW_ENGINE_RCS_MASK },
>@@ -167,6 +206,14 @@ static const struct engine_info engine_info[] =3D {
>         { .cls =3D "gsccs", .mask =3D XE_HW_ENGINE_GSCCS_MASK },
> };
>=20
>+static const struct {
>+        const char *name;

I wonder if it would be good to use name[MAX_GT_TYPE_CHARS +
1] here.  That way we get warnings if the strings don't match the
expectation.

>+        u64 type;

Hm... I would have gone with the enum type here.  Any specific reason we
chose u64 here?

>+} gt_types[] =3D {
>+        { .name =3D "primary", .type =3D XE_GT_TYPE_MAIN },
>+        { .name =3D "media", .type =3D XE_GT_TYPE_MEDIA },
>+};
>+
> static struct xe_config_group_device *to_xe_config_group_device(struct co=
nfig_item *item)
> {
>         return container_of(to_config_group(item), struct xe_config_group=
_device, group);
>@@ -229,6 +276,55 @@ static ssize_t survivability_mode_store(struct config=
_item *item, const char *pa
>         return len;
> }
>=20
>+static ssize_t gt_types_allowed_show(struct config_item *item, char *page=
)
>+{
>+        struct xe_config_device *dev =3D to_xe_config_device(item);
>+        char *p =3D page;
>+
>+        for (size_t i =3D 0; i < ARRAY_SIZE(gt_types); i++)
>+                if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
>+                        p +=3D sprintf(p, "%s\n", gt_types[i].name);
>+
>+        return p - page;
>+}
>+
>+static ssize_t gt_types_allowed_store(struct config_item *item, const cha=
r *page,
>+                                      size_t len)
>+{
>+        struct xe_config_group_device *dev =3D to_xe_config_group_device(=
item);
>+        const char *p =3D page;
>+        u64 typemask =3D 0;
>+
>+        while (p < page + len) {
>+                size_t typelen =3D strcspn(p, ",\n");
>+                bool matched =3D false;
>+
>+                if (typelen > MAX_GT_TYPE_CHARS)
>+                        return -EINVAL;
>+
>+                for (size_t i =3D 0; i < ARRAY_SIZE(gt_types); i++) {
>+                        if (strncmp(p, gt_types[i].name, typelen) =3D=3D =
0) {

I think we are allowing values like "pri", "me" etc in p to match
gt_types[i].name here.  Is that intentional?

>+                                typemask |=3D BIT(gt_types[i].type);
>+                                matched =3D true;
>+                                break;
>+                        }
>+                }
>+
>+                if (!matched)
>+                        return -EINVAL;
>+
>+                p +=3D typelen + 1;
>+        }
>+
>+        guard(mutex)(&dev->lock);
>+        if (is_bound(dev))
>+                return -EBUSY;
>+
>+        dev->config.gt_types_allowed =3D typemask;
>+
>+        return len;
>+}
>+
> static ssize_t engines_allowed_show(struct config_item *item, char *page)
> {
>         struct xe_config_device *dev =3D to_xe_config_device(item);
>@@ -342,11 +438,13 @@ static ssize_t enable_psmi_store(struct config_item =
*item, const char *page, siz
> }
>=20
> CONFIGFS_ATTR(, enable_psmi);
>+CONFIGFS_ATTR(, gt_types_allowed);
> CONFIGFS_ATTR(, engines_allowed);
> CONFIGFS_ATTR(, survivability_mode);
>=20
> static struct configfs_attribute *xe_config_device_attrs[] =3D {
>         &attr_enable_psmi,
>+        &attr_gt_types_allowed,
>         &attr_engines_allowed,
>         &attr_survivability_mode,
>         NULL,
>@@ -513,6 +611,7 @@ static void dump_custom_dev_config(struct pci_dev *pde=
v,
>                                  dev->config.attr_); \
>         } while (0)
>=20
>+        PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>         PRI_CUSTOM_ATTR("%llx", engines_allowed);
>         PRI_CUSTOM_ATTR("%d", enable_psmi);
>         PRI_CUSTOM_ATTR("%d", survivability_mode);
>@@ -563,6 +662,26 @@ bool xe_configfs_get_survivability_mode(struct pci_de=
v *pdev)
>         return mode;
> }
>=20
>+/**
>+ * xe_configfs_get_gt_types_allowed - get GT type allowed mask from confi=
gfs
>+ * @pdev: pci device
>+ *
>+ * Return: GT type mask set in configfs
>+ */
>+u64 xe_configfs_get_gt_types_allowed(struct pci_dev *pdev)
>+{
>+        struct xe_config_group_device *dev =3D find_xe_config_group_devic=
e(pdev);
>+        u64 mask;
>+
>+        if (!dev)
>+                return device_defaults.gt_types_allowed;
>+
>+        mask =3D dev->config.gt_types_allowed;
>+        config_group_put(&dev->group);
>+
>+        return mask;
>+}
>+
> /**
>  * xe_configfs_get_engines_allowed - get engine allowed mask from configf=
s
>  * @pdev: pci device
>diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_conf=
igfs.h
>index 1402e863b71c..eddb66201edf 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.h
>+++ b/drivers/gpu/drm/xe/xe_configfs.h
>@@ -15,6 +15,7 @@ int xe_configfs_init(void);
> void xe_configfs_exit(void);
> void xe_configfs_check_device(struct pci_dev *pdev);
> bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>+u64 xe_configfs_get_gt_types_allowed(struct pci_dev *pdev);
> u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
> bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> #else
>@@ -22,6 +23,7 @@ static inline int xe_configfs_init(void) { return 0; }
> static inline void xe_configfs_exit(void) { }
> static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
> static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pde=
v) { return false; }
>+static inline u64 xe_configfs_get_gt_types_allowed(struct pci_dev *pdev) =
{ return U64_MAX; }
> static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) {=
 return U64_MAX; }
> static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { r=
eturn false; }
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 77bee811a150..f065b8ea5673 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -668,8 +668,21 @@ static int xe_info_init(struct xe_device *xe,
>         const struct xe_media_desc *media_desc;
>         struct xe_tile *tile;
>         struct xe_gt *gt;
>+        u64 gt_types_allowed;
>         u8 id;
>=20
>+        /*
>+         * It's not currently possible to probe a device with the primary
>+         * GT disabled.  With some work, this may be future in the possib=
le
>+         * for igpu platforms (although probably not for dgpu's since acc=
ess
>+         * to the primary GT's BCS engines is required for VRAM managemen=
t).
>+         */
>+        gt_types_allowed =3D xe_configfs_get_gt_types_allowed(to_pci_dev(=
xe->drm.dev));
>+        if ((gt_types_allowed & BIT_ULL(XE_GT_TYPE_MAIN)) =3D=3D 0) {
>+                drm_err(&xe->drm, "Cannot probe device with primary GT di=
sabled via configfs\n");
>+                return -ENODEV;
>+        }
>+
>         /*
>          * If this platform supports GMD_ID, we'll detect the proper IP
>          * descriptor to use from hardware registers.
>@@ -761,6 +774,11 @@ static int xe_info_init(struct xe_device *xe,
>                 if (MEDIA_VER(xe) < 13 || !media_desc)
>                         continue;
>=20
>+                if ((gt_types_allowed & BIT_ULL(XE_GT_TYPE_MEDIA)) =3D=3D=
 0) {
>+                        drm_info(&xe->drm, "Media GT disabled via configf=
s\n");
>+                        continue;
>+                }
>+

Shouldn't we do this before updating gt->info.engine_mask (where gt is
the primary GT)?

--
Gustavo Sousa

>                 /*
>                  * Allocate and setup media GT for platforms with standal=
one
>                  * media.
>--=20
>2.51.0
>
