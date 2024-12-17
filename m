Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858CBE7717F
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 17:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5135B10EA17;
	Tue, 17 Dec 2024 17:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtLUm0K+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751A110EA17
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Dec 2024 17:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734455161; x=1765991161;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ygksxf8U0xnH4WT1u8AwnbRwrn02Ns6KTWGkONKlH2k=;
 b=gtLUm0K+rzRpa4ipKpHM4POrLdFATW0y1DafmYMIBHDI3xc0kxzrySeJ
 eNH7Xocilnjw5uTZht5nDd8G2i3PpWaKWNgVOG/nGvz0cJag088kdPmv+
 /Ssob70PEVuLGxYV12pPvFFVSK52ivk4FbWLERKoQzpQChkgaGASpXH1Y
 kHZqreXOQTsO74Axpbu2oqaenxGzkFjD09Wj+VxXFyUuP1JMCfd7WiZMu
 83mEDyTTgds3lIZLMDw323PkYWY4t7kcg0o+J5fUIhsGNwvoHfCG/BUxB
 IM8ZtKVSvLJVM2UdD0hzDzHPr364ZjTA5TW3Y/xDOhmkwBT2d6FI1kIho Q==;
X-CSE-ConnectionGUID: r6sDpBNuTUuwT3ND7NWDoQ==
X-CSE-MsgGUID: Egq8m8OIRRq4q56RwGshKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45378447"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45378447"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 09:06:01 -0800
X-CSE-ConnectionGUID: Mktb02EgQuOrqvkNfy3ZUQ==
X-CSE-MsgGUID: Q0/k9bnGRZuxmmBVEFQVcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134931020"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 09:06:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 09:06:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 09:06:00 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 09:05:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGfD73SZYKmbpmRjG5h/sIiqndD+5GRGDLip3Mz2XgmfGBfY9HCRIGJU7ujXgJLKy87X/ka7WyNBQaKmuigcYQj9lJPiuhNA1XT5+R5A6DqnXs2C+tRQ8M18vw74fKTZds5JZOcmRSDGT9235NvWBy5MgzbEbS0jveIan/jl7gxGWGvC6TquT0C2T5tcDYbbYGbGdnTtEYd19n7rdm5ZD8gC+1cvMosY+siQTy/mVdK//RWwN+AlGFVtRmtL1sU3zrOF+H2lXonZ2A2PG7vbcn3l3jpjugBEgevzFEKSEj92Mskz0M6WduXnCCJugZJ3dlS1RgbrGxc6DBn9oEYnOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygksxf8U0xnH4WT1u8AwnbRwrn02Ns6KTWGkONKlH2k=;
 b=pa5jp9upirC/398bW3OeSI9cPBvgi6F0KkZ48cXsn0Raae7DuiwQ2QsUqiRvP5ujMX6C1bxp01XRtxXpxOAE0lBYHFzw7NZUVqQaARXXHL3qbIRtaCh0JVQlUMP/cuVonk/tuUZ1oThbKlbGPNYVVKuWA2lQOzfKfmrhWC6H1NlnZ8HzGRYz5pouythDE3L9tULBfJycZlf+NIIYZoxj/EjRb8NRw8kS81ZaXirLozLKJkrXG/rU1vaV8wqkOqKlaFQNCD316s0r2S3+XS3roKYZl4mLKIW1Lm1porrzji/KSpWIjPASMEjsZYFUf7Sw4L/6TCclFTKf3YEnqigiIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by MW6PR11MB8366.namprd11.prod.outlook.com (2603:10b6:303:24c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 17:05:30 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%7]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 17:05:30 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nerlige
 Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: Re: [PATCH 0/2] Fixes for MI_REPORT_PERF_COUNT
Thread-Topic: [PATCH 0/2] Fixes for MI_REPORT_PERF_COUNT
Thread-Index: AQHbUB71nP+06ilvU0qegyuyAk/437Lqq3+A
Date: Tue, 17 Dec 2024 17:05:30 +0000
Message-ID: <86588b9eec3e3b59a30fcd3aae1481dca21a651b.camel@intel.com>
References: <20241217005818.25205-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20241217005818.25205-1-umesh.nerlige.ramappa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|MW6PR11MB8366:EE_
x-ms-office365-filtering-correlation-id: 5cae1de9-45b3-42b1-0777-08dd1ebd02df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R2diR1hjWHpIdlVZdUxRWWtNekV2ZHNubEdObVo1OWM4RFNoYU1lYmFFMDMx?=
 =?utf-8?B?dEh0MkxETWkxckdXKzBkK1NEOEk4RnZYWmtZaXRETE42azUyOXk3TmVZSml6?=
 =?utf-8?B?K0xYdnZlVWg3U1VwT0xIR01aQ1Q1aHEyN1NpS3hnbk5NMkViRW5EcnNNRWwz?=
 =?utf-8?B?ODIxMmRQTXo3VnQ0SUVDMTZwN3M0eGRnQTdwQTA0ayt2ZC9QeWFMQklBcURJ?=
 =?utf-8?B?bHIyMUhjbmRJcVlOdUZkQlVuSjdnQWRLVjlGMXNnOWIydDUxdkZkOUREWEVx?=
 =?utf-8?B?eUs4R2wrZklSQzd3eGVCNkg0eFgxM1Q5VGFDNkwxQVJmQTluM1hNN2t5TnZJ?=
 =?utf-8?B?Z3l5QkMrYm9FR2ZwbGpPbkVRQ3FaVmVZWEhxL2J6TWJBVU5pOGhQWUVGbUtt?=
 =?utf-8?B?UFBnV1JCbzlDeVVnZVVkT2pkVngyaUhEMUMzYWUvUjRUQWVOd2dtc0dJVU1w?=
 =?utf-8?B?Nk9WTHprN1hyTnBCN1F5R1F5aTJhN0RSQ0R2ajUzd0pLeSszWm1XcDduN1Uw?=
 =?utf-8?B?bVFjSFVZYjhTalNFNkE5T3Zla3pYczJJamVSZTlmTzVHRWJ6Q1RaLzErVEd6?=
 =?utf-8?B?d1duOER6OEE3TmhCUCtyZDIrbVhGckZUcDNNMERtZjhqYWhIaHVPMURsL0ky?=
 =?utf-8?B?dzl1TCtRWkVwUXBpY1c3SXMvZW1Xd1Zzd0NiRmgwbzdDc0pvUURCeXliSWN2?=
 =?utf-8?B?ZzN4enhiRVRFelFlaUtnUDhtUkFFYWNoMVovU1VQcjRWVk9oamRwdDRadmhB?=
 =?utf-8?B?SDVTRXlRWjkwMVBYWHRoNmFBUWVQLy8rd0duTzB2clRDcjNoZEU5WWxQcW5F?=
 =?utf-8?B?V281Vk1DcUhsQlJLVmN5T1d3MnI0dElzYnpMbWpFNHhIQVVvODlvN1NERjJH?=
 =?utf-8?B?VUFYVGFKRmpyNWVVQzQzYmt4V0FNSjBwaGcwRUlqTkF5dThjS1hCazdiR21U?=
 =?utf-8?B?eXhWSjNrZTcvR3JGVlRKSUg0bWtGMTdzbThoS1BqdVBOOG9YV29OcWdxZkdV?=
 =?utf-8?B?QmwxSFpCdk1tb1dTaU85elQrRmlWUlBSaGtoWmFsb2lVdVQxRVg3TUVxdEt2?=
 =?utf-8?B?RmJocS9UM0V5ZnlxTXB1b3M1bDNWSHYrY0hSdzN5S3AyNU1ENU5QZmJsWS9j?=
 =?utf-8?B?Q0NzM2tQclNuY0dCYU9IS05yRlp4TkgvOXpaZHdqb3owSVhqUmVxZ2hGam1X?=
 =?utf-8?B?RXd1QlZnSTZrZXVUdjgxZjVwaG42Q3BTc3RLeWQ1R1BhQldjcm5OZXl1Wmh5?=
 =?utf-8?B?OWF2WTJBbmJKR2J3RjIydTF1bDRBWGFLMk5KYVVQOWR1dDRzSitxZ0diN2s2?=
 =?utf-8?B?V1dOd0FReWtESWVLdkRMRzgzaDlVaW1PTlh0djIzQnhyU3hENSthbVc0cHFY?=
 =?utf-8?B?aGJ3bUoyblh6cDNxRnNCdjZtVGRvVEs4RW5HSHA4cTZLcjhJVWZ0dEhFTlBF?=
 =?utf-8?B?dEVPVllBTXlmaVNRSmhRQlhpYXAwS2xGZFZ4TnBHZ29JWXlKL1pXMnRoRWpI?=
 =?utf-8?B?MlpBYmhJN2U5WWl2ZGF1dk9peHkzS0ViaXBlRUV0VDg0T2NrZmJnZEQwaDZE?=
 =?utf-8?B?UVlEcm92UmxsOE94S2p1NUtxSktyZXBEOStyZFNJdmViNFo1bFE3WEkzMlZS?=
 =?utf-8?B?T3JBNEZXU2dkQjllMnUrbVBRckxYamR6Tk1ZZ0lFMzZaQ25QVFE2eGoyYzBt?=
 =?utf-8?B?NVJFQ1RsWW1HeWYvOUd6ZkR0RE5Mc3N1Vmg3RDcyWG42ZGhaL2YyU2hlRmF1?=
 =?utf-8?B?Mzc5NTQ2ZWJkQy9vNUZOYmFLUWVta0FndndISHExTEEwTk1NZXg5eVJNOXVm?=
 =?utf-8?B?K2NsUjhuQVhrYzR5V3pzTXhmVmlxV2ZMSFdhUmlMTUxkbXN5ZUdxZ1FyeDRz?=
 =?utf-8?B?R3JoS0xlSGJVKzA5c0pIWUs3aUpEdjl5dm9nM1pldDlrTmhBdG9jVG1IY1kr?=
 =?utf-8?Q?iM3koPrgYp3ZGBw7daLQMZKC1N50UJcV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1l4a09pN0NuMW1VRkRyWlY2b1RmTE9wYzJPVzZIWjV6OEE4R1E4UktYank4?=
 =?utf-8?B?T0E3WkNCbUZSSEhST21EQmREUVVVL2IzMjNpdklKVlh6enJwSkY1aTJMM2JY?=
 =?utf-8?B?ekJGR2NIcUVMaU9lMzZ5Tlh5VjU1NHdZdDR6OEt0ZWREQVhOMStUNUZpWFJa?=
 =?utf-8?B?OHlzK3kzVzN4M1RITDFtL0lXVEM2MFkvTVZqN2owNzZsc1ZmS05aOXdHNTd0?=
 =?utf-8?B?bWRjRnBRRGRyMVFPNndiV1dLelo0dHR3UDlIVk91eFpJOTl3Rm03c3d6cVl0?=
 =?utf-8?B?QTZScGNKcTJIREpVdlJreVBHUkl6aXJwNmg2Vk1YS3pid0RzeXNaWGFtRVdz?=
 =?utf-8?B?cUNpSC80bzNBbzNMRzFhTytjcTE3SHE5TFQyd3RwVFNDVEdIWnRtYlFjZmtz?=
 =?utf-8?B?QzBjd0QwWmNpNCtwQ3NOWGc3RFJ5L0pPYk5SSFcweVpmN2w0RjFGc1dpMlJF?=
 =?utf-8?B?andjS01NOGtmL29MeDk4ZU4zMTAxUXBWMStPNE5lTTVZdi9KNE1YV21CaCtT?=
 =?utf-8?B?cEhESkJxL3dPVHBsalhIYUJ6VzNnODN5STJ6TWxYL1haUXRtVXUrQ0ZuRnpP?=
 =?utf-8?B?YzJKZ0szVjJHL3VLbzRpYXJrNWtseW03UXZGNGJ6ZlVYNndkRWhjRUwrSVc2?=
 =?utf-8?B?S0JmcnU3MForL09XdjFlZEFIUVR4ZWdBdmFsSzFoZ0dWMjRPbWhOYUYvSnlP?=
 =?utf-8?B?Ky8yUGdkYTRnY3FONnA3am1jVUpSVmdrNzNvU2ZKZ21jRFZFd1ZvUE1LUTI4?=
 =?utf-8?B?czY3WXBBbkRQeGxBdVpsRUtyY0NCYnM3ZU1nRXY5Q2JsOSszWFJjUm81bUlP?=
 =?utf-8?B?RzUwKzAydExHWS9CUkptRVp6UVFncE12R013ZS9MUkJpclh4QWVjeUt6eEp3?=
 =?utf-8?B?dXZDUFRJc21wbEs5WGhHQTk2MU1wQ29PaWRTa1J5S2lveWdKWmIrZGIxcEpU?=
 =?utf-8?B?QnBINklDbk96QVFzT0dxUjZ0OE5MUmVXR3UxVnpVSEI5V0Q5ck9meDFKbEFW?=
 =?utf-8?B?ZURrS284UkFUdWJ6WGVCbWNIdFk0NDlVMFJCWTVta3dndU5QMVBZNldrU1Qy?=
 =?utf-8?B?Rm5xSFowNmI0OUozZC85cVV5U2tRaTU0UE9xUTc3bnNRdndZU2JySTVhQlFN?=
 =?utf-8?B?b2taVjVDV1lKMEtkeGdnUmtBUUhqbUJUQkl6dkpudTNON0V1NTVBZm5YTzJm?=
 =?utf-8?B?UXhqRjlWbTMxQWp5a0hFaHRDdm5IdnVTWHpJdEJFclBJZlJZTCtsL0VXNS9o?=
 =?utf-8?B?Wm5iVkpyMUlmUFN1NmJpWG45ZlAyeU5WeTJLem9xc25lYVF1T0hwc2RvL1BY?=
 =?utf-8?B?U0Vhc2gxMDZkQ3FvN21BZkR0Z3J1UEhMcHMrbTZSQ3Z3bjlZOTdCamVHdkxp?=
 =?utf-8?B?MGVXbU8wUEtkbWFzNWl0RkkzblZuUmdtWnR5QmpMWDBjZXl4SVNxNms5TGox?=
 =?utf-8?B?clpBbVJYT1V1VndYQXhBejRveC90M0R5MkYzb0dEWVhac1hjckxaNm40MGF4?=
 =?utf-8?B?RFFDS2tMazk0c1AvcEk2VnkwMldtbmY0U0xGMFpFKzQzenBpa2pvNDhVRlZK?=
 =?utf-8?B?U1dTWlc5Z2hKY2ZqRVRZNk4rSHFwMUtvTVYzREJKbU13Uzg2dGJ3eUFqMTh1?=
 =?utf-8?B?bndDaVdWSmhVMmlpM1YxN08wUmpmMDVlMS9paVlzMmJpaENhbHJVK2xvYVlV?=
 =?utf-8?B?M1VJSEFxQ3VlWDMzUTQ1eXBBbm5rQlYxU0s0ZEtLT2ovVzk0bERnbS95ajVw?=
 =?utf-8?B?RHJidzhCSDlKckhPRUU2T0l5d0FydU95MFU5cEF1eTFmVk9YTFZwWHArRXdQ?=
 =?utf-8?B?dE1SR0VLUnJRUWZJWVFWRHpxdXFBS2xRNEQ5UGFMRHowWi9sQnVWVUM2M2Qw?=
 =?utf-8?B?ZEJwREQyUllMZnAvK0NZTnFRV2NTenB6amlhaHNUU09QTVM2L0lqYXlSb2Jw?=
 =?utf-8?B?cXdRc0Z5THVYeUl6aHF3SFdaUkd2WUFLQ1VkL214UDVRaHhGV3VrMU55Rmho?=
 =?utf-8?B?UXBxK1l4bnBQMk0zRWVnUjZrQVZvcnFSNjVxU3ErcUdMcDVUSi84TFNLbWw5?=
 =?utf-8?B?d0lQVklFL29RTlY1Rm82UXJnV2JjVjk5NFV5L0NuM0FMZG0zMndBVEYzNHNq?=
 =?utf-8?B?NVcvYkdNQUtHWG81c3E4SWhoUkxUQnZCQ1B3NFE4R0FhUFhUdDNDdVZWcjZs?=
 =?utf-8?B?Y3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F7DA4253C43D04DB200FA75079EB7A5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cae1de9-45b3-42b1-0777-08dd1ebd02df
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 17:05:30.1995 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hipu61Zr15lDgYwgwbWwW4BXz7vldLRh34y9ZmHwZw2LxYOFWHFS/dTVc2taT2kvVzmd0ngsydcd0r12tKah4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8366
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

T24gTW9uLCAyMDI0LTEyLTE2IGF0IDE2OjU4IC0wODAwLCBVbWVzaCBOZXJsaWdlIFJhbWFwcGEg
d3JvdGU6DQo+IE9BIHByb2dyYW1taW5nIHNlcXVlbmNlIGZvciBxdWVyeSBtb2RlIG9yIE1JX1JF
UE9SVF9QRVJGX0NPVU5UIHJlcXVpcmVzDQo+IG1vZGlmeWluZyBzb21lIEhXIHJlZ2lzdGVycyBp
biB0aGUgc2FtZSBodyBjb250ZXh0IGFzIHRoZSB1c2VyIGV4ZWMNCj4gcXVldWUuIFVzZXIgcGFz
c2VzIHRoZSBleGVjX3F1ZXVlIHRvIHRoZSBPQSBpbnRlcmZhY2UgYW5kIE9BDQo+IGltcGxlbWVu
dGF0aW9uIHN1Ym1pdHMgYW4gTUlfTE9BRF9SRUdJU1RFUl9JTU0gdG8gdGhpcyBxdWV1ZSB0byBt
b2RpZnkNCj4gdGhlIHJlZ2lzdGVycy4NCj4gDQo+IFRoZSBPQSBpbXBsZW1lbnRhdGlvbiBzdWJt
aXRzIGEgYmF0Y2ggbWFwcGVkIGluIEdHVFQgdG8gdGhlIHVzZXIgZXhlYw0KPiBxdWV1ZSBhbmQg
aGVuY2UsIHNvbWUgcGx1bWJpbmcgaXMgYWRkZWQgaW50byByZWxldmFudCBjb2RlIHRvIGVuYWJs
ZQ0KPiB0aGF0IChhcyBwZXIgc3VnZ2VzdGlvbnMgZnJvbSBNYXR0aGV3IEJyb3N0KS4NCj4gDQo+
IHYyOiByZXZpZXcgcmV3b3JrDQoNClRoaXMgc2VyaWVzIGZpeGVzIEdQVSBoYW5nIGhhcHBlbmlu
ZyB3aGVuIGNsb3NlIE9BIHN0cmVhbS4NCg0KVGVzdGVkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNv
dXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVW1lc2gg
TmVybGlnZSBSYW1hcHBhIDx1bWVzaC5uZXJsaWdlLnJhbWFwcGFAaW50ZWwuY29tPg0KPiANCj4g
VW1lc2ggTmVybGlnZSBSYW1hcHBhICgyKToNCj4gICB4ZTogQWxsb3cgYSBHR1RUIG1hcHBlZCBi
YXRjaCB0byBiZSBzdWJtaXR0ZWQgdG8gdXNlciBleGVjIHF1ZXVlDQo+ICAgeGUvb2E6IFVzZSBN
SV9MT0FEX1JFR0lTVEVSX0lNTUVESUFURSB0byBlbmFibGUgT0FSL09BQw0KPiANCj4gIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9vYS5jICAgICAgICAgICAgICB8IDcxICsrKysrKysrKysrKysrKysr
Ky0tLS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jICAgICAgICB8ICA1
ICstDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfc2NoZWRfam9iX3R5cGVzLmggfCAgMiArDQo+
ICAzIGZpbGVzIGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQ0KPiAN
Cg0K
