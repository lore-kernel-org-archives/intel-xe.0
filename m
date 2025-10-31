Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF006CCFA00
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 16:41:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD9410EBF1;
	Fri, 31 Oct 2025 16:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FcVJc0um";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EE910EBF1
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Oct 2025 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761928873; x=1793464873;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WOX9VJLFVFtXS471OX7QlTYfG/lf0ex1nNhUxQstWRA=;
 b=FcVJc0umV1hZ7fAEsed1jKdaRHr0rj71sL/TsOAVqF746cmJEcfhlKDu
 z0Tfpl5yxQO2I1YnJ9iONj1ItZPI3qQ0yBAep62R5stCPWdCoC2RPtK0s
 7IdrhnWBiUZh71X1bQvIV4cLCA2Zb/Y/AZOOW18Zyp/KaHgZ+tlwjNJYE
 wStU3TBgaUuwBa9KTn/Hy8zK6ixQilf+dlD1JuxEQPRpZMvF/hR7lDdva
 QJmHdKczhA640EQsZsxldhOH2qXBCVJs11iy6KjZOf9kefLK++EVVuZpw
 7A9Wjl7XwHlnmckGnzoze51ZL69slBMA1dO8LSH8zAZiw4BEos2Gmij33 Q==;
X-CSE-ConnectionGUID: z4bZtWNXTsaeOLq+J8hb6w==
X-CSE-MsgGUID: MrfDvW0BQ2ys/uzdd1RQng==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67931888"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67931888"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:41:13 -0700
X-CSE-ConnectionGUID: lcwYtcBqSHy9CZ+zSWjGcA==
X-CSE-MsgGUID: DRnf7Xz+QoaRZRWn0MijUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="185940490"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:41:12 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:41:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 09:41:11 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:41:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbWpCOXneFzAZAG6VHVKIW1ryPeem9y40T953m8oRSTdOnmK585EDqDGu5VH5v4xMIGLf54ixlPp3n0sk8dJaBRU0p78DDqFlbi/37a5Wh38Z07QZ0AuY8vg5neEo4sQJHbb0X/MXng7n9S9ggrS5pjhb1APkZOfKpTqbh29gqAr2Je3dUHW239hAh28uUalXL2SC3VRMs8oL87uErP4M19h2xW54JrqAjc3zXTuskOP6lL8O1Oa9xIRkdwdnSAaVV+bwKSkXZ6otuSBXDSDUauh4S6VGxxGxzKsUbkow8+sY6SygyfZfjh3Mk3VEJJq6Rob8b9lHMHQ9jDUy+BL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKZdfyCrGHlA93vwCR9rUeBxYenavU2bFQigifH1uHo=;
 b=begTXTZihbgYU6vXHRndAmMSU5LAjcFUd9hGhoyI9YokheveD1p4NiLkvci5ADlP5Jq4qheTf1nIVuncq1pyW3/1aD6M/XkWNtsd7JMQRnw0XYb4C2T4FP3+LyFqeq+zxU0EGv/WdutnbnVEC4tUhUowz6933lZLNODNv4oErVL8IaWKkXREaUuaRZtCh+Dx1tT8hlkVhr5R6LyOhBY4JBBRPesdFj5KD3arkXxOJib3QIlFqxntZfAq6tC1yXz7YHNvpuxzp3s5TGyyMIeytYpBPUT796TRMlpG8WVHS0v6Z/XwI3+8iJ9MeuoPh0D4i26THrcdCSKtKTWAE9L3bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7501.namprd11.prod.outlook.com (2603:10b6:a03:4d2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 16:41:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Fri, 31 Oct 2025
 16:41:09 +0000
Date: Fri, 31 Oct 2025 09:41:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <stuart.summers@intel.com>
Subject: Re: [PATCH v3 1/7] drm/xe: Stub out new pagefault layer
Message-ID: <aQTmo3yHnPEmfxHl@lstrano-desk.jf.intel.com>
References: <20251028035843.2488613-1-matthew.brost@intel.com>
 <20251028035843.2488613-2-matthew.brost@intel.com>
 <aQS6hgtqWvaIglr_@fdugast-desk>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQS6hgtqWvaIglr_@fdugast-desk>
X-ClientProxiedBy: BY5PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d7a9e06-4db5-4ae8-c375-08de189c4b96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SEdIWFdSSTZJRnRTT2I1U3FqUy9qYXlhekYyRStuL0tqWHNIQUJhbXQ0dDly?=
 =?utf-8?B?dzBXbldYNmE0WFFOUGJMUjNXT0VXNjdUSlpZZjkzckZ5MlJoeVdERURFbmlG?=
 =?utf-8?B?OS8wNHpTaUo0RVFyTkdQY0hBa0w3V1RGV284bGZvVlp6WEovL2NDMG5jYXQz?=
 =?utf-8?B?T0pZTFBvbE9qMjlQYUVlY2kxUS9XRmNObExtNHg2eXJhL0wrQWd0b3FBVzkr?=
 =?utf-8?B?bUg1eUFRNENIZERhVmlNUncyV0hubFQwZTlIenJ4bXFaV0xNNnFKVWtsa3E2?=
 =?utf-8?B?ek91L1dLMWY5c25EU3k2eC9MZjFHUWNhUU5Ua3FsalNmaVVvZFJuUUpNaGYr?=
 =?utf-8?B?amZGTDdVR3BXeGIzaHA5NDJOc25VakRjT0I1VkFRdnFWdHRxSTBFM3p0M3dJ?=
 =?utf-8?B?UklNcjU5RWVqQ1kxRCthY2ZBN01vdmlEbmgyaGtpZGoxOEZFM0F2ZC9keXpi?=
 =?utf-8?B?dkpXalZsL08wK1c3S1JZektrdVpaQml2K3ZPVVZjT0tYYStJNU5tcnJaZXdr?=
 =?utf-8?B?QjdYU0RoK2FPRC9WNlAyYVBLbGpvNktlQlY4L0pnN2pSc0s1aWdPNHNYRE9H?=
 =?utf-8?B?eWZZWVdlMzROS1hHVnlYUmVUTVNhWHg1YXhtMjlFcGJFdHZGeW5DSFZHOG1m?=
 =?utf-8?B?Ri9IZXRpeFdJT3d1VkZ6SFVEa21kRGFYZlBDOFdvUE0wRGFFUHR5WVlTcEN0?=
 =?utf-8?B?UnFmTlpPNkFIR0NmZkdJVmFFUHhrTUVKNENWYWRnVklpNi9lK0NYOFNyNm9z?=
 =?utf-8?B?Zklla2w3SUt0cDVKbDhodWpmVlRMUkRXSGRFUWU0UjVZdWMwcEFKdFdQdEZv?=
 =?utf-8?B?ZE0vdi9INDNRdEpJcjhtZFZYQ21DaThZY2NyNUhSS2JpdWt5akZ2K2IvTWZw?=
 =?utf-8?B?dW9wNGZSTkRjUDR1QVpvT0ZFR3NhbVRZU2xXMDg5SFNjQ1NCSEw0N2pjMjBG?=
 =?utf-8?B?YStVZHpDTm9wUVgrQldXNWdON1JCL1A4cnF4N0dXQkdHVjMxRkU2V1N0SzVz?=
 =?utf-8?B?Z2dLTWI1Rmp6ckpRQlg0YnE5NjlBdkxyd0FWcTU0eU5yM21LY1BpaUFjNHNz?=
 =?utf-8?B?cTA5Q0UwSFp3cERkR3lvWHdnRUNkQmJoaTZsc0pUcHZlb20rMHdyd3RScjhZ?=
 =?utf-8?B?T0dRQ2VvQ1RBYitOTkx2OXpmS1R4SWxldEtvc1o3K1BXQmVqL3BpTDJlN01h?=
 =?utf-8?B?aUsyMmpJL1E2NXVNV1hsQ0VjSG5IQ0dHcTBZejIvWktkelhPcC9sazFCanU1?=
 =?utf-8?B?UHorajVld0g1ckRRTkhiNXpyamxrb2Y4c1FNMy9GTDlrY0xEYTAvbUdmOHdD?=
 =?utf-8?B?V28zdHRtaklQWE05YytuRHlhWnBjaEUxQW9uOEc2Y1B2ZldwOThmL0lsUWNv?=
 =?utf-8?B?dDE4UlduSncrblNyUEVtbi9OcVFZZGt6NEhYL0l4L2FBaDFKbFN4R1k3UUVo?=
 =?utf-8?B?eEdreGRNUWU1bDJ4VWV0cy9VOE5Sem5NM3Q4RS8rbkUvRTJpbGh6clp1V0li?=
 =?utf-8?B?SFZaa3d1b1pjL053VUQvNHZ6L1VOOUVnWlRUNHNvWjNmaVlYR0JYWVVwT1g3?=
 =?utf-8?B?ZUxQSENoNEFteVdyQTNlMHE3L1JVT3lMOG1zODF2djA5MndENWVtVHlVamdi?=
 =?utf-8?B?bHQzWVMzTjJxaHlJZ0J6cWpsekZCWjAyVE5USmhlRTZxcVhHYktiVmdBdWlI?=
 =?utf-8?B?cm5zWmU3V2Z0aS9LQVlYUEdOakpMNVQ3NlBWZVBpblhFa05OL0svWFN5eEhu?=
 =?utf-8?B?RmJ3OXJQZ1Joa0dPaW9qVDRTWjVCVktMZm82Qklud2J5eWU2N3dFcEZDN3R5?=
 =?utf-8?B?ZXpaOUYzQVJEWDdCeVBGWUdEVDZtdFN3NWVLMXRGL0pidWkxWm1iQTJMUkFI?=
 =?utf-8?B?cWRzMzZDcjVyWE9xNjBtN28raHpNT210RkpHaGxXQXV1QitPd1pQdjZaTi9z?=
 =?utf-8?Q?03xTtyvZUGVGryYUx4ZSUqLOJe6UxeHi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1duVEQyTU9RSzZFUkZZQWZ4cVh4bVl3aGNreTBQS0Jxa1R2SDdpMDJ3TG9N?=
 =?utf-8?B?clRpTHh1NHZ6OFRTNVBNK0YwRFo3VkVPNVlDeVMyd0tSSGxDOHBuZEs1U2lJ?=
 =?utf-8?B?VS9XRWhHd0pnRmptR0JPdHhLa2FSemdZSHF2T2xwbTdoaUZYaklWTGd3N0Nt?=
 =?utf-8?B?U2pudmRJK1NaYmRxSy8vYXNQekQ0emNwSnNKdW5Mc2FPOUo3c1hEdXhKaU82?=
 =?utf-8?B?MVAxdER5WS9tQ0xKejFvcXdZcVJsNVdOOCtKT3NLT3R1RFdrVjhFU2NiTXJC?=
 =?utf-8?B?K0FWZjQrVCtva3FwcllQd2tudXZjcnFSQWNXeXIxc1g4QWdHbzB2cHBjSWFx?=
 =?utf-8?B?VlgycXdQYnFNQisvbGMwekoxWnROR0NZVFpKdkxpTjdZZEdBaHl5UUh3bm9V?=
 =?utf-8?B?U2ZCMVZ0TUdqNmNhWmlLUStLcUp3cTNpMloxbWltd1NSVTJUbWVVVzhaRXcv?=
 =?utf-8?B?NTJQLzZERE9FRU05WWhDVE8vdFJEMVZjaENTOGRJa2NuVjl6NDJiTVZETGNM?=
 =?utf-8?B?UENSU0xvSENhNTBHK0Fid2JXeHhlaWhQSUdraFJjQU0wUkJMSkFVQVVLOEVu?=
 =?utf-8?B?cUQ1SzlqWnpScmxoSW45QlQrd1hQdnVZVkdPRUxRMlVZT2JHa2JkUThVWk5p?=
 =?utf-8?B?UWZ5TnpqYjNaQkhaNy80MlNNV3ByVTlTaVhmN080d0NBUTdjMDBJV3A2K2wx?=
 =?utf-8?B?N2w3NG1rT2ttcWU3Vm42d1FIbExZL3pma0h6ZEo5MEJlanhvcUpDa2JQczh1?=
 =?utf-8?B?SGdTSmdUYlpsNzVWMm5FMnduRmxSSS9GZXM4bDMwM0NKNEZTNk5RSVI0SWdU?=
 =?utf-8?B?VytVUDlSR1FlcjR3MFVQbVFqbm1ERk12YjlTVCthalRvM3gzN2M5OUcxVHdj?=
 =?utf-8?B?VFZTdnh4Q0o0T1cvRzhlYk9BV3NxK2p6V3FnczVyMnNPeWZFZkUwNS9qYmRJ?=
 =?utf-8?B?SExPd2ZjRHJBK3k3VWdrMTdXcXJLVjB1MmlNZGFSSlloZkpWWU1KYSs0MVdr?=
 =?utf-8?B?N1VZUGtXcHdMR2wvUks0cGExQ3pURHF3a2dBbUw0cW5EZXJRN1R1S3NiSnBq?=
 =?utf-8?B?eFdINklxQ3EvOFlKZ3FqZGZVKzJGRHdJcEtYY1czYjQ4RmIzU25weDFycmtL?=
 =?utf-8?B?ejZmbTE5ZEV0ZkZheVRSTW1oZHhYSkc3TllqQkR3VENnSzdoMC9wR2g2NDB2?=
 =?utf-8?B?ZnJ0MVlzcEorckVYQ2s5YXJ2VjdsS3Z6Y2R0QjZUc3N2eGVZY2hjT2tmQ1hM?=
 =?utf-8?B?aCtiOGpxQmtWSGhzK050NUhGdXhzNDFPRTRMejByaHFPcEhuMUFEYkdwdFRH?=
 =?utf-8?B?SXlGWHVCaGU2bFZIOVcrRmw3K0U2MmQ0WjYrbTBjd1lFNU1XREswaS9GUWpl?=
 =?utf-8?B?YTR3Z3RsVnM5UmM0dlNVdmp2akxYaVlwb0YwcEsvM0RGaG9OVFRvNHcrNHE3?=
 =?utf-8?B?dFRkaG5NaXFzQXpiMDdsQlB0R1ZHYXVMSDNZUDRiNzhmTUJvdC9VVS8ydjN1?=
 =?utf-8?B?ZmtNNFJiSUxtNVVmWVUvSDdKTHlaRUVQNnBLSjFLVDZGOVk0KzFIemhkTjlI?=
 =?utf-8?B?dERDL3pFUk1kaENjMlpJYjdmZVFUenR2bWJBVmRTSjZWN0F5cTVSdWxBbmti?=
 =?utf-8?B?RzBFZStQMUFQRzgzaUgyaFdNWE5FeUJyUzBwb1lMdVdmM0cwWjEwdER2N21h?=
 =?utf-8?B?RGRxeXBLSGttaVJTMzVnaTJENnQ4WTViYy9rL2FJNi9JcmJmd2J3aG93Umh6?=
 =?utf-8?B?NkZ4S3U4enhIUmgzekNTUW0zaU9OVW9iQmVNaHJmS1ZOK0dId05wYW53Qkw2?=
 =?utf-8?B?Q1VMSE9FY0pqM2NZTWxZd1dOaGxrUlNtRTJVQ3VBZ3p2VTg0QTJwQkVRS3Z4?=
 =?utf-8?B?dmdoMCtKbm5Rc2J1YURta0tzUGNTZWRmWGJIY0hKbGtXcFRvY3NQZ0Q3NG5h?=
 =?utf-8?B?R20wQ0ZibXo3QmZaNjFBVmJ3cWxTdExzZlRpQ3cxaTZWQVdMRmR0SWVKZ3lC?=
 =?utf-8?B?OGgxd284dWVRTUdTNDdpY25pbzNieVNlSllhMUFPVDdtTUptZ3pHYmdSV3M4?=
 =?utf-8?B?RHVYNnY4cm5XaDVMU0twaHV1UEZra2t2dTE2Z0lPZldFSExQQ01Vc00zdjEr?=
 =?utf-8?B?cHFTUWJtRUVvaENoaXFlSWxwTHVkMncxRVlLcUVERG9od3BjYmFLY1AyMXZj?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7a9e06-4db5-4ae8-c375-08de189c4b96
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 16:41:09.7613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0ffO+iT0fQ+HRkVfOSn/7rv6Iy+H+OYCj/F7FK9l9K5tuDfnCIq4fwMmJGYnYXe3LS23Mn8rt0Xg6B3XDvIjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7501
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

On Fri, Oct 31, 2025 at 02:33:02PM +0100, Francois Dugast wrote:
> On Mon, Oct 27, 2025 at 08:58:37PM -0700, Matthew Brost wrote:
> > Stub out the new page fault layer and add kernel documentation. This is
> > intended as a replacement for the GT page fault layer, enabling multiple
> > producers to hook into a shared page fault consumer interface.
> 
> Nit: this patch and others in the series have been modified since the
> previous version, for future revisions please include a brief changelog
> in the commit message to help review, thanks.
> 

Yea, I had change logs but somehow lost them...

Will try to bring them back in v4.

Matt

> Francois
> 
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile             |   1 +
> >  drivers/gpu/drm/xe/xe_pagefault.c       |  65 +++++++++++
> >  drivers/gpu/drm/xe/xe_pagefault.h       |  19 ++++
> >  drivers/gpu/drm/xe/xe_pagefault_types.h | 136 ++++++++++++++++++++++++
> >  4 files changed, 221 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_pagefault_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 82c6b3d29676..b35021e5b9eb 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -94,6 +94,7 @@ xe-y += xe_bb.o \
> >  	xe_nvm.o \
> >  	xe_oa.o \
> >  	xe_observation.o \
> > +	xe_pagefault.o \
> >  	xe_pat.o \
> >  	xe_pci.o \
> >  	xe_pcode.o \
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> > new file mode 100644
> > index 000000000000..d509a80cb1f3
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -0,0 +1,65 @@
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
> > + * Xe page faults are handled in two layers. The producer layer interacts with
> > + * hardware or firmware to receive and parse faults into struct xe_pagefault,
> > + * then forwards them to the consumer. The consumer layer services the faults
> > + * (e.g., memory migration, page table updates) and acknowledges the result back
> > + * to the producer, which then forwards the results to the hardware or firmware.
> > + * The consumer uses a page fault queue sized to absorb all potential faults and
> > + * a multi-threaded worker to process them. Multiple producers are supported,
> > + * with a single shared consumer.
> > + *
> > + * xe_pagefault.c implements the consumer layer.
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
> > +	/* TODO - implement */
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_pagefault_reset() - Page fault reset for a GT
> > + * @xe: xe device instance
> > + * @gt: GT being reset
> > + *
> > + * Reset the Xe page fault state for a GT; that is, squash any pending faults on
> > + * the GT.
> > + */
> > +void xe_pagefault_reset(struct xe_device *xe, struct xe_gt *gt)
> > +{
> > +	/* TODO - implement */
> > +}
> > +
> > +/**
> > + * xe_pagefault_handler() - Page fault handler
> > + * @xe: xe device instance
> > + * @pf: Page fault
> > + *
> > + * Sink the page fault to a queue (i.e., a memory buffer) and queue a worker to
> > + * service it. Safe to be called from IRQ or process context. Reclaim safe.
> > + *
> > + * Return: 0 on success, errno on failure
> > + */
> > +int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
> > +{
> > +	/* TODO - implement */
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.h b/drivers/gpu/drm/xe/xe_pagefault.h
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
> > +int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > new file mode 100644
> > index 000000000000..d3b516407d60
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > @@ -0,0 +1,136 @@
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
> > +struct xe_gt;
> > +struct xe_pagefault;
> > +
> > +/** enum xe_pagefault_access_type - Xe page fault access type */
> > +enum xe_pagefault_access_type {
> > +	/** @XE_PAGEFAULT_ACCESS_TYPE_READ: Read access type */
> > +	XE_PAGEFAULT_ACCESS_TYPE_READ	= 0,
> > +	/** @XE_PAGEFAULT_ACCESS_TYPE_WRITE: Write access type */
> > +	XE_PAGEFAULT_ACCESS_TYPE_WRITE	= 1,
> > +	/** @XE_PAGEFAULT_ACCESS_TYPE_ATOMIC: Atomic access type */
> > +	XE_PAGEFAULT_ACCESS_TYPE_ATOMIC	= 2,
> > +};
> > +
> > +/** enum xe_pagefault_type - Xe page fault type */
> > +enum xe_pagefault_type {
> > +	/** @XE_PAGEFAULT_TYPE_NOT_PRESENT: Not present */
> > +	XE_PAGEFAULT_TYPE_NOT_PRESENT			= 0,
> > +	/** @XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION: Write access violation */
> > +	XE_PAGEFAULT_TYPE_WRITE_ACCESS_VIOLATION	= 1,
> > +	/** @XE_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION: Atomic access violation */
> > +	XE_PAGEFAULT_TYPE_ATOMIC_ACCESS_VIOLATION	= 2,
> > +};
> > +
> > +/** struct xe_pagefault_ops - Xe pagefault ops (producer) */
> > +struct xe_pagefault_ops {
> > +	/**
> > +	 * @ack_fault: Ack fault
> > +	 * @pf: Page fault
> > +	 * @err: Error state of fault
> > +	 *
> > +	 * Page fault producer receives acknowledgment from the consumer and
> > +	 * sends the result to the HW/FW interface.
> > +	 */
> > +	void (*ack_fault)(struct xe_pagefault *pf, int err);
> > +};
> > +
> > +/**
> > + * struct xe_pagefault - Xe page fault
> > + *
> > + * Generic page fault structure for communication between producer and consumer.
> > + * Carefully sized to be 64 bytes. Upon a device page fault, the producer
> > + * populates this structure, and the consumer copies it into the page-fault
> > + * queue for deferred handling.
> > + */
> > +struct xe_pagefault {
> > +	/**
> > +	 * @gt: GT of fault
> > +	 */
> > +	struct xe_gt *gt;
> > +	/**
> > +	 * @consumer: State for the software handling the fault. Populated by
> > +	 * the producer and may be modified by the consumer to communicate
> > +	 * information back to the producer upon fault acknowledgment.
> > +	 */
> > +	struct {
> > +		/** @consumer.page_addr: address of page fault */
> > +		u64 page_addr;
> > +		/** @consumer.asid: address space ID */
> > +		u32 asid;
> > +		/**
> > +		 * @consumer.access_type: access type, u8 rather than enum to
> > +		 * keep size compact
> > +		 */
> > +		u8 access_type;
> > +		/**
> > +		 * @consumer.fault_type: fault type, u8 rather than enum to
> > +		 * keep size compact
> > +		 */
> > +		u8 fault_type;
> > +#define XE_PAGEFAULT_LEVEL_NACK		0xff	/* Producer indicates nack fault */
> > +		/** @consumer.fault_level: fault level */
> > +		u8 fault_level;
> > +		/** @consumer.engine_class: engine class */
> > +		u8 engine_class;
> > +		/** @consumer.engine_instance: engine instance */
> > +		u8 engine_instance;
> > +		/** consumer.reserved: reserved bits for future expansion */
> > +		u8 reserved[7];
> > +	} consumer;
> > +	/**
> > +	 * @producer: State for the producer (i.e., HW/FW interface). Populated
> > +	 * by the producer and should not be modified—or even inspected—by the
> > +	 * consumer, except for calling operations.
> > +	 */
> > +	struct {
> > +		/** @producer.private: private pointer */
> > +		void *private;
> > +		/** @producer.ops: operations */
> > +		const struct xe_pagefault_ops *ops;
> > +#define XE_PAGEFAULT_PRODUCER_MSG_LEN_DW	4
> > +		/**
> > +		 * @producer.msg: page fault message, used by producer in fault
> > +		 * acknowledgment to formulate response to HW/FW interface.
> > +		 * Included in the page-fault message because the producer
> > +		 * typically receives the fault in a context where memory cannot
> > +		 * be allocated (e.g., atomic context or the reclaim path).
> > +		 */
> > +		u32 msg[XE_PAGEFAULT_PRODUCER_MSG_LEN_DW];
> > +	} producer;
> > +};
> > +
> > +/**
> > + * struct xe_pagefault_queue: Xe pagefault queue (consumer)
> > + *
> > + * Used to capture all device page faults for deferred processing. Size this
> > + * queue to absorb the device’s worst-case number of outstanding faults.
> > + */
> > +struct xe_pagefault_queue {
> > +	/**
> > +	 * @data: Data in queue containing struct xe_pagefault, protected by
> > +	 * @lock
> > +	 */
> > +	void *data;
> > +	/** @size: Size of queue in bytes */
> > +	u32 size;
> > +	/** @head: Head pointer in bytes, moved by producer, protected by @lock */
> > +	u32 head;
> > +	/** @tail: Tail pointer in bytes, moved by consumer, protected by @lock */
> > +	u32 tail;
> > +	/** @lock: protects page fault queue */
> > +	spinlock_t lock;
> > +	/** @worker: to process page faults */
> > +	struct work_struct worker;
> > +};
> > +
> > +#endif
> > -- 
> > 2.34.1
> > 
