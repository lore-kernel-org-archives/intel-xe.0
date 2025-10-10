Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66740CCA476
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 19:13:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA4410EC7C;
	Fri, 10 Oct 2025 19:13:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g60koT/N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE19C10EC7C
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Oct 2025 19:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760123631; x=1791659631;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dvWEUTRVunn2/+hw3YUl8KaKoLKSMx2SvmkPlOCzt3I=;
 b=g60koT/NQcAWlYsdKP5cLCbAunXa7VzL5NGvD89IdgnOcyrb5pVmsgrP
 sbSV66lhskIDwY7+jnrxI1KwdbofumVBsC+VCf0a0q6NtgPYZMgE1BhR9
 Tf4L+Zh947loa0SyjmPaLCbnIfjRp+T1c8CV7nXjuMDwy6bOy2Trh/OOs
 zCxQ2lBtP1NZq8MDG9UwU0rSHkJX7fg4NX17jYHeuRjFijmTCz3Qt2jcc
 edc1cI3stoaKlT7tUbSWNzx+CP8omJXoBPsoUj99RdVsd6QhC13oLpcUF
 6C9KiLLz1emPbF6MuWdbQbIuRN61Ibp2vvBL7iQYOTQd3Ek0y+aHTm1Os Q==;
X-CSE-ConnectionGUID: /fzM5q9+SDSjeAjGpnuLng==
X-CSE-MsgGUID: RCi8ophhQVmdqhFYolxDTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="64969666"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="64969666"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 12:13:50 -0700
X-CSE-ConnectionGUID: PciEhvZ1Q/iXhrEc9DULHA==
X-CSE-MsgGUID: wgnHO5uDSYeBiUcTxvEwcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; d="scan'208";a="181060454"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 12:13:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 12:13:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 12:13:49 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 12:13:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSxEWPDvjfwVsXI0b/a2Fp+t3O/rzVD2S2d2fbiqi18LKBUflwHioXSMwg3wWx3r80x9e9lLTVvvFQAab+LFHwaePve75V8e6ZhF9jDDXSVAELqJETaUDag7Jf93Ddss/VI3lCgAdMh2mC96mcwGyWhG3lItcQFJvKF2AmVu5m/iP9TL9SrfgK7nsUJSjYyKKT7QEQfj4aJuNTGkmxER08uVxadmkXBRPjc9tuvLV4dSXKIpzv3tuDk+f2EWt3dZ9N/b1QFJTTTa4fpBip0DOtUF/HT3ZZ3wBmDQe8s8g1nL4QVidDiNkmI/fq3BGZo4eFvNUY9h9OuuCfj1d7hmtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+vxV+FyNnrFwPOLo/azdU3L7t3Jli7ZF6H9gLbF5y0=;
 b=sdT7jLI5HcbUKelw8wWabxxB4sV24ssVO86N1bPXzPIaaZDkvTnnRm4FgHhgthx5usyUCQE3d2ivA/M2126CefIpB9Gz16Ntw7enQSoJL3BXr7euiZb+Mi8zsDlQ73cQpp4S/ihv0k+hMRjJlT8UZurFPgTtfb/4yXcG9qOAdQPHmNz9A65rOq5hkrNAX8m770X5/OpnM4oevqt8DRH01Jd7aPPqX2qJuXyHPSedP3wTRYVwSJog8KH22D9S1BndCXCAuLicp++XuzYee036NQXW9p8+APosKeoLmrlvJJDVcFEB9fO5mBOU444ZNE7xQ9wRQB0U0Ai7g8hG7FuhRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB8785.namprd11.prod.outlook.com (2603:10b6:208:599::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 19:13:46 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 19:13:46 +0000
Date: Fri, 10 Oct 2025 15:13:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v5 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aOla52pB_vhhMm9B@intel.com>
References: <20251008101145.11506-5-satyanarayana.k.v.p@intel.com>
 <20251008101145.11506-6-satyanarayana.k.v.p@intel.com>
 <aObsmCaIbrSgHrvd@lstrano-desk.jf.intel.com>
 <aOex-1E8yBlGFbwI@intel.com>
 <aOfeoWV87W+Gt6HH@lstrano-desk.jf.intel.com>
 <aOgAXul_Az3JLC0V@intel.com>
 <aOgDrJhtrEqgpAJk@lstrano-desk.jf.intel.com>
 <20251009230638.GF1207432@mdroper-desk1.amr.corp.intel.com>
 <08b2f77e-5db7-44ea-834a-b38739bef4aa@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08b2f77e-5db7-44ea-834a-b38739bef4aa@intel.com>
X-ClientProxiedBy: BYAPR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::38) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: 7865fb0f-88c5-42cf-7b06-08de083122cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wm9uUEFpekptUlJTUEk1VStndnBkTUtkSGpaaVgrclZQVk84NzJXMklRR1gr?=
 =?utf-8?B?L2c5K1d1TGR6NHdwSFAvWVpYblRxK3lza3A5YzdINVFCbm9rSHhkUFUwUHpJ?=
 =?utf-8?B?c3h1TkVFSTNSb3dmZDhoVm9TdEp1cm5JaThIL3dyU29jNmVRbFpGUkJiRGlh?=
 =?utf-8?B?bFdjWDBRRTRhNVI1OFhXUWF4YjFEeHJNaUlQaCsxM29zc3lCd3NsbnY3cGpn?=
 =?utf-8?B?SnZQMmlUN3JMNGRlWHY1NUE0U0Rza0hwYW5sWTZTMmJVM21OclYzNVBGeGVp?=
 =?utf-8?B?QUgzd1liVXVPbkNndk1QYmwyVEpERWtlZ0NEd0dzTkQrWnFRRFhTZzNna3Vh?=
 =?utf-8?B?MlU3MGpSZ21lK3huMEE3TXBBdUZ2akFMMDV4RlZsdVJndUVrRnlrdElyWHpX?=
 =?utf-8?B?cUpRc1dYTXNiOGF2ZW42endCbm11WlNsWWxnT01JaXErY2IwaU1SdjU4L0pa?=
 =?utf-8?B?Vk9QaXVaemtUaDhLRmUvRzdMU3N3UHRPSHJuOU1WZlUrNGQ2SnFGUDdVcmp5?=
 =?utf-8?B?d0xNSGZYTEFPL0FCdG5KRGlhWXNOZ05UOEJBbW44ZWlweXFXRWFkNEdKUjR6?=
 =?utf-8?B?VUJhLzFKMFpHcGt0SzZFdnpndis5eXUzRTV1SzBPWWJqTkJ2NTduY3lxMUh3?=
 =?utf-8?B?cjV0UDNoNFptNjRUQ1hXUG5DRHFtdDFRWk4zZDl2a2pEclBTcVZGYXcwVExs?=
 =?utf-8?B?RmRaN3pqYUlTOTBqWDgrblpUMzRDbEhZam5LUXZ6aytlcjNoVHI2ODlIeWth?=
 =?utf-8?B?ZWN3RUZVTzBtU2NtNEtobnFGdEloSjBWSTNybVVySmY4Snd5RzB4WkE2b011?=
 =?utf-8?B?Rmhpa201RHZxS0Q5dWpoUnB6WkRxQzRxZHVzVDVLajcyREVqZ1o1M0Z5dHc3?=
 =?utf-8?B?M3dFRVp2QXFoNjAyNEx5QkZ3TE1YY3dPam5mNzQyS2tsUXFoZkxoQUk2YlFw?=
 =?utf-8?B?L01JbmpLbUgrenhtaCt0V3kwM3lTZU03OEZlRTBFbWc0ekpTVDhJeXZ1YStP?=
 =?utf-8?B?dlZGM1hlVEdpMkZMaDFvd2pnUjEyZUVTWXVnbGc3S3RRZTRGT1U2ZUxxZnlN?=
 =?utf-8?B?RzVFb2MxekJ6VThsVjF3dEdkUDZiQ3ovU1V2SCtkVk5OSE1XWlVSVll5ekZN?=
 =?utf-8?B?QmxHSXFNaVdtdUIzVStxc1IxSXR3VVJhTHJaYm1xbkVzdExreUhnMVZDdm5s?=
 =?utf-8?B?UnR6R1JKS0dzQzlXSHlmb3o5R1dZb3BiMVJQZWEzSnNvMGZsaThOWm5IMzNp?=
 =?utf-8?B?aG9JSUM3VjZQb3ZxdG1iN0I0eHR2SWhYZTgwaWZqbW4vVVFFQ1poZTRDR25x?=
 =?utf-8?B?Um1YdzVDRlpnQzFTVGRlbWVKWjEreXRmeEoxMlB6SVF6TFN1TlpSNzhSUnVm?=
 =?utf-8?B?ZFViMmF2QVdiRDFja25VT2wvem83dzY3eXkzUDhGNSt2eXhnUWF3RTI3RWhF?=
 =?utf-8?B?R3poUTlGSFAvY25Cek9IVll6azJsSlVJR3Q3NXlwdGFMb3A0c0RLVnhqWG11?=
 =?utf-8?B?VnQ1MTgwaDZObE04SlVSREJocy9YL0o4Mzdzd3JKbUovaW1wUk42STk5NVVT?=
 =?utf-8?B?UGk4Y1o3MGFRbnp5MS9FM0FPOVFDRzNGY3Rmall6Vy9VRnliUzEyZnlOK1Nz?=
 =?utf-8?B?cUp4MktuSERRK1FZQ0g2WjM3cmVQSEtFSmNVZENmMjlqVS9vTUY4dzlCNXEy?=
 =?utf-8?B?K3Y4bWRsY0s0UnBoQU1ETmJOdWFwVyt2ZE9vZzBOUEhRZi9NeWNvQnFIb0xF?=
 =?utf-8?B?SjRzZXFJQ21KUGdQNGZVMUUxdDhWdjBWZFowZUZ2UjlSMWJVVnBraTZTS0NX?=
 =?utf-8?B?OFRtcnorcS9RTU9Xb3RJajMrdDM2K0VwRlhpbWZVeGZnY2pJc3hIVGwrakVk?=
 =?utf-8?B?NDlQK25uM3FmNTJSYzFRam5UT0R4VnZyaUl1QnZxRXBIdUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0pUcFd5WDh5cUVsN3NxVXZBRWRpRmRnSDZYY3owMWpCYjBTWGFPVE1JenpJ?=
 =?utf-8?B?V3RaUVI0dCs5NXRFOGFJUTgrRm9FNGMyQzlDcEJGa2xtNEdQUmlRRDVjTEt2?=
 =?utf-8?B?V2xLdHJqQWZxQ3czVzNqOGgxT3BReXJRSHV1TTB4TGxENG9yQm9VT01Sd3hj?=
 =?utf-8?B?VjJubkN6TE8vRHBUNmtCeEFlUXVxalZ4Tm83UGJxRGVrZnh4aW8xV3F2V1hN?=
 =?utf-8?B?d0pkT1V2TmtwN3U1REI2OFZNaUJ0WDlUUlI4dnpGNUVzL2k5ZE1TaFdFV0xx?=
 =?utf-8?B?ZVNSajhIdjFUZzRIczZSU1JoaDhQTUdBSG5ZYXRHQTJFN0hkYW9LRzh3N2Fn?=
 =?utf-8?B?MHdWOExNOE9hSFVUbjMzWHN3cDJwUHBxbVBNKzJ2U1JQc0w4YXJWbHNNQllP?=
 =?utf-8?B?VHJYTGtmZ2RqazIxNzBuZWN2NzVBbm9kZFlHVDcveVpXUDZES0ozdERFUUNP?=
 =?utf-8?B?OWRKT0gxT09TVW5ZZ1RYMlBXNUZ2RFhGcTFENmo1bk5PU3JiNUpXVmxYSk9G?=
 =?utf-8?B?dEQ1NjUyY3dyLzlFZjR2NFcvdG1rSFhKOVJERjRlV1ZBYTlBOW43NzErK0s5?=
 =?utf-8?B?eko5T2NJVmlPOHQ1cTdXQTRIMmZYem5ldTBLbWVpM0VtOElXVUM3U1E1S1M4?=
 =?utf-8?B?NFp0NjdFaTFxcWdkMytGRFplSFg5MWhtc1MwUGVqSWMwK3grTTd2OXFaWFh6?=
 =?utf-8?B?RzVob0xtM0dpQ0s2N0s5ckM0Q094UW5tSSt6b25YWkYvWjN2M0hNTmdmK09v?=
 =?utf-8?B?U3haSDFDNHVwTHBtbVFaeHZ4U3h0dmVLZzRIakhIWFZNUnJFSmoxeFJyYk1t?=
 =?utf-8?B?RERBMVF4TFNtUWtpVGF4RzVpS3I5a01Jbk1SVWpaZE9JVktVNTFodThsQjlF?=
 =?utf-8?B?ZUMzT2dNcUlwVzY1SENaeU5QamRMbGo1R250elIrMEZCQUE5MGowMFA0Qysw?=
 =?utf-8?B?bWNjWnRNclpRR3VWS3Z4Y2RFQWxhZ3ZDVFhOME1ydytrVHI3UkFoakVxRUVu?=
 =?utf-8?B?N2IwOUI4dk1VbEtPVndkMXRObldyQ3RsSUJEUDR4MGRLdUhBbWNSaUR6NzhG?=
 =?utf-8?B?OU1ZVlZtY2VxY0dIb2Npd2pUTUcyNEwxYjFocU1QS2RNUXZiaHI0QkUwaFJo?=
 =?utf-8?B?b1BIWnJRSGFJTlVpZi9tK3hlL3Z1cngvbUNKcVBmNEZMR0dwTytXQ3F6eXUz?=
 =?utf-8?B?MUZNZWVjQWU4U1p4QlVJQ096dVJvVktlMlFFM2VUWkNzS0JjRjllNWY2bTVB?=
 =?utf-8?B?VXphWDdTcUR6N25IdTU4dG5zS21Bcm5TbWlIWm5MSmNxdStPMEFzQnRzdGxs?=
 =?utf-8?B?V0hwM2JVQSsvWTE4TGZGM1ZKd2hNS1FXUmZzdjE5M2JBVDFkd2JQelhxVzFQ?=
 =?utf-8?B?UkhET3ZjaG0zcjhES2dIblJ1TU1rcWlPZzFia09Wa09STVNTU3l1MThEakhj?=
 =?utf-8?B?SW1XNmNuTDJId0lLSVp6MzJ2cmlMWGVLRXBvcUJXQlBORDZQN3NZMXV2Q0Vs?=
 =?utf-8?B?LzlvRklXcHZ0bWNIMXU4cTh3WnFud0ZYcnBFRFdyMkJYOExDWUUzTHgxQmI5?=
 =?utf-8?B?dE5WVERSaGVuT1pGODVvK0Naam1CWm1nTWtzeDRDV2doUTlNM29zWFV3TFZQ?=
 =?utf-8?B?MXF6MDdiSzNsL1NKQkFOTWUvWFNqcTd4WVVpVGtwMnZ2NFVYZTJVM0RkeGZn?=
 =?utf-8?B?UzFLL0FHOU9OM0EyM2tRY0kyY3FELzY1UXBlRDRvUGE3QlRYWkhoV0xUZ3Qy?=
 =?utf-8?B?b0FKajgyb1l3cU9MQmVqOVdiMkFHT1dkSXZjaTZWck45ME14KyttVmdZVC9w?=
 =?utf-8?B?ODdvbW84cHR1SS9rQUUzOHEwT2FPaTd6eUF5alYrVm5KMzZObEREQ2dQdklH?=
 =?utf-8?B?a1VyblNDZlFWUmxmRHJ6YlRVRWtmZ1E3OFNRZUVteUhFRW5KRFkxNFNpS0xD?=
 =?utf-8?B?bnVjZUJyZFRMUWpDR28vdGpxWTZ1REE1bzQ0VGtvN1ptbURMVjFWWGhZdFlW?=
 =?utf-8?B?QnJYQjhrV3FRQlJkZlFoTEhIVlQrU1ArNXdNYU9yZ0pydHlBZmV0Z0c2K2Fa?=
 =?utf-8?B?bnZIWkdvUGVnOEN0YzBqZlR4RHhPbDJhanVHaHZJWU9jVEQxUHh6TWVZRTFJ?=
 =?utf-8?B?STlnS0lzOGo5a2UwOVp4dzVVOXZsQ212aW9XSlRRUFNML0tHTGlnVlNxNUs5?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7865fb0f-88c5-42cf-7b06-08de083122cf
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 19:13:46.5511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6pslfmNJbi4H2vFeZBKHIvVHYYI5KHsys8/X4ue/QdmpjnyGgcXByqBRm5OWpga00G7wEjW+F4eURmOopsoAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8785
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

On Fri, Oct 10, 2025 at 02:11:52PM +0530, K V P, Satyanarayana wrote:
> 
> 
> On 10-10-2025 04:36, Matt Roper wrote:
> > On Thu, Oct 09, 2025 at 11:49:16AM -0700, Matthew Brost wrote:
> > > On Thu, Oct 09, 2025 at 02:35:10PM -0400, Rodrigo Vivi wrote:
> > > > On Thu, Oct 09, 2025 at 09:11:13AM -0700, Matthew Brost wrote:
> > > > > On Thu, Oct 09, 2025 at 09:00:43AM -0400, Rodrigo Vivi wrote:
> > > > > > On Wed, Oct 08, 2025 at 03:58:32PM -0700, Matthew Brost wrote:
> > > > > > > On Wed, Oct 08, 2025 at 03:41:47PM +0530, Satyanarayana K V P wrote:
> > > > > > > > The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > > > > > save/restore while this sequence is being programmed, partial writes may
> > > > > > > > trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> > > > > > > > instruction to write the sequence atomically.
> > > > > > > > 
> > > > > > > > Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> > > > > > > > 8 dwords instead of 5 dwords.
> > > > > > > > 
> > > > > > > > Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> > > > > > > > chunks.
> > > > > > > > 
> > > > > > > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > > > > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > > > > 
> > > > > > > > ---
> > > > > > > > V4 -> V5:
> > > > > > > > - Fixed review comments. (Matt B)
> > > > > > > > 
> > > > > > > > V3 -> V4:
> > > > > > > > - Fixed review comments. (Wajdeczko)
> > > > > > > > - Fix issues reported by patchworks.
> > > > > > > > 
> > > > > > > > V2 -> V3:
> > > > > > > > - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> > > > > > > > - Updated emit_flush_invalidate() to use vmovdqu instruction.
> > > > > > > > 
> > > > > > > > V1 -> V2:
> > > > > > > > - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
> > > > > > > >    (Auld, Matthew)
> > > > > > > > - Fix issues reported by patchworks.
> > > > > > > > ---
> > > > > > > >   drivers/gpu/drm/xe/xe_migrate.c | 93 +++++++++++++++++++++++++--------
> > > > > > > >   1 file changed, 72 insertions(+), 21 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > > index c39c3b423d05..b629072956ee 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > > > > > @@ -5,7 +5,9 @@
> > > > > > > >   #include "xe_migrate.h"
> > > > > > > > +#include <asm/fpu/api.h>
> > > > > > > >   #include <linux/bitfield.h>
> > > > > > > > +#include <linux/cpufeature.h>
> > > > > > > >   #include <linux/sizes.h>
> > > > > > > >   #include <drm/drm_managed.h>
> > > > > > > > @@ -33,6 +35,7 @@
> > > > > > > >   #include "xe_res_cursor.h"
> > > > > > > >   #include "xe_sa.h"
> > > > > > > >   #include "xe_sched_job.h"
> > > > > > > > +#include "xe_sriov_vf_ccs.h"
> > > > > > > >   #include "xe_sync.h"
> > > > > > > >   #include "xe_trace_bo.h"
> > > > > > > >   #include "xe_validation.h"
> > > > > > > > @@ -644,18 +647,49 @@ static void emit_pte(struct xe_migrate *m,
> > > > > > > >   	}
> > > > > > > >   }
> > > > > > > > -#define EMIT_COPY_CCS_DW 5
> > > > > > > > +static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
> > > > > > > > +{
> > > > > > > > +#ifdef CONFIG_X86
> > > > > > > > +	kernel_fpu_begin();
> > > > > > > > +	if (size == SZ_128) {
> > > > > > > > +		asm("vmovdqu (%0), %%xmm0\n"
> > > > > > > > +		    "vmovups %%xmm0,   (%1)\n"
> > > > > > > > +		    :: "r" (src), "r" (dst) : "memory");
> > > > > > > > +	} else if (size == SZ_256) {
> > > > > > > > +		asm("vmovdqu (%0), %%ymm0\n"
> > > > > > > > +		    "vmovups %%ymm0,   (%1)\n"
> > > > > > > > +		    :: "r" (src), "r" (dst) : "memory");
> > > > > > > > +	}
> > > > > > > > +	kernel_fpu_end();
> > > > > > > > +#endif
> > > > > > > 
> > > > > > > Everything in this patch LGTM but I think we maintainer input to ensure
> > > > > > > we are breaking some rules about inlined asm code in a driver (no idea
> > > > > > > if this exists) or if a better place would be somewhere common. Can you
> > > > > > > ping Lucas, Thomas, or Rodrigo and ask them about this?
> > > > > > 
> > > > > > Well, it is possible and we have asm code in i915 for instance (i915_memcpy.c)
> > > > > > 
> > > > > > But the rule does exist:
> > > > > > https://www.kernel.org/doc/html/latest/process/coding-style.html#inline-assembly
> > > > > > 
> > > > > > "don’t use inline assembly gratuitously when C can do the job. You can and should
> > > > > > poke hardware from C when possible"
> > > > > > 
> > > > > > In this case here, please explain why exactly memcpy with smp_wmb barriers and
> > > > > > or WRITE_ONCE code combined couldn't solve it.
> > > > > > 
> > > > > > Also, please explain how exactly vmovdqu guarantees the atomicity promised by
> > > > > > the commit message. On a quick search here my take is that for this 128 or 256
> > > > > > bits, atomicity is not guaranteed.
> > > > > 
> > > > > I don't think cache atomicity is what we're after here—rather, it's vCPU
> > > > > halting atomicity.
> > > > > 
> > > > > Consider the following case:
> > > > > b++ = XY_CTRL_SURF_COPY_BLT;
> > > > > b++ = addr;
> > > > > 
> > > > > If the vCPU is halted during the instruction that stores
> > > > > XY_CTRL_SURF_COPY_BLT, the address will be invalid. The GuC executes the
> > > > > batch buffer (BB) that is being programmed as part of the VF save. This
> > > > > will clearly cause the BB to hang due to a page fault on the copy
> > > > > command.
> > > > 
> > > > okay, perhaps this is what is getting me confused most
> > > > what I don't understand in the flow is: why GuC is already
> > > > executing it or going to execute it while you are going to a halt when
> > > > writing the command to the buffer?  and not writing to the buffer first
> > > > and then sending it to the exec queue?
> > > > 
> > > 
> > > It how this feature was architected, will send over SaS link of the list.
> > 
> > I'm confused by this too.  At the point we're filling in the
> > batchbuffer, the GuC isn't aware of the batch at all yet as far as I can
> > see.  In xe_migrate_copy(), we've called xe_bb_new() to allocate a new
> > batchbuffer, and then we start calling emit_* functions to poke
> > instructions into that buffer.  At the point we call
> > xe_migrate_ccs_copy(), the hardware still isn't aware that this buffer
> > exists, so it shouldn't be possible for it to start executing.  Only
> > later on when we eventually create a job for the batchbuffer (after
> > we've finished emitting all of the commands) should it be possible for
> > the hardware to start executing this.
> > 
> > If there's some other *future* changes (not present in the driver today)
> > that change the design such that we allocate a batchbuffer and tell the
> > GuC it's free to start executing it, but only fill in the contents after
> > that point, then that needs to be clearly explained in the commit
> > message.  But that also sounds like an fundamentally racy design, so I'm
> > not sure why vCPU would be the only situations we'd be running into
> > problems.
> > 
> > 
> > Matt
> > 
> HI Matt,
>  Please refer to xe_migrate_ccs_rw_copy() function which just creates BB and
> it does not submit job. The idea here is that, we have a sub-allocator which
> is already registered with Guc and the function xe_migrate_ccs_rw_copy() is
> allocating BBs from the sub-allocator.
> When the vCPU is paused, GUC automatically submits these BBs to HW. So, we
> are making sure that the BB always contain valid GPU instructions so that HW
> will not report any page faults while executing.
> I will share the SAS for this.

The SAS sharing doesn't help. Please ensure that this flow is documented
in the patch itself with some comments. I didn't see this in the last
version. Also ensure kunit is passing.

Thanks,
Rodrigo.


> 
> -Satya.
> > > 
> > > > > 
> > > > > If the entire XY_CTRL_SURF_COPY_BLT is stored via an AVX instruction,
> > > > > then either the GPU entire instruction is written or none of it is. I
> > > > > believe vCPU halting guarantees that a CPU instruction is either fully
> > > > > executed or not at all—regardless of how many micro-operations (uOPs) it
> > > > > decodes into. If this guarantee does not hold, then the entire
> > > > > architecture of CCS save/restore on PTL is fundamentally broken which is
> > > > > always possible.
> > > > 
> > > > Okay, this is guaranteed. I mean, the vCPU won't get halted in the middle
> > > > of the vmovdqu nor vmovups. only before, between, or after them.
> > > > 
> > > > But is this uncached and/or coherent? isn't there really any possibility that
> > > > the command finished, but GuC mid-flight executing things aren't still
> > > > seeing different cachelines?
> > > > 
> > > 
> > > The GuC won't start executing until vCPU unpause on the save flow.
> > > Restore flow is bit more tricky as vCPU are live when this happens but
> > > we can W/A that race in software I think. That part is not in this
> > > series.
> > > 
> > > > > 
> > > > > > 
> > > > > > So, imho this patch is introducing a unmaintainable, complex, and fragile code
> > > > > > that is not even doing what it is claiming to do. But I will be glad if someone
> > > > > > can challenge this and prove me wrong.
> > > > > > 
> > > > > 
> > > > > Let me know if the above makes any sense.
> > > > 
> > > > Okay. But how to handle cases where AVX might not be available? really not needed?
> > > > 
> > > 
> > > This iGPU feature for PTL so shouldn't be an issue as PTL has AVX
> > > instructions.
> > > 
> > > Matt
> > > 
> > > > > 
> > > > > Matt
> > > > > 
> > > > > > Thanks,
> > > > > > Rodrigo.
> > > > > > 
> > > > > > > 
> > > > > > > Matt
> > > > > > > 
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> > > > > > > > +{
> > > > > > > > +	u32 instr_size = size * BITS_PER_BYTE;
> > > > > > > > +
> > > > > > > > +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> > > > > > > > +
> > > > > > > > +	if (IS_VF_CCS_READY(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX))
> > > > > > > > +		memcpy_vmovdqu(dst, src, instr_size);
> > > > > > > > +	else
> > > > > > > > +		memcpy(dst, src, size);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +#define EMIT_COPY_CCS_DW 8
> > > > > > > >   static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > > > > > >   			  u64 dst_ofs, bool dst_is_indirect,
> > > > > > > >   			  u64 src_ofs, bool src_is_indirect,
> > > > > > > >   			  u32 size)
> > > > > > > >   {
> > > > > > > > +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> > > > > > > >   	struct xe_device *xe = gt_to_xe(gt);
> > > > > > > >   	u32 *cs = bb->cs + bb->len;
> > > > > > > >   	u32 num_ccs_blks;
> > > > > > > >   	u32 num_pages;
> > > > > > > >   	u32 ccs_copy_size;
> > > > > > > >   	u32 mocs;
> > > > > > > > +	u32 i = 0;
> > > > > > > >   	if (GRAPHICS_VERx100(xe) >= 2000) {
> > > > > > > >   		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > > > > > > @@ -673,15 +707,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > > > > > >   		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> > > > > > > >   	}
> > > > > > > > -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> > > > > > > > -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > > > > > -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > > > > > -		ccs_copy_size;
> > > > > > > > -	*cs++ = lower_32_bits(src_ofs);
> > > > > > > > -	*cs++ = upper_32_bits(src_ofs) | mocs;
> > > > > > > > -	*cs++ = lower_32_bits(dst_ofs);
> > > > > > > > -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> > > > > > > > +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> > > > > > > > +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > > > > > +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > > > > > +		  ccs_copy_size;
> > > > > > > > +	dw[i++] = lower_32_bits(src_ofs);
> > > > > > > > +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> > > > > > > > +	dw[i++] = lower_32_bits(dst_ofs);
> > > > > > > > +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> > > > > > > > +	/*
> > > > > > > > +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > > > > > +	 * save/restore while this sequence is being issued, partial writes may trigger
> > > > > > > > +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> > > > > > > > +	 * write the sequence atomically.
> > > > > > > > +	 */
> > > > > > > > +	emit_atomic(gt, cs, dw, sizeof(dw));
> > > > > > > > +	cs += EMIT_COPY_CCS_DW;
> > > > > > > >   	bb->len = cs - bb->cs;
> > > > > > > >   }
> > > > > > > > @@ -993,18 +1035,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> > > > > > > >   	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> > > > > > > >   }
> > > > > > > > -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> > > > > > > > +/*
> > > > > > > > + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> > > > > > > > + * save/restore while this sequence is being issued, partial writes may
> > > > > > > > + * trigger page faults when saving iGPU CCS metadata. Use
> > > > > > > > + * emit_atomic() to write the sequence atomically.
> > > > > > > > + */
> > > > > > > > +#define EMIT_FLUSH_INVALIDATE_DW 4
> > > > > > > > +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
> > > > > > > >   {
> > > > > > > >   	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> > > > > > > > +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> > > > > > > > +
> > > > > > > > +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > > > > > +		      MI_FLUSH_IMM_DW | flags;
> > > > > > > > +	dw[j++] = lower_32_bits(addr);
> > > > > > > > +	dw[j++] = upper_32_bits(addr);
> > > > > > > > +	dw[j++] = MI_NOOP;
> > > > > > > > -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > > > > > -		  MI_FLUSH_IMM_DW | flags;
> > > > > > > > -	dw[i++] = lower_32_bits(addr);
> > > > > > > > -	dw[i++] = upper_32_bits(addr);
> > > > > > > > -	dw[i++] = MI_NOOP;
> > > > > > > > -	dw[i++] = MI_NOOP;
> > > > > > > > +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
> > > > > > > > -	return i;
> > > > > > > > +	return i + j;
> > > > > > > >   }
> > > > > > > >   /**
> > > > > > > > @@ -1049,7 +1100,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > > > > >   	/* Calculate Batch buffer size */
> > > > > > > >   	batch_size = 0;
> > > > > > > >   	while (size) {
> > > > > > > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > > > > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > > > > > >   		u64 ccs_ofs, ccs_size;
> > > > > > > >   		u32 ccs_pt;
> > > > > > > > @@ -1090,7 +1141,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > > > > >   	 * sizes here again before copy command is emitted.
> > > > > > > >   	 */
> > > > > > > >   	while (size) {
> > > > > > > > -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > > > > > +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > > > > > >   		u32 flush_flags = 0;
> > > > > > > >   		u64 ccs_ofs, ccs_size;
> > > > > > > >   		u32 ccs_pt;
> > > > > > > > @@ -1113,11 +1164,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > > > > >   		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > > > > > > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > > > > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > > > > > >   		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > > > > > > >   						  src_L0_ofs, dst_is_pltt,
> > > > > > > >   						  src_L0, ccs_ofs, true);
> > > > > > > > -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > > > > > +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > > > > > >   		size -= src_L0;
> > > > > > > >   	}
> > > > > > > > -- 
> > > > > > > > 2.51.0
> > > > > > > > 
> > 
> 
