Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6B3D15DAF
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 16:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8550B10E735;
	Wed,  3 Dec 2025 16:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GwK94GBR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2087F10E15D
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 16:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764779103; x=1796315103;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5/WCc6mVjP64TEJPUxiACFmbpJr+n/GdsTqo19GYj0s=;
 b=GwK94GBRccblGNoqe9Zixc8QViBIFNbZIfj9PZ6WDq3NjzlBMIHA3Yht
 wOp3qcZnSCZ437vYmeDCW4QKkVaLFqr80EIpkYxA/YXbzwdQDjYnmdVQP
 06ubDWliUXof5gGl6m0Eneh28OgPO2CXzeRShO/N/tG4YiHdaiMg1wePb
 1bx1sZ0cWV9A8FPOb2RPxrj8x1442rt8rK0h8UQf4paOwNIMUfK//h0ip
 NR8OSbONou4uRjJDjDlO6k52e1TA0/kTKq/1hqsx3pQpZ2way2iMedrhf
 7R6QYO2z1wwpXwRT/s7hyks7/sRfIs4XmRZ73vkw3pySM6P0suDPy1/mf g==;
X-CSE-ConnectionGUID: s5YJH7QxS0iNhnMJxdeRRQ==
X-CSE-MsgGUID: /l/PPdKSQ9+WChtak84kcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78128222"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="78128222"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 08:25:03 -0800
X-CSE-ConnectionGUID: 27Ijn8AKS7yPfaG5gVl71w==
X-CSE-MsgGUID: abImjazNTiOZ8zRnPKWHwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="199677831"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 08:25:02 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 08:25:02 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 08:25:02 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 08:25:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qo+oLlDgBIbZ5m2/Bcf6YwgkwY4LdB6gm1y8lwz48UYr5xSYf1NDJvNlzwbm1kjucYjOksRw7LNpi0QGs4ZGV4E+m/x1CMzm3j76VHmgsoCR9MlnRvUGLDgiwn8qimQ7z6xMxF4xNUXEJaGMRzKnklnNP9PuNMLg1i6ghZAMZnf8JTINrg+xVb8G98QQmPdb0vXWJH3ihwtiC9rytvqgpA4ICaHXjcIcFek5EEXqFRos6kMfeYlesdmYfXy/z33TXfnAygtQU7S0EHYgPk/D3MUlJs19cvll42FUpb+EtYfcmX3qx+/z7rU1y6o1669H6WOo8F8N6e8qbxwfc7pnNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBMkdjysI5HTc1qmiQWOWhxeSxeYT33EgDhS0/uFRII=;
 b=gVrYhwLY8x/wRkiPAwTYj9lmgIJmhyC8LdRNRK4JK72JBhKgKpaY7o1OvYeMqj6ng/9MaLXX3l2rMlSy7rlLNP3K6jB/zMV1pNLnhOVZWo8Js28n0OWJ2b4jM7WT0jjT0uTJcQuOjmoKKyv0dveulSLGt6/LDJt1juAJ8RdUkTI5wX7mxE8KQXkioSRIK+s/ytDV/cq5v3Fp69b5RP2nzP9P0rqT1J7JpiqmVO5ggRG1uB6Wp5EKhcRFFaTSPLfSKJUToGmM3LgEt2T9mZQMgM9sP/tFyrv4JMK9jv9E6Vuz2JYK+gwp7fZciGMWhcAxyAEpBmxt8wdyBSXTS2STQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB6695.namprd11.prod.outlook.com (2603:10b6:a03:44e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 16:24:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 16:24:58 +0000
Date: Wed, 3 Dec 2025 08:24:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [RFC v2 5/9] drm/xe/bo: Handle CPU faults on purged buffer objects
Message-ID: <aTBkWCQP5ktht+CU@lstrano-desk.jf.intel.com>
References: <20251201055309.854074-1-arvind.yadav@intel.com>
 <20251201055309.854074-6-arvind.yadav@intel.com>
 <aS8zH+PBu9yDmRc0@lstrano-desk.jf.intel.com>
 <aS80edjt8NMTWNYo@lstrano-desk.jf.intel.com>
 <605b6378-abff-4c24-b8f0-85d7ea51ea30@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <605b6378-abff-4c24-b8f0-85d7ea51ea30@intel.com>
X-ClientProxiedBy: MW4PR04CA0359.namprd04.prod.outlook.com
 (2603:10b6:303:8a::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB6695:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b562f6-fc06-4281-6da0-08de32888074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WE1ycFVPc2s2ZTlSczlwYjdZUHVWTkg1VHpQdVVqOHliTEd5NkpzMG1VMHV0?=
 =?utf-8?B?K3lvTkJxeHFqNFpuTlhsUzlIUzRZYkFWZzVwa2VodXpmc2dZYmRxbjU0Y05Z?=
 =?utf-8?B?SDZOekREbjVSamlpODM4bFZybHdacGdaRnJocEg0cGdYbHNsN1dtWFB4a2xN?=
 =?utf-8?B?M3JodFNYQmt6V2VKZ2tRdGl6MXpkeGYvSmd0bEM0Ymk3eVFSYmpFYWt5eTl5?=
 =?utf-8?B?bUtTTFF5OEZvdzVEbVBPRmVvNktCOFhwREY2ME5jbXRaeEkzYVNPVER3ZG4r?=
 =?utf-8?B?OEo5dDRwcnFwVUNpclJRNG0xVGlRdTFOUVNnY2xkeFdZaGxOajF4UE1hTGYx?=
 =?utf-8?B?bVR5ejdMdmFadnAycjdFR2p5dEx3UXlkZ2NZeDZleWs5TGx3V3Q1Qk9ZZjNU?=
 =?utf-8?B?SG5kVG1hRm9wQlFsOWRHbHVXRnpmZTVqa2YrODVjRXZJWWRUd1RubGlJek8r?=
 =?utf-8?B?blhqUENsL1I0NmlSK1BMSkxlNGFsaXovYi80Q09GR0drbGxyTzJBNWxMdUFL?=
 =?utf-8?B?M0QxL25QZ01YM0lldms1YmlWVVhhZ2lkRWxuOC9nUU0zUnNveTgyR05IakVW?=
 =?utf-8?B?Z3RNTXZKYVhiYkJxMExkYk42b09PRGUrRUswSUk0V3VpVkhOQjZYaFIzQ04z?=
 =?utf-8?B?WEswZGduYy9LSEh2TWxYdHBWMnN4S1ZGdUcvYlBnOVlwNGxTdWt4dExhM3gy?=
 =?utf-8?B?K082Sit1cjJuRlNXbGxVczc1VzJQb2NrVXdCcWxFZ0x2L2w3LzRWUEV2d1l2?=
 =?utf-8?B?bTk4K2puMVozeEdtdTFLTFd3MkNBRXZ5b0padUtvbDgrc21lMURRbzN2U3c4?=
 =?utf-8?B?cWxqTHgxbnNhbytLK0w2QVkwNGZhS0w3aXg4eVozUHRSM0VDdHVDbWU0a3JU?=
 =?utf-8?B?VVlJODdVNUdZbDJtRlF5MWhGMnRxNUdjS0ltSndHQmY3bDJvbmJ2VkxXdi9B?=
 =?utf-8?B?YTdQc0pia1o5TTgzMEV2bTllUkVwVE1weGcrcGs0VGJiclZyT29FNmlWb0ZP?=
 =?utf-8?B?aUpLRUxyRHkzZFFKb0E2ZVJVdXNGMVBGL2hRUTlPSmRCSEt0QlpsekNvN1ZL?=
 =?utf-8?B?aTRvQjdjV2RyZ0ZYOU01SU5YVlE2WUY1Y2pHQUlVR0lGaXcvRXVyVHVZMWF1?=
 =?utf-8?B?QlUwMWYxZWNkQXV1Z3dxdWk5MWhCNjNmR1U3a0l2aTJTS1l3Q2R1TTJRbkM0?=
 =?utf-8?B?WHlGdFVFZ25QQURkWkNWak9ZTWZ5a3V4RjJzZXRaelhOQm5KY3F3eGMyME1W?=
 =?utf-8?B?N0NNZEFZKzd1bmRIdk1abUl0cUF3ZXo5SnVRWmI0dXJZb1pOb0ZPeENoVlZF?=
 =?utf-8?B?dWhQekg2N3cwRkp4cnJSU0xxZk1jRUtDb3J3WEhxYXZuOWJNKy85cXAwTHRT?=
 =?utf-8?B?V3ZoVDV5N0xuU3d5VTBHZFFNUG1oT2o1aGl5Z3hOQjB2SjBTY2t4bnoramRy?=
 =?utf-8?B?aHM0MVovUEhiOFdOYmFGb1RHM2lTZFAwb2JWYkgyRXkyRlBqRHZuemMxbFBT?=
 =?utf-8?B?a0FJMmhmZFR1US9SamJSbE9sSU9zemdTc2FKaXc3eFFrWHhMWDUzWmxIN1lj?=
 =?utf-8?B?SitUSVltaFN2L1M0cUdkMHBVc214NWRvcWxnRmR4R1B5UDVpeWt4eFF6c0hJ?=
 =?utf-8?B?WEtXV0J4UXcwb1lzQlR5THpWVVdydkkvbkQvczBBM1hJd2VMN0NJUVJlcWg4?=
 =?utf-8?B?Tm9lTEFVZGtIc0ljdEtLaHVzUWxiMHg3emRCdGxzSXE2WndaVHp2SU1oTnJV?=
 =?utf-8?B?VDFJdHg1Zk5NTVlzNUx2M2ppWDduQlFTS2w1THMzdHB5ZXVSWXZJa1ByR2JQ?=
 =?utf-8?B?SG4zWDNMTXdJbzV0U09MbDJ0aitBL3RKaGE2QWZVdWEzSDRBdHdmRmxwSjc3?=
 =?utf-8?B?VWFUSzI4QzhwZlVQQ0grd2w3S3E1NDg2RUpqS1R6ZUJIYVIrcGJCVUJXNzd2?=
 =?utf-8?Q?ynqakvRX82MXLW+aED9bpGoots1bcsGN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDVxcWw2dlJUT24wZ01xQUN5SGtscmRybXZrdVdrcDBBR0VlWmIrak1IbURC?=
 =?utf-8?B?SlpIY2VQRzdLbXVsdGdsRDltOVk1NzZIUC9kU3R0ei9ObmY5N2l3NHhZZHFl?=
 =?utf-8?B?UWNTUUswaWhTbEYzbHE0bWxoa0tMYnRwNStnNE1JQVVIMG8wbkVxcTVKMmpI?=
 =?utf-8?B?OXJQUzViUktWNzVYOUhoOEJ2QjczY3lyTTJqMlREY1RFSlZ2TXFwbkNHaTEr?=
 =?utf-8?B?TnY4eFV6ZkpVZHFLb1JJNDcvdEVkc01wT1YwclI2TlhhNzYyL3QxUkNrek43?=
 =?utf-8?B?L05KSHcvRWRhSWJObXdsRnk5VzZOV3lJUllGWjgyUkZMZ3FhMmpYSGZiYkdS?=
 =?utf-8?B?eWFDOEs3SVVVR2toaDVPVDVjVnFOYUJKMUVGQjhJNXdKeEx0WmNma2FPSW4r?=
 =?utf-8?B?RUpLOXpHcmNyOWd6enV4Mk9OMTNpWkpOZjhhcjl5TkRVS2pKQi9JU0dpeGJN?=
 =?utf-8?B?Z2hzS3F5Rms5eE5PdjJpOFY5dnNuQzZ1NjdIdkhUaC90bWkxOXNoOVU3OTJM?=
 =?utf-8?B?Ykx1Y3kxVXMwRlNkR01LR1o0UThGTUZlT0lYRjUzU1NDRkVHK2hpcSs4S2dw?=
 =?utf-8?B?VnVpQTR2T0NnN1BLYnNKLzkzdmFnSmhyK3pqZVpBc3Zpem8rdmplRmxDM1Iw?=
 =?utf-8?B?MnAxMEJDVHBPRHRRNExRL3IrY21OVkxkNDVTYTBHWHR4cG5lbTZnNWVHeXVP?=
 =?utf-8?B?TEljemhNUURqOFFVZmpuSnFLc0M1MzlHeU9SZHhmeFVZbnR1dU5FemUyWk9W?=
 =?utf-8?B?bFMyaXlhTGlSeXozRytLRlVNSmxDTjFOSXQ3YjdpdWJwYmdLc29ZTVEvM0Rz?=
 =?utf-8?B?cU1jZWxNa0tueHZyeWdjNEJhajBYYnBOd3RCNFpPOWhaRFl3Z1hPb21lek1l?=
 =?utf-8?B?TkJTM3B4SlNYZ1BRaEZtdHhEK05UZVZzRkVTUzNyWEg2TnI3ZVRCU0NhY3My?=
 =?utf-8?B?OHNnVCtOSXlxaDNkT0FKMTF3Q1hBK1N4TGN6d0RVV1dTajA0MHV4Q1VGU2xN?=
 =?utf-8?B?c3I5RnNQQ1pJZzB5UFRWQ2MzTk11Q0xTVTcwbU85Qm5pUFM1Sy9FaDZ5VG9C?=
 =?utf-8?B?V20vOW5yK3JjbG4zZ1VaelVpeklEbDlSQVNBNjgxdk1XNVlFMTZXbnc0MEVM?=
 =?utf-8?B?R3Z4Z2loUk9CT2xSOFFZMVl4QVBHRjlSVGlBRjRaTkJwSVozSjJNUGdvcnox?=
 =?utf-8?B?dVlYU2JGZDByWnBtOG5LSEZwdzFGRjNkOFR2cUpNSWR5VU1EWUVUdzArNGRO?=
 =?utf-8?B?ODBvUzhHaitoSmd3bUpZMnJhRU1kOVMvbGoyWkJJREcvZ1FaczN3bjV3U3NR?=
 =?utf-8?B?VUJmVVRsMHJLRjFQOU1pQ0g1Tzd2K0tSZVUrWU8xR0JKS2d2ZzgwTFNIK1Nq?=
 =?utf-8?B?ekRuREZ1SUxhMFd2RkpUSTU0Y1p4bmFRREFBL2lBMHR0azZMcjVsdEg0aVhY?=
 =?utf-8?B?Z1pWcG9pMVNBVy9KSnpWL1dDZjZ5dlYvYzBWMWlkVk5rRWUxRGRjVjRoeVNV?=
 =?utf-8?B?SXFFL1RlQ0xLdWRJaFFwaFBuRTdZV3NlSjY0OUI3NzRXU2dxRTREYUxQQlhI?=
 =?utf-8?B?V292K1ZxdTlBYWFMcTcrYXNISUxTUWQzQkZzemxQa3Rlc0ZQZEFZMDRNUU5C?=
 =?utf-8?B?bHA3Z0ZKVjNQdGhsRzdLRnVEc0o2K0dSUVNVN1cwQXA5TE4wYllua3hCVkMy?=
 =?utf-8?B?YVdNaG9tTk1qWklDazZiNmgrbERCRStkTURZZ2NldUo5dk14bjNxeXlpYy9F?=
 =?utf-8?B?emJYM3IwOGdsL0dKeWtCc2ljZkJmay95eE9XMzA3S1RYTUJnbzV5elBSM1N5?=
 =?utf-8?B?SkZUTmpxRDBBRUJ4SUlKMlIxQTdQQWgrVE9ZVzR5NGtuL1VjaThwVXpPWXZu?=
 =?utf-8?B?bFlPQjFlN0ppWUFGd3pTc2FXZDNYSTYwd2FNa3lrTUNwLzZVazNVVnVLeG1B?=
 =?utf-8?B?bEtZOTFuUGx1M25RUU9STEk4QmRaNnU0Uk1UYnd3bVFGYnl5cjFPYkljVGh4?=
 =?utf-8?B?V1RvbkZMa290NTI0YVp2dTR0eVN5QjFvbHppNFI4cSttU2pxMjQrNTUxODVE?=
 =?utf-8?B?Z2ZoeEZudVViZExPRFo0eVM2K05BQ1hkS0sxMy9GcDI3eWtwYitndGhZWEU0?=
 =?utf-8?B?UVVQNnpWVGN6S0RjL0k2TWJOOXB0Z1JYUzQ0cm92VXZKMmN4dXlvYjJ6RG1L?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b562f6-fc06-4281-6da0-08de32888074
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 16:24:58.6931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJ6FUM4KUBrEBl7Dg4i2XcISF602104m8EWq/53ifNVmKhCGyQKZWiFLwDOs3DsmKKAJiZqCx0MIhZGyESXTvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6695
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

On Wed, Dec 03, 2025 at 12:55:52PM +0530, Yadav, Arvind wrote:
> 
> On 03-12-2025 00:18, Matthew Brost wrote:
> > On Tue, Dec 02, 2025 at 10:42:39AM -0800, Matthew Brost wrote:
> > > On Mon, Dec 01, 2025 at 11:20:15AM +0530, Arvind Yadav wrote:
> > > > Modify the CPU page fault handler, `xe_bo_cpu_fault()`, to correctly
> > > > handle access to buffer objects that have been purged.
> > > > 
> > > > When a buffer object is in the `XE_MADV_PURGED` state, its backing
> > > > store has been reclaimed by the kernel. If the CPU attempts to access
> > > > this memory, it is an error that should be reported to the application.
> > > > 
> > > > v2:
> > > >    - Added xe_bo_is_purged(bo) instead of atomic_read.
> > > >    - Avoids leaks and keeps drm_dev_exit() while returning.
> > > > 
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > 
> > Ah, actually I think I made a mistake here.
> > 
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_bo.c | 10 ++++++++++
> > > >   1 file changed, 10 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > index f0b3f7a13114..7f5bcf114ed4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -1992,6 +1992,16 @@ static vm_fault_t xe_bo_cpu_fault(struct vm_fault *vmf)
> > > >   	if (!drm_dev_enter(&xe->drm, &idx))
> > > >   		return ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
> > > > +	/*
> > > > +	 * BO content is gone. Signal the user process.
> > > > +	 * Once purged, BO remains permanently invalid (i915 semantics).
> > > > +	 * Application must destroy and recreate the BO.
> > > > +	 */
> > > > +	if (xe_bo_is_purged(bo)) {
> > Doesn't this need to done under the BO's dma-resv lock to avoid a race?
> > Consider the case where after this check, TTM evicts this BO changing
> > the state purged. Now we grab the BO's dma-resv lock and try to get
> > pages on purged BO. Seems like an issue.
> 
> Thanks for catching these issues!.
> 
> > 
> > Also with that, xe_bo_is_purged likely should have lockdep annotation
> > asserting the BOs dma-resv lock is held.
> I initially added xe_bo_assert_held() to xe_bo_is_purged(), but it causes
> crashes because many callers don't hold the lock.
> For example, in xe_pagefault.c (this early check), no lock is held. I’ll
> recheck the call and update accordingly.
> 

I've touched on this in other patches - sorry my reviews sometimes come
in scattered bursts as I look at code - but I think the point is all
purging state changes / critical checks should be done under the BO
dma-resv lock to avoid races. Sure user space shouldn't touching a BO in
WONTNEED state but it could and if purging races with a check outside a
lock it seems like bad things could happen in the kernel.

Matt

> ~Arvind
> > 
> > Matt
> > 
> > > > +		ret = VM_FAULT_SIGBUS;
> > > > +		goto out;
> > > > +	}
> > > > +
> > > >   	ret = xe_bo_cpu_fault_fastpath(vmf, xe, bo, needs_rpm);
> > > >   	if (ret != VM_FAULT_RETRY)
> > > >   		goto out;
> > > > -- 
> > > > 2.43.0
> > > > 
