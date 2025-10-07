Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C9FCCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 21:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E090E10E009;
	Tue,  7 Oct 2025 21:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dt/5Zyxv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADFDA10E009
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 21:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759871930; x=1791407930;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rB7eUKciI7L4Qx2J/2II8CLxM54rk/e6yPM8sJ1k9tw=;
 b=dt/5ZyxvWCOWwbflLFy8KXpz0iV63Fpt39eXb0tEh8Ld7Tvd5Ttk8Dnz
 sOA4KgHaJ/3SoMPAHdH/lBjCp9nzVhtSNs1Juk3nQjhUJQWlwS974ANSv
 C+C0ZnUKkFWUNT+sSkjWuQ5dJwDemyo/4i6b0wRbjHo9i6n6NM+UxL1Tv
 yJ8+DRvaAzDaNGPXF0/G0FDGq2ri1nE2x9kIHR1K777bliB+tRPn8+241
 oOnBkMCLECsTNU4nJJT/j1GcqdJrPVcIP61XEQUjSGcxB7TWxc6p2Qo+g
 WNEH0khh20/oUxmIfCU/kaCimdL5Ar4/pKhcP8boYFrHipSL552/9j3i8 g==;
X-CSE-ConnectionGUID: e+C01hdmTx+lRVfaxwxuqQ==
X-CSE-MsgGUID: +21s75UPQN2qajCEVhKqHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="79489953"
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="79489953"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 14:18:50 -0700
X-CSE-ConnectionGUID: GPPzQUrnRU2B1bucdtq2Eg==
X-CSE-MsgGUID: O/0AZXXjQ7mdG71PG5fMig==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 14:18:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 14:18:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 14:18:48 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 14:18:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSCja63g81/kMiBa8gzp4ghTpE0Z8SWCGtnWu5GHzMug7NvSJnIhRv4rtV8byIbxEF/Wfu1MZE1TEGhxPybjFHmYDa54v5Yo08tsN/5ThfLeknRgzDCRpA+zYYNEjB48FH4sXj0XbsbF1ysRiSn/kxGxgBrSdgZw2MjpUBTV5fJpFUmPtwbUIgig41rz1TjGNpz+PLysYBK7XTiOarRM/7UZ/vkoQ/u4jWufMi3AClXta84NGLbzGGmmnn/204a5lTTSXVDzf5uCM+14xEW3Do4Y3t/V3iVKiFcyWejVl7C/5hdIpiogTMKp2OIHk7qiHYlt5x8SsOSYryvWf1MGWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3r+Uc3JdUyk3Wp/2lGpvjdUFELPzUXl4aurjW2V3+n4=;
 b=kkQxkecB954k9TuYruKmPoQBu0a9tzNRw8IBliGaRb7Eb6/Hi7IcpS8iLz6T6wtJnWgpSZ0gX/QPEoQyWRVHoPIKnt5qR+tRCN7hPplKx1Ht0B2NYxLIYkuQW1r4dGgnP04tLazzxhTZkCMabC7sp8RHrgJ9isUMjnOQmdId/wE3p29a5ih+sDf39DvLzsToVw0Vl2PCwlw1eqiVNs5vsB8EqtzdVYBXgtkKvYOs5+en3LdjWSKCQBuclPq8aKYWU1pVx9B+ues5hlN76E1JchK0oFPHT9ijuF3j0ixd3jsoMSL5fFIipFoHUZujZZqePWCtVQZ299db6gggiTq/EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF890B596B9.namprd11.prod.outlook.com (2603:10b6:f:fc02::38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 7 Oct
 2025 21:18:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 21:18:40 +0000
Date: Tue, 7 Oct 2025 14:18:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 27/30] drm/xe/vf: Use primary GT ordered work queue on
 media GT on PTL VF
Message-ID: <aOWDrjbRq2PnCRqL@lstrano-desk.jf.intel.com>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-28-matthew.brost@intel.com>
 <t6aytzfw5frhua2ojrz3xyrobi25p424exjagpmovtvif5jwhw@ocmceysqldql>
 <aORH4NrjGSNcCxi/@lstrano-desk.jf.intel.com>
 <h4mwspqv5chueicgkrvd4grucstgev3vfkuavaeqbweqecvznc@wjpe5lk7tkr3>
 <aOVMXzdQCB1e7LoV@lstrano-desk.jf.intel.com>
 <ux3zete2u3t22wqzjugztc7ijkbgsgznrthfos7pyxczzklhos@256zc7fujlnf>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ux3zete2u3t22wqzjugztc7ijkbgsgznrthfos7pyxczzklhos@256zc7fujlnf>
X-ClientProxiedBy: MW4PR04CA0172.namprd04.prod.outlook.com
 (2603:10b6:303:85::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF890B596B9:EE_
X-MS-Office365-Filtering-Correlation-Id: 960864f1-fc85-4577-f245-08de05e71698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wm1rREJYSWtaVFdvQ0dUVzdiWDJMdUlDK2Q5a1VSVDZ4KzZSa0I4VHlRUGls?=
 =?utf-8?B?NFY2Z05mK3VzSWJLQjNOVHBWMElwaGV4UXdXREVoRERTT0E0c2VHMDhhU3Ur?=
 =?utf-8?B?Si9Nd29lcDRRTmV2YjZHb2UzYk9sTWdGUGU2T0VTNmNCKzB5QXlpUXpaRFNU?=
 =?utf-8?B?dVRkZmUrYnNJbXpuanNLR3cxTE5NNFZTWnM3a1puK251c2UvRXdnNVVQK0NZ?=
 =?utf-8?B?eEw5THErS2dpd083YW5RN2g0SE1YQS8vOXAxZ3RMdERnLzRTdXd0b2xacTNj?=
 =?utf-8?B?N1BFT0NxNlZWcFJQZEtxNXJkeVNOeXlDQnk1QXI1MTZFS3c3M3A5MG1rOVdQ?=
 =?utf-8?B?bnFCQkZJUUVQM3hTWGdscUpYTEtYcFBqVkdYODNIbmtncjFUTWFueEgxaGdD?=
 =?utf-8?B?YmxkcW8xODkyRnJVNEJNdHRmYU5mZUpJY1orU1pjcjllK3FxRVlGMGRmQ1BN?=
 =?utf-8?B?YUlwMjB1QWJPNk1XbGxNOWtmWmZZb01PclJUeFdyVklhZU9OdnNYKzBQV1Va?=
 =?utf-8?B?dk04aGd4OWpNVG1vNS9HVDBJZEN1Z25wQ2Z4ODI2YUVvaTJYQXgydC9VL1A1?=
 =?utf-8?B?RTI5eUdhVnN3YWRBR1NTTTBXU0tiSlhqZGY5VDhCQUxTTGV2a2FxR1hLOXR2?=
 =?utf-8?B?NFJDbEMzR2pjMmJEc0pnRExPZzZzcHd1V3dHL0tpZWVhRHBIemRhRS9HSHhq?=
 =?utf-8?B?UVVwOE9kYmJERWVzUjhDSnBoSEJ6dTZ3SVNheEh2TDc4cjJKMnRsM2ZnT1Nz?=
 =?utf-8?B?UENIRExsNmFXRFdUTDB4Rk5pV2FQSktIZ3QyRFhQS2pEaXN5a2g5STN4Q2lL?=
 =?utf-8?B?c3ZUZHYxNWF0dmF5N1lyaHU3MnFwZFR0TDd2akNnU3hvb1FyQTRpaWlaRUhn?=
 =?utf-8?B?TjZLeTViWitrOUhEWVRZWjl2T3lubFE3dWdmRkc5QkdkTFdVQm1hVVJZTHAy?=
 =?utf-8?B?RG5BYXRyNEV6UnN4aEpnM01MRmVqMmhDRG5HaElvNzZTalhaZFdHL0NiMmN3?=
 =?utf-8?B?UWJlMDdCOFFLdHo2NXZmdWJ2c1pWWGk4SnAwRDlyczRBemMvdHl0NDZ1TXM2?=
 =?utf-8?B?TEpLNUZHeUFFTjg2MXFGMVdTQkllSVdSdVJpV3VWa3lwVG8yeEFjQW1kNm02?=
 =?utf-8?B?UktlZGR5RWtlY3FGNVdQNHVRendXUFhySjYyNTRqMS9CVjZYVzV1NGRqZjJS?=
 =?utf-8?B?RWltSXY4b1hhV21qRG5JNEtET2d2NnNtUTJuU0YyaU9zWHp3YjUwWFhHS0hP?=
 =?utf-8?B?ZzdYVWpNSVQzaExJSkF1Z0tDWUJaaXVpZlVoQVR2QlJvRlRGbkRsczgrRFl0?=
 =?utf-8?B?TURwZmR3aFAzeHhMRXQreXNFdStqQ2pWMDZWY2VhemhiK3FQVzNLT0VMTExs?=
 =?utf-8?B?cjltZTZ5eTZ0Z3FsZDNHeDdXU3NWVEZKOWMycTJpSHB0Z01ScEhZMlhIemMx?=
 =?utf-8?B?a2N6Rm9TRVpVQ3JpZFI1MkMrYkg1STJuRHhLcGxWWTk4MnUzWVhvQnR0WTNN?=
 =?utf-8?B?dDUrMm1qMUhkeHJmNy9jSGxsS3hza09wVXN0VlEvNzBxc1BzMVlEbVFVZUR6?=
 =?utf-8?B?dHl0ZnRjYUlhWlpLTm1JbzBrWDY0S3RCL2g2N0RaUVNWTVVyeEVGWjYzVWtT?=
 =?utf-8?B?Q0VJZDdNQkpVckJlck5pdEFxSFk3cnpMdk56VkhoQzZ0NytEcE9uN2tHN3hI?=
 =?utf-8?B?QnVjTXRGR0xDdXhsTkg1eTk3VHhIRnVST3YrZW91S1Q0TnBVWHZjSHJ3NU1G?=
 =?utf-8?B?NjJ5blE0Q3VSSndYN3VuMmUzZG8vOVNFU25YOHhOT0M4WHhvY1FuTkNyUGZH?=
 =?utf-8?B?dlVPY0kwTEhVbllFYkdFbzB2UzhVR2ROdHAvbUl5VUZzSHhrRWJtMjhFV0E0?=
 =?utf-8?B?ZkIyV0N6bXZDcThuWVQxZmVkQ0RsVXJ5RldZc25sRFgva0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzRGQ1BqOU5sY1NOQWFybThGZ2ZEeHpXUlVtY0M5RXFYK2I0K0o5UXBTbGVr?=
 =?utf-8?B?UVNoSHBSVUpodGdRdzVxTW5SVWF3YzdNSXFVa2V3OWd2VEwraFNXRVlPZ2pm?=
 =?utf-8?B?YTBLeEdLc3BFN0hyZGFHZDNLbHlmVGFHZ3VlQ25wanc2dEo1cGU3MmhVa2lh?=
 =?utf-8?B?K2VTbTR6aUtBTUZHbWVRREY1d2FucmhieFNldnJ2Mmptc1kzOXA1MVZhZFZ0?=
 =?utf-8?B?R0pFMS91TVlCQTdrZWxXYVc2Q09XNGdWd2M3a0V6RktiUzhXaUJLU0F1QVBk?=
 =?utf-8?B?ZjlkRjYyR3ptWXZEMmhUMm1LTE0yWU1xakxOeFRpQlAwR0Y1OTZoTS9tWGUv?=
 =?utf-8?B?dDdCcWRUeHpIaFVCM2o0VmtjcVBQY2ZLanVjN3VuZ0V3SEt6alVuYmVaMUNn?=
 =?utf-8?B?MGRzMzI2bi90SXRqZk9EUDhZSFh2RzdiekphTWxvSHRkWjBRdnJVR0NtN0Qz?=
 =?utf-8?B?UzR5dW5LOVNMSS85MVk4R1RtNkV3YjNpZjA0S2RHZjl2Z3Buam9naThlMkZG?=
 =?utf-8?B?aFFWeFNEVHdRYUw1S3FkZjJHeWVXNTBLUkFiRGp4WVZ6K3dZM0hEMVhhbXdz?=
 =?utf-8?B?QzhYa1VEelIrR21EKzRzaG50N1BOOHZZOUVlelEvOGpKaUVqZFVaM0haSlJ0?=
 =?utf-8?B?cytFc2NJVnVtVDBZeHRXWlBKMjZ6VkZzaHk1YTlYWWNiRFhrVHZTZWZlSTNn?=
 =?utf-8?B?d2huWnpFaFF4bzJadFNDV09EQ2hMWEFnUUlRNmU4L2RiczV0SC9GTXRlcnI3?=
 =?utf-8?B?Y1lRdiszZUpRaHJxbWVoa1lDZGpYV2hUTVBnQiswWmExVzRzbi80U1NRS3cr?=
 =?utf-8?B?bVdaN0xkMmNSdjJnam4zVnFDRnpsb1RpWTh1TEhyVjFoZFlHWXdIN0NTcXZP?=
 =?utf-8?B?TVNUMGJQSXhmMDNnNDJhRVhlWVQ1QWREcjJzV2RmN2hRK3ptN3FyV3JJOE5r?=
 =?utf-8?B?TUJMMTQyeHBoMzAwbE1WY2N0dXZ0YkYzV1RxaExZM1ArdlBXVXhBM05lTTU3?=
 =?utf-8?B?Q0YxSEIzdFhSMHlDUXFLQ1Z3eGRrTEZIV1Evc2doMWFJWWk2dnVtU1lsa3hm?=
 =?utf-8?B?clJleUFMWmNnNGVYb0dRR0JuM3o2c1dTQTFsQU9QNGNvUlFBRWJ5YXdnYXJQ?=
 =?utf-8?B?d1BsNnZ0WjFVOWtPUHNHVStKV3JkV2VNdjAxYTZGSmZpRFVuV0xpSUlIMXV2?=
 =?utf-8?B?b2Q2YUlLZ2RGM29xMTRicUNHUGtGRVU1dWdnbU9vSUQ0ajJtbkM2MFoxc014?=
 =?utf-8?B?aCtQTDRaQ2xCbDVaV1psdkh0UDlkdXgrSkp1NWM0UUZGbVhEMmdFTFhaK1Mx?=
 =?utf-8?B?dGFPVG1GNmlUT2dLY2M4M0ZobHZLZ0I3YzRTOWNnbUluNUg0eVdEdjlmNzNn?=
 =?utf-8?B?Q2RzL3RWOHFSbnN2cWtvN0RoV1ZRK084bzBiTFZmMDdFZUhWclV0R3ZJaGdG?=
 =?utf-8?B?K1o2V0hYQytLZzEvT3NEd2F5MlROUEl4OSsxZjU5eG41RDJWTmgrSjRDcXFO?=
 =?utf-8?B?OEFmTU5SRzYwem5QN2kvbzIwendMTURINExHdDMrUVRjNmN6Z3JmTXR3eW9P?=
 =?utf-8?B?b0tXY3NWeEN2WC96VkRQQUxoWXhJczRaNWFmT1Y1RWRjekR3cWhEMjV0Nncr?=
 =?utf-8?B?ZGc4OVJ3YVNwN1JyWkJzQWdVWnRqRlpZQ24rdXIrak1vZjFTSGpyTDNncTl5?=
 =?utf-8?B?WUwxRy9rYjVhK202ZUF2N29wUWtWVVd0MzlrbmJJNVdJdDRrekNldktWWlBh?=
 =?utf-8?B?UStuS2pyZlJ2WFJsTlB5aUVVQTNKeWN5YWp4UmliOVVNcG5Ma1I2dEw1bUxT?=
 =?utf-8?B?d3h6ZFpHdlhQQTJRQW5HWHc3ejhoOUlFQmVxUitYTUo4V3gxODUyRGh0RGl6?=
 =?utf-8?B?NEdHbmo4eGdOL0t4VFlNNnA0dExxMnJzL1J0ZTF0TXRKY2FBL25YL01reWdQ?=
 =?utf-8?B?eHRHUEQ4RGt2UmNyQ0NLMVhFNUJEcU8wL3dBY3Y1bDh5UDl0bVAxQWRuOEIv?=
 =?utf-8?B?VVpuZmdOZmhoSUs5ZmgvMi9jZ043L0h6eFBndjR2dzRLSFJCQmY1dEdiT2JE?=
 =?utf-8?B?THg5dHBKNEZsRmpZTGo4Q2hlMTZqYnpDVHQ4V1dMdVRVZXZEVjFSQXJIbmZT?=
 =?utf-8?B?dGs4RkkweDNyVEpPeUdicnpGYjJIbGhPTVFLVHlSQVVHcmhPSkQxb3JyRHE5?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 960864f1-fc85-4577-f245-08de05e71698
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 21:18:40.9019 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DQI9DmG26U7t71mCp5hsTyIZlqJN93MhRaevlVhTuFWB+4fPjkQucE0k5xF13Ovnz5IVExA89BrNMiHekJqsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF890B596B9
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

On Tue, Oct 07, 2025 at 03:36:55PM -0500, Lucas De Marchi wrote:
> On Tue, Oct 07, 2025 at 10:22:39AM -0700, Matthew Brost wrote:
> > On Tue, Oct 07, 2025 at 12:00:32PM -0500, Lucas De Marchi wrote:
> > > On Mon, Oct 06, 2025 at 03:51:12PM -0700, Matthew Brost wrote:
> > > > On Mon, Oct 06, 2025 at 05:24:55PM -0500, Lucas De Marchi wrote:
> > > > > On Mon, Oct 06, 2025 at 04:10:35AM -0700, Matthew Brost wrote:
> > > > > > VF CCS restore is a primary GT operation on which the media GT depends.
> > > > > > Therefore, it doesn't make much sense to run these operations in
> > > > >
> > > > > I'd need to double check the previous patches to see the entire
> > > > > picture, but this seems weird at a first glance. The VF CCS restore is
> > > > > not the single work we queue in gt->ordered_wq.  To me it seems more
> > > > > like "in what ordered queue we are going to queue the VF CCS restore. If
> > > > > it's global per device, why are we not using the device wq rather than
> > > > > making all the GT wq point to the same thing?
> > > > >
> > > >
> > > > This is where things get convoluted. Four mechanisms manipulate the
> > > > scheduling state by starting or stopping the DRM scheduler:
> > > >
> > > > - Job timeouts
> > > > - GT resets
> > > > - VF restore
> > > > - PM resume
> > > >
> > > > All of these paths require mutual exclusion, or the scheduler design
> > > > breaks.
> > > >
> > > > The first three ensure ordering by scheduling on the same ordered work
> > > > queue (GT-ordered WQ). The last one is guaranteed by holding PM
> > > > references in all the right places.
> > > >
> > > > Another issue is that the first three items are all in the reclaim path
> > > > — the GT-ordered work queue is designed to handle this.
> > > >
> > > > This patch [1] explains the entire scheduler design in detail.
> > > >
> > > > Only PTL has the cross-VF/GT restore ordering requirement, so I figured
> > > > the path of least resistance is to just point all GTs to the primary
> > > > work queue.
> > > >
> > > > [1] https://patchwork.freedesktop.org/patch/677980/?series=154627&rev=4
> > > >
> > > > > > parallel. To address this, point the media GT's ordered work queue to
> > > > > > the primary GT's ordered work queue on platforms that require (PTL VFs)
> > > > > > CCS restore as part of VF post-migration recovery.
> > > > > >
> > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > ---
> > > > > > drivers/gpu/drm/xe/xe_device_types.h | 2 ++
> > > > > > drivers/gpu/drm/xe/xe_gt.c           | 7 +++++--
> > > > > > drivers/gpu/drm/xe/xe_gt.h           | 2 +-
> > > > > > drivers/gpu/drm/xe/xe_pci.c          | 6 +++++-
> > > > > > drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
> > > > > > drivers/gpu/drm/xe/xe_tile.c         | 2 +-
> > > > > > 6 files changed, 15 insertions(+), 5 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > index c66523bf4bf0..02c04ad7296e 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > > @@ -334,6 +334,8 @@ struct xe_device {
> > > > > > 		u8 skip_mtcfg:1;
> > > > > > 		/** @info.skip_pcode: skip access to PCODE uC */
> > > > > > 		u8 skip_pcode:1;
> > > > > > +		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
> > > > > > +		u8 needs_shared_vf_gt_wq:1;
> > > > > > 	} info;
> > > > > >
> > > > > > 	/** @wa_active: keep track of active workarounds */
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > > > index cf484a2da35e..05465f358c96 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > > > @@ -65,7 +65,7 @@
> > > > > > #include "xe_wa.h"
> > > > > > #include "xe_wopcm.h"
> > > > > >
> > > > > > -struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> > > > > > +struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq)
> > > > >
> > > > > If using the device wq is not an option (possibly because it would queue
> > > > > with other undesired work going on there), then I'd rather drop this
> > > > > bool passing here and make the decision inside this function:
> > > > >
> > > > > > {
> > > > > > 	struct drm_device *drm = &tile_to_xe(tile)->drm;
> > > > > > 	struct xe_gt *gt;
> > > > > > @@ -75,7 +75,10 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> > > > > > 		return ERR_PTR(-ENOMEM);
> > > > > >
> > > > > > 	gt->tile = tile;
> > > > >
> > > > > 	if (!xe->info.needs_shared_gt_wq || !tile->primary_gt->ordered_wq)
> > > > > 		ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
> > > > > 	else
> > > > > 		ordered_wq = tile->primary_gt->ordered_wq;
> > > > > 	if (IS_ERR_OR_NUL(ordered_wq))
> > > > >  		return ordered_wq ? ERR_CAST(gt->ordered_wq) : ERR_PTR(-EINVAL);
> > > > >
> > > > > 	gt->ordered_wq = ordered_wq;
> > > > > 	
> > > > > ... or something like that so you use the xe info to decide it here
> > > > > rather than passing it down as a function arg.
> > > > >
> > > >
> > > > Sure can refactor this as you suggest.
> > > 
> > > 
> > > another option that would avoid a bool arg would be to actually pass the
> > > wq from the caller.
> > > 
> > > 	wq = NULL;
> > > 
> > > 	if (xe->info.needs_shared_gt_wq)
> > > 		wq = tile->primary_gt->ordered_wq;
> > > 
> > > 	xe_gt_alloc(tile, wq);
> > > 
> 
> > I posted a v7/v8 which did it like you suggest.
> 
> good, will take a look
> 
> > 
> > > >
> > > > >
> > > > > > -	gt->ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
> > > > > > +	if (use_primary_wq)
> > > > > > +		gt->ordered_wq = tile->primary_gt->ordered_wq;
> > > > > > +	else
> > > > > > +		gt->ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
> > > > > > 	if (IS_ERR(gt->ordered_wq))
> > > > > > 		return ERR_CAST(gt->ordered_wq);
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > > > > > index 5df2ffe3ff83..9545c0c93ab6 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_gt.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > > > > > @@ -28,7 +28,7 @@ static inline bool xe_fault_inject_gt_reset(void)
> > > > > > 	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
> > > > > > }
> > > > > >
> > > > > > -struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> > > > > > +struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq);
> > > > > > int xe_gt_init_early(struct xe_gt *gt);
> > > > > > int xe_gt_init(struct xe_gt *gt);
> > > > > > void xe_gt_mmio_init(struct xe_gt *gt);
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > > > index 3f42b91efa28..25a1d96a68e7 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > > > @@ -347,6 +347,7 @@ static const struct xe_device_desc ptl_desc = {
> > > > > > 	.has_sriov = true,
> > > > > > 	.max_gt_per_tile = 2,
> > > > > > 	.needs_scratch = true,
> > > > > > +	.needs_shared_vf_gt_wq = true,
> > > > >
> > > > > as per above... I think this needs to be detached from vf. There may be
> > > > > other reasons the wq needs to be shared.
> > > > >
> > > >
> > > > I’d prefer to share the work queue only when absolutely necessary — such
> > > > as when PTL is on a VF and migration is supported.
> > > 
> > > 
> > > I missed that you left the VF condition out as an && for the allocation:
> > > 
> > 
> > Yes.
> > 
> > > > > > +                                       xe->info.needs_shared_vf_gt_wq &&
> > > > > > +                                       IS_SRIOV_VF(xe));
> > > 
> > > IMO a better way would be to call it `needs_shared_gt_wq` and then
> > > override the condition in the vf-specific function:
> > > 
> > > sriov_update_device_info()
> > > 
> > 
> > I'm trying to follow this one.
> > 
> > This a platform (static) and VF (dynamic) condition combination.
> > 
> > Are you suggesting removing platform information from xe_pci.c and just
> > have info bit in the device which the sriov code sets? I think we'd need
> > a platform check then in the sriov code which I thought in general we
> > want to avoid inline platform checks.
> 
> yeah, true... for that to be done without hardcoding the vf it would be
> more verbose and there isn't much need if the VF is the only expected
> one.
> 
> 
> > 
> > Maybe I'm misunderstanding here.
> > 
> > Matt
> > 
> > > Lucas De Marchi
> > > 
> > > >
> > > > > If we just make them point to a device wq as suggested above, then
> > > > > there's no extra issue with the ongoing work to disable GTs that Matt
> > > > > Roper is doing (https://patchwork.freedesktop.org/series/154739/).
> > > > > Otherwise we will need to think on how to reconciliate them.
> > > > >
> > > >
> > > > I don’t see how it would ever be possible to disable the primary GT and
> > > > still do anything meaningful. You can’t allocate memory (e.g., for
> > > > clears), perform VM binds, or handle page faults without a copy engine.
> 
> it's actually useful for platform bringup as we can enable the
> individual pieces in parallel. We know what should and shouldn't
> work and workloads we can execute in this case.

I believe this, but it would be very, very difficult to even run a user
job on the media GT without the primary GT—unless you performed some
serious hacking of the KMD.

Regardless, I don't think this patch would affect any platform bring-up,
as it is tied to a VF. That is, we are never going to bring up a
platform with only the media GT in VF mode. So no conflict with Matt
Roper's series IMO.

Matt

> 
> Lucas De Marchi
> 
> > > >
> > > > Matt
> > > >
> > > > > Lucas De Marchi
> > > > >
> > > > > > };
> > > > > >
> > > > > > #undef PLATFORM
> > > > > > @@ -598,6 +599,7 @@ static int xe_info_init_early(struct xe_device *xe,
> > > > > > 	xe->info.skip_mtcfg = desc->skip_mtcfg;
> > > > > > 	xe->info.skip_pcode = desc->skip_pcode;
> > > > > > 	xe->info.needs_scratch = desc->needs_scratch;
> > > > > > +	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
> > > > > >
> > > > > > 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> > > > > > 				 xe_modparam.probe_display &&
> > > > > > @@ -766,7 +768,9 @@ static int xe_info_init(struct xe_device *xe,
> > > > > > 		 * Allocate and setup media GT for platforms with standalone
> > > > > > 		 * media.
> > > > > > 		 */
> > > > > > -		tile->media_gt = xe_gt_alloc(tile);
> > > > > > +		tile->media_gt = xe_gt_alloc(tile,
> > > > > > +					     xe->info.needs_shared_vf_gt_wq &&
> > > > > > +					     IS_SRIOV_VF(xe));
> > > > > > 		if (IS_ERR(tile->media_gt))
> > > > > > 			return PTR_ERR(tile->media_gt);
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> > > > > > index 9b9766a3baa3..b11bf6abda5b 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > > > > > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > > > > > @@ -48,6 +48,7 @@ struct xe_device_desc {
> > > > > > 	u8 skip_guc_pc:1;
> > > > > > 	u8 skip_mtcfg:1;
> > > > > > 	u8 skip_pcode:1;
> > > > > > +	u8 needs_shared_vf_gt_wq:1;
> > > > > > };
> > > > > >
> > > > > > struct xe_graphics_desc {
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > > > > > index 6edb5062c1da..e9bcff2de563 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_tile.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > > > > > @@ -157,7 +157,7 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> > > > > > 	if (err)
> > > > > > 		return err;
> > > > > >
> > > > > > -	tile->primary_gt = xe_gt_alloc(tile);
> > > > > > +	tile->primary_gt = xe_gt_alloc(tile, false);
> > > > > > 	if (IS_ERR(tile->primary_gt))
> > > > > > 		return PTR_ERR(tile->primary_gt);
> > > > > >
> > > > > > --
> > > > > > 2.34.1
> > > > > >
