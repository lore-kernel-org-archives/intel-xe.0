Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16DCC369D2
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 04:06:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FAA10E06F;
	Mon, 21 Apr 2025 04:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TtzEI/T/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DF810E06F
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 04:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745208401; x=1776744401;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=e7QSfTU0yzjzwO6ZuK1cvuyECPBzEtxnxtAt7aSpez0=;
 b=TtzEI/T/ZDjGQWp4Cfth/YEk1VWXZtsnpdrLSJG+tuViNK+2MnOteH8I
 CqMp+TPSuedmgvbhd/dMTlupXxAEV6thGoPsoGEF+QV+SdyiSC2AN39CU
 /5VquyiJUTksIe36VIteI9bsySL8Ubtv+Czc2RSovXBGU+haI9gWLq8wv
 bEoN+9MEjJyfw24t86ZMjh1ycGWUCotMpeaWHgSg/Im31lEX8iLtQ7nva
 Yn+S0sjh7jNKHerpDv2PWAT3ExNOSQmfd50G1A3SdBtSynmR7+yqs0oH9
 HVUbhN8r6S5TYbs7lEGESymi/ZDbFhgF2mSomD3RdpzBOpU5nrkUqzA6T g==;
X-CSE-ConnectionGUID: fsZKZU5LTouQoV8XV/c8+Q==
X-CSE-MsgGUID: uDzxZapeSnqtRGsDhJmNiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="72125960"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="72125960"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 21:06:40 -0700
X-CSE-ConnectionGUID: JdgYIGNeQKafYlx1cNB+3Q==
X-CSE-MsgGUID: EvyF2cHBSbqvvjTgJHoEkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="131359659"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 21:06:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 20 Apr 2025 21:06:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 20 Apr 2025 21:06:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 20 Apr 2025 21:06:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKd3UMKDqHm5MoBdzC/9nCIfTiQTEei2O6D1rLfkkTVjaD4P/olCyvt61Qr+5qYhKTnW8RoYxJGDoSNQNZOWWQxoLLnoGDxNg3pzUPpAMe8PFDxtbiyUE0aaNka0xE6UB4R3cXO+Z5P55TquMmmCjs2tH4sHTXl+CgLcfr8rxEWiqT5R46ljgu1K5LuKVxfAelErC96ku0e3vRqxB5LP1YLYAAsNQ/EjLswKWFmJ769jruONY1tPi6OiQS6J9BXTLI05IpkokrmZxnBe58JizRt2ld9d8mIlpro4B5+1Ai8BAAqjY/8IcU5HDbePidmMyB5aYVTBBPcqBy+TtaHnWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vj4FGoLkUUHZYn+mf2N932IlEP2WIH7WjA0LtrULXqk=;
 b=S+bL0bT/uT7ae+sKw/rQh7bQRtj+WNonWosbjkV1/ZVnvFv4i35xbrk4hQ9grBpYbH+vvN56hG7DvcVgIcqfupy+apwj66U1z/oc7ayegQWZltMeXHOO0N+VMDh+g/zNYPnTpfASQZSnBpboqtkPDhaOC/ZyyI9jladaOCEFHiSysP0BNdoPrfqUa3IXkv3ll7VLYpxvxVX6BpgMtHGrbKZLDl+sDRVfmiKuQYl5BRsU3OmPRkIUqfH1OIv76S3HQuQa1FELHEPOKqQuF9yK1F/PuojjMKCFwV967qOGhdyhNhD0ZZUk92wAZiXWFaUEC7PiwG4yl/SaWh1QvnOARQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by BL1PR11MB6026.namprd11.prod.outlook.com (2603:10b6:208:391::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Mon, 21 Apr
 2025 04:06:36 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 04:06:36 +0000
Message-ID: <7c0e90e9-d633-4a16-99dd-fd909d2182ab@intel.com>
Date: Mon, 21 Apr 2025 09:36:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/32] drm/xe: Make xe_svm_alloc_vram public
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-3-himal.prasad.ghimiray@intel.com>
 <aABse87AfXKsFOn0@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aABse87AfXKsFOn0@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::32) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|BL1PR11MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: c99f866d-611a-4d5a-6b68-08dd8089e8ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2xxKzh6SklRcFRNMXh2empTNnI1WU5aczVFRWprc2tYeGF3U013OGdEbVdp?=
 =?utf-8?B?c3M2MGdUYUZIVkJuODkxTmxkRkJLUm1CR3Y1VVptS284TXBvbkxvTCs3ODhH?=
 =?utf-8?B?UU1VTkxYZnBRTUllMEp1OUpRUkpaNFRRUUNYTE9VNFYzZWg2OU10eS9TZWU0?=
 =?utf-8?B?dE1EZnB1UlBkdHRPbkU4WmZpa1pCYVYzL2lwSW9udy9IZGgrMmFQL1ZLZmlp?=
 =?utf-8?B?dUs4UUZEUnVqanExKy96bzNVQTRJL3VMUmNHQ3A3dGxvZ0hEU3hsSk5BQXZQ?=
 =?utf-8?B?M3hSN2UybDdOUVZuemZ1ZXFNbUQrcEdVSFluTXVwL0NDRExsUk12cTRjWC9I?=
 =?utf-8?B?dkgrdDJQQU50d2U2bEhaT1FEZlBOR2ZPSzd1UkNRZWk5OTJTdElKcFU1RlI3?=
 =?utf-8?B?ZnpSYlo5dnphc0RGbjlCY3RPQTErZFZQMGphR1RvSmt4ZlpBY3BvdjZJaElv?=
 =?utf-8?B?TzZJUlV0OUZQWFNqbk1kYVVuTGN2ZnRLd0dzT0NCRXBhUlJOaTNvS2xWTXB1?=
 =?utf-8?B?MytGaTlEQ2tSYlZ2bHJ2R1dCZm5heE1xblcrRllBSTY4U1NrcHk1dWNDcFJr?=
 =?utf-8?B?YUFUaXR3b1FkQnA4K2dZYnVsTnpKc1JYck1wcW1vUWtHZnhUMjN4d1d2d21k?=
 =?utf-8?B?N1hVdWFxK2g4YW1nRkhERldOdG55TUsvWElrY1oweG8rVWRLTVNodlh4YlYx?=
 =?utf-8?B?RVRYUk96SEpQTnNnYTlnRXM1ZDkyQmlEaHYrcmJldjdjZFhyQjFWMndYbU9B?=
 =?utf-8?B?a2lySDJYRCswN29YS3lrV3NGTExwQTNCNE9rN0hoOVRNa1daVjM4aFBIWFo4?=
 =?utf-8?B?S0ZrRklsOGl0U1p2ajBBUEdSYWRQSkdhbmltcjcvd2dTTFhVRXJ0WEY0ZytB?=
 =?utf-8?B?aktMUXNmZDlWb0FibnVwUEREMy9SUW9GVzJ4ZmdqaUNhVGhrais5eXNmK0xR?=
 =?utf-8?B?c1JrTlVJeHhMenJQLzc3Ym0zR1JkcUJXU1o3SUwrczAvTElLcFU1Z2dtc2tn?=
 =?utf-8?B?ZGdCSmxPd0J4THc1Mm5INU1ubFY1dWZDTGVXWEpNMGZtT1dNTTV3cW5yUlJQ?=
 =?utf-8?B?K05wYlAvVG1kS3NRbDdkV000V09KN1FuemQzZDBIM1JqREJtUmtQeUI5VXFy?=
 =?utf-8?B?SlpnQjlrWVNKTFcvanM2YVVvbFFlT0o3b3FWaS9HWWtxZVRqZW94V2tCY2x4?=
 =?utf-8?B?aEdySzJIQ1VJVnlmN044dEZEa1J5Q1A2TjV6M2pvV08wYWR2Q1lLdmZXUDFQ?=
 =?utf-8?B?bGZPYS9Qa2ZickRaS1ZQelh6dUhpOEF3Rk5WbStyTVRQOUczTkRyMDVqd0pu?=
 =?utf-8?B?RlhsT25CeHBJTE1LWGNBTWZyUUduM2hjVDBISnp6dmE2aGtpT2Qza05NRXVm?=
 =?utf-8?B?bkU5MmZnczZPYXYzOEoyYWNhemZoWEFvV0JNTUppSkw0RTZianpTVnRvU1NC?=
 =?utf-8?B?NlR4NDBMTnZKMzRzc09McDc2ZWVKM3dnOEpZY0VTUWhQMS9kVnA4ZklIcUgv?=
 =?utf-8?B?c0RZMDFzNXJhVUNSRHUzN0hPQ1o0VFBOWXVhNWxnTVNXRVlabzNPeXlieUdF?=
 =?utf-8?B?VnIyWDRmUzlIT1pjdkJMc2dhWXkzcVdwZldoeWExZnZPQWxjOW4vWnB3Y0RC?=
 =?utf-8?B?Zk56MDZYcVFCYUJVYXpvdFJTbVFRUW9LZVhJcjJib3I5eXd2Qmh5KzlHTWJ4?=
 =?utf-8?B?eHhyQ3puaWNVTGJMa3VDYVErQ29NVE83d1ZpRU8zMlN3b0Nobm9PR3FXQWFC?=
 =?utf-8?B?N3BwbGpqRlloN1M5MWorUzJ3U1A2bEpZMHIzNWhaL3Q1ZmV0cGlnbjJraHdG?=
 =?utf-8?B?Vnc2UDZQOXpSa285T00xSUtKVDhnZDRBdUlkeFp5VXNIMFpDNTVRS2pGTlhv?=
 =?utf-8?B?bHdsemdYN0hPd3hqMkFNZkFMMTRyUGNFMUlKVnJieWNjZ3RZR1VmZm1hU095?=
 =?utf-8?Q?SSCi4JtQtV8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXluSDFBa1FmVVh6OFNDVGtFQnI2Q1Q3aitPVGlKL1liV0FjakVReHhKcWI3?=
 =?utf-8?B?cE5UZHJzVW9JbWhYRFJ5UWh0K1R6WUN1amcvOTdSaFV3VXBaVi8rVElrNmpH?=
 =?utf-8?B?UGhOWURLcXF4M1FOWGxrRDNNR1ZOZTd1NEJpcnM2c1BWZzF3TFN4ZmRRcmtZ?=
 =?utf-8?B?amxtVU5UZi9LcVQ3RVVPK0x5Y3RsbCtITHhKSHZ5cnlVU0g2UDB2cVpMKysv?=
 =?utf-8?B?RUhZWXB4UDhKcGlUNnhqaVl4ZHBOMG9WT1BiamZoQk5ENU9XQ29hZDBadjFS?=
 =?utf-8?B?eTNscmplQjJSdzR6NWtud0JDblBvR0VzQ3JSRDZvN2k0bTVwMmI0N1p3SmVG?=
 =?utf-8?B?TzR5MkhOb1BoT01yT0ZzNkpJcWJZWWY4WEs5a0t6bUlvL3ZlUEt0YXBKWUpV?=
 =?utf-8?B?QWlVeDZwV3V4TmpyUTBRajRNd2JJL2g2azE4cU0xdTRySmN4c0xzSEU3enFw?=
 =?utf-8?B?VkZlNDgrMzljam9UWDN4MHVHOXJXSlJiTnZseXFKL1F2Z0dwWk5VSWE3L29h?=
 =?utf-8?B?Tmt3Ujd3aU9Fc3FqMEVVVmxVWEhsaDBYd2krSXRSSnE3U0cxMHJCNmJJRTdn?=
 =?utf-8?B?YzVodzljK2ZCeFN2UkszWUZ4Mno3cG5zVHNTRmtpZ2dSVmVWWndLVGFJdW9q?=
 =?utf-8?B?a3RCdnFtMG5KbEQrNWFzNnBaYjh4WjljZ0ZWR0NyNjFQNWIvR0xHZlVqM3dZ?=
 =?utf-8?B?bjFJMFNvR01DYUdoZUVRcmZpVFQ3SHMwYUVQT2E3dlBVR1VkbGtqbjZCcml5?=
 =?utf-8?B?Qk9JbWZDWUE0dlhWY3V2NnQxTkJoSVlVNnVremhndnorMTlwdXJMYmN1cUk1?=
 =?utf-8?B?SXpsbVFSdldGMkI1b3lhYXdnNlRVVHFqTDJ3YlhickxwaHZDd1FBT1E5WHFr?=
 =?utf-8?B?VTRrVkNsNTQzRnVUWVlMejhaUmpPRDhrbVVIRlNIOFlQeFlzK0pEZiswZkNi?=
 =?utf-8?B?eDVmNWNBYXJxQ2JOTzk0SzdXemRwK09MRk13dmFRQ053R0hkLzZsbTMrTXA4?=
 =?utf-8?B?dmhYMmRxZEFhSWliL0t5L2NwYUZDZnZWNnIxWWJKM3B5aXM5VCtmMGlxcWhs?=
 =?utf-8?B?UUNpckpMWkkwNFNQQVNEMlRKdHlxa1hDekhPNjhsdU9OVW1XVG1XejJpbTBh?=
 =?utf-8?B?NFFnRFZrUnJUMW1ZYnB0dzZYYjNYQmtpWXhVem9GQ3N4cC9uM1NBSXhZamNB?=
 =?utf-8?B?WFlFdDhQUVArMjVUNlRPU0lhMnVmV2VucE44QjB2UUtYWnVkRXh1WUJtTXBv?=
 =?utf-8?B?TTNXV1B6RUI5REtFaUZ5MzJzTTI2ekNhNTA5YjJTWEg3WEVPaElEVEd2NmFk?=
 =?utf-8?B?WEp4V1lBK2N2UU85NEJjREliWjFhcVZlLzVBalNqWW9MWGxqVjhiZWVRdW5Q?=
 =?utf-8?B?N3EyUkVWcmpxRDhTVTNjdWgzK0xuMm5ETk1pdG54bHdOdVBsV2dHSE1DT3pB?=
 =?utf-8?B?QUJITHA0Nzh1WWF3NXlaM3FIc3VUY1BWakEzMWhRbHpvZkRLNks3RjkvVzNl?=
 =?utf-8?B?Zk8wbnUrOUNMa1NPdnptdWNiMlExZE1rVXMrL1BBVCtianZCb211QTZHbmdy?=
 =?utf-8?B?UFpQNUs0ZkhIWmovd3B0dUkrK1YxSEYxblF6TnJ4S25rVGtmeW0zcENYT0ox?=
 =?utf-8?B?V3g0R1FBMTdxZmEzRGpwUkpFTkV0bU80WjdlYUpUTk1nYVdrc05ic2o1NDZE?=
 =?utf-8?B?dHlZdCt0R21QSG00MXRsMmxrRnp5Y2F5UFI5d2ZlMnNYNWo1VzFwQXB3VFl4?=
 =?utf-8?B?Y1lpUVhrdVVENXBkRHpFc0UvWm1NYU1nZFNxNnBGcGpsWUV1bm04K2xtRjA5?=
 =?utf-8?B?d2M1c25zWlRWYU9wWi9HVlBlVjBCSEVSdFR6RG1CVUNxQTdkZ1RLUU5VaEpG?=
 =?utf-8?B?Q1BvWGpGd1drQUhQTEEvZUZyQkpha0Zyd2R1dndxcnh4S3Z6aFZ4Z3lYTGl4?=
 =?utf-8?B?UzkxWU1Hc2NjeEZEcFJPRER6K1drRithMGJKeHRmaHlOb2NzZmgxVTJWQzBu?=
 =?utf-8?B?K3VPTEhDN0xabkVYQUFlc0FqM2dUWDBTaURTSUkyYlMzV01rUGlhMUZTNXho?=
 =?utf-8?B?T0N3d214M0NEMndGT0NYVWc0MGlFUG9ZWFlzZUUxOStsK2F3amN4eVgxSTlF?=
 =?utf-8?B?SEZZUkJwc1JHSmowbmRwdVZubHNCbWpUbVdWYTNYc3Z3eDYwbkQ2alc3dW1p?=
 =?utf-8?Q?IrsUhXeR6VD5Fg/JfDZex9k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c99f866d-611a-4d5a-6b68-08dd8089e8ef
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 04:06:36.6223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WM258Ou0IIEkFDrfVHka1ggpPDBaxOQy3lDIQSwnIlyvfANiCaWNqxUFzmafuBHVvu8vEWFRvHttApCA2aJwID4uUtIeACwxHK/LeUh04w4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6026
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



On 17-04-2025 08:20, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:46:49PM +0530, Himal Prasad Ghimiray wrote:
>> This function will be used in prefetch too, hence make it public.
>>
>> v2:
>>    - Add kernel-doc (Matthew Brost)
>>    - Rebase
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c | 23 +++++++++++++----------
>>   drivers/gpu/drm/xe/xe_svm.h | 23 +++++++++++++++++++++++
>>   2 files changed, 36 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index c7424c824a14..de19ad056287 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -661,9 +661,19 @@ static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
>>   	return &tile->mem.vram;
>>   }
>>   
>> -static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>> -			     struct xe_svm_range *range,
>> -			     const struct drm_gpusvm_ctx *ctx)
>> +/**
>> + * xe_svm_alloc_vram()- Allocate device memory pages for range,
>> + * migrating existing data.
>> + * @vm: The VM.
>> + * @tile: tile to allocate vram from
>> + * @range: SVM range
>> + * @ctx: DRM GPU SVM context
>> + *
>> + * Return: 0 on success, error code on failure.
>> + */
>> +int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>> +		      struct xe_svm_range *range,
>> +		      const struct drm_gpusvm_ctx *ctx)
>>   {
>>   	struct mm_struct *mm = vm->svm.gpusvm.mm;
>>   	struct xe_vram_region *vr = tile_to_vr(tile);
>> @@ -717,13 +727,6 @@ static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>>   
>>   	return err;
>>   }
>> -#else
>> -static int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>> -			     struct xe_svm_range *range,
>> -			     const struct drm_gpusvm_ctx *ctx)
>> -{
>> -	return -EOPNOTSUPP;
>> -}
>>   #endif
>>   
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>> index 3d441eb1f7ea..d8772f841ab7 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.h
>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>> @@ -75,6 +75,20 @@ int xe_svm_bo_evict(struct xe_bo *bo);
>>   
>>   void xe_svm_range_debug(struct xe_svm_range *range, const char *operation);
>>   
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>> +int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>> +		      struct xe_svm_range *range,
>> +		      const struct drm_gpusvm_ctx *ctx);
>> +#else
>> +static inline
>> +int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>> +		      struct xe_svm_range *range,
>> +		      const struct drm_gpusvm_ctx *ctx)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +#endif
>> +
>>   /**
>>    * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>>    * @range: SVM range
>> @@ -100,6 +114,7 @@ static inline bool xe_svm_range_has_dma_mapping(struct xe_svm_range *range)
>>   #include <linux/interval_tree.h>
>>   
>>   struct drm_pagemap_device_addr;
>> +struct drm_gpusvm_ctx;
>>   struct xe_bo;
>>   struct xe_gt;
>>   struct xe_vm;
>> @@ -170,6 +185,14 @@ void xe_svm_range_debug(struct xe_svm_range *range, const char *operation)
>>   {
>>   }
>>   
>> +static inline
>> +int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
>> +		      struct xe_svm_range *range,
>> +		      const struct drm_gpusvm_ctx *ctx)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
> 
> It is a little goofy to have 2 versions of xe_svm_alloc_vram stubbed
> out in a single file. How about...
> 
> #if IS_ENABLED(CONFIG_DRM_GPUSVM) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> prototyope
> #else
> stub
> #endif
> 
> Or another option is in xe_svm.c we stub out xe_devm_add behind
> CONFIG_DRM_XE_DEVMEM_MIRROR so maybe stick xe_svm_alloc_vram there?

would go ahead with this.

> 
> Or lastly, I don't think anything in xe_svm_alloc_vram actually depends
> on CONFIG_DRM_XE_DEVMEM_MIRROR either as static version is not hidden
> behind CONFIG_DRM_XE_DEVMEM_MIRROR.
> 
> Matt
> 
>>   #define xe_svm_assert_in_notifier(...) do {} while (0)
>>   #define xe_svm_range_has_dma_mapping(...) false
>>   
>> -- 
>> 2.34.1
>>

