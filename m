Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03945CA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 13:45:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAF610E252;
	Tue,  9 Sep 2025 13:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJQ2x66L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DCB10E252
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 13:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757425532; x=1788961532;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=+d3eAC8JvpC0jdxDiDYMCisJx9oOjUOetX6CYkKswZI=;
 b=JJQ2x66L4837eXbPo/kFT2qIGeEusn+As8Y4nPH7Be5fbKONBKF3zvTe
 e9RvfxMvHHpTn3mSZj9gG5ymuZ5cFpvGntOKTipd0/yHCPWtk/+8XcXtZ
 vznoDL4on25BITXTANNYrqinLxfbvQ71yzbwz4sAVZHkSTS74zZ+d/ViY
 VcxqAI9R5zZDrt9lsRzAjKTV+gMIDE1gou90R5tveA5C8QYaIXLTzIuM4
 Jd2aYc9jH3noD9HTB5Eo066fsA4S9M/ZNR6WGAf359UNN30C+LSVT7TCC
 zmG2vqCNWL46DJ7AhKS542YHyirrMg+nerTtaOi7kgOb5Nm4FCtnK1F7R g==;
X-CSE-ConnectionGUID: aOuXSarvTnSsLW0+zFAIDA==
X-CSE-MsgGUID: pXWhZn44TW2TTc+/9h7YDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="70807152"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="70807152"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:45:31 -0700
X-CSE-ConnectionGUID: 5e0y01OeSDmTVsPfpxqOpQ==
X-CSE-MsgGUID: qMgCxklqQ++YurPGicdeAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172668098"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:45:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 06:45:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 06:45:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.89)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 06:45:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmAuSKqxNNqFhV6NIvv7xQTHJjs5aG5zlVoPcYkqryVBnHX2Itx/zoaMZO6+KWumTHRuuJLOLOnAPkqNG+z8Y/5pEGNm2xsjdCJCNPEAdgqf9LUrnA5P5fgvHT60rRG4tyUfklz9tXMH9pmNkR3oMhQRhY5HUbExfYeBaME3g3XbHP4txCP5LZMF6ACe+hp/1VOBJaeur0FsiywKXoQf4ydrdgO9xkbAgGQZeEJWpkDMoFLD1p4Uq+BTobIrGQoAsCkfiqskLur89iTD0bQMo2z7iGlRtTg+9UbyeR6Mi/eJwh27p6V87n+OQccZ0Q2/OxVw5jjbHfjDpUC98x51FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZkH1DyfRzVnZaeIEscMNaM1Fzyld+Tq8E75JXGmCWk=;
 b=UgQH8ncDUkfYHntkamcynjtleEWNQqx554Io2oBZR15Tsv6J/ZQPNpH9BaVxt0jZxbxsm1mNvUS61i23flF0QLpBhCRSchlcObjqQfYKnkgfLZaCUO4WNZjHyZCgu0CWcOJyN/o0RRvAHkqkdtwO+AUhaJFHZeOzkWW+CmitjW2s/zqBYDD+7DKLfVTEbTLcEnjQC84QTApHMMXrHqV1PMTXXYJQ0lmSfS4goACEBpF0xDiVACSGsh9aSveRfJ0fKXyWyKFTTF60uRvpbbYg5y8T66SfaBgQP98uD2EDCS1g6vR9dKVW/FgZAn9+/fJeJu4wcklWoB0/WDqroRZRtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM6PR11MB4609.namprd11.prod.outlook.com (2603:10b6:5:28f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 13:45:27 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 13:45:23 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250905215614.796247-3-matthew.d.roper@intel.com>
References: <20250905215614.796247-3-matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Never report L3 bank mask for media GT going
 forward
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, Fei Yang <fei.yang@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Tue, 9 Sep 2025 10:45:18 -0300
Message-ID: <175742551891.1838.7121326229073094607@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR05CA0151.namprd05.prod.outlook.com
 (2603:10b6:a03:339::6) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM6PR11MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: e424a737-1d12-4b1f-d719-08ddefa7201f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3M1dE9RUjhEZ0M4MDBrSllZWkZ5OElyS1Jham44MUJUc2JaSUI0d1lpVUhj?=
 =?utf-8?B?dmlXdC9hRHRCQXZNY0NsREhKM0hWM1M4RzhkVmx2VXVSdVYrUmkzT1hTZHR4?=
 =?utf-8?B?bmlpSEdrVThROTN0M1NYZFRTN01yWExEM3hQR3ljWDJvWSsvWDRWZW9tYmNC?=
 =?utf-8?B?eUgyNnJCTkMwSUhyejBmWkdacTYrU1NpMWRGMVJIeGNTWHJsankrMFlzRUlx?=
 =?utf-8?B?TlVpNk1Wa3REWWVGSEtsakowcTZrN1dzTmxLVVF3dEd3VmJnbWRHSzUwSWV2?=
 =?utf-8?B?UlRJdnlaRU41QjZWdVZmakF5MWJEbEpwTWlNYjd0Y3R1ZWZZQWo4cFdqcmhS?=
 =?utf-8?B?SFNqYlNrUkVKTk1yV09BWlZtMGtnNjV1S3NWTVBTVWtwbTE0WmhmcGx3T1pJ?=
 =?utf-8?B?ZGZLWEg2cTRBQmZDMy9vZzc5aElHS3ZremQ5V3MzcWkyNVpYaEJiZFBuZlRR?=
 =?utf-8?B?ZUlHK0Rpcis5Z2VmWXFqVm11bGdiM3FMUW9zSHBRK0ZYckM5WnBKM2lmTnpr?=
 =?utf-8?B?Z2JpYmEvcE1zYnNQSVgrOUFDdVFtd1ppYjFGUzlEbVAzZUhJNTAreXNvWnlp?=
 =?utf-8?B?U1FxZXJzZHNuZlBtb0ltWXVoYjYvekJwYy9DTWlGOXRwU1NGNEVuTGpLVFM4?=
 =?utf-8?B?NjZYVmZweUsremE3SDhuWkZTc2NVNU9WMXQ3aUNSTVZ2NEMyQitib0lSWFlK?=
 =?utf-8?B?Rmg5ZVQrTVc1djJ1eWRzRkJ0SVZSbGhlUmVaSUZMODJCTGhLZFNnbm9BNURo?=
 =?utf-8?B?bTk0cUZac1Y2S25xamw5aGhmeU12ekQ1czlPRXBQNDVBcWRZKzlEejNQOGtP?=
 =?utf-8?B?NTFoSTBJZXdnV1ZxTk5XY1JZQzRMZUlDRWFsd0YzMlBOTHFBWGFVamxjUnUr?=
 =?utf-8?B?VWJWcHJWMWZoTjNhYlpqakVHZklFQmtGMWhXZS9BQmdaUUcxeVhMOXQydGdM?=
 =?utf-8?B?ZUhKbGJTdWpRMUZwS25WNDV4YXdoZFlBYWdtZjZlSVU2ZVRVTmVCWDVUNXNJ?=
 =?utf-8?B?OU13Nnl4b0VKTXJ4Z1U0VTVWYzY3dUFsNXpUYkZ3N3UvUjI3ZUtZSXIvTlVq?=
 =?utf-8?B?SlNiR3Zaa0dLQ3g3MUxkNXZzY1kzdWVNRi8vdzNMTG9menIwWjRoaFFHb0Rr?=
 =?utf-8?B?MFFQaXBEaXBnN2VRd0FacjFZYVNWZXVhVFV4c0FVZGgyRTFYeEI3MXczWnIv?=
 =?utf-8?B?Y2dOeXhVYzM3OTc3V1VSeGxIdVdLdVRINTI2SmdKNWNvTDA4SWNIZ0VOMlFa?=
 =?utf-8?B?T3d0UWVEZzViTUNSWnFQdDMxUmltU280T3ZSYVpjLzVlZGZjZ0x3YmswRjJa?=
 =?utf-8?B?NVpNeXlzOFZYSlBKVWsxK0I5aFczTnBlS0pyZUdkdWtFa2YzZzVxb2JURzhh?=
 =?utf-8?B?dGN0Zm5kWmxVdzdOQy9jSHd0VmdXbDdRcHFWV0lBbnl5eFMvMUNpZ0NXL0F5?=
 =?utf-8?B?b2hiUTU4TU11dGVkRG1DYUFlQkc5cnk5SmxZN0R3VlhkWmJPNTZyenpEcjJK?=
 =?utf-8?B?amtRRDg0Qjd3bVVQR1NkSnZEV01VUkhWUVBMSkhOZFpmbjkza3d3REFVaEhi?=
 =?utf-8?B?UWZsRzJHc3lJNitDRnlhWDJicnZxNmNneDRBaEJpc1FFcEZCNm05d1c5Ymdw?=
 =?utf-8?B?dEFiZGYrYmVac0V6TUF6cEZ3TlJhaUtFUUtheExVN1JoQm9mYlM3Ukw3TXBj?=
 =?utf-8?B?ZkdNTEkxNnZaY3FvVFQrK2NrNDRoVGxMa0t6UkEzdER2dHcrSWFVUXBzNGNX?=
 =?utf-8?B?UHR0ZnVSNGRjaHQvT2s3WmZlZzFSZE5WNDVNbUJMV0lyOEp5clBXZ05GWml3?=
 =?utf-8?B?VldUSmNsbHRZVGR2MjM5YlUramM0WlJSTFNpYkNmSUpPVzVJd0FFcnJ2MmRj?=
 =?utf-8?B?cERKMkNCNmprZkhWcUZIcWdsSUlTRmUwdEh4ZnN6YVJpbWpQOXpSZXRIdGdJ?=
 =?utf-8?Q?icgIfs1q7wE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkc5R3B0ZUowM3BGM2xBM0J0dXB5N05MR3hMeU9KMlk2SUExOHJIdHBhcGoy?=
 =?utf-8?B?d25QNGNrZzhJNUsyOUVkZ0ZsTTlTYUliUUJyY2E0NThkdXpkelErSk44MXpK?=
 =?utf-8?B?YTdUWityNTMrVlBpV05pOFNTZjlPQjdINVFZVlR0TG5naGtvc0FmOGFobGY1?=
 =?utf-8?B?Wjh3NXVBMGRKTnNIOXFteGJnTlFWT2pNRUt0akFsVDdqeUFSdDI1K01yc1Vm?=
 =?utf-8?B?WmxlSTZMTGRDZG5RaWRZc0wxUnp1QmhwT3pZbmVDcW96ZHliZ0d6NHd0Q0NQ?=
 =?utf-8?B?eHVqQkFJTk5WWlJrZndoNUdNRmFxcFJ4ZWhidFNDdWovc2IvQysraGR6N1FR?=
 =?utf-8?B?UnA3eU9PQjZiZWdudVJXNzA1aHg5bmY0bjRJNnpvSXUrZklSVklkSjBjV0ty?=
 =?utf-8?B?bDUxNUlwd3dnaUJYcFV0OFVPMzRHUjNsS0cwa2NnMzBxK0h6aytLajNFLzh2?=
 =?utf-8?B?QVdkbEkvK1Z4WVBwSDU4Wnp5elU1SURGSjNjVUdEWm1jMFRoSG43K3FPQU94?=
 =?utf-8?B?VFBpNnM1WmQ2ZUtSRXVJQzVoOXUwV2Rhc3pQeGRSbTRNNEI1TStITXlFTWhz?=
 =?utf-8?B?V1BmZGtVWE5XT3RGVklrRjFUb2FaVjVCbTVTZUUxdFhUekJPVm5RNDd4cy8v?=
 =?utf-8?B?em90SXZsQi92SVJnU0kxckc5b29ZWk5LL3hEZkxjejFmems3Q2xWU1pjTXQx?=
 =?utf-8?B?TXF3YWxrOVRVZy9GK1E3MXZHWWh5QnQ2c1VESnBRa0dxTERVV0pFZ3FKK1J2?=
 =?utf-8?B?cnRtaGJMY0tRcHpyQ3hBVUREVG40Y0E4WFVxeDNuVFdGbklRMHI4S1NpUnNq?=
 =?utf-8?B?ZTk5UjZTbEdwQk5FZEhiQWF1UFhxTWlEZW5Lck92R2MyVTV0SjJLMUNGNXB4?=
 =?utf-8?B?THBaUDRhL21XZXdlVVo1L0tDNkdnVEw4bUR5b0hVT0s0a0NNYU9VOWs3K1hG?=
 =?utf-8?B?WkgwMEduZzBoN0R5dmFaOXlCSDYzN2tmdWk5dzdkVklOK2IzbENvRlNGRHFv?=
 =?utf-8?B?RDVFcGRDMGQxallIM2g2T1dDTGlaaUd1a3haakU5MldROHVGL1VrTExKQklk?=
 =?utf-8?B?UHRZRDdxUTg4cEpJVTlSNm5JbWlPZXNLSVJBeGxQZW1sRUY2RkovQzFMOHFj?=
 =?utf-8?B?Nk9ZczdGdWp4ak10N0dRUzRVN2dmM1N6WEpNRkt3dzRoaDhlTVpYeUZ2WmhB?=
 =?utf-8?B?Mncxb0tPZDludUx5TjBYR2JkYVNTUkVIYXIwTzgwTiszZCtWNFZ5L0NhVXhO?=
 =?utf-8?B?Z01kVXhZcjM4RUpaYTZTRTc3QUpvbTF6V3VtcEhxZHVNN2ZaS2RnZEQ0ZFd6?=
 =?utf-8?B?LzlKcTA4SFpNdTBQUGpuckRXRHZnbmh1clZXZ3QzckZ0RzRoNjN2TDJtbnJ5?=
 =?utf-8?B?UytML3VnSG9aNHBtUCs3YmxQS21nNzJlbXBNbkdVQ0V5SUk3OGo2UGI4VGNF?=
 =?utf-8?B?TnJKVExnQktRR1E1ZmxXYWZSOTRneHpZSWxoUTlQckhsQjB4UER4bDVueXVs?=
 =?utf-8?B?ZVJCdXhYYW5OYmtUdVUzNzc4VlM0VlJPWEZVYTBxUll5M2gzcXloR2twWU52?=
 =?utf-8?B?ZGJkRjVEL3RaaEJxb21FRXlhY3VUUUVwa3ZlSTZOaG5XekgrZnhOeXIwU0Zh?=
 =?utf-8?B?dVN0T2hrL2laelg5ZUpta1FoTDhDR0RRR2h4L1dkMjBmemhWY0hoTG9LUHNM?=
 =?utf-8?B?NjlYK1piOXMwSG9NWGJEL3F3VFhVV0JkWWM5dXNFakgyS3cwbHJ4K0M0V0h5?=
 =?utf-8?B?SzhhM01PVW1EZDBhT2tlaHl4TzVRWXl5Z0Z5cExBbk9FajFtWmY1bUFkUWg5?=
 =?utf-8?B?UE9xT3M2YnBaWi9SMGQ3NzNYN3gvUmNYWXBtV1NsWWhNZEY3TjY2N0tWNTdU?=
 =?utf-8?B?dlYyS0RtelBqbzVwbEc1R2lxWWphcW1JU0tPb293cmtBUGpKQkp1eVNkK3dm?=
 =?utf-8?B?TmJZWUhwR1hUeWxiRGJYZzJ5UEcvelJVaHlLMlUzZUhnVUY2Mk5QWm9YWnNt?=
 =?utf-8?B?dS9Pdlorc2Nlc2NYTlJocGp4bUZoemh0VGdGQWxicGpxdTdZd0gvY01oUVlZ?=
 =?utf-8?B?bFA5cm45bEJWVmVTd1AwRkFWZ3I4NFBxWmlIYXlHb2hra3dycjVCV1ROTUh3?=
 =?utf-8?B?VCtxSXJ3OWljaFExYjhIb3VkVWU4N21YMXREUldYL1Z1UXhtd1ZPK0pZZUs1?=
 =?utf-8?B?YWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e424a737-1d12-4b1f-d719-08ddefa7201f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 13:45:23.6896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kacNsgoW8RBwgWhfI912mBXdKmZuvFfHURT4k93E8GofS26OvVCngpHJN0/PdcmTRSQ4HkqgVP1N5QDiWA55Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4609
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

Quoting Matt Roper (2025-09-05 18:56:15-03:00)
>We currently report an L3 bank mask as part of the GT topology on both
>GTs (primary and media) because a copy of the L3 bank fuse register
>exists on both GTs (e.g., $gsi_offset + 0x9130 on Xe3).  After recent
>discussions it's come to light that the only known userspace software
>that uses this part of the uapi (the compute UMD and Mesa) only uses the
>value reported for the primary GT; the value reported for the media GT
>is ignored by both projects, and the media UMDs don't have any use for
>L3 information today.  Since we always strive to have our uapi match the
>specific needs of userspace and not include additional unused baggage,
>let's officially drop L3 bank reporting on the media GT going forward
>and only keep it around for the primary GT where it actually gets used.
>This change will only apply to future platforms (Xe3 and later); even
>though it would probably be safe to remove it from Xe1/Xe2 as well, we
>don't want to take any chances with changing existing ABI.
>
>Note that we'd already disabled reading/reporting of the L3 bank for the
>media GT on PTL in commit 9ab440a9d042 ("drm/xe/ptl: L3bank mask is not
>available on the media GT") because it was discovered that the copy of
>the fuse registers on the media GT were just reporting a bogus ~0 value
>rather than an accurate mask.  So this is just extending that PTL
>behavior forward to WCL and other future platforms.  Note that we're
>also free to reinstate this part of the uapi in the future if/when some
>new userspace consumer emerges that _does_ have a use for media-specific
>L3 bank masks.
>
>Cc: Fei Yang <fei.yang@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_gt_topology.c | 31 ++++++++++++++++++-----------
> drivers/gpu/drm/xe/xe_gt_topology.h |  2 ++
> drivers/gpu/drm/xe/xe_query.c       |  5 +++--
> drivers/gpu/drm/xe/xe_wa_oob.rules  |  1 -
> 4 files changed, 24 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_g=
t_topology.c
>index 0ed7dc9044a5..4e61c5e39bcb 100644
>--- a/drivers/gpu/drm/xe/xe_gt_topology.c
>+++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>@@ -123,6 +123,21 @@ gen_l3_mask_from_pattern(struct xe_device *xe, xe_l3_=
bank_mask_t dst,
>         }
> }
>=20
>+bool xe_gt_topology_report_l3(struct xe_gt *gt)
>+{
>+        /*
>+         * No known userspace needs/uses the L3 bank mask reported by
>+         * the media GT, and the hardware itself is known to report bogus
>+         * values on several platforms.  Only report L3 bank mask as part
>+         * of the media GT's topology on pre-Xe3 platforms since that's
>+         * already part of our ABI.
>+         */
>+        if (xe_gt_is_media_type(gt) && MEDIA_VER(gt_to_xe(gt)) >=3D 30)
>+                return false;
>+
>+        return true;
>+}
>+
> static void
> load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
> {
>@@ -130,16 +145,7 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t=
 l3_bank_mask)
>         struct xe_mmio *mmio =3D &gt->mmio;
>         u32 fuse3 =3D xe_mmio_read32(mmio, MIRROR_FUSE3);
>=20
>-        /*
>-         * PTL platforms with media version 30.00 do not provide proper v=
alues
>-         * for the media GT's L3 bank registers.  Skip the readout since =
we
>-         * don't have any way to obtain real values.
>-         *
>-         * This may get re-described as an official workaround in the fut=
ure,
>-         * but there's no tracking number assigned yet so we use a custom
>-         * OOB workaround descriptor.
>-         */
>-        if (XE_GT_WA(gt, no_media_l3))
>+        if (!xe_gt_topology_report_l3(gt))
>                 return;
>=20
>         if (GRAPHICS_VER(xe) >=3D 30) {
>@@ -276,8 +282,9 @@ xe_gt_topology_dump(struct xe_gt *gt, struct drm_print=
er *p)
>         drm_printf(p, "EU type:             %s\n",
>                    eu_type_to_str(gt->fuse_topo.eu_type));
>=20
>-        drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BANK_MASK_=
BITS,
>-                   gt->fuse_topo.l3_bank_mask);
>+        if (xe_gt_topology_report_l3(gt))
>+                drm_printf(p, "L3 bank mask:        %*pb\n", XE_MAX_L3_BA=
NK_MASK_BITS,
>+                           gt->fuse_topo.l3_bank_mask);
> }
>=20
> /*
>diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_g=
t_topology.h
>index d95cdd6e45be..5e62f5949b7b 100644
>--- a/drivers/gpu/drm/xe/xe_gt_topology.h
>+++ b/drivers/gpu/drm/xe/xe_gt_topology.h
>@@ -49,4 +49,6 @@ bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned in=
t dss);
>=20
> bool xe_gt_has_discontiguous_dss_groups(const struct xe_gt *gt);
>=20
>+bool xe_gt_topology_report_l3(struct xe_gt *gt);
>+
> #endif /* _XE_GT_TOPOLOGY_H_ */
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index 4dbe5732cb7f..e1b603aba61b 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -21,6 +21,7 @@
> #include "xe_force_wake.h"
> #include "xe_ggtt.h"
> #include "xe_gt.h"
>+#include "xe_gt_topology.h"
> #include "xe_guc_hwconfig.h"
> #include "xe_macros.h"
> #include "xe_mmio.h"
>@@ -477,7 +478,7 @@ static size_t calc_topo_query_size(struct xe_device *x=
e)
>                         sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_=
dss);
>=20
>                 /* L3bank mask may not be available for some GTs */
>-                if (!XE_GT_WA(gt, no_media_l3))
>+                if (xe_gt_topology_report_l3(gt))
>                         query_size +=3D sizeof(struct drm_xe_query_topolo=
gy_mask) +
>                                 sizeof_field(struct xe_gt, fuse_topo.l3_b=
ank_mask);
>         }
>@@ -540,7 +541,7 @@ static int query_gt_topology(struct xe_device *xe,
>                  * mask, then it's better to omit L3 from the query rathe=
r than
>                  * reporting bogus or zeroed information to userspace.
>                  */
>-                if (!XE_GT_WA(gt, no_media_l3)) {
>+                if (xe_gt_topology_report_l3(gt)) {
>                         topo.type =3D DRM_XE_TOPO_L3_BANK;
>                         err =3D copy_mask(&query_ptr, &topo, gt->fuse_top=
o.l3_bank_mask,
>                                         sizeof(gt->fuse_topo.l3_bank_mask=
));
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa=
_oob.rules
>index 338c344dcd7d..f3a6d5d239ce 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -49,7 +49,6 @@
> 16023588340        GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf=
)
> 14019789679        GRAPHICS_VERSION(1255)
>                 GRAPHICS_VERSION_RANGE(1270, 2004)
>-no_media_l3        MEDIA_VERSION_RANGE(3000, 3002)
> 14022866841        GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
>                 MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
> 16021333562        GRAPHICS_VERSION_RANGE(1200, 1274)
>--=20
>2.51.0
>
